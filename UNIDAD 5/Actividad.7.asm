//Cambios en ofApp.h

class SpiralParticle : public RisingParticle {
private:
    float baseX;       // posición X original, para oscilar alrededor de ella
    float spiralSpeed; // frecuencia de la oscilación
    float spiralAmp;   // amplitud (ancho del zigzag)
    float angle;       // ángulo acumulado para el seno

public:
    SpiralParticle(const glm::vec2& pos, const glm::vec2& vel,
                   const ofColor& col, float life)
        : RisingParticle(pos, vel, col, life),
          baseX(pos.x),
          spiralSpeed(ofRandom(4.0f, 8.0f)),
          spiralAmp(ofRandom(20.0f, 50.0f)),
          angle(0.0f) {}

    void update(float dt) override {
        // Primero ejecuta la física del padre (gravedad, detección de explosión)
        RisingParticle::update(dt);
        // Luego añade la oscilación lateral encima
        angle += spiralSpeed * dt;
        position.x = baseX + sin(angle) * spiralAmp;
    }

    void draw() override {
        ofSetColor(color);
        // Dibuja como una línea giratoria en vez de círculo
        float len = 18.0f;
        float dx = cos(angle) * len;
        float dy = sin(angle) * len;
        ofSetLineWidth(3);
        ofDrawLine(position.x - dx, position.y - dy,
                   position.x + dx, position.y + dy);
        ofSetLineWidth(1);
        // Punto central pequeño
        ofDrawCircle(position, 4);
    }
};

class BurstParticle : public RisingParticle {
private:
    std::deque<glm::vec2> trail; // historial de posiciones
    static const int TRAIL_LEN = 12;

public:
    BurstParticle(const glm::vec2& pos, const glm::vec2& vel,
                  const ofColor& col, float life)
        : RisingParticle(pos, vel, col, life) {}

    void update(float dt) override {
        // Guarda la posición actual antes de mover
        trail.push_front(position);
        if ((int)trail.size() > TRAIL_LEN)
            trail.pop_back();
        // Ejecuta la física del padre
        RisingParticle::update(dt);
    }

    void draw() override {
        // Dibuja la estela: círculos cada vez más pequeños y transparentes
        for (int i = 0; i < (int)trail.size(); i++) {
            float t = 1.0f - (float)i / TRAIL_LEN; // 1.0 en frente, 0.0 al final
            ofColor c = color;
            c.a = (unsigned char)(t * 180);
            ofSetColor(c);
            float r = ofMap(t, 0, 1, 2, 10);
            ofDrawCircle(trail[i], r);
        }
        // Cabeza brillante
        ofSetColor(color);
        ofDrawCircle(position, 11);
    }
};


class RingExplosion : public ExplosionParticle {
private:
    float angle; // ángulo propio de este rombo (para rotarlo)

public:
    // totalParts y index permiten distribuir los ángulos uniformemente
    RingExplosion(const glm::vec2& pos, const ofColor& col,
                  int index, int totalParts)
        : ExplosionParticle(pos, glm::vec2(0, 0), col, 1.4f, ofRandom(8, 16))
    {
        // Ángulo perfectamente uniforme: ningún hueco, ningún amontonamiento
        float a = TWO_PI * index / totalParts;
        float speed = ofRandom(120, 200);
        velocity = glm::vec2(cos(a), sin(a)) * speed;
        angle = a;
    }

    void draw() override {
        ofSetColor(color);
        ofPushMatrix();
        ofTranslate(position);
        ofRotateRad(angle + age * 2.0f); // rota mientras vuela
        // Rombo: cuatro vértices
        float s = size * 0.7f;
        ofDrawTriangle( 0, -s,  s, 0,  0,  s);
        ofDrawTriangle( 0, -s, -s, 0,  0,  s);
        ofPopMatrix();
    }
}

//Cambios en ofApp.cpp
// En ofApp::update(), cambia el bloque de selección de explosión:
// Antes tenía: int explosionType = (int)ofRandom(3);
// Ahora tiene 4 tipos:

int explosionType = (int)ofRandom(4); // 0:Circular 1:Random 2:Star 3:Ring
int numParticles = (int)ofRandom(20, 30);

for (int j = 0; j < numParticles; j++) {
    if (explosionType == 0) {
        particles.push_back(
            new CircularExplosion(particles[i]->getPosition(),
                                  particles[i]->getColor()));
    } else if (explosionType == 1) {
        particles.push_back(
            new RandomExplosion(particles[i]->getPosition(),
                                particles[i]->getColor()));
    } else if (explosionType == 2) {
        particles.push_back(
            new StarExplosion(particles[i]->getPosition(),
                              particles[i]->getColor()));
    } else {
        // RingExplosion necesita index y total para distribuir ángulos
        particles.push_back(
            new RingExplosion(particles[i]->getPosition(),
                              particles[i]->getColor(),
                              j, numParticles));
    }
}