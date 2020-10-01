#!/usr/bin/env bash
set -euo pipefail

gunicorn httpbin:app -b 0.0.0.0:80 -k gevent </dev/null &>/tmp/http.log &
gunicorn httpbin:app --certfile=/httpbin/keys/cert.pem --keyfile=/httpbin/keys/key.pem -b 0.0.0.0:443 -k gevent </dev/null &>/tmp/https.log &

tail -f /tmp/http.log /tmp/https.log
