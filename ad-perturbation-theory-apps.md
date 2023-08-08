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

## Relativistic corrections

`[slide]`

We had seen that the quantum wavefunction of the electron has angular momentum, which also implies linear momentum - and any moving particle with mass $m$ is subject to relativistic corrections. For a point-like particle, the momentum becomes 

$$p=\frac{m v}{\sqrt{1-(v / c)^2}}$$

Calculation of this perturbation theory, luckily the standard non-degenerate theory works due to the nature of the corrections, for details please read Griffith 7.3.1. The result is:

$$
E_r^1=-\frac{\left(E_n\right)^2}{2 m c^2}\left[\frac{4 n}{\ell+1 / 2}-3\right]
$$

We see that now, the energy levels depend on the angular momentum quantum number $\ell$! The corrections are on the $10^-5$ level to the eigenenergies of hydrogen.

## Spin-orbit coupling

`[slide]`

As we discussed before, particles with spin have a magnetic moment $\vec{\mu}=\gamma\vec{S}$, and if there is a magnetic field it has an energy of $H=-\gamma\vec{B}\cdot\vec{S}$. Where is the issue in hydrogen-like systems without external magnetic fields?

In the rest frame of the proton, there is no magnetic field produced by the proton. However, in the rest frame of the electron, where the proton circles around the electron, it produces a magnetic field known from the [Biot-Savart law](https://en.wikipedia.org/wiki/Biot%E2%80%93Savart_law) in electromagnetism. 

```{figure} figures/perturbation-theory/soc-protonfield.png
---
name: soc-protonfield
---
The hydrogen atom, from the perspective of the electron the proton is orbiting around the electron and produces a magnetic field.
```
<!-- TODO replace -->

The magnetic field is proportional to the angular momentum of the electron: 

$$\vec{B}\propto\vec{L}$$

We obtain as the spin-orbit coupling Hamiltonian this expression - we mainly note that it retains our initial assumption:

$$H_{so}^{\prime}=\left(\frac{e^2}{8 \pi \epsilon_0}\right) \frac{1}{m^2 c^2 r^3} \vec{S}\cdot\vec{L}$$

## Quantum spin-orbit coupling

`[slide]`

In the presence of such interaction, you probably agree that $H$ no longer commutes with $\vec{L}$ and $\vec{S}$, and the spin and orbital angular momenta are not separately conserved.

Luckily, $H_{so}$ does commute with $L^2$, $S^2$, and the total angular momentum $\vec{J}=\vec{L}+\vec{S}$. So $L_z$ and $S_z$ became bad states, but the eigenstates of $L^2$, $S^2$, $J^2$, and $J_z$ are "good"! We won't calculate them here, see Griffith 7.3.2 for more information.

The most important outcome is that the energy of the electronic states in hydrogen depend not only on $n$, but also on the total angular momentum quantum number $j$, which therefore splits different $\ell$ and $s$ states:

```{figure} figures/perturbation-theory/h-finestructure.png
---
name: h-finestructure
---
```
<!-- TODO replace -->

`[slide]`

Historically, the "fine structure" of the hydrogen atom includes the relativistic corrections and spin-orbit coupling, which itself has contributions by a number of effects.

Here is a very useful wikipedia page which sums up very well many decades of research on the fine structure of hydrigen: [wikipedia](https://en.wikipedia.org/wiki/Fine_structure). Effects can work in different directions, as shown here:

```{figure} figures/perturbation-theory/h-finestructure-wp.png
---
name: h-finestructure-wp
---
```

Of course, everything is in excellent agreement with experiments! Probably a note on the existence of "true degeneracies" - probably it's best not to think that they are fundamental, but only due to our level of approximation of a model. For instance, even the levels on the right in the figure above are degenerate - what splits this last degeneracy in $m_j$?


## The Zeeman effect


TODO but only strong...
also do zeeman here, mention that lots of confusion of strong field and weak field - this is just because the effective magnetic field of SOC in atoms is pretty strong (tesla) - but in qutech it doesn't really play a role so we usually are in the easy strong field regime.


also own data!



