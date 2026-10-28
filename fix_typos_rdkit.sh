#!/usr/bin/env bash
# Run inside your clone of your RDKit fork. Fixes spelling mistakes found with codespell; changes comments/docstrings/docs only.
set -e
r() { f=$1; shift; while [ $# -gt 0 ]; do perl -pi -e "s/\b$1\b/$2/g" "$f"; shift 2; done; }
r Docs/Book/Cookbook.rst addtional additional chemcially chemically
r Docs/Book/GettingStartedInPython.rst embarassingly embarrassingly
r Docs/Book/RDKit_Book.rst sectin section specfication specification modfied modified specfied specified defition definition contorlled controlled confiuration configuration
r rdkit/Chem/AllChem.py alingment alignment
r rdkit/Chem/Descriptors.py decriptor descriptor fucntions functions
git diff --stat
