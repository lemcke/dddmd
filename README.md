# Overview
**DDDMD** is a simple three-dimensional molecular dynamics code written in C.
It is probably the best MD code in the history of MD codes, maybe ever.

## Basic development guidelines
These may or may not be good practice, but:

- Work with pointers where possible, e.g. function parameters and for iterating
over arrays.
Individual `int`, `float`, etc. can be passed by value
(for example, `struct PARTICLE.mass` is a `double` and not a pointer to one).

- Memory allocation should ideally only take place in `main.c`.
If a function allocates memory, it is responsible for either freeing the
memory itself, or returning a pointer to the allocated block.
In the latter case, `alloc` should be present in the function's name.

- No hands to the face or hair.
