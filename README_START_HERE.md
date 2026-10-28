# Open-source contribution kit (DeepChem and RDKit)

These are real, small fixes found by scanning the current source of both projects. 

## What is in the kit
| Item | What it is |
|---|---|
| `deepchem/deepchem-typos.patch` or `fix_typos_deepchem.sh` | 22 spelling fixes in 9 files (docstrings, comments, one tutorial page, one warning message) |
| `rdkit/rdkit-typos.patch` or `fix_typos_rdkit.sh` | 14 spelling fixes in 5 files (RDKit Book, Getting Started, Cookbook, two docstrings) |
| `rdkit/cookbook_entry_RDKitCB_41.rst` | A new Cookbook recipe: scaffold-based train/test split (the Cookbook has no such recipe) |

Both patches were checked with `git apply --check` against the master files as of today, and the changed Python files still compile. Files change over time, so if a patch no longer applies, use the `.sh` script instead; it finds the words wherever they are.

## DeepChem pull request
1. `cd deepchem && git checkout -b fix-docstring-typos`
2. `bash /path/to/fix_typos_deepchem.sh` (or `git apply /path/to/deepchem-typos.patch`)
3. `git diff` and **read every changed line**. Confirm each is a spelling fix.
4. `git commit -am "Fix spelling mistakes in docstrings, comments and docs"` (do not add `[skip ci]`; one change is inside a warning message in `datasets.py`)
5. `git push origin fix-docstring-typos`, then open the pull request from the banner GitHub shows on your fork.
6. DeepChem's CONTRIBUTING.md asks contributors to follow its coding conventions and contributions are offered under the MIT License. Read its "Pull Request Process" and "The Agreement" sections first: https://github.com/deepchem/deepchem/blob/master/CONTRIBUTING.md

PR title: `Fix spelling mistakes in docstrings, comments and docs`


## RDKit pull requests (two separate ones)
Read the guide first: https://rdkit.org/docs/GettingStartedWithContributing.html (fork, branch, test, pull request; it also asks you to name any AI tool you used beyond autocomplete).

**PR 1: typo fixes.** Same steps with `fix_typos_rdkit.sh`. Title: `Fix spelling mistakes in the RDKit Book, Getting Started, Cookbook and two docstrings`. Body: list a few examples (for example "specfication" -> "specification"), say no behavior changes, and add the AI-assistance sentence if true.

**PR 2: Cookbook recipe.** Open `Docs/Book/Cookbook.rst`, paste the entry from `cookbook_entry_RDKitCB_41.rst` after "Wiener Index", fill in the Author line, and confirm in the current Cookbook that RDKitCB_41 is still the next free number (the Cookbook says so near its top). Run `python recipe_test.py` and the Cookbook doctests described in the guide. Title: `Add Cookbook recipe: scaffold-based train/test split`. Body: say what the recipe does, why (random splits put close analogues in both sets), that you ran its examples, and the AI-assistance sentence if true.


