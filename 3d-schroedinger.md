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

# The Schrödinger equation in 3D

In this section, we turn to 3 dimensions and first solve the Schrödinger equation for arbitrary rotation-symmetric or spherically symmetric potentials, potentials which depend only on the radial coordinate. We will see that certain restrictions on possible wave functions appear automatically, which are parametrized by numbers which we will call quantum numbers. Finally, we discuss the specific case of the hydrogen atom.

## The Schrödinger equation in 3D

{{slidetag}}

It is now time to extend our formulation of the Schrödinger equation to 3 dimensions, for instance to calculate quantum mechanically the simplest realistic case: the hydrogen atom, where a single negatively charged electron is bound to the electrostatic potential of the positively charged nucleus.

In classical mechanics in 3 dimensions, we simply add up the kinetic energies for the 3 spatial simensions. We do the same in quantum mechanics, the Hamilton operator was in 1D

$$
H=-\frac{\hbar^2}{2m}\ \frac{\partial^2}{\ \partial x^2}+V(x)
$$(3d-s-1)

In 3D, we need to add up the kinetic energies for all 3 dimensions: 

$$
H=-\frac{\hbar^2}{2m}\ \left(\frac{\partial^2}{\ \partial x^2}+\frac{\partial^2}{\partial y^2\ }+\frac{\partial^2}{\ \partial z^2}\right)+V(x,y,z)
$$(3d-s-2)

The expression in brackets has a name, it is called the Laplace operator $\Delta$ since it is so useful in physics. This operator is the square of the nabla operator $\Delta=\nabla^2$, $\nabla$ is sometimes also called *del*, which is a vector containing the first derivaties:

$$
\nabla=\left( \frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z}  \right)
$$(3d-s-3)

The nabla operator is used many times in physics, for instance to calculate the gradient of a scalar field or the divergence of a vector field.

With this, we can write the Hamilton operator in 3D even shorter:

$$
 H=-\frac{\hbar^2}{2m}\ \nabla^2+V
$$(3d-s-4)

## The Schrödinger equation in spherical coordinates

{{slidetag}}

Many quantum systems, like the hydrogen atom, have a potential which only depends on the radial coordinate, $V(r)$, so-called central potentials. To gain insight and solve the Schrödinger equation for this case, it is useful to express the Hamiltonian in spherical coordinates - since this coordinate system better represents the spherical symmetry of our potential. The spherical coordinates are the radius $r$, the polar angle $\theta$ and the azimuthal angle $\phi$, as indicated in the figure. 

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
ax.set_axis_off()
ax.view_init(elev=10, azim=20, roll=0)
rr=1.5
ax.add_artist(Arrow3D([-rr, rr], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [-rr, rr], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [0, 0], [-rr, rr], **(arrow_prop_dict | dict(color="0.2"))))
ax.text3D(rr,-0.2,0.0,"$x$", fontsize=15)
ax.text3D(0,rr,0.1,"$y$", fontsize=15)
ax.text3D(rr,0.2,rr,"$z$", fontsize=15)
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
ax.text3D(0,0.25+c1[0],0.25+c1[2],r"$\vec{r}(r,\theta,\phi)$", fontsize=20, color='r')
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

glue("3d-sphc", fig, display=False)
```

(3d-sphc)=
```{glue:figure} 3d-sphc
The spherical coordinate system where a position is defined by the radius $r$ and two angles $\theta$ and $\phi$.
```


We first look up the square of the nabla operator in spherical coordinates:

$$
\nabla^2=\frac{1}{r^2} \frac{\partial}{\partial^2}\left(r^2 \frac{\partial}{\partial r}\right)+\frac{1}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{r^2 \sin ^2 \theta}\left(\frac{\partial^2}{\partial \phi^2}\right)
$$(3d-s-5)

It is actually quite easy to convince yourself that this is how it needs to be - for instance if the operator is applied to a function that is varying only as a function of the azimuthal angle $\phi$. The same change appears to be faster if the object is further away, and since the Laplacian should give us kinetic energy which does not depend on the chosen coordinate system, we need to divide by $r^2$ in the last term.

The time-independent Schrödinger equation then becomes

$$
-\frac{\hbar^2}{2 m}\left(\frac{1}{r^2} \frac{\partial}{\partial^2}\left(r^2 \frac{\partial}{\partial r}\right)+\frac{1}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{r^2 \sin ^2 \theta}\left(\frac{\partial^2}{\partial \phi^2}\right)\right) \psi+V \psi=0
$$(3d-s-6)

We see terms with derivatives of the radial, polar, and azimuthal coordinates, and relatively simple prefactors involving different coordinates. Now, we show how you can solve this equation.

## Separation of variables

{{slidetag}}

What we saw before that the method of separation of variables can be used to split a wavefunction up in a time-dependant and a spatial part. We use a similar approach for the 3D Schrödinger equation, we start looking for solutions that factorize in a radial part $R$ and angular part $Y$ in the following way:

$$
\psi\left(r,\theta,\phi\right)=R\left(r\right)Y\left(\theta,\phi\right)
$$(3d-s-7)

We now insert this back into the Schrödinger equation, and make use of the fact that partial derivatives only act on the corresponding parts

$$
-\frac{\hbar^2}{2 m}\left[\frac{Y}{r^2} \frac{d}{d r}\left(r^2 \frac{d R}{d r}\right)+\frac{R}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial Y}{\partial \theta}\right)+\frac{R}{r^2 \sin ^2 \theta} \frac{\partial^2 Y}{\partial \phi^2}\right]+V R Y=E R Y
$$(3d-s-8)

We now divide by $YR$, multiply with $-2 m r^2 / \hbar^2$ and regroup the terms so we obtain the equation

$$
\left\{\frac{1}{R} \frac{d}{d r}\left(r^2 \frac{d R}{d r}\right)-\frac{2 m r^2}{\hbar^2}[V(r)-E]\right\}+\frac{1}{Y}\left\{\frac{1}{\sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial Y}{\partial \theta}\right)+\frac{1}{\sin ^2 \theta} \frac{\partial^2 Y}{\partial \phi^2}\right\}=0
$$(3d-s-9)


We see that the first term in curly brackets only depends on the radial coordinate $r$, while the second term only on the angular coordinates $\theta$ and $\phi$. Therefore, both parts must be individually constant and add up to zero, so they need to be the negative of each other. Without restricting generality, we choose as the constant for the left part $\ell(\ell+1)$, and $-\ell(\ell+1)$ for the right part. This does not restrict generality as $\ell$ can be any complex number.

## The angular part

{{slidetag}}

The angular part can be split up further again by separation of variables with $Y(\theta, \phi)=\Theta(\theta) \Phi(\phi)$ and we obtain:

$$
\left\{\frac{1}{\Theta}\left[\sin \theta \frac{d}{d \theta}\left(\sin \theta \frac{d \Theta}{d \theta}\right)\right]+\ell(\ell+1) \sin ^2 \theta\right\}+\frac{1}{\Phi} \frac{d^2 \Phi}{d \phi^2}=0
$$(3d-s-10)

We again see two parts, the left term in brackets depends only on the polar angle, and the right term depends only on the azimuthal angle. Now we use the same procedure as before - now we call the constant describing the rightmost term $m^2$, this equation is so simple that we can directly solve it:

$$
\frac{d^2 \Phi}{d \phi^2}=-m^2 \Phi \Rightarrow \Phi(\phi)=e^{i m \phi}
$$(3d-s-11)
 
Due to the periodicity of the azimuthal coordinate $\phi=\phi+2\pi$, we obtain that $m$ must be an integer number $m=0, \pm1, \ldots$ With this, we have found our first **quantum number** describing our system! Note, we have only assumed that the potential is rotationally symmetric, and already a quantum number appears! An cartoon of the azimuthal part of the wavefunction for $m=6$ is shown in the figure.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.view_init(elev=20, azim=45, roll=0)
ax.set_aspect("equal")
u, v = mgrid[0:2*pi:20j, 0:pi:10j]
x = cos(u)*sin(v)
y = sin(u)*sin(v)
z = cos(v)
ax.plot_wireframe(x, y, z, color="0.5", alpha=0.5)

fi=linspace(0,2*pi,100)
ax.plot(sin(fi), cos(fi), 0.2*sin(6*fi), color="r", linewidth=4)
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
plt.show()

glue("3d-aziwave", fig, display=False)
```

(3d-aziwave)=
```{glue:figure} 3d-aziwave
An azimuthal wave function that repeats itself after one round trip.
```

{{slidetag}}

One can also solve the whole polar-azimuthal part, again by looking up or solving the polar differential equation yourselves, see Griffiths Chapter 4.1 for more details. At the end, the solutions turn out to be the so-called **spherical harmonics**, where we now have quantum numbers $\ell$ and $m$:

$$
Y_{\ell}^m(\theta, \phi)=\sqrt{\frac{(2 \ell+1)}{4 \pi} \frac{(\ell-m) !}{(\ell+m) !}} e^{i m \phi} P_{\ell}^m(\cos \theta)
$$(3d-s-12)

where $P_{\ell}^m$ are the *associated Legendre polynomials*. In the derivation, $\ell$ appears as the $\ell$-th partial derivative, so $\ell$ must be a non-negative integer number.

One also obtains a more strict condition on $m$ and we have in the end:

$$
\ell=0,1,\ldots\quad\text{and}\quad m=-\ell,-\ell+1,\ldots,\ell
$$(3d-s-13)

Later we will see that $\ell$ is associated with the total angular momentum of the state, and $m$ the projection of the angular momentum along a particular axis, the $z$-axis in our case here.

## The radial part

{{slidetag}}

In order to solve the radial part, we can get insight even before assuming a specific radial potential. We can simplify the radial part by changing variables with $u(r) \equiv r R(r)$, then we are left with this differential equation: 

$$
-\frac{\hbar^2}{2m}\ \ \frac{d^2u}{dr^2}+\left[V+\frac{\hbar^2}{2m}\ \frac{\ell\left(\ell+1\right)}{r^2}\ \ \right]u=Eu\ 
$$(3d-s-14)

This is a again a 1D Schrödinger equation, with a radial-position dependent term added to the potential term in square brackets. This term decreases quickly with radial distance, and it increases with larger $\ell$ or angular momentum - this means this term accellerates the quantum particle outwards, it is also called the centrifugal term. Together with $V$ the term in brackets is called the effective potential. 

To finally solve this equation and with this the full Schrödinger equation, we need to plug in a particular potential $V$. Here, we aim to calculate the electronic energy states of the simplest atom, the hydrogen atom. In this case, $V$ is given by the Coulomb potential that describes the electrostatic attraction of the electron to the nucleus that consists of a single positive charge, the proton - therefore the potential is purely attractive, or negative:

$$
V=\ -\frac{e^2}{4\pi\epsilon_0}\frac{1}{r}\ 
$$(3d-s-15)

It is attractive so it counteracts the centrifugal term before - even more, if we study the effective potential with the $\ell$-term, if $\ell>0$, we see that for very small distances the effective potential results in a repulsive force - preventing the electron to fall into the core!


## The hydrogen atom

{{slidetag}}

We do not derive the solution of the radial differential equation here, please have a look at Griffiths 4.2 for details. The resulting eigenvalues or energies are

$$
E_n=-\left[\frac{m_e}{2 \hbar^2}\left(\frac{e^2}{4 \pi \epsilon_0}\right)^2\right] \frac{1}{n^2}=\frac{E_1}{n^2}, \quad n=1,2,3, \ldots
$$(3d-s-16)

These energies are described by a new quantum number $n$ - which describes the energy $E$. The energy does, probably surprisingly, not depend on the other quantum numbers $\ell$ or $m$ - we will see towards the end of this course that there are corrections, but for now only $n$ determines the energy of the electron. We get, however, by properties of the differential equation, a new restriction on $\ell$:

$$
\ell=0,\ldots,n-1
$$(3d-s-19)

The formula for energy means that there is an infinite number of states with negative energy - therefore states where the electron is bound to the nucleus. However, the energies approach $0$ for $n\rightarrow\infty$, therefore an electron in a highly excited state is only weakly bound to the core.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

nmax = 6

def efromx(x):
    return -1/abs(x/3)

def xfrome(e):
    return -1/(e/3)

def efromn(n):
    return -7/(n*n)
fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-xfrome(efromn(nmax)), xfrome(efromn(nmax)), 500)
ax.plot(x,efromx(x), color='orange')
ax.text(3, -5, "Coulomb potential", color='orange')
ax.arrow(0,-9, 5, 0, width=0.07, length_includes_head=False, color='0.5' )
ax.text(3, -8, "distance from core", color='0.5')
ax.arrow(0,-10, 0, 11, width=0.07, length_includes_head=False, color='0.5' )
ax.text(0.5, 0.5, "energy", color='0.5')
ax.text(-8, -2, "states")
for n in range(1,nmax):
    ee=efromn(n)
    ax.plot([-xfrome(ee),xfrome(ee)],[ee,ee],'-k')
    
ax.set_ylim([-10,2])

ax.axis('off')
fig.legend(loc='outside right')

glue("h-energies", fig, display=False)
```
% TODO new
(h-energies)=
```{glue:figure} h-energies
Coulomb potential of the hydrogen atom showing a numnber of bound states. 
```


The energy formula is the famous Bohr formula that was derived in a handwaving and serendipious way before the development of the theory of quantum mechanics - the so-called Bohr radius reminds of of this. It gives a good measure of the size of the hydrogen atom:

$$
a \equiv \frac{4 \pi \epsilon_0 \hbar^2}{m_e e^2}=0.529 \times 10^{-10} \mathrm{~m}
$$(3d-s-17)

Further, $E_1$ is a measure of the binding energy of the electron, because it is very important, it is also called the *Rydberg energy*:

$$
E_1=-\left[\frac{m_e}{2 \hbar^2}\left(\frac{e^2}{4 \pi \epsilon_0}\right)^2\right]=-13.6\,\mathrm{eV}
$$(3d-s-18)

The unit electron volt or eV is a very useful energy unit in quantum mechanics and has more natural values of order 1 compared to Joule - the conversion is

$$1\, \mathrm{eV} = 1.6022\times10^{-19}\, \mathrm{J}$$(3d-ev)

:::{admonition} Note: electronvolt
:class: dropdown
The unit electronvolt is very useful to express energies corresponding to visible-light photons, 1.8 eV for red up to 3.1 eV for blue photons. But you can also express different quantities with it using other fundamental constants, see [wikipedia](https://en.wikipedia.org/wiki/Electronvolt).
:::

Finally, we can write down a single equation describing the wavefunction of the electron in the hydrogen atom (where $L$ are the associated Laguerre polynomials):

$$
\psi_{n \ell m}=\sqrt{\left(\frac{2}{n a}\right)^3 \frac{(n-\ell-1) !}{2 n(n+\ell) !}} e^{-r / n a}\left(\frac{2 r}{n a}\right)^{\ell}\left[L_{n-\ell-1}^{2 \ell+1}(2 r / n a)\right] Y_{\ell}^m(\theta, \phi)
$$(3d-s-20)

We see that
* the radial coordinate is re-scaled by the radial quantum number $n$ and the Bohr radius $a$
* there is a nice separation into radial and angular parts
* The Laguerre polynomials and the normalization factor combines both degrees of freedom

:::{Note}
:class: dropdown
You don't need to memorize the explicit hydrogen atom solutions or precisely how you derive them, but it is useful to know the procedure - and that you can look it up here. More important is understanding the meaning of the quantum numbers $n$, $\ell$ and $m$ - their restrictions, how they are derived, and why they appear!
:::


Now, we visualize some solutions and comment on a few properties.

## Hydrogen wavefunctions

{{slidetag}}

Here we show plots of $|\psi|$ - the norm or square root of the probability density to find an electron at a certain position, and for different quantum numbers, for $n=0,1,2,3$. The plots are made in the $xy$-pane at $z=0$.

```{figure} figures/schroedinger/hydrogen-wavefunctions.png
---
name: h-wavefunctions
---
Picture of hydrogen wavefunctions, credits to [Qijing Zheng](http://staff.ustc.edu.cn/~zqj/posts/Hydrogen-Wavefunction/).
```


We see that the quantum number $n$ determines the number of radial nodes which is $n-1$ for $\ell=0$. For $\ell > 0$, there appears a rich angular structure, which is key for the directionality of chemical bonds and the formation of molecules.

<!-- For exercises: Griffiths problems 4.4, 4.7, 4.9, 4.11 -->



