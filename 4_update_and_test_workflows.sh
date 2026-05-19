#!/bin/bash

cat << 'EOF' > .github/workflows/ci-primer-wf.yml
name: Comandos de shell
on: push
jobs:
  build_and_release:
    runs-on: ubuntu-latest
    steps:
      - name: Echo
        run: echo "Hello world"
        shell: bash
      - name: Display the path
        run: |
          node --version
          npm --version
          pwd
          cat /etc/os-release
        shell: bash
      - name: Display the processor
        run: |
          import platform
          print(platform.system())
          print(platform.processor())
        shell: python

  comandos_windows:
    runs-on: windows-latest
    steps:
      - name: PowerShell
        run: |
          Get-Location
          Get-ChildItem
        shell: powershell
EOF

actionlint --verbose .github/workflows/ci-primer-wf.yml

git add .
git commit -m "Añadido paso de Python y job de Windows"
git push