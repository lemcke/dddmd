#include "./body/particle.h"
#include "./geometry/vec3d.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define DEBUG
#define N 100 // number of particles

int main(void)
{
	/*
	 * Set up a system of N particles.
	 */
	srand(time(NULL));
	vec3d_t positions[N];
	particle_t particles[N];
	
	double mass, px, py, pz;
	for (int i = 0; i < N; i++)
	{
		// mass
		mass = (double) rand() / (double) RAND_MAX;

		// position
		px = (double) rand() / (double) RAND_MAX;
		py = (double) rand() / (double) RAND_MAX;
		pz = (double) rand() / (double) RAND_MAX;
		vec3d_set(&positions[i], px, py, pz);
		particle_init(&particles[i], mass, &positions[i]);

		#ifdef DEBUG
		particle_debug(&particles[i]);
		#endif
	}

	return 0;
}
