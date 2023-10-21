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

## Relativistic corrections

`[slide]`

We had seen that the quantum wavefunction of the electron has angular momentum, which also implies linear momentum - and any moving particle with mass $m$ is subject to relativistic corrections. For a point-like particle, the momentum becomes 

$$p=\frac{m v}{\sqrt{1-(v / c)^2}}$$(ad-pta-1)

Calculation of this perturbation theory, luckily the standard non-degenerate theory works due to the nature of the corrections, for details please read Griffiths 7.3.1. The result for the relativistic energy correction is:

$$
E_r^{(1)}=-\frac{\left(E_n\right)^2}{2 m c^2}\left[\frac{4 n}{\ell+1 / 2}-3\right]
$$(ad-pta-2)

We see that now, the energy levels depend on the angular momentum quantum number $\ell$! The corrections are on the level of $10^{-5}$ compared to the eigenenergies of the electron in the hydrogen atom.

## Spin-orbit coupling

`[slide]`

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

`[slide]`

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

`[slide]`

Historically, we now briefly discussed corrections which collectively are called to result in the "fine structure" of the hydrogen atom: relativistic corrections and spin-orbit coupling, where the latter actually consists of a number of effects and we have only discussed one of them. It is are called "fine structure" because atomic emission lines were observed to split up in several lines if a spectrometer with increased resolution was used.

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

Of course, everything is in excellent agreement with experiments! You have seen that looking deeper at a problem has lifted several degeneracies - where states with different quantum numbers that had the same energy, became split up in energy. Therefore the question is appropriate, do "true degeneracies" at all? Sometimes, if a system is very well under control, they indeed exist - but for the hydrogen atom there are more effects that probably also will lift the leftover $m_j$ degeneracy, which we will discuss now.


## The Zeeman effect

`[slide]`

The last degeneracy in $m_j$ is lifted by the Zeeman effect in an external magnetic field, which we have seen before, now with the dipole moment for electron spin $\vec{\mu}_s=-\frac{e}{m} \vec{S}$ and orbital motion $\vec{\mu}_l=-\frac{e}{2 m} \vec{L}$:

$$H_Z^{\prime}=\frac{e}{2 m}(\vec{L}+2 \vec{S}) \cdot \vec{B}_{ext}$$(ad-pta-6)

Depending on the strength of the magnetic field compared to the internal magnetic fields that lead to spin-orbit interaction, one distinguishes different regimes: The weak- and strong-field Zeeman effect.

### Weak-field Zeeman effect

`[slide]`

For $B_{\mathrm{ext}} \ll B_{\mathrm{int}}$, the fine structure splitting dominates, and $H_Z'$ can be treated as a perturbation. Luckily, $\left|n \ell j m_j\right\rangle$ are good eigenstates and we can use first-order perturbation theory (for details see Griffiths 7.4.1):

$$E_Z^{(1)}=\left\langle n \ell j m_j\left|H_Z^{\prime}\right| n \ell j m_j\right\rangle=\frac{e}{2 m} B_{\mathrm{ext}} \hat{z} \cdot\langle\vec{L}+2 \vec{S}\rangle$$

One can calculate 

$$\langle\vec{L}+2 \vec{S}\rangle=\left[1+\frac{j(j+1)-\ell(\ell+1)+s(s+1)}{2 j(j+1)}\right]\langle\vec{J}\rangle$$

where the term in brackets is the **Landé g-factor** $g_J$:

$$E_Z^{(1)}=\mu_B g_J B_{\mathrm{ext}} m_j$$(ad-pta-7)

And, 

$$\mu_B \equiv \frac{e \hbar}{2 m}=5.788 \times 10^{-5} \mathrm{eV} / \mathrm{T}$$(ad-pta-8)

is the **Bohr magneton**.

The magnetic field breaks rotation symmetry and $H_Z'$ lifts the degeneracy in $m$.

### Strong-field and intermediate fields

`[slide]`

If $B_{\mathrm{ext}} \gg B_{\mathrm{int}}$, we can use $H_{\mathrm{Bohr}}+H_Z^{\prime}$ as the unperturbed Hamiltonian, and use $H_{fs}'$ as the perturbation. 

Now, what if spin-orbit coupling and Zeeman splitting are similar? Somehow a theory needs to connect the corrections by the weak- and strong-field Zeeman effect in a continuous way. In this intermediate regime we need to treat $ H^{\prime}=H_Z^{\prime}+H_{\mathrm{fs}}^{\prime}$ as the perturbation, and it is not clear what good eigenstates are. Therefore, we have to use the Clebsch-Gordan coefficients to find the state decomposition, and have to run perturbation theory with them. We do not do this here but it works, as can be seen in Griffiths 7.4.3, and the result is shown in the figure:

```{figure} figures/perturbation-theory/zeeman-all.png
---
name: zeeman-all
scale: 50%
---
Zeeman splitting of the $n=2$ states of hydrogen where we see that the different regimes connect nicely. Figure from Griffiths.
```
<!-- TODO replace G7.11 -->

## Hyperfine splitting

`[slide]`

As a last effect, we want to mention the hyperfine splitting, since it appears also in other qubit systems.

The origin lies in the magnetic dipole moment of the proton, despite it is much smaller than the dipole moment of the electron because the proton mass is much higher:

$$
\vec{\mu}_p=\frac{g_p e}{2 m_p} \vec{S}_p, \quad \vec{\mu}_e=-\frac{e}{m_e} \vec{S}_e
$$(ad-pta-9)

We find a first-order perturbation theory correction to energy 

$$E_{\mathrm{hf}}^{(1)}=\frac{\mu_0 g_p e^2}{3 \pi m_p m_e a^3}\left\langle\vec{S}_p \cdot \vec{S}_e\right\rangle$$(ad-pta-10)

which is an example of spin-spin coupling! It is suggestive that it splits the "triplet" state where both spins are aligned parallel, and the singlet state where the spins are anti-parallel.

It turns out that for hydrogen, this energy difference is $1420$ MHz which corresponds to a wavelength of 21 cm. This radiation can easily be detected with radio antennas, and since it can easily be thermally excited, it is one of the key frequencies omnipresent in radiation from the universe, since hydrogen is everywhere!



