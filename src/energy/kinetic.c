#include "kinetic.h"

double kinetic_energy_particle(double mass, double velocity)
{
	return 0.5 * mass * velocity * velocity;
}
