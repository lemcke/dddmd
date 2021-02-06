#include "particle.h"
#include "vec3d.h"
#include <stdio.h>

void particle_debug(particle_t *p)
{
	printf("particle: %p\n", (void *) p);
	printf(
		"\tmass:     %p = %f\n",
		(void *) &(p->mass), p->mass
	);
	printf(
		"\tposition: %p = (%f %f %f)\n",
		(void *) &(p->pos), p->pos->x, p->pos->y, p->pos->z
	);
}

void particle_init(particle_t *p, double mass, vec3d_t *pos)
{
	p->mass = mass;
	p->pos = pos;
}
