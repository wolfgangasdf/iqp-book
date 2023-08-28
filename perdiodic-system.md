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

Atoms are neutral, so an atom with atomic number $Z$ has also $Z$ electrons. These individual electrons in an atom can be described by the 3 quantum numbers $(n,l,m)$ that we obtained before, the principal energy quantum number $n$ – often called “shell”, the total angular momentum quantum number $\ell$ called “subshell”, and the $z$-projection of the AM $m$. 

If electrons were bosons, they would all relax into the lowest-energy state (1,0,0) – but they are fermions, and as we have seen before they cannot occupy the same state. This is why for an atom with multiple electrons, they occupy different quantum states. How does this work?

There are $n^2$ 3D hydrogen wavefunctions for a particular $n$, and two possible spin states for each electron – resulting in $2 n^2$ electrons for shell $n$. 

Each subshell can host $4 \ell+2$ electrons, since $m=-\ell\ldots \ell$ and we have again the spin.

Now, if interactions between electrons could be neglected, all electrons in the $n=1$ shell, for instance, would have the same energy. This is not the case, already due to electron-electron Coulomb interaction, but also due to spin-spin magnetic interactions the energy levels slightly change. Here only want to give a qualitative explanation which explains most of the atoms.

`[slide]`

Here we show a table of the first few elements, and how their electronic state is characterized. The *electron configuration* is indicated by $(n\ell)^N$ - meaning $N$ electrons in shell $n$, subshell $\ell$. $\ell$ is written as letters with $s,p,d,f,\ldots$ for $\ell=0,1,2,3$.

The *term symbol* is written as $^{2(S+1)}L_J$. Here, $2(S+1)$ is the spin multiplicity - how many different spin configurations are possible (remember $m=-s\ldots s$). $J$ is the total angular momentum quantum number for the electrons in the atom – as we have seen before in angular momentum coupling it ranges from $|L-S|$ to $L+S$. Finally, $L$ is the total orbital angular momentum quantum number denoted by $S,P,D,F,\ldots$

Why do we need both? If we think about the two $(2p)^2$ electroncs, they could be either in the triplet or singlet state - the term symbol will clarify this.

| Z | element | configuration | term symbol | 
|---|---|---|---|
| 1 | H | $(1s)$ | $^2S_{1/2}$ |
| 2 | He | $(1s)^2$ | $^1S_{0}$ |
| 3 | Li | $(He)(2s)$ | $^2S_{1/2}$ |
| 4 | Be | $(He)(2s)^2$ | $^1S_{0}$ |
| 5 | B | $(He)(2s)^2(2p)$ | $^2P_{1/2}$ |
| 6 | C | $(He)(2s)^2(2p)^2$ | $^3P_{0}$ |


How the electrons for a particular atom take find their lowest-energy configuration could be very complicated due to the electron-electron interactions, but it turns out to be pretty simple for most atoms and can be described by 3 rules, so-called **Hund’s rules**. 

To mention one, the first rule is that the configuration with the highest spin multiplicity 2S+1 which is also equal to the number of unpaired electrons plus one, has the lowest energy. 

For example, 3 electrons in the $p$ subshell will be in the $\uparrow\uparrow\uparrow$ spin state. Only if a fourth electron is added, it has to go into the down state and we obtain $\uparrow\downarrow\uparrow\uparrow$. Remember this simply as the “bus seat rule”! The reason for this rule is a bit beyond this course.
Look up the rules in [wikipedia](https://en.wikipedia.org/wiki/Hund%27s_rules)

`[slide]`

```{figure} figures/periodic-table-configuration.png
---
name: periodic-table
---
The periodic table of elements in configuration space - the elements are behaving nicely! [Credit: wikipedia](https://en.wikipedia.org/wiki/Periodic_table#Electron_configuration_table)
```



