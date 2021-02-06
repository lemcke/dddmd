#ifndef VEC3D_H
#define VEC3D_H

typedef struct VEC3D {
	double x, y, z;
} vec3d_t;

void vec3d_set(vec3d_t *v, double x, double y, double z);
double vec3d_magnitude(vec3d_t *v);

#endif // VEC3D_H
