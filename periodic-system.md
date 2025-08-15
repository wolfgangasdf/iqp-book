---
jupytext:
    formats: md:myst
    text_representation:
        extension: .md
        format_name: myst
kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# The periodic table of elements

## The electronic structure of atoms

<!-- [G5.2.2 The Periodic Table and P11.1,2] -->
`[slide]`

Now we have all ingredients to understand the building blocks of matter - atoms. At least, we can understand their electronic structure, which is key for chemical reactions, how solid state matter forms from atoms, and how to make qubits from atoms. 

We won’t discuss molecules in detail – they are also very important – but the principles are similar to atoms. We also do not discuss the atomic core – a whole lot of quantumness is going on there, but surprisingly only knowledge of the number of protons, which is the atomic number $Z$, is sufficient to understand atoms.

Atoms are neutral, so an atom with atomic number $Z$ has also $Z$ electrons. These individual electrons in an atom can be described by the 3 quantum numbers $(n,\ell,m)$ that we obtained before, the principal energy quantum number $n$ – often called “shell”, the total angular momentum quantum number $\ell$ called “subshell”, and the $z$-projection of the angular momentum $m$. 

If electrons were bosons, they would all relax into the lowest-energy state (1,0,0) – but they are fermions, and as we have seen before they cannot occupy the same state. This is why for an atom with multiple electrons, they occupy different quantum states. How does this work?

There are $n^2$ 3D hydrogen wavefunctions for a particular $n$, and two possible spin states for each electron – resulting in $2 n^2$ electrons for shell $n$. 

Each subshell can host $4 \ell+2$ electrons, since $m=-\ell\ldots \ell$ and we have again the spin.

Now, if interactions between electrons could be neglected, all electrons in the $n=1$ shell, for instance, would have the same energy. This is not the case, already due to electron-electron Coulomb interaction, but also due to spin-spin magnetic interactions the energy levels slightly change. Here only want to give a qualitative explanation which explains most of the atoms.

`[slide]`

Here we show a table of the first few elements, and how their electronic state is characterized. The *electron configuration* is indicated by $(n\ell)^N$ - meaning $N$ electrons in shell $n$, subshell $\ell$. $\ell$ is written as letters with $s,p,d,f,\ldots$ for $\ell=0,1,2,3$.

The *term symbol* is written as $^{2S+1}L_J$. Here, $S$ is the sum of all $m_s$ values for each electron, and $L$ is the sum of all $m_\ell$ values, denoted by $S,P,D,F,\ldots$. $2S+1$ is then the spin multiplicity - how many different spin configurations are possible (remember $m=-s\ldots s$). $J$ is the total angular momentum quantum number for the electrons in the atom – as we have seen before in angular momentum coupling it can have values from $|L-S|$ to $L+S$. The particular value depend on several boundary conditions and we won't explore this further here.

Why do we need both? If we think about the two $(2p)^2$ electroncs, they could be either in the triplet or singlet state - the term symbol will clarify this.

The table shows the first few elements, where the shells are filled up ordinarily.

| Z | element | configuration | term symbol | 
|---|---|---|---|
| 1 | H | $(1s)$ | $^2S_{1/2}$ |
| 2 | He | $(1s)^2$ | $^1S_{0}$ |
| 3 | Li | $(He)(2s)$ | $^2S_{1/2}$ |
| 4 | Be | $(He)(2s)^2$ | $^1S_{0}$ |
| 5 | B | $(He)(2s)^2(2p)$ | $^2P_{1/2}$ |
| 6 | C | $(He)(2s)^2(2p)^2$ | $^3P_{0}$ |


For more electrons, the lowest-energy configuration can be more complicated due to electron-electron interactions, but it turns out to be pretty simple for most atoms and can be described by 3 rules, so-called **Hund’s rules**. 

To mention one, the first rule is that the configuration with lowest energy has the highest spin multiplicity $2S+1$ - or number of unpaired electrons, electrons which don't have a partner in the same shell with the opposite spin.

This means that, for example, the 3 electrons in the $p$ subshell will be in the $\uparrow\uparrow\uparrow$ spin state. Only if a fourth electron is added, it has to go into the spin-down state resulting in $\uparrow\downarrow\uparrow\uparrow$. Remember this simply as the “bus seat rule” - the bus fills up with individually travelling people such that everyone has two places. The reason for this rule is a bit beyond this course.
You can look all rules in [wikipedia](https://en.wikipedia.org/wiki/Hund%27s_rules)

`[slide]`

```{figure} figures/periodic-table-configuration.png
---
name: periodic-table
---
The periodic table of elements in configuration space - the elements are behaving nicely! [Credit: wikipedia](https://en.wikipedia.org/wiki/Periodic_table#Electron_configuration_table)
```



