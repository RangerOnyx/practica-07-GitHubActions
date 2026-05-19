#!/bin/bash

cat << 'EOF' > .github/workflows/ci-env-wf.yml
name: Variables de entorno
on:
  push
env:
  user: vagrant
jobs:
  python-310:
    runs-on: ubuntu-latest
    env:
      Python: "3.10"
    steps:
      - name: Echo
        run: echo "Valor de user $user Valor de Python $Python Valor de fichero $fichero"
        env:
          fichero: "hola.py"

  python-312:
    runs-on: ubuntu-latest
    env:
      Python: "3.12"
    steps:
      - name: Echo
        run: echo "Valor de user $user Valor de Python $Python Valor de fichero $fichero"
        env:
          fichero: "adios.py"
EOF

actionlint --verbose .github/workflows/ci-env-wf.yml

git add .
git commit -m "Uso de variables de entorno en workflow"
git push