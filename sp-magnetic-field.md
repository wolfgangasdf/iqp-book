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

# Magnetic fields

<!-- Griffiths 4.4.2(but much better text in Ph8.2 -->
In this section we investigate spins and angular momenta in a magnetic field, this field splits the energy of the angular momentum states which has enabled a crucial experiment proving that the quantum spin is correctly modelling nature: the Stern-Gerlach experiment.


## An electron in a magnetic field

`[slide]`

A particle with spin is a little magnet – called a magnetic dipole, with a north and south pole like the earth magnetic field. Its magnetic dipole moment $\vec{\mu}$ is proportional to its spin angular momentum $\vec{S}$:

$$\vec{\mu}=\gamma\vec{S}$$(sp-b-1)

The proportionality constant $\gamma$ is called the gyromagnetic ratio. For an electron, it is equal to 

$$\gamma=\frac{g_e\mu_B}{\hbar}$$(sp-b-2)

Where $\mu_B$ is the **Bohr magneton**, which relates the spin (but also orbital) angular momentum of an electron to its magnetic moment:

$$\mu_B \equiv \frac{e \hbar}{2 m}=5.788 \times 10^{-5} \mathrm{eV} / \mathrm{T}$$(sp-b-3)

Now, $g_e$ or often written as $g_s$ for the spin is the Landé g-factor, which for a classical spinning charged ball or orbital motion would be $1$, but for the electron spin it is $g_e=2$. Derivation requires relativistic Dirac theory.

 Now, we place the electron with its magnetic dipole moment in a magnetic field $\vec{B}$. We can obtain the Hamiltonian of this system by using the energy of the magnetic moment in the magnetic field $-\vec{\mu}\cdot\vec{B}$, and replacing the moment by the spin operator:

$H=-\gamma\vec{B}\cdot\vec{S}$

This interaction changes the energy for the spin parallel or antiparallel to $\vec{B}$ - this is called the **Zeeman effect**:

```{figure} figures/spin/zeeman.png
---
name: sp-zeeman
---
Zeeman splitting: The parallel and anti-parallel dipole moment orientation with respect to an external magnetic field leads to an energy splitting (right).
```


## Larmor Precession

`[slide]`

What happens for an arbitrarily aligned magnetic moment? Classically, this leads to a torque acting on the dipole $\vec{\mu}\times\vec{B}$, which tries to line up the dipole moment parallel to the field, just like a compass needle. In the absence of dissipation, also classically, the magnetic moment would rotate around the field forever.

Quantum mechanically, for instance for a single electron, only particular orientations are allowed with respect to the quantization axis $z$ here. We have already seen that the magnetic field splits the energy of spin-up and down states - this implies a different "wiggle factor" that we found before! Now, If you simply calculate what this means for, for instance $\langle S_x\rangle$, you will find an oscillation. This is worked out in more detail in Griffith example 4.3 – please have a look!

The result is that the spin rotates around the B-field with the so-called Larmor frequency $\omega=\gamma B_0$. As mentioned, the relative phase of the spin-up and spin-down components change during rotation, therefore this Larmor precession an important tool for spin qubit manipulation in the lab.

```{figure} figures/spin/larmor.png
---
name: sp-larmor
width: 50%
---
Larmor precession: A spin precesses around the magnetic field along $z$.
```

## The Stern-Gerlach experiment

`[slide]`
<!-- [Griffith example 4.4] -->

From magnetostatics in physics it was already long known that a magnetic dipole in an inhomogeneous magnetic field experiences not only a torque, but also a net force - we assume here that the magnetic field varies along the $z$-axis, and consider only the $z$-component of the magnetic moment:

$$
F_z=µ_z\frac{\partial B}{\partial z}
$$(sp-b-sg1)

We now consider that the B-field only changes along the $z$ direction, and we ignore the $x$-component of the spin because this will in fact average out due to the Larmor precession. From before we know that $\vec{\mu}=\gamma \vec{S}$ , and we obtain for the force:

$$
F_z=\gamma\alpha S_z
$$(sp-b-sg2)

Where $\alpha$ describes the strength of the gradient along the $z$-direction of the $B$-field.

Now we send electrons with arbitrary spin orientation through the Stern-Gerlach experiment shown here, with the magnets producing the inhomogeneous magnetic field and a plate on the right for detection of the electrons. 


```{figure} figures/spin/stern-gerlach.png
The Stern-gerlach experiment. A silver atom stream (2) is produced in an oven (1), send through the inhomogeneous magnetic field (3). Classically, we would expect a smeared out picture (4) but quantum mechanics correctly predicts the outcome of the experiment of two distinct spots (5)! [Image credit](https://en.wikipedia.org/wiki/Stern%E2%80%93Gerlach_experiment)
``````

In classical physics, $\mu_z$ could have any value, and any force between $-1/2 \gamma\alpha$ up to $+1/2 \gamma\alpha$ is possible, therefore a vertically smeared-out picture on the electron-detecting plate is expected.

The experimental result was very different – two spots were observed, in agreement with our quantum mechanics knowledge!

In quantum mechanics, the magnetic field along the $z$-axis leads to quantization of the magnetic moment along this axis. The eigenstates of $\mu_z$ and $S_z$ are discrete, either $+1$ or $-1$, therefore only two different orientations of the magnetic moment are possible for the electron. This was a crucial smoking gun experiment showing that the description of elementary particles requires quantum mechanics.
For a more detailed discussion, please see Griffiths Example 4.4, or Phillips 8.2.


