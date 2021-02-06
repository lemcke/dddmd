#ifndef PARTICLE_H
#define PARTICLE_H

#include "vec3d.h"

typedef struct PARTICLE particle_t;

struct PARTICLE {
	double mass;
	vec3d_t *pos;
	/*
	 * Later add mass, velocity, neighbour list, etc.
	 */
};

void particle_debug(particle_t *p);
void particle_init(particle_t *p, double mass, vec3d_t *pos);

#endif // PARTICLE_H
