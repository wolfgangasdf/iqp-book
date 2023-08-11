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

## Spin 1/2 quantum states

<!-- Griffiths 4.4.1 -->
`[slide]`

We now discuss $s=1/2$, for instance for an electron – once we have understood this case it is quite simple to work out the formalism for any other spin. As we have seen before, there are only two possible values for $m_s$ and therefore there are just two eigenstates, now in the notation $\left|sm_s\right\rangle$:

$$
\left|sm_s\right\rangle=\left\{\left|\frac{1}{2}\frac{1}{2}\right\rangle,\left|\frac{1}{2}-\frac{1}{2}\right\rangle\right\}, 
$$

which we often call spin up and down, and we can write the state vectors as $|\uparrow\rangle$ and $|\downarrow\rangle$. 

In quantum information, the preferred notation called the computational basis is $\left|0\right\rangle$ and $\left|1\right\rangle$. In many quantum mechanics books, the spin states are called spinors $\chi_+$ and $\chi_-$, and a general spin state that is a quantum superposition of these basis states is written as 

$$
\chi=\left(\begin{array}{l}
a \\
b
\end{array}\right)=a \chi_{+}+b \chi_{-}
$$

In contrast to an electron in a harmonic potential, where we needed to add an anharmonicity to obtain a good two-level system for a qubit, we see that the spin of a single particle already defines a very nice two-level system that is potentially usable for quantum information processing! 

## Spin 1/2 algebra

`[slide]`

Now we can use relatively simple algebra – we have two basis states, therefore our spin-1/2 Hilbert space is two-dimensional, and  operators are $2\times 2$ matrices. Since our spin states are eigenstates of the operators $S^2$ and $S_z$ , we can work them out simply by calculating their eigenvalues for $\left|0\right\rangle$ and $\left|1\right\rangle$:

$$
S^2\left|0\right\rangle=\hbar^2\ s(s=1)=\frac{3}{4}\hbar^2\left|0\right\rangle,\\

S^2\left|1\right\rangle=\frac{3}{4}\hbar^2\left|1\right\rangle\\

S_z\left|0\right\rangle=\frac{\hbar}{2}\left|0\right\rangle, 		S^2\left|1\right\rangle=\frac{\hbar}{2}\left|1\right\rangle
$$

And we get 

$$
S^2=\frac{3}{4}\hbar^2\left(\begin{matrix}1&0\\0&1\\\end{matrix}\right),	S_z=\frac{\hbar}{2}\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$

For the spin ladder operators, and the other projection operators we obtain in a similar way:

$$
\mathrm{S}_{+}=\hbar\left(\begin{array}{ll}
0 & 1 \\
0 & 0
\end{array}\right), \quad \mathrm{S}_{-}=\hbar\left(\begin{array}{ll}
0 & 0 \\
1 & 0
\end{array}\right)
$$

Since $S_{ \pm}=S_x \pm i S_y$, we have $S_x=(1 / 2)\left(S_{+}+S_{-}\right)$ and $S_y=(1 / 2 i)\left(S_{+}-S_{-}\right)$, and with this we obtain

$$
\mathrm{S}_x=\frac{\hbar}{2}\left(\begin{array}{ll}0 & 1 \\ 1 & 0\end{array}\right), \quad \mathrm{S}_y=\frac{\hbar}{2}\left(\begin{array}{cc}0 & -i \\ i & 0\end{array}\right)
$$

<!-- [ex: Griffith example 4.2 & see text below!] -->

## Pauli matrices

`[slide]`

It turns out that the S_i matrices are so fundamental in quantum mechanics that after pulling out the factor $\hbar/2$ they get another name, the spin Pauli matrices $\sigma_i$:

$$
\sigma_x=\left(\begin{matrix}0&1\\1&0\\\end{matrix}\right), 		\sigma_y=\left(\begin{matrix}0&-i\\i&0\\\end{matrix}\right), 	\sigma_x=\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$

The spin operator (vectorial here) can then be written as $\vec{S}=\left(\hbar/2\right)\vec\sigma$ with $\vec\sigma=\left(\sigma_x,\sigma_y,\sigma_z\right)$.

The Pauli matrices $\sigma$ form the basis of unitary operators on spin states. Since the spin-1/2 system is equivalent to any two-level system describing qubits, the whole algebra for qubits is based on them!

## Pauli rotations

`[slide]`

Spin is about rotation. Rotation of what? We mean rotations in qubit space. If we take the arbitrary qubit $\psi\rangle=\alpha |0\rangle+\beta|1\rangle$, we have two complex coefficients and therefore 4 real numbers. We can, however, remove one because a global phase is irrelevant for all observable quantities. Therefore we have a 3 dimensional parameter space, which can be visualized in 3 dimensions! Due to normalization $|\alpha|^2+|\beta|^2=1$, (pure) quantum states reside on the sphere with radius 1:

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
ax.plot([c1[0],c1[0]], [0,c1[1]], [0,0], color="k")
ax.plot([0,c1[0]], [c1[1],c1[1]], [0,0], color="k")
ax.plot([c1[0],c1[0]], [c1[1],c1[1]], [0,c1[2]], color="k")

ax.set_xticks([]); ax.set_yticks([]); ax.set_zticks([])
plt.show()

glue("sp-bloch-sphere", fig, display=False)
```

(sp-bloch-sphere)=
```{glue:figure} sp-bloch-sphere
The qubit Bloch sphere with a particular qubit vector.
```

There is a deeper connection between Pauli matrices and rotations. You can quite easily convince yourselves using series expansion that we can construct from the Pauli matrices rotation matrices for vectors, but equally for qubit quantum states.


Coming back to the rotations, 

$$
\begin{aligned}
R_x(\theta) & \equiv e^{-i \frac{\theta}{2} \sigma_x} \\
R_y(\theta) & \equiv e^{-i \frac{\theta}{2} \sigma_y} \\
R_z(\theta) & \equiv e^{-i \frac{\theta}{2} \sigma_z}
\end{aligned}
$$

In general, like the Euler formula, if an operator satisfies $A^2=I$ then we have $e^{i \theta A}=\cos (\theta) I+i \sin (\theta) A$.

Therefore we can obtain well-known rotation matrices:

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
$$

<!-- from http://www.vcpc.univie.ac.at/~ian/hotlist/qc/talks/bloch-sphere-rotations.pdf -->

We suggest to use the [qutip](https://qutip.org/docs/latest/guide/guide-bloch.html) or probably even better the [qiskit](https://qiskit.org/documentation/stubs/qiskit.visualization.plot_bloch_multivector.html) Bloch sphere functions. Play around with Pauli rotations!

## Measurement and spin 1/2 states

`[slide]`
<!-- Classic Griffiths dialogue section -->

If we have a particle in the spin-up state, and we measure the $z$-component of the spin angular momentum, which value do we get?

We obtain $S_z=\hbar /2$. 

Now, let us measure afterwards the $x$-component of the spin angular momentum of the particle, what is the outcome? 

We obtain with 50% chance $\hbar /2$, and with 50% chance $-\hbar /2$.

This might first seem weird, since we know the state exactly before the second measurement, it was in the spin-up state. But remember photon polarization, or any other degree of freedom: If we measure in a different “unbiased” basis, the outcome is always 50:50.
