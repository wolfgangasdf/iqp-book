---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---

# Magnetic fields

<!-- Griffiths 4.4.2(but much better text in Ph8.2 -->
In this section we investigate spins in an external magnetic field. This field splits the energy of the spin states which has enabled a crucial experiment proving that the quantum spin is correctly modelling nature: the Stern-Gerlach experiment.

```{seealso}
Further reading: Griffiths Chapter 4.4.2 and Phillips Chapter 8.2
```


## An electron in a magnetic field

:::{slidetag}
:::


This section discusses a small aspect of electromagnetism, which in physics is tought in several courses on electrostatics and electrodynamics. We hope you see that only very few concepts are needed to understand the spin dynamics in a magnetic field!

A particle with spin can be seen as a little magnet – or a *magnetic dipole*, with a north and south pole like the earth. The magnetic dipole moment $\vec{\mu}$ is proportional to the spin angular momentum $\vec{S}$:

$$\vec{\mu}=\gamma\vec{S}$$(sp-b-1)

The proportionality constant $\gamma$ is called the gyromagnetic ratio. For an electron, it is equal to 

$$\gamma=\frac{g_e\mu_B}{\hbar}$$(sp-b-2)

Where $\mu_B$ is the **Bohr magneton**, which relates the spin (but also orbital) angular momentum of an electron to its magnetic moment:

$$\mu_B \equiv \frac{e \hbar}{2 m}=5.788 \times 10^{-5} \mathrm{eV} / \mathrm{T}$$(sp-b-3)

Now, $g_e$ or often written as $g_s$ for the spin is the Landé g-factor, which for a classical spinning charged ball or orbital motion would be $1$, but for the electron spin it is $g_e\approx-2$. Derivation requires relativistic Dirac theory, and is irrelevant here.

 Now, we place the electron with its magnetic dipole moment in a magnetic field $\vec{B}$. We can obtain the Hamiltonian of this system by using the energy of the magnetic moment in the magnetic field $-\vec{\mu}\cdot\vec{B}$, and replacing the moment by the spin operator:

$H=-\gamma\vec{B}\cdot\vec{S}$

This interaction changes the energy for the spin parallel or antiparallel to $\vec{B}$ - this is called the **Zeeman effect** as shown in the figure. 

```{figure} figures/spin/zeeman.png
---
name: sp-zeeman
---
Zeeman splitting: The parallel and anti-parallel magnetic moment orientation with respect to an external magnetic field leads to an energy splitting of the spin states (right).
```


## Larmor Precession

:::{slidetag}
:::


What happens for an arbitrarily aligned magnetic moment? As shown in the figure, we consider a spin magnetic moment, and the magnetic field aligned along the $z$ axis. Classically, this leads to a torque acting on the dipole $\vec{\mu}\times\vec{B}$, which tries to line up the dipole moment parallel to the field, just like a compass needle. In the absence of dissipation, also classically, the magnetic moment would rotate around the field forever as indicated in the figure.

Quantum mechanically, for instance for a single electron, only particular orientations are allowed with respect to the quantization axis $z$ here. We have already seen that the magnetic field splits the energy of spin-up and down states - this implies a different "wiggle factor" that we found before! Now, If you simply calculate what this means for, for instance for the $x$-component $\langle S_x\rangle$, you will find an oscillation. This is worked out in more detail in Griffiths example 4.3 – please have a look!

The result is that the spin rotates around the B-field with the so-called Larmor frequency $\omega=\gamma B_0$ - pretty much like in classical electrodynamics. As mentioned, the relative phase of the spin-up and spin-down components change during rotation, therefore this Larmor precession an important tool for spin qubit manipulation in the lab.

```{figure} figures/spin/larmor.png
---
name: sp-larmor
width: 50%
---
Larmor precession: A spin precesses around the magnetic field along $z$.
```

## The Stern-Gerlach experiment

:::{slidetag}
:::

<!-- [Griffiths example 4.4] -->

From magnetostatics in physics it was already known since a long time that a magnetic dipole in an *inhomogeneous* magnetic field experiences not only a torque, but also a net force. We assume here that the magnetic field varies along the $z$ direction, and consider only the $z$-component of the spin and its magnetic moment, $\mu_z$:

$$
F_z=\mu_z\frac{\partial B}{\partial z}
$$(sp-b-sg1)

In fact, the other components of $S$ or $\mu$ will average out due to Larmor precession. From before we know that $\vec{\mu}=\gamma \vec{S}$ , and we obtain for the force:

$$
F_z=\gamma\alpha S_z
$$(sp-b-sg2)

$\alpha$ describes the strength of the gradient along the $z$-direction of the $B$-field.

Now we perform the experiment shown in the figure. Note that it uses not electrons but silver atoms, however the discussion is the same. The atoms are produced in an oven labelled 1 with arbitrary spin orientation and shaped into a nice stream, label 2. This is then sent through an  arbitrary spin orientation through the experiment shown here, with the magnets producing the inhomogeneous magnetic field labelled 3. On the left is a plate that detects the position of the particles. 


```{figure} figures/spin/stern-gerlach.png
The Stern-gerlach experiment. Classically, we would expect a smeared out picture (4) but quantum mechanics correctly predicts the outcome of the experiment of two distinct spots (5)! [Image credit](https://en.wikipedia.org/wiki/Stern%E2%80%93Gerlach_experiment)
``````

In classical physics, $\mu_z$ could have any value, and any force between $-1/2 \gamma\alpha$ up to $+1/2 \gamma\alpha$ is possible, therefore a vertically smeared-out picture on the electron-detecting plate is expected, label 4.

The experimental result was very different – two spots were observed, label 5, in agreement with our quantum mechanics knowledge: there are only two allowed $z$ components of the spin-1/2 particle!

Or we rephrase: In quantum mechanics, the magnetic field along the $z$-axis leads to quantization of the magnetic moment along this axis. The eigenstates of $\mu_z$ and $S_z$ are discrete, therefore only two different orientations of the magnetic moment are possible for the electron. This was a crucial smoking gun experiment showing that the description of elementary particles requires quantum mechanics - called the Stern-Gerlach experiment.

:::{note}
For a more detailed discussion, please see Griffiths Example 4.4, or Phillips 8.2.
:::

