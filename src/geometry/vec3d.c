#include "vec3d.h"
#include <math.h>

void vec3d_set(vec3d_t *v, double x, double y, double z)
{
	v->x = x;
	v->y = y;
	v->z = z;
}

double vec3d_magnitude(vec3d_t *v)
{
	return sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
}
