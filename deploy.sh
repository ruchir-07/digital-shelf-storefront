#!/bin/sh
# Publish the storefront. Run from anywhere.
#   1. edit _SHIP/links.json
#   2. python _SHIP/apply_links.py      (rewrites index.html)
#   3. sh _SHIP/03-storefront/deploy.sh
set -e
cd "$(dirname "$0")"
git add -A
git commit -m "${1:-Update storefront}" || { echo "nothing to commit"; exit 0; }
git push origin main
echo "pushed - GitHub Pages rebuilds in ~30s"
echo "https://ruchir-07.github.io/digital-shelf-storefront/"
