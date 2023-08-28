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

# Quantum mechanics in 3D

In this section, we turn to 3 dimensions and first solve the Schrödinger equation for arbitrary radially-symmetric potentials. We will see that restrictions on possible wave functions appear automatically, which are parametrized by numbers which we will call quantum numbers. Finally, we discuss the specific case of the hydrogen atom.

## The Schrödinger equation in 3D

`[slide]`

It is now time to extend our formulation of the Schrodinger equation to 3 dimensions, for instance to calculate quantum mechanically the simplest realistic case: the Hydrogen atom, where a single negatively charged electron is bound to the electrostatic potential of the positively charged nucleus.

In classical mechanics in 3 dimensions, we simply add up the kinetic energies for the 3 spatial simensions. We do the same in quantum mechanics, the Hamilton operator was in 1D

$$
H=-\frac{\hbar}{2m}\ \frac{\partial^2}{\ \partial x^2}+V(x)
$$(3d-s-1)

In 3D, we need to add up the kinetic energies for all 3 dimensions: 

$$
H=-\frac{\hbar}{2m}\ \left(\frac{\partial^2}{\ \partial x^2}+\frac{\partial^2}{\partial y^2\ }+\frac{\partial^2}{\ \partial z^2}\right)+V(x,y,z)
$$(3d-s-2)

The expression in brackets has a name, it is called the Laplace operator Delta since it is so useful in physics. This operator is the square of the nabla operator $\nabla$, sometimes called *del*, which is a vector containing the first derivaties:

$$
\nabla=\left( \frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z}  \right)
$$(3d-s-3)

The nabla operator is ues to calculate the gradient of a scalar field or the divergence of a vector field.

With this, we can write the Hamilton operator in 3D even shorter:

$$
 H=-\frac{\hbar}{2m}\ \nabla^2+V.
$$(3d-s-4)

## The Schrödinger equation in spherical coordinates

`[slide]`

Many quantum systems, like the hydrogen atom, have a potential which only depends on the radial coordinate, $V(r)$, so-called central potentials. To gain insight and solve the Schrödinger equation for this case, it is useful to express the Hamiltonian in spherical coordinates, where we can use this identity for the square of the nabla operator:

$$
\nabla^2=\frac{1}{r^2} \frac{\partial}{\partial^2}\left(r^2 \frac{\partial}{\partial r}\right)+\frac{1}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{r^2 \sin ^2 \theta}\left(\frac{\partial^2}{\partial \phi^2}\right)
$$(3d-s-5)

It is actually quite easy to convince yourself that this is how it needs to be - for instance if the operator is applied to a function that is varying only as a function of the azimuthal angle $\phi$. The same change as a function of cartesian distance appears to be much faster in spherical coordinates if the object is further away, and since the Laplacian should give us kinetic energy which doesn't depend on coordinate system choices, we need to divide by $r^2$ in the last term.

The time independent Schrödinger equation then becomes

$$
-\frac{\hbar}{2 m}\left(\frac{1}{r^2} \frac{\partial}{\partial^2}\left(r^2 \frac{\partial}{\partial r}\right)+\frac{1}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{r^2 \sin ^2 \theta}\left(\frac{\partial^2}{\partial \phi^2}\right)\right) \psi+V \psi=0
$$(3d-s-6)
 
Now, we show how you can solve this equation.

## Separation of variables

`[slide]`

What we saw before that the method of separation of variables can be used to split a wavefunction up in a time-dependant and a spatial part. We use a similar approach for the 3D Schrödinger equation, we start looking for solutions that separate in a radial part $R$ and angular part $Y$:

$$
\psi\left(r,\theta,\phi\right)=R\left(r\right)Y\left(\theta,\phi\right)
$$(3d-s-7)

We now insert this back into the Schrödinger equation, and make use of the fact that partial derivatives only act on the individual parts

$$
-\frac{\hbar^2}{2 m}\left[\frac{Y}{r^2} \frac{d}{d r}\left(r^2 \frac{d R}{d r}\right)+\frac{R}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial Y}{\partial \theta}\right)+\frac{R}{r^2 \sin ^2 \theta} \frac{\partial^2 Y}{\partial \phi^2}\right]+V R Y=E R Y
$$(3d-s-8)

We now divide by $YR$ and multiply with $-2 m r^2 / \hbar^2$  and obtain

$$
\left\{\frac{1}{R} \frac{d}{d r}\left(r^2 \frac{d R}{d r}\right)-\frac{2 m r^2}{\hbar^2}[V(r)-E]\right\}+\frac{1}{Y}\left\{\frac{1}{\sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial Y}{\partial \theta}\right)+\frac{1}{\sin ^2 \theta} \frac{\partial^2 Y}{\partial \phi^2}\right\}=0
$$(3d-s-9)


We see that the first term in curly brackets only depends on the radial coordinate $r$, while the second term only on the angular coordinates $\theta$ and $\phi$. Therefore, both parts must be individually constant and their negatives, we choose as the constant for the left part $\ell(\ell+1)$, therefore $-\ell(\ell+1)$ for the right part. We will see later why we choose this.

## The azimuthal part

`[slide]`

The angular part can be split up further again by separation of variables with $Y(\theta, \phi)=\Theta(\theta) \Phi(\phi)$ and we obtain:

$$
\left\{\frac{1}{\Theta}\left[\sin \theta \frac{d}{d \theta}\left(\sin \theta \frac{d \Theta}{d \theta}\right)\right]+\ell(\ell+1) \sin ^2 \theta\right\}+\frac{1}{\Phi} \frac{d^2 \Phi}{d \phi^2}=0
$$(3d-s-10)

Same procedure as before - now we call the constant describing the rightmost term $m^2$, this right part is so easy that we can directly solve it:

$$
\frac{d^2 \Phi}{d \phi^2}=-m^2 \Phi \Rightarrow \Phi(\phi)=e^{i m \phi}
$$(3d-s-11)
 
Due to the periodicity of the azimuthal coordinate $\phi=\phi+2\pi$, we obtain that $m$ must be an integer number $0, \pm1, \ldots$ With this, we have found our first **quantum number** describing our system! Note, we have only assumed that the potential is centrosymmetric, and already a quantum number appears!

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

`[slide]`

One can also solve the polar part, where we don't show the derivation - see Griffith Chapter 4.1 for more details. At the end, we obtain the so-called **spherical harmonics**, where we now have quantum numbers $\ell$ and $m$:

$$
Y_{\ell}^m(\theta, \phi)=\sqrt{\frac{(2 \ell+1)}{4 \pi} \frac{(\ell-m) !}{(\ell+m) !}} e^{i m \phi} P_{\ell}^m(\cos \theta)
$$(3d-s-12)

where $P_{\ell}^m$ are the *associated Legendre polynomials*. In the derivation, $\ell$ appears as the $\ell$-th partial derivative, so $\ell$ must be a non-negative integer number.

One also obtains a more strict condition on $m$ and we have:

$$
\ell=0,1,\ldots\quad\text{and}\quad m=\ell,-\ell+1,\ldots,\ell
$$(3d-s-13)

Later we will see that $\ell$ is associated with the total angular momentum of the state, and $m$ the projection of the angular momentum along a particular axis.

## The radial part

`[slide]`

In order to solve the radial part, we can get insight even before assuming a specific radial centrosymmetric potential. We can simplify this by changing variables with $u(r) \equiv r R(r)$, then we are left with this differential equation: 

$$
-\frac{\hbar^2}{2m}\ \ \frac{d^2u}{dr^2}+\left[V+\frac{\hbar^2}{2m}\ \frac{l\left(l+1\right)}{r^2}\ \ \right]u=Eu\ 
$$(3d-s-14)

This is a again a 1D Schrödinger equation, with a radial-position dependent term added to the potential term. This term decreases quickly with radial distance, and it increases with larger $\ell$ or angular momentum - this means this term accellerates the quantum particle outwards, it is also called the centrifugal term. Together with $V$ the term in brackets is called the effective potential. 

To finally solve this equation and with this the full Schrödinger equation, we finally need to plug in a particular potential $V$. We aim to calculate the electronic energy states of the simplest atom, the hydrogen atom. In this case, $V$ is given by the Coulomb potential that describes the electrostatic attraction of the electron to the nucleus, therefore it is negative:

$$
V=\ -\frac{e^2}{4\pi\epsilon_0}\frac{1}{r}\ 
$$(3d-s-15)

It is attractive so it counteracts the centrifugal term before - even more, if we study the effective potential with the $\ell$-term, if $\ell>0$, we see that for very small distances the effective potential results in a repulsive force - preventing the electron to fall into the core!


## The Hydrogen atom

`[slide]`

We do not derive the solution of the radial differential equation here, please have a look at Griffith 4.2 for details. The resulting energies are

$$
E_n=-\left[\frac{m_e}{2 \hbar^2}\left(\frac{e^2}{4 \pi \epsilon_0}\right)^2\right] \frac{1}{n^2}=\frac{E_1}{n^2}, \quad n=1,2,3, \ldots
$$(3d-s-16)
 
which is the famous Bohr formula that was derived in a handwaving and serendipious way before the development of the theory of quantum mechanics - the so-called Bohr radius reminds of of this. It gives a good measure of the size of the Hydrogen atom:

$$
a \equiv \frac{4 \pi \epsilon_0 \hbar^2}{m_e e^2}=0.529 \times 10^{-10} \mathrm{~m}
$$(3d-s-17)

And $E_1$ is a measure of the binding energy of the electron, also called the Rydberg energy:

$$
E_1=-\left[\frac{m_e}{2 \hbar^2}\left(\frac{e^2}{4 \pi \epsilon_0}\right)^2\right]=-13.6\,\mathrm{eV}
$$(3d-s-18)

```{figure} figures/schroedinger/hydrogen.png
---
name: se-hydrogen
---
Possible states for different angular momentum quantum number $\ell$.
```
<!-- TODO: redo G4.6 and do I understand it? -->

`[slide]`

We also get a new quantum number $n$ - this describes the energy $E$ which therefore does not depend on $\ell$ or $m$! However, we also get a new restriction on $\ell$:

$$
\ell=0,\ldots,n-1
$$(3d-s-19)

Finally, we can derive a single equation describing the wavefunction of the electron in the Hydrogen atom (where $L$ are the associated Laguerre polynomials):

$$
\psi_{n \ell m}=\sqrt{\left(\frac{2}{n a}\right)^3 \frac{(n-\ell-1) !}{2 n(n+\ell) !}} e^{-r / n a}\left(\frac{2 r}{n a}\right)^{\ell}\left[L_{n-\ell-1}^{2 \ell+1}(2 r / n a)\right] Y_{\ell}^m(\theta, \phi)
$$(3d-s-20)

The figure shows the energy levels, showing the bound states, and the spacing becomes increasingly small for higher states. For now, the different $\ell$ states are degenerate - you might already guess that this will change if we dive deeper into interactions.


Now, we visualize this and comment on a few properties.

## Hydrogen wavefunctions

`[slide]`

Here we show plots of $|\psi|$ - the norm or square root of the probability density to find an electron at a certain position, and for different quantum numbers, for $n=0,1,2,3$. The plots are made in the $xy$-pane at $z=0$.

```{figure} figures/schroedinger/hydrogen-wavefunctions.png
---
name: h-wavefunctions
---
Picture of hydrogen wavefunctions, credits to [Qijing Zheng](http://staff.ustc.edu.cn/~zqj/posts/Hydrogen-Wavefunction/). Note that $\ell=l$ here.
```




We see that $n$ determines the number of radial nodes which is $n-1$ for $\ell=0$. We also see a rich angular structure, which is key for the directionality of chemical bonds and the formation of molecules.

<!-- For exercises: Griffiths problems 4.4, 4.7, 4.9, 4.11 -->



