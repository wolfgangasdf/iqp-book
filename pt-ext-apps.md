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

# Advanced applications of perturbation theory

In this section, we discuss some more applications of perturbation theory, which are beyond the scope of our course content. However, these are historically very relevant and have lead to great discoveries in physics!

(pt-relativistic-corrs)=
## Relativistic corrections

{{slidetag}}

We had seen that the quantum wavefunction of the electron has angular momentum, which also implies linear momentum - and any moving particle with mass $m$ is subject to relativistic corrections. For a point-like particle, the momentum becomes 

$$p=\frac{m v}{\sqrt{1-(v / c)^2}}$$(ad-pta-1)

Calculation of this perturbation theory, luckily the standard non-degenerate theory works due to the nature of the corrections, for details please read Griffiths 7.3.1. The result for the relativistic energy correction is:

$$
E_r^{(1)}=-\frac{\left(E_n\right)^2}{2 m c^2}\left[\frac{4 n}{\ell+1 / 2}-3\right]
$$(ad-pta-2)

We see that now, the energy levels depend on the angular momentum quantum number $\ell$! The corrections are on the level of $10^{-5}$ compared to the eigenenergies of the electron in the hydrogen atom.

## The Zeeman effect

{{slidetag}}

The last degeneracy in $m_j$ is lifted by the Zeeman effect in an external magnetic field, which we have seen before, now with the dipole moment for electron spin $\vec{\mu}_s=-\frac{e}{m} \vec{S}$ and orbital motion $\vec{\mu}_l=-\frac{e}{2 m} \vec{L}$:

$$H_Z^{\prime}=\frac{e}{2 m}(\vec{L}+2 \vec{S}) \cdot \vec{B}_{ext}$$(ad-pta-6)

Depending on the strength of the magnetic field compared to the internal magnetic fields that lead to spin-orbit interaction, one distinguishes different regimes: The weak- and strong-field Zeeman effect.

### Weak-field Zeeman effect

{{slidetag}}

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

{{slidetag}}

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

{{slidetag}}

As a last effect, we want to mention the hyperfine splitting, since it appears also in other qubit systems.

The origin lies in the magnetic dipole moment of the proton, despite it is much smaller than the dipole moment of the electron because the proton mass is much higher:

$$
\vec{\mu}_p=\frac{g_p e}{2 m_p} \vec{S}_p, \quad \vec{\mu}_e=-\frac{e}{m_e} \vec{S}_e
$$(ad-pta-9)

We find a first-order perturbation theory correction to energy 

$$E_{\mathrm{hf}}^{(1)}=\frac{\mu_0 g_p e^2}{3 \pi m_p m_e a^3}\left\langle\vec{S}_p \cdot \vec{S}_e\right\rangle$$(ad-pta-10)

which is an example of spin-spin coupling! It is suggestive that it splits the "triplet" state where both spins are aligned parallel, and the singlet state where the spins are anti-parallel.

It turns out that for hydrogen, this energy difference is $1420$ MHz which corresponds to a wavelength of 21 cm. This radiation can easily be detected with radio antennas, and since it can easily be thermally excited, it is one of the key frequencies omnipresent in radiation from the universe, since hydrogen is everywhere!

