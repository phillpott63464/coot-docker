# Docker container for coot

Simple docker container for coot, version 0.9.8, based on ubuntu 20.04. Software rendering only. Works on xwayland, I haven't tested it on xorg yet.

Requires sudo access, unless you run it with podman, but I haven't tested podman.

requirements:
- docker
- xhost
- xwayland
