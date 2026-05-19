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

  log-default-env:
    runs-on: ubuntu-latest
    steps:
      - name: variables
        run: |
          echo "HOME: ${HOME}"
          echo "GITHUB_WORKFLOW: ${GITHUB_WORKFLOW}"
          echo "GITHUB_ACTION: ${GITHUB_ACTION}"
          echo "GITHUB_ACTIONS: ${GITHUB_ACTIONS}"
          echo "GITHUB_ACTOR: ${GITHUB_ACTOR}"
          echo "GITHUB_REPOSITORY: ${GITHUB_REPOSITORY}"
          echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
          echo "GITHUB_WORKSPACE: ${GITHUB_WORKSPACE}"
          echo "GITHUB_SHA: ${GITHUB_SHA}"
          echo "GITHUB_REF: ${GITHUB_REF}"
          echo "SECRETS: ${{ toJson(secrets) }}"
          echo "SECRETS_TOKEN: ${{ secrets.GITHUB_TOKEN }}"
          echo "user: $user ${{ toJson(env)}}"
          echo "JOB_ENV: ${{ toJson(job) }}"
          echo "STEP_ENV: ${{ toJson(steps) }}"
          echo "RUNNER_OS: ${RUNNER_OS}"
          echo "RUNNER_ARCH: ${RUNNER_ARCH}"
EOF

actionlint --verbose .github/workflows/ci-env-wf.yml

git add .
git commit -m "Añadido job log-default-env con variables por defecto"
git push