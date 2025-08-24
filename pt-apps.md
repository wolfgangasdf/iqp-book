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

# Applications of perturbation theory

In this section, we give an overview how perturbation theory is used to calculate all kinds of corrections to the very simple hydrogen model that we had discussed before.

Historically and in most books, perturbation theory has been applied to calculate energy levels of atoms with better and better precision - to keep pace with the constantly increasing precision of experimental data - and this race is still on-going.

However, perturbation theory is equally useful for prediction of the behaviour of modern quantum systems that are used as qubits, therefore learning perturbation theory is useful for QIST! Anyway, in this course we will focus on the hydrogen atom.

## Spin-orbit coupling

{{slidetag}}

As we discussed before, particles with spin have a magnetic moment $\vec{\mu}=\gamma\vec{S}$, and if there is a magnetic field it has an energy of $H=-\gamma\vec{B}\cdot\vec{S}$. Does this lead to corrections in hydrogen-like systems, even without external magnetic fields?

In the rest frame of the proton, there is no magnetic field produced by the proton. However, in the rest frame of the electron, where the proton circles around the electron, it produces a magnetic field known from the [Biot-Savart law](https://en.wikipedia.org/wiki/Biot%E2%80%93Savart_law) in electromagnetism - shown in the figure. 

```{figure} figures/perturbation-theory/soc-protonfield.png
---
name: soc-protonfield
scale: 50%
---
The hydrogen atom, from the perspective of the electron, the proton is orbiting around the electron and produces a magnetic field.
```

This magnetic field turns out to be is proportional to the angular momentum of the electron: 

$$\vec{B}\propto\vec{L}$$(ad-pta-3)

The resulting correction term in the Hamiltonian depends on the orientations of the spin and orbital angular momenta - therefore it is also called the spin-orbit coupling Hamiltonian:

$$H_{so}^{\prime}=\left(\frac{e^2}{8 \pi \epsilon_0}\right) \frac{1}{m^2 c^2 r^3} \vec{S}\cdot\vec{L}$$(ad-pta-4)

<!-- TODO not very clear - probably add a slide? -->

## Quantum spin-orbit coupling

{{slidetag}}

In the presence of such interaction, you probably agree that the Hamiltonian $H$ no longer commutes with $\vec{L}$ and $\vec{S}$, and the spin and orbital angular momenta are not separately conserved.

Luckily, $H_{so}$ does still commute with $L^2$, $S^2$, and the total angular momentum $\vec{J}=\vec{L}+\vec{S}$. So the eigenstates of $L_z$ and $S_z$ became bad states, but the eigenstates of $L^2$, $S^2$, $J^2$, and $J_z$ are "good"! We won't calculate them here, see Griffiths 7.3.2 for more information. The resulting energy correction is:

$$
E_{\mathrm{so}}^{(1)}=\frac{\left(E_n\right)^2}{m c^2}\left\{\frac{n[j(j+1)-\ell(\ell+1)-3 / 4]}{\ell(\ell+1 / 2)(\ell+1)}\right\}
$$(ad-pta-5)

The most important outcome of this is that the energy of the electronic states in hydrogen depend not only on $n$ and $\ell$, but also on the spin via $j$, which therefore splits different $\ell$ and $s$ states, as shown in the figure:

```{figure} figures/perturbation-theory/h-finestructure.png
---
name: h-finestructure
scale: 50%
---
Electronic energy levels of hydrogen with fine structure. From Griffiths.
```
<!-- TODO replace also bad-->

{{slidetag}}

Historically, we now briefly discussed corrections which, along with relativistic corrections (discussed in the Appendix), collectively are called to result in the "fine structure" of the hydrogen atom. Spin-orbit coupling actually consists of a number of effects and we have only discussed one of them. It is are called "fine structure" because atomic emission lines were observed to split up in several lines if a spectrometer with increased resolution was used.

As mentioned before, the corrections are small, and often they are expressed in powers of the fine-structure constant $\alpha$ which consists of constants that appear in the expressions: 

$$
\alpha \equiv \frac{e^2}{4 \pi \epsilon_0 \hbar c} \approx \frac{1}{137.036}
$$(ad-fs)

Relativistic corrections and spin-orbit coupling together are of order $\alpha^2$.

There is a very useful wikipedia page which sums up very well many decades of research on the fine structure of hydrogen: [wikipedia](https://en.wikipedia.org/wiki/Fine_structure). The correction effects can work in different directions, and even sometimes compensate each other, an example is shown in the figure:

```{figure} figures/perturbation-theory/h-finestructure-wp.png
---
name: h-finestructure-wp
scale: 50%
---
Image credit: [link](https://commons.wikimedia.org/wiki/File:Hydrogen_fine_structure_energy_2.svg)
```

Of course, everything is in excellent agreement with experiments! You have seen that looking deeper at a problem has lifted several degeneracies - where states with different quantum numbers that had the same energy, became split up in energy. Therefore the question is appropriate, do "true degeneracies" at all? Sometimes, if a system is very well under control, they indeed exist - but for the hydrogen atom there are more effects that probably also will lift the leftover $m_j$ degeneracy, which is discussed in the Appendix.
