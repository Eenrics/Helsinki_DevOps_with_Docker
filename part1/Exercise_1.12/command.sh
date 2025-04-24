#!/bin/usr/env bash
docker build . -t react-project:latest && docker run -p 5010:5010 react-project:latest