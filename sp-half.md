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

# Spin one half

In this section, we discuss the most common spin: $1/2$ - we show how this can be used to realize qubits in many systems and how the spin operators are connected to rotations.


## Spin 1/2 quantum states

<!-- Griffiths 4.4.1 -->
{{slidetag}}

We now discuss $s=1/2$, for instance for an electron – once we have understood this case it is quite simple to work out the formalism for any other spin. As we have seen before, there are only two possible values for $m_s = \pm1/2$, and therefore there are just two eigenstates, now in the notation $\left|sm_s\right\rangle$:

$$
\left|sm_s\right\rangle=\left\{\left|\frac{1}{2}\frac{1}{2}\right\rangle,\left|\frac{1}{2}-\frac{1}{2}\right\rangle\right\}, 
$$(sp-oh-s1)

Note that the comma between $s$ and $m_s$ has been omitted - since there is no ambiguity here. These states are often called spin-up and spin-down, and written as the state vectors $|\uparrow\rangle$ and $|\downarrow\rangle$. 

In quantum information, the preferred notation called the computational basis is $\left|0\right\rangle$ and $\left|1\right\rangle$. In many quantum mechanics books, the spin states are called spinors $\chi_+$ and $\chi_-$, and a general spin state that is a quantum superposition of these basis states is written as 

$$
\chi=\left(\begin{array}{l}
a \\
b
\end{array}\right)=a \chi_{+}+b \chi_{-}
$$(sp-oh-ch)

In contrast to an electron in a harmonic potential, where we needed to add an anharmonicity to obtain a useful two-level system, we see that the spin of a single spin-half particle already defines a very nice two-level system that is potentially usable for quantum information processing! 

## Spin 1/2 algebra

{{slidetag}}

Now we can use relatively simple algebra – we have two basis states, therefore our spin-1/2 Hilbert space is two-dimensional, and  operators are $2\times 2$ matrices. Since our spin states are eigenstates of the operators $S^2$ and $S_z$ , we can work them out simply by calculating their eigenvalues for $\left|0\right\rangle$ and $\left|1\right\rangle$:

$$
S^2\left|0\right\rangle=\hbar^2\ s(s+1)\left|0\right\rangle=\frac{3}{4}\hbar^2\left|0\right\rangle\\

S^2\left|1\right\rangle=\frac{3}{4}\hbar^2\left|1\right\rangle\\

S_z\left|0\right\rangle=\frac{\hbar}{2}\left|0\right\rangle, 		S_z\left|1\right\rangle=-\frac{\hbar}{2}\left|1\right\rangle
$$(sp-oh-a1)

And we get 

$$
S^2=\frac{3}{4}\hbar^2\left(\begin{matrix}1&0\\0&1\\\end{matrix}\right)\quad\text{and}\quad	S_z=\frac{\hbar}{2}\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$(sp-oh-a2)

For the spin ladder operators, and the other projection operators we obtain in a similar way:

$$
\mathrm{S}_{+}=\hbar\left(\begin{array}{ll}
0 & 1 \\
0 & 0
\end{array}\right), \quad \mathrm{S}_{-}=\hbar\left(\begin{array}{ll}
0 & 0 \\
1 & 0
\end{array}\right)
$$(sp-oh-a3)

Since $S_{ \pm}=S_x \pm i S_y$, we have $S_x=(1 / 2)\left(S_{+}+S_{-}\right)$ and $S_y=(1 / 2 i)\left(S_{+}-S_{-}\right)$, and with this we can calculate the operators for the other spin components:

$$
\mathrm{S}_x=\frac{\hbar}{2}\left(\begin{array}{ll}0 & 1 \\ 1 & 0\end{array}\right), \quad \mathrm{S}_y=\frac{\hbar}{2}\left(\begin{array}{cc}0 & -i \\ i & 0\end{array}\right)
$$(sp-oh-a4)

:::{note}
Convince yourselves that the ladder operator matrices do what they should do! Also, calculate Example 4.2 from Griffiths.
:::

<!-- [ex: Griffiths example 4.2 & see text below!] -->

## Pauli matrices

{{slidetag}}

It turns out that the $S_i$ matrices are so useful and fundamental in quantum mechanics that, after pulling out the factor $\hbar/2$, they get another name, the spin Pauli matrices $\sigma_i$:

$$
\sigma_x=\left(\begin{matrix}0&1\\1&0\\\end{matrix}\right), 		\sigma_y=\left(\begin{matrix}0&-i\\i&0\\\end{matrix}\right), 	\sigma_z=\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$(sp-oh-a5)

The spin operator (vectorial here) can then be written as $\vec{S}=\left(\hbar/2\right)\vec\sigma$ with $\vec\sigma=\left(\sigma_x,\sigma_y,\sigma_z\right)$.

The Pauli matrices $\sigma_i$ form the basis of unitary operators on spin states. They are hermitian operators, because they correspond to observables. The spin ladder operators are not hermitian - they are also of course not observable! Since the spin-1/2 system is equivalent to any two-level system describing qubits, the whole algebra for qubits is based on them!

## The Bloch sphere

{{slidetag}}

We now briefly want to mention how such a qubit can be visualized. If we take the arbitrary qubit $|\psi\rangle=\alpha |0\rangle+\beta|1\rangle$, we have two complex coefficients and therefore 4 real numbers. We can, however, remove one real number because the global phase of a quantum state is irrelevant for all observable quantities. Therefore we end up with a 3-dimensional parameter space, which can be visualized in 3 dimensions! Now, due to normalization $|\alpha|^2+|\beta|^2=1$, (pure) quantum states reside on a sphere with radius 1 - the so-called *Bloch sphere* shown in the figure. A qubit state can therefore also be parametrized by two angles $\theta$, the polar angle and $\phi$, the azimuthal angle with $0 \leq \theta \leq \pi$ and $0 \leq \phi \leq 2 \pi$:

$$
|\psi\rangle=\cos \frac{\theta}{2}|0\rangle+e^{i \phi} \sin \frac{\theta}{2}|1\rangle
$$

On the Bloch sphere, $|0\rangle$ is on the north pole, and $|1\rangle$ on the south pole, and every point on the surface describes a quantum superposition of these basis states.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
# 3d arrows, omg - https://stackoverflow.com/a/74122407
from matplotlib.patches import FancyArrowPatch
from mpl_toolkits.mplot3d import proj3d
class Arrow3D(FancyArrowPatch):
    def __init__(self, xs, ys, zs, *args, **kwargs):
        super().__init__((0,0), (0,0), *args, **kwargs)
        self._verts3d = xs, ys, zs
    def do_3d_projection(self, renderer=None):
        xs3d, ys3d, zs3d = self._verts3d
        xs, ys, zs = proj3d.proj_transform(xs3d, ys3d, zs3d, self.axes.M)
        self.set_positions((xs[0],ys[0]),(xs[1],ys[1]))
        return min(zs)
arrow_prop_dict = dict(mutation_scale=20, linewidth=3, arrowstyle='-|>', shrinkA=0, shrinkB=0)
def pol2cart(r, theta, phi):
    theta=pi/2+theta
    return [r * sin(theta) * cos(phi),r * sin(theta) * sin(phi),r * cos(theta)]
fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.set_aspect("equal")
ax.view_init(elev=10, azim=20, roll=0)
rr=1.5
ax.add_artist(Arrow3D([-rr, rr], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [-rr, rr], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [0, 0], [-rr, rr], **(arrow_prop_dict | dict(color="0.2"))))
ax.text3D(rr,-0.2,0.0,"$S_x$", fontsize=15)
ax.text3D(0,rr,0.1,"$S_y$", fontsize=15)
ax.text3D(rr,0.2,rr,"$S_z$", fontsize=15)
thax=linspace(-pi,pi,50);
fiax=linspace(0,2*pi,50)
for fi in linspace(0,2*pi,10):
    c1=pol2cart(1,thax,fi)
    ax.plot(c1[0], c1[1], c1[2], color="0.5", alpha=0.5)
for th in linspace(-pi,pi,10):
    c1=pol2cart(1,th,fiax)
    ax.plot(c1[0], c1[1], c1[2], color="0.5", alpha=0.5)
c1=pol2cart(1,-pi/4,pi/3)
ax.add_artist(Arrow3D([0,c1[0]],[0,c1[1]],[0,c1[2]], **(arrow_prop_dict | dict(color="r"))))
ax.text3D(0.0,c1[0],c1[2],r"$\psi$", fontsize=20, color='r')
ax.plot([0,c1[0]], [0,c1[1]], [0,0], color="k")
ax.plot([c1[0],c1[0]], [c1[1],c1[1]], [0,c1[2]], color="k")
c1=pol2cart(0.7,0,linspace(0,pi/3,10))
ax.plot(c1[0], c1[1], c1[2], color="orange", alpha=1)
ax.text3D(0,0.1,0.8,r"$\theta $", fontsize=20, color="black")
c1=pol2cart(0.7,linspace(-pi/2,-pi/4,10),pi/3)
ax.plot(c1[0], c1[1], c1[2], color="orange", alpha=1)
ax.text3D(0.2,0.2,-0.3,r"$\phi $", fontsize=20, color="black")
ax.set_xticks([]); ax.set_yticks([]); ax.set_zticks([])
plt.show()

glue("sp-bloch-sphere", fig, display=False)
```

(sp-bloch-sphere)=
```{glue:figure} sp-bloch-sphere
The qubit Bloch sphere with a particular qubit state, indicated by the so-called Blochvector, and the polar and azimuthal angle is indicated.
```

:::{note}

Simple projection tells us that the coordinates of the point on the Bloch sphere where the (pure) quantum state lies is:

$$
(x, y, z) = (\cos\,\phi \sin\,\theta, \sin\,\phi \sin\,\theta, \cos\,\theta)
$$

Now, as an exercise, let us calculate the expectation values of a general quantum state for $\sigma_x, \sigma_y, \sigma_z$.

First, we write the quantum state $\ket{\psi}$ in the matrix form:

$$
\ket{\psi} = \begin{bmatrix}
\cos \frac{\theta}{2} \\
e^{i \phi} \sin \frac{\theta}{2}
\end{bmatrix}
$$

Now we calculate $\langle \sigma_x \rangle$:

$$
\begin{aligned}
\langle\psi|\sigma_x|\psi\rangle
&=
\begin{bmatrix}
\cos \frac{\theta}{2} & e^{-i \phi} \sin \frac{\theta}{2} 
\end{bmatrix}
\begin{bmatrix}0&1\\1&0\end{bmatrix}
\begin{bmatrix}
\cos \frac{\theta}{2} \\
e^{i \phi} \sin \frac{\theta}{2}
\end{bmatrix} \\[6pt]
&=
\begin{bmatrix}
\cos \frac{\theta}{2} & e^{-i \phi} \sin \frac{\theta}{2} 
\end{bmatrix}
\begin{bmatrix}
e^{i\phi}\sin\frac{\theta}{2} \\
\cos\frac{\theta}{2}
\end{bmatrix}
\\[6pt]
&=\cos \frac{\theta}{2}\,e^{i\phi}\sin\frac{\theta}{2}
+ e^{-i\phi}\sin\frac{\theta}{2}\,\cos\frac{\theta}{2} \\[6pt]
&=\cos\frac{\theta}{2}\sin\frac{\theta}{2}\,\big(e^{i\phi}+e^{-i\phi}\big) \\[6pt]
&=2\cos\frac{\theta}{2}\sin\frac{\theta}{2}\,\cos\phi \\[6pt]
&=\cos\phi\,\sin\theta
\end{aligned}
$$

As we can see, this is exactly the X-coordinate of the quantum state on the Bloch Sphere! You can verify for yourself that this holds true for the Y and Z coordinates as well. This is not just a neat coincidence, the Bloch Vector is defined so that it's coordinates line up perfectly with the expectation values of these measurements.

:::

## Pauli matrices and rotations

{{slidetag}}

You might know the Pauli matrices $\sigma_x, \sigma_y, \sigma_z$ from the single-qubit quantum logic gates, where they are usually called $X,Y,Z$ - You can easily convince yourselves that the Pauli matrices rotate a qubit state by 180 degrees on the Bloch sphere. For instance, $\sigma_x|0\rangle = |1\rangle$.
How can we rotate around arbitrary angles? The Pauli matrices are called the generators of rotation, if we exponentiate the Pauli matrices in the following way, it turns out that we obtain arbitrary angle qubit rotation matrices: 

$$
\begin{aligned}
& R_x(\theta) \equiv e^{-i \frac{\theta}{2} \sigma_x}=\cos \frac{\theta}{2} I-i \sin \frac{\theta}{2} \sigma_x=\left[\begin{array}{cc}
\cos \frac{\theta}{2} & -i \sin \frac{\theta}{2} \\
-i \sin \frac{\theta}{2} & \cos \frac{\theta}{2}
\end{array}\right] \\
& R_y(\theta) \equiv e^{-i \frac{\theta}{2} \sigma_y}=\cos \frac{\theta}{2} I-i \sin \frac{\theta}{2} \sigma_y=\left[\begin{array}{cc}
\cos \frac{\theta}{2} & -\sin \frac{\theta}{2} \\
\sin \frac{\theta}{2} & \cos \frac{\theta}{2}
\end{array}\right] \\
& R_z(\theta) \equiv e^{-i \frac{\theta}{2} \sigma_z}=\cos \frac{\theta}{2} I-i \sin \frac{\theta}{2} \sigma_z=\left[\begin{array}{cc}
e^{-i \theta / 2} & 0 \\
0 & e^{i \theta / 2}
\end{array}\right]
\end{aligned}
$$(sp-oh-pr2)

Here we made use of a vavriant of the Euler formula: if an operator satisfies $A^2=I$ then we have $e^{i \theta A}=\cos (\theta) I+i \sin (\theta) A$.

You might recognize the 2D vector rotation matrices, which makes sense, since each equation describes a rotation in a 2D plane!



<!-- also useful: http://www.vcpc.univie.ac.at/~ian/hotlist/qc/talks/bloch-sphere-rotations.pdf but we haven't introduced the density operator, to make observables invariant under unitary transformations one needs to do R.rho.R^dag - this is not needed for pure states. -->

:::{note}
For easy visualization of qubits on the Bloch sphere, and to investigate these rotations, we suggest to use the [qutip](https://qutip.org/docs/latest/guide/guide-bloch.html) or probably even better the [qiskit](https://qiskit.org/documentation/stubs/qiskit.visualization.plot_bloch_multivector.html) Bloch sphere functions. Play around with Pauli rotations!
:::

(sp-half-ex-meas)=
:::{note}
**Example: measurement of spin 1/2 states**
<!-- Classic Griffiths dialogue section -->

If we have a particle in the spin-up state, and we measure the $z$-component of the spin angular momentum, which value do we get?

We obtain $S_z=\hbar /2$. 

Now, let us measure afterwards the $x$-component of the spin angular momentum of the particle, what is the outcome? 

We obtain with 50% chance $\hbar /2$, and with 50% chance $-\hbar /2$.

This might first seem weird, since we know the state exactly before the second measurement, it was in the spin-up state. But remember photon polarization, or any other degree of freedom: If we measure in a different “unbiased” basis, the outcome is always 50:50.
:::