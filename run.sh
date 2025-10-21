#!/bin/bash
xhost +local:root
sudo docker compose up -d --build
