#!/bin/bash
acorn build -t ghcr.io/randall-coding/acorn/firefly && \
acorn push ghcr.io/randall-coding/acorn/firefly && \
acorn run -s firefly-mariadb:firefly-mariadb -n firefly ghcr.io/randall-coding/acorn/firefly
