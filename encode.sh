#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"
.venv/bin/python zte-config-utility/examples/encode.py \
  --signature "ZXHN H298Q V7.0" --use-signature-encryption config.xml config2.bin
