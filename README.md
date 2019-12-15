# docker-files

In this repo I keep docker images that I use frequently

## Building images

To build an image run:

```bash
make build-<application name>
```

## Running applications

To run an application execute:

```bash
make run-<application name>
```

If the application image is not [built](#building-images) yet, the Makefile tries to build it before running the app.

## Application images in this repo

- [Freeplane](https://www.freeplane.org/wiki/index.php/Home)