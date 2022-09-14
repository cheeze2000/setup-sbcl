# setup-sbcl
GitHub Action for Steel Bank Common Lisp and other build tools

# Configured Tools
- SBCL
- Quicklisp
- ASDF

# Usage
This GitHub action only supports `ubuntu-latest` for the time being!

```yml
on: [push, pull_request]
jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Setup SBCL
        uses: cheeze2000/setup-sbcl@v1
        with:
          version: 2.2.8
      - name: Verify installation
        run: sbcl --non-interactive --eval "(print (ql:client-version))" --eval "(print (asdf:asdf-version))"
```
