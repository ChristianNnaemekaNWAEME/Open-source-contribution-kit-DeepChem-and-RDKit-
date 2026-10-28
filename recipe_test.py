from collections import defaultdict
from rdkit import Chem
from rdkit.Chem.Scaffolds import MurckoScaffold

def scaffold_split(smiles, test_frac=0.2):
    """Return (train_idx, test_idx) so that molecules sharing a Murcko scaffold stay together."""
    groups = defaultdict(list)
    for i, smi in enumerate(smiles):
        mol = Chem.MolFromSmiles(smi)
        groups[MurckoScaffold.MurckoScaffoldSmiles(mol=mol)].append(i)
    # largest scaffold groups first, ties broken by scaffold SMILES so the split is reproducible
    ordered = sorted(groups.items(), key=lambda kv: (-len(kv[1]), kv[0]))
    n_train = int(round((1 - test_frac) * len(smiles)))
    train, test = [], []
    for scaffold, idx in ordered:
        if len(train) + len(idx) <= n_train:
            train.extend(idx)
        else:
            test.extend(idx)
    return sorted(train), sorted(test)

smiles = ['c1ccccc1C', 'c1ccccc1CC', 'c1ccccc1O', 'c1ccccc1N', 'c1ccncc1C',
          'c1ccncc1CC', 'C1CCCCC1C', 'C1CCCCC1O', 'CCO', 'CCCC']
train, test = scaffold_split(smiles, test_frac=0.3)
print(len(train), len(test))
print([smiles[i] for i in test])
scaf = lambda idx: {MurckoScaffold.MurckoScaffoldSmiles(smiles=smiles[i]) for i in idx}
print(scaf(train) & scaf(test))
