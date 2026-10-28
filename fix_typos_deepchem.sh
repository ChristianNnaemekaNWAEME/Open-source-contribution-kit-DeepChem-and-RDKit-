#!/usr/bin/env bash
# Run inside your clone of your DeepChem fork. Fixes spelling mistakes found with codespell; changes comments/docstrings only.
set -e
r() { f=$1; shift; while [ $# -gt 0 ]; do perl -pi -e "s/\b$1\b/$2/g" "$f"; shift 2; done; }
r docs/source/get_started/tutorials.rst splitted split initialze initialize
r deepchem/metrics/score_function.py continous continuous
r deepchem/feat/molecule_featurizers/rdkit_descriptors.py precendence precedence
r deepchem/data/datasets.py typle tuple metatadata metadata automaticall automatically optioanl optional absense absence
r deepchem/trans/transformers.py specifed specified recieve receive fisrt first
r deepchem/utils/evaluate.py Tranformers Transformers
r deepchem/splits/splitters.py demoninator denominator Paramters Parameters
git diff --stat
