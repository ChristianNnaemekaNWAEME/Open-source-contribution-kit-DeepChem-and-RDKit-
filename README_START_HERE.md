# Open-source contribution kit (DeepChem and RDKit)

These are real, small fixes found by scanning the current source of both projects. They are **drafts for you to review and submit under your own GitHub account**. Nothing here has been submitted, and nothing counts as a contribution until a maintainer merges it. Do not claim a pull request in your petition before then.

## What is in the kit
| Item | What it is |
|---|---|
| `deepchem/deepchem-typos.patch` or `fix_typos_deepchem.sh` | 22 spelling fixes in 9 files (docstrings, comments, one tutorial page, one warning message) |
| `rdkit/rdkit-typos.patch` or `fix_typos_rdkit.sh` | 14 spelling fixes in 5 files (RDKit Book, Getting Started, Cookbook, two docstrings) |
| `rdkit/cookbook_entry_RDKitCB_41.rst` | A new Cookbook recipe: scaffold-based train/test split (the Cookbook has no such recipe) |

Both patches were checked with `git apply --check` against the master files as of today, and the changed Python files still compile. Files change over time, so if a patch no longer applies, use the `.sh` script instead; it finds the words wherever they are.

## Before you start (about 15 minutes, once)
1. Make a free GitHub account if you do not have one. Use the account whose name appears on your public repositories.
2. Open https://github.com/deepchem/deepchem and click **Fork**. Do the same at https://github.com/rdkit/rdkit.
3. Install git. Clone each fork: `git clone https://github.com/YOUR-USERNAME/deepchem.git` and the same for rdkit.

## DeepChem pull request
1. `cd deepchem && git checkout -b fix-docstring-typos`
2. `bash /path/to/fix_typos_deepchem.sh` (or `git apply /path/to/deepchem-typos.patch`)
3. `git diff` and **read every changed line**. Confirm each is a spelling fix.
4. `git commit -am "Fix spelling mistakes in docstrings, comments and docs"` (do not add `[skip ci]`; one change is inside a warning message in `datasets.py`)
5. `git push origin fix-docstring-typos`, then open the pull request from the banner GitHub shows on your fork.
6. DeepChem's CONTRIBUTING.md asks contributors to follow its coding conventions and says contributions are offered under the MIT License. Read its "Pull Request Process" and "The Agreement" sections first: https://github.com/deepchem/deepchem/blob/master/CONTRIBUTING.md

PR title: `Fix spelling mistakes in docstrings, comments and docs`
PR body:
> Fixes 22 spelling mistakes found with codespell (for example "optioanl" -> "optional", "recieve" -> "receive", "demoninator" -> "denominator") in datasets.py, transformers.py, splitters.py, score_function.py, evaluate.py, rdkit_descriptors.py and the tutorials page. Only docstrings, comments, documentation text and one warning message are changed; no behavior changes. I reviewed each change by hand. [If true: An AI assistant helped me find and prepare these fixes; I reviewed and tested them myself.]

## RDKit pull requests (two separate ones)
Read the guide first: https://rdkit.org/docs/GettingStartedWithContributing.html (fork, branch, test, pull request; it also asks you to name any AI tool you used beyond autocomplete).

**PR 1: typo fixes.** Same steps with `fix_typos_rdkit.sh`. Title: `Fix spelling mistakes in the RDKit Book, Getting Started, Cookbook and two docstrings`. Body: list a few examples (for example "specfication" -> "specification"), say no behavior changes, and add the AI-assistance sentence if true.

**PR 2: Cookbook recipe.** Open `Docs/Book/Cookbook.rst`, paste the entry from `cookbook_entry_RDKitCB_41.rst` after "Wiener Index", fill in the Author line, and confirm in the current Cookbook that RDKitCB_41 is still the next free number (the Cookbook says so near its top). Run `python recipe_test.py` and the Cookbook doctests described in the guide. Title: `Add Cookbook recipe: scaffold-based train/test split`. Body: say what the recipe does, why (random splits put close analogues in both sets), that you ran its examples, and the AI-assistance sentence if true.

## If you prefer not to use the command line
For a single file you can use GitHub's web editor: open the file on your fork, click the pencil icon, make the edit, and choose "Propose changes". It creates the branch and the pull request for you. The RDKit recipe (one file) works well this way.

## Reality check
- Maintainers may ask for changes, ask you to combine or split the pull request, or decline. Typo fixes are low-risk but not guaranteed.
- A merge usually takes days to weeks.
- If a maintainer replies, answer politely and quickly. I can help you draft replies.
- When a pull request is merged, send me the link and I will add it to Prong 2 (the section is already prepared and commented out).
