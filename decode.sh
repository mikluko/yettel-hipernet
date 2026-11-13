#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"
.venv/bin/python zte-config-utility/examples/decode.py config.bin config.xml
