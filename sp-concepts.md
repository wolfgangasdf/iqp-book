---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---

# Spin: concepts

In this section, we discuss the quantum version of spinning rotation: the spin - and show that it is a crucial quantum property that discriminates different fundamental particles of nature.


## Classical spin

:::{slidetag}
:::


Classically, a body can show an orbiting motion and a spinning rotation, like the earth orbits once a year around the sun and spins every day around the north-south axis. 
The classical-mechanics law for orbital angular momentum is $L=r \times p$, that is the cross-product between the position vector of the orbiting mass $r$, and the linear momentum $p$ of that mass. One often places the origin of the coordinate system at a position of high symmetry, for the case of the earth to the center of the sun. In this case, the orbital angular momentum of the earth is nonzero and points upwards, to the north, as shown in the figure. 

A spinning rotation leads to a spin angular momentum around the center of mass of the spinning body, which is calculated using the same equation $S=r \times p$ for all constituents that make op the spinning body, such as the earth. Approximately, the spin angular momentum $S$ does not contribute to $L$ measured around the origin, but it is clear that both have the same origin and the distinction is largely semantically in classical mechanics. Also, classically, a point-like particle cannot have a spin angular momentum, because $r$ is zero if measured from the center of mass of the particle. Finally, of course, the orbital and spin angular momentum can have any value in classical mechanics.

```{figure} figures/spin/spin-classical.png
---
name: spin-classical
width: 50%
---
Classically, the spin angular momentum is identical to the orbital angular momentum measured around the center of mass of the spinning, and possibly orbiting, body.
```



## Quantum spin

:::{slidetag}
:::


In quantum mechanics, the case is very different, and there is a fundamental difference between orbital and spin angular momentum. First, for the orbital angular momentum (OAM), we remember that we had seen that quantum particles can only have discrete values of angular momentum determined by the angular momentum quantum number $\ell$ - which corresponds to an angular momentum of magnitude $L=\hbar\sqrt{\ell\left(\ell+1\right)}$. 

We had seen that we cannot attribute exact values to all cartesian components of the angular momentum $L_i$ at the same time, due to the uncertainty principle. However, we had seen that we can calculate exact values for the length $L$ or squared length $L^2$ and one cartesian component, where traditionally the $z$-component $L_z$ is chosen. This leads to the eigenvalue $L_z=\hbar m_\ell$ where $m_\ell$ is one of the $2\ell+1$ values between $-\ell$ and $+\ell$. 

Remember that the appearance of angular momentum did simply happen by writing the Schrödinger equation in spherical coordinates. In principle, also for a linearly moving particle one can calculate the angular momenta - but they would change very rapidly. Therefore, the discussion of angular momenta makes only sense for localized particles such as the electron in the hydrogen atom. 

This is different for the spin angular momentum, since it is an intrinsic property of particles, also valid if the particle is moving in a particular direction!

It is one of the most profound discoveries in quantum mechanics that fundamental particles in nature seem to have a spin angular momentum, despite they are considered to be very much “point like” if their position is measured. Remember that the the de Broglie picture attributes a quantum wave to the electron, and that the electron wavefunctions of the hydrogen atom determine the probability to find an electron at a particular position. But, if we measure the position of an electron, we find experimentally that it seems to be very much point-like - to date no substructure of the electron has been discovered. 

The spin is so important in quantum mechanics because of a number of reasons, but probably above all because all known fundamental particles (electron, photon, quarks, gluons and a few more) have a nonzero spin - except for the recently discovered Higgs boson, which was confirmed experimentally in 2013 – it has zero spin.

## Spin commutation relations and eigenvalues 

:::{slidetag}
:::


We now write down the algebraic quantum theory of the spin by exact analogy to the derivation of the quantum orbital angular momentum. Instead of $L$ we use the letter $S$, and instead of $m_\ell$ we use $m_s$. Note that the subscript to $m$ is often omitted, it should be clear from the context. We now rewrite the operator commutation relations in a shorter way using the Levi-Civita symbol $\varepsilon_{klm}$. $\varepsilon_{klm}$ is $+1$ if $k,l,m$ are cyclic like $1,2,3$ or $2,3,1$, and $-1$ if anti-cyclic, and zero otherwise.

$$
\varepsilon_{klm} = \begin{cases}
         +1 & \text{if } (k,l,m) \text{ is } (1,2,3), (2,3,1), \text{ or } (3,1,2), \\
         -1 & \text{if } (k,l,m) \text{ is } (3,2,1), (1,3,2), \text{ or } (2,1,3), \\
    \;\;\,0 & \text{if } k = l, \text{ or } l = m, \text{ or } k = m
\end{cases}
$$(levi)

With this the commutation relations are 

$$
\left[S_k, S_l\right]=i \hbar S_m \varepsilon_{k l m}
$$(sp-c-cr)
 
Again, since the cartesian spin components do not commute they cannot be simultaneously known perfectly due to the uncertainty principle. On the other hand, $\left[S^2,S_i\right]=0$, so the spin vector length commutes with each of the individual components and can be known and measured simultaneously with arbitrary precision. 


We introduce the spin quantum number $s$ and the quantum number of $S_z$, $m_s$ and obtain as before for the orbital angular momentum:

$$
\begin{align}
S^2\left|s,m_s\right\rangle&=\hbar^2s\left(s+1\right)\left|s,m_s\right\rangle\\
S_z\left|s,m_s\right\rangle&=\hbar m\left|s,m_s\right\rangle\\\end{align}
$$(sp-c-s2)

In contrast to the orbital angular momentum, we do not know the eigenfunctions and it does not make sense to restrict ourselves to integer $s$ and $m_s$, which was needed for the orbital angular momentum to make sense with the spherical harmonics eigenfunctions. Therefore here, also half-integer values are allowed as resulted from the algebraic theory of angular momentum in the previous section: 

$$
\begin{align}s&=0,\frac{1}{2},1,\frac{3}{2},\ldots\\
m_s&=-s,-s+1,\ldots,s-1,s
\end{align}
$$(sp-c-s)

Experimentalists have measured $s$ (you will see later how) for all elementary particles and found that every elementary particle has a specific spin $s$. But, classification of particles by their spin is also very useful for composite particles like a proton that consists of several quarks and gluons – but the case is quite complicated if done exactly, and still subject to research. 

## The standard model of particle physics

:::{slidetag}
:::


The so-called standard model particle physics is shown in the figure, where we see the quarks building up the nuclei with spin $1/2$, the lightweight particles, leptons, also with spin $1/2$, exchange particles with integer spin, usually $1$ except for the Higgs boson which has zero spin. Missing is the graviton, the exchange particle of gravity, we don't know yet if it really exists - since we do not have a theory of quantum gravity yet, nor do we know if such theory exists. But if it does exist, the graviton might have spin $2$.

For our daily interactions with nature, but also for quantum information science, two spins are in particular important: $s=1$, for the photon, the quantum particle of light, and $s=1/2$, which is the spin of the electron, protons, and neutrons – key constituents of matter. 

```{figure} figures/spin/standard-model.png
---
name: standard-model
width: 75%
---
The standard model of particles with mass, charge & spin. [Image credit](https://en.wikipedia.org/wiki/Standard_Model)
```




















