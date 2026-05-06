#!/bin/bash
set -e

# Pass through to zensical directly
# Config preprocessing is handled by Backstage/techdocs-cli in TypeScript
exec zensical "$@"
