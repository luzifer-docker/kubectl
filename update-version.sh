#!/bin/bash
set -euo pipefail

### ---- ###

echo "Switch back to master"
git checkout master
git reset --hard origin/master

### ---- ###

version=$(curl -s "https://lv.luzifer.io/v1/catalog/kubernetes/latest/version")
grep -q "KUBECTL_VERSION=v${version}$" Dockerfile && exit 0 || echo "Update required"

sed -Ei \
  -e "s/KUBECTL_VERSION=v[0-9.]+/KUBECTL_VERSION=v${version}/" \
  Dockerfile

### ---- ###

echo "Testing build..."
docker build .

### ---- ###

echo "Updating repository..."
git add Dockerfile
git -c user.name='Luzifer.io Jenkins' -c user.email='jenkins@luzifer.io' \
  commit -m "kubectl ${version}"
git tag ${version}

git push -q https://${GH_USER}:${GH_TOKEN}@github.com/luzifer-docker/kubectl.git master --tags
