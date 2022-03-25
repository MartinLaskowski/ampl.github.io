#!/bin/bash
set -ex
if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <version>"
else
  version=$1
  # sed -i~ "s/ampl_sphinx_theme==.*/amplpyfinance==$version/" docs/requirements.txt
  sed -i~ "s/version=\"[^']*\"/version=\"$version\"/" setup.py
  sed -i~ "s/__version__ = \"[^']*\"/__version__ = '$version'/" ampl_sphinx_theme/__init__.py
fi
