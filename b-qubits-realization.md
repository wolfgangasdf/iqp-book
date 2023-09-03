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

# Qubits realizations

We want to start by giving a simple overview how easy it can be to encode a qubit into a physical system. On one hand, it is useful to keep this in mind while studying quantum mechanics, and on the other hand we repeat basic linear algebra that will come back many times.


## Light's polarization

`[slide]`

Many important aspects of quantum mechanics and qubits can be shown with the polarization of light, which might be familiar to you.

:::{margin}
```{figure} figures/basics/erwin.png
---
name: erwin
---
The Schrödinger equation with $\psi$ on his bust in Vienna.
```
:::

The state of a qubit is written in the ket notation often as $\left|\psi\right\rangle$, psi is traditionally the greek letter used for the quantum wave function of a particle. However, the state of a qubit is a mathematical concept, disconnected from physical realizations, which makes it possible to study quantum information theory without understanding physical realizations of it – quantum mechanics provides the physical substance. We say that we can “encode” the quantum state in a degree of freedom of a physical system.

We now show how we can encode qubits in the polarization of light, for instance of a laser pointer beam. For such a light field, where light travels into a particular direction, the polarization is fully defined in the transverse plane by the horizontal H and a vertical V electric field amplitude, and we have with the known basis vectors: 

$$
\vec{E}=\left(\begin{matrix}E_H\\E_V\\\end{matrix}\right)=\ E_0\left( E_H\left(\begin{matrix}1\\0\\\end{matrix}\right)+E_V\left(\begin{matrix}0\\1\\\end{matrix}\right) \right)
$$(b-qr-01)

Here we have absorbed the electric-field units into $E_0$, and $E_H$ and $E_V$ are dimensionless complex coefficients.

Now to the quantum state, the Psi ket-vector. By analogy, the dimensionless polarization vector is simply our qubit state vector, with the basis states H and V, where we assume normalization $|E|=1$:

$$\left|\Psi\right\rangle=\left(\begin{matrix}E_H\\E_V\\\end{matrix}\right)=E_H\left|H\right\rangle+E_V\left|V\right\rangle$$(b-qr-02)

$E_H$ and $E_V$ are truly quantum amplitudes, where the squared amplitude gives the probability to measure the specific state. This is very similar to polarization in optics, where we often can not measure directly the electric field, but detectors measure the intensity, which is $I=\vec{E}^2=\vec{E}\cdot \vec{E}$. This can again be written in the bra-ket notation where  $\left\langle E\right|$ is the complex transpose of ket $\left|E\right\rangle$, with this we can mathematically correct calculate quantum state overlaps, as an example, we can express the normalization condition like this:

$$\left\langle\Psi | \Psi\right\rangle=\left(\begin{matrix}
E_x^*,\, E_y^*\end{matrix}\right)
\cdot\left(\begin{matrix}E_x \\E_y\end{matrix}\right)=E_x^* E_x+E_y^* E_y=\left|E_x\right|^2+\left|E_y\right|^2=1$$(b-qr-03)



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
ax.set_axis_off()
ax.set_aspect("equal")
ax.view_init(elev=-75, azim=20, roll=-20)
rr=2.5
ax.add_artist(Arrow3D([-rr, rr], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0, 0], [-rr, rr], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0, 0], [0, 0], [-rr, rr], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0,2], [0, 0], [-0.2, -0.2], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([0,0], [0, 1.5], [-0.2, -0.2], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([0,2], [0, 1.5], [-0.2, -0.2], **(arrow_prop_dict | dict(color="orange"))))
ax.plot([0,2,2], [1.5,1.5,0], [-0.2,-0.2,-0.2],'-.',color='k')
ax.text3D(1.8,-0.3,0.0,"$E_V$", fontsize=15)
ax.text3D(-0.4,1.4,0.0,"$E_H$", fontsize=15)
ax.text3D(2,1.5,0.0,r"$\vec{E}$", fontsize=15)
# ax.text3D(rr,-0,0.0,"$x$", fontsize=15); ax.text3D(0,rr,0.2,"$y$", fontsize=15); ax.text3D(0,0,rr,"$z$", fontsize=15)
# ax.set_xlim3d(-1,3); ax.set_ylim3d([-1,3]); ax.set_zlim3d([-1,3]); 
# ax.set_xticks([]); ax.set_yticks([]); ax.set_zticks([])
plt.show()

glue("b-polarization", fig, display=False)
```

(b-polarization)=
```{glue:figure} b-polarization
Polarization of a light beam, where $\vec{z}$ is the beam propagation direction.
```

## Polarization bases
`[slide]`

We say that $H$ and $V$ polarizations form a basis, there are two orthogonal basis vectors because our state space is two-dimensional here (the quantum state is described by a 2-element vector). 

$$
|H\rangle=\left(\begin{matrix}1\\0\\\end{matrix}\right)
\quad\text{and}\quad
|V\rangle=\left(\begin{matrix}0\\1\\\end{matrix}\right)
$$(b-qr-1)

The other bases, in fact quantum superpositions of the HV-basis, are the DA basis 

$$
|D/A\rangle=\frac{1}{\sqrt{2}}(|H\rangle\pm|V\rangle)
=\frac{1}{\sqrt{2}}\left(\begin{matrix}1\\\pm1\\\end{matrix}\right)
$$(b-qr-1)

which corresponds to diagonal/antidiagonal linear polarization and 

$$
|R/L\rangle=\frac{1}{\sqrt{2}}(|H\rangle\pm i |V\rangle)
=\frac{1}{\sqrt{2}}\left(\begin{matrix}1\\\pm i\\\end{matrix}\right)
$$(b-qr-2)

which corresponds to right/left circular polarization. 

In the figure we show the qubit state vectors for $H/V$ and $D/A$, and we can easily see that both are mutually orthogonal. We cannot straight-forwardly draw the basis vectors of the circular polarization basis, therefore we have omitted them. Later we will see a 3-dimensional representation of qubit state vectors where also complex relative phases can be visualized.


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
ax.set_axis_off()
ax.set_aspect("equal")
ax.view_init(elev=-75, azim=20, roll=-20)
rr=1.5
ax.add_artist(Arrow3D([-rr, rr], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0, 0], [-rr, rr], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0, 0], [0, 0], [-rr, rr], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0,1], [0, 0], [-0.2, -0.2], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([0,0], [0, 1], [-0.2, -0.2], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([0,1/sqrt(2)], [0, 1/sqrt(2)], [-0.2, -0.2], **(arrow_prop_dict | dict(color="orange"))))
ax.add_artist(Arrow3D([0,1/sqrt(2)], [0, -1/sqrt(2)], [-0.2, -0.2], **(arrow_prop_dict | dict(color="orange"))))
th = linspace(0, 2*pi, 200)
ax.plot(sin(th), cos(th), 0*th-0.2,'-.',color='k')
ax.text3D(1.1,-0.0,0.0,"$V$", fontsize=15)
ax.text3D(-0.2,1.1,0.0,"$H$", fontsize=15)
ax.text3D(0.7,0.7,0.0,"$D$", fontsize=15)
ax.text3D(0.7,-0.9,0.0,"$A$", fontsize=15)
plt.show()

glue("b-pbas", fig, display=False)
```

(b-pbas)=
```{glue:figure} b-pbas
$H$, $V$, $D$ and $A$ polarization vectors.
```

A note: As you will see in quantum information, the bases are truly equivalent - but one has to choose which basis is which. Traditionally, the basis which is in polarization space the $H/V$ basis is called the computational basis in quantum information and it is denoted by the 0 and 1 ket vector:

$$
|H\rangle\equiv |0\rangle\quad
|V\rangle\equiv |1\rangle
$$(b-b-0)

The diagonal - antidiagonal basis is called the Hadamard basis since we can obtain it by applying a Hadamard operation on states in the computational basis:

$$
|D\rangle\equiv |+\rangle\quad
|A\rangle\equiv |-\rangle
$$(b-b-1)

The circular polarization basis is less often used in quantum information but can be called the $|\pm i\rangle$ imaginary basis.


## From polarizers to quantum measurements
`[slide]`

We now show that a polarizer in combination with a photo detector does quantum measurements in polarization space. Let us assume that we have a horizontally polarized incident laser beam. The transmission of this beam through a polarizer depends on the relative angle between them, in fact, only the polarization component of the light that is parallel to the polarizer orientation is transmitted. With the polarizer angle $\alpha$ with respect to the horizontal polarization orientation we have the situation shown in the figure:

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(4,3))
ax.set_aspect("equal")
a=pi/4;x=1/cos(a)
ax.arrow(0,0,x,0, linewidth=3, head_width=0.05, color='black')
ax.plot([-0.3,1],[-0.3,1],':',color="orange", linewidth=3)
ax.plot([cos(pi/4),x],[sin(pi/4),0],':',color="grey", linewidth=3)
ax.plot([cos(pi/4),0],[sin(pi/4),0],'-',color="blue", linewidth=5)
ax.text(x+0.2,0.0,"$E_H$",fontsize=20)
ax.text(0.2,0.05,r"$\alpha$",fontsize=20)
ax.axis("off")

glue("b-proj", fig, display=False)
```

(b-proj)=
```{glue:figure} b-proj
Projection of horizontal polarization onto a polarizer with angle $\alpha$ (dotted line), which lets only the field indicated by the blue line pass through. 
```

The transmitted intensity can be calculated just by the inner product of the polarizer unit vector and the incident polarization:

$$I=\left|\left(\cos\alpha\;\sin\alpha\right)\cdot
\left(\begin{matrix}E_H\\E_V\\\end{matrix}\right)\right|^2=
\cos^2(\alpha)
$$(b-malus)

which is known as Malus law in optics. Now, for a single photon and since everything is normalized here, this dimensionless transmitted intensity directly corresponds to the propability that this photon is transmitted. Therefore, we can say that the combination of the polarizer and the detector does a quantum measurement on the incident quantum state!

In the bra-ket formalism, we can describe quantum measurements, the probability that a detector that detects state $|\psi_{meas}\rangle$ clicks for a state $|\psi\rangle$ is 

$$
P_{click}=\left|\left\langle\Psi_{\text {detector }} \mid \Psi\right\rangle\right|^2
$$(b-qm)

By repeating the measurement many times, we can derive the detection probabilities of the states. For instance, we obtain $|\langle V \mid H\rangle|^2=0$ because state and detector are orthogonal, or 

$$|\langle D \mid H\rangle|^2
= \left| \frac{1}{\sqrt{2}}(\langle H \mid+\langle V|) \, |H\rangle\right|^ 2=\frac{1}{2}
$$(b-qr-04)

if the detector is oriented with 45 degree with respect to the incident polarization. In this case, the detector will click with 50% probability.

In our polarization example here it is quite obvious, that after the measurement polarizer, if the photon has passed through, it is polarized along the detector polarization. This is in fact a useful postulate of quantum mechanics, that after a successful measurement of $|\psi_{meas}\rangle$, the state of the system will be in that particular state!



## Quantum measurements and normalization

`[slide]`

With this, we can already explain a suprising experiment, which you can easily do by using 3 polarizers. 

We start with a horizontal polarizer, therefore with the blue polarization shown in the figure. Now, if you place a vertical polarizer after this, no light is transmitted because $|\langle V \mid H\rangle|^2=0$ - as shown on the left in the figure.

If you, however, place an additional polarizer oriented at an angle of 45 degrees before the $V$ polarizer, you will observe transmission of light! In the quantum formalism we have two polarizers after the first, and in the first step where $D$ is the diagonal polarizer in the middle a photon transmission probability of:

$$|\langle D \mid H\rangle|^2
= \left| \frac{1}{\sqrt{2}}(\langle H \mid+\langle V|) \, |H\rangle\right|^ 2=\frac{1}{2}
$$(b-qr-3p1)

and the transmitted photon will be in the $D$ state. Now, under the condition that the photon is transmitted or the quantum measurement was successful, we have a similar situation at the last $V$ polarizer:

$$|\langle V \mid D\rangle|^2
= \left| \langle V \mid \frac{1}{\sqrt{2}}(| H \rangle+| V\rangle) \right|^ 2=\frac{1}{2}
$$(b-qr-3p2)

Also here the chance of a successful measurement is 50% - and we obtain in total $0.5\cdot0.5=0.25$ or 25% total transmission!


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
ax = fig.add_subplot(1,2,1,projection='3d')
ax.set_axis_off()
ax.view_init(elev=5, azim=48, roll=0)
ax.add_artist(Arrow3D([1,-1.5], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0.5, 0.5], [0, 1], [0,0], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([-1, -1], [0, 0], [0,0.15], **(arrow_prop_dict | dict(color="blue"))))
yax = linspace(-0.5, 0.5, 10)
for y in yax:
    ax.plot([-0.3,-0.3],[y,y],[-0.5,0.5],'-',color="0.6")

ax = fig.add_subplot(1,2,2,projection='3d')
ax.set_axis_off()
ax.view_init(elev=5, azim=48, roll=0)
ax.add_artist(Arrow3D([1,-2.5], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.6"))))
ax.add_artist(Arrow3D([0.5, 0.5], [0, 1], [0,0], **(arrow_prop_dict | dict(color="blue"))))
ax.add_artist(Arrow3D([-2.0, -2.0], [0, 0], [0,0.7], **(arrow_prop_dict | dict(color="blue"))))
yax = linspace(-0.5, 0.5, 10)
f=1/sqrt(2)
for y in yax:
    ax.plot([-0.3,-0.3],asarray([-0.5+y,0.5+y])*f,asarray([-0.5-(y),0.5-(y)])*f,'-',color="orange")
for y in yax:
    ax.plot([-1,-1],[y,y],[-0.5,0.5],'-',color="0.6")
ax.set_xlabel("x"); ax.set_ylabel("y"); ax.set_zlabel("z")
plt.show()

glue("b-3pol", fig, display=False)
```

(b-3pol)=
```{glue:figure} b-3pol
The polarizer example. Left: a horizontally polarized light beam is not transmitted by a vertically oriented polarizer. Right: If a 45 degree oriented polarizer is inserted before the vertical polarizer, the transmission is not zero anymore because the polarization is projected onto the 45-degre polarizer in between!
```

