Scaffold Split for Train/Test Sets
===================================

| **Author:** Christian N. Nwaeme
| **Source:** Bemis, G. W.; Murcko, M. A. The Properties of Known Drugs. 1. Molecular Frameworks. *J. Med. Chem.* **1996**, 39, 2887-2893.
| **Index ID#:** RDKitCB_41
| **Summary:** Split a list of molecules into training and test sets so that molecules sharing a Bemis-Murcko scaffold always land on the same side of the split.

A random split of a molecular data set often puts close analogues in both the training and the test set, which makes a model look
better than it is on new chemistry. Splitting by scaffold keeps each scaffold group on one side of the split, so test molecules have
core structures that were not seen in training. Molecules without rings have an empty scaffold and form one group.

.. testcode::

   from collections import defaultdict
   from rdkit import Chem
   from rdkit.Chem.Scaffolds import MurckoScaffold

   def scaffold_split(smiles, test_frac=0.2):
       """Return (train_idx, test_idx); molecules sharing a Murcko scaffold stay together."""
       groups = defaultdict(list)
       for i, smi in enumerate(smiles):
           mol = Chem.MolFromSmiles(smi)
           groups[MurckoScaffold.MurckoScaffoldSmiles(mol=mol)].append(i)
       # largest scaffold groups first; ties are broken by the scaffold SMILES so the split is reproducible
       ordered = sorted(groups.items(), key=lambda kv: (-len(kv[1]), kv[0]))
       n_train = int(round((1 - test_frac) * len(smiles)))
       train, test = [], []
       for scaffold, idx in ordered:
           if len(train) + len(idx) <= n_train:
               train.extend(idx)
           else:
               test.extend(idx)
       return sorted(train), sorted(test)

.. testcode::

   smiles = ['c1ccccc1C', 'c1ccccc1CC', 'c1ccccc1O', 'c1ccccc1N', 'c1ccncc1C',
             'c1ccncc1CC', 'C1CCCCC1C', 'C1CCCCC1O', 'CCO', 'CCCC']
   train, test = scaffold_split(smiles, test_frac=0.3)
   print(len(train), len(test))
   print([smiles[i] for i in test])

.. testoutput::

   6 4
   ['c1ccncc1C', 'c1ccncc1CC', 'C1CCCCC1C', 'C1CCCCC1O']

Check that no scaffold appears on both sides:

.. testcode::

   scaf = lambda idx: {MurckoScaffold.MurckoScaffoldSmiles(smiles=smiles[i]) for i in idx}
   print(scaf(train) & scaf(test))

.. testoutput::

   set()

Note that the largest groups are placed in the training set first, so the test set is made of the rarest scaffolds. This is the
convention used by several benchmark suites; shuffling the groups with a fixed random seed instead gives other, equally valid splits
for repeated evaluation.
