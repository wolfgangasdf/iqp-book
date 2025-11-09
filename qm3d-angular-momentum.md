---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# Angular momentum

We had already mentioned that the quantum number $\ell$ which we found is related to the orbital angular momentum - in this section we discuss this deeper. The quantum analog of the orbital angular momentum will turn out to be equally important in quantum mechanics as the classical version is in celestial mechanics for the orbiting and rotating motion of our earth around the sun.

```{seealso}
Further reading: Griffiths Chapter 4.3
```


## Classical angular momentum

:::{slidetag}
:::


Symmetries in physics lead to conservation laws - for instance, translation symmetry leads to linear momentum conservation - this is the reason why the velocity of a moving body remains constant if no forces act on it. 

Similarly, if a system is rotationally symmetric like a bicycle wheel, the angular momentum is conserved. What is this classical angular momentum? In physics this is explained in classical mechanics courses, here a summary.

For a point mass, the angular momentum is defined by

$$\vec{L}=\vec{r}\times \vec{p}
$$(3d-am-1)

Here, the vector $\vec{L}$ is the angular momentum, $\vec{r}$ the position of the mass, and $\vec{p}$ the linear momentum equal to mass times velocity: $\vec{p}=m\vec{v}$. Of course the mass would not follow a circular path - therefore we assume that it is connected to the coordinate system origin by a string:

```{figure} figures/schroedinger/classical-angular-momentum.png
---
name: classical-am
width: 50%
---
Classical angular momentum.
```

The angular momentum is an extensive quantity, so for a composite system and not a point-like particle, it is the sum of the angular momenta of the constituents of the body.


## Quantum angular momentum

:::{slidetag}
:::


How about the angular momentum of the electron in the quantum case? How does it depend on the quantum numbers that appeared while solving the hydrogen atom problem?

To start, we can use again canonical quantization, where the classical quantities are replaced by operators.

So we have $\hat{L}=\hat{r}\times\hat{p}$, where $\hat{p}=-i\hbar\nabla$ for the (linear) momentum operator using nabla.

We now want to figure out what quantum mechanical angular momenta are allowed. Similar to the procedure we used for finding solutions and eigenvalues for the quantum harmonic oscillator, we now do the following:

1. We derive the commutation relations which are more complex because we have 3 components ($x,y,z$) of the angular momentum operator.
2. We derive ladder operators which increase or decrease the angular momentum, and derive the commutation relations of these operators.
3. We find the highest-energy angular momentum state, and use ladder operators to find all possible eigenstates and energies. By purely algebraic means we therefore find all possible eigenvalues
4. We find the eigenfunctions, which will allow for comparison to the hydrogen atom.

:::{slidetag}
:::


You can follow the derivations in Griffiths chapter 4.3, here only the results. We have 3 angular momentum operators along the 3 coordinates

$$
L_x, L_y, L_z
$$(3d-am-2)

We derive the commutation relations:

$$
\left[L_x, L_y\right]=i \hbar L_z ; \quad\left[L_y, L_z\right]=i \hbar L_x ; \quad\left[L_z, L_x\right]=i \hbar L_y
$$(3d-am-3)

Note that the indices can be permuted *cyclic*, so you have only to remember one. The non-vanishing commutator means that the 3 cartesian components of the quantum orbital angular momentum are simultaneously *not* well defined - or, that we never can measure all 3 components at the same time with infinite precision! Remember that we had the same argument for position and momentum.

However, the square of the total angular momentum $L^2 \equiv L_x^2+L_y^2+L_z^2$ does commute with the cartesian components:

$$
\left[L^2, L_x\right]=0, \quad\left[L^2, L_y\right]=0, \quad\left[L^2, L_z\right]=0
$$(3d-am-4)

This means that $L^2$ and any of the cartesian components are simultaneoualy well defined or can be measured precisely.

% changed 20230924
Therefore, let us find now the eingenvalues of $L^2$ and one component, where traditionally, $L_z$ is chosen. We assume that $f$ is an eigenfunction with eigenvalue $m$: $L_z f=\hbar m f$.

For $L_z$, one can show that the ladder operators are $L_{ \pm} \equiv L_x \pm i L_y$, which therefore also commute with $L^2$. 

:::{slidetag}
:::


Similar to the quantum harmonic oscillator, we start by defining $f_t$ as the highest angular momentum state. We assume that $\hbar\ell$ is the highest eigenvalue of $L_z$, of that top state, the reason will become clear later. We therefore have $L_z f_t=\hbar \ell f_t$. 

For $L^2$, the eigenvalue equation is $L^2 f_t=\lambda f_t$ for a yet unknown eigenvalue $\lambda$. Using the ladder operator algebra and we find an expression for $\lambda$ and we obtain $L^2 f_t=\hbar^2 \ell(\ell+1) f_t$. We have found the eigenvalue of $L^2$ in terms of the maximum eigenvalue of $L_z$ which is $\ell$.

Now we do the same with bottom rung of angular momentum states, and we find that it must have $m=-\ell$. 

So, the eigenvalues of $L_z$ are $m\hbar$ where $m$ goes from $-\ell$ to $\ell$ in $N$ integer steps. These states are shown in the figure for $\ell=3$, with the $L_z$ eigenvalues, action of the ladder operators, and eigenfunctions $f$.

```{code-cell} ipython3
:tags: [remove-input]
:label: 3d-amladder
:caption: Ladder of orbital angular momentum ladder states, indicated is the $L_z$ eigenvalue in $\hbar$ and the raised and lowered eigenfunctions. 

from matplotlib import pyplot as plt
from numpy import *
hbar=1
m=1
omega=1
nmax = 7
def energy(n):
    return hbar*omega*(1/2+n)
fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-5, 5, 500)
sa=["$f_b$","$L_-^2f$","$L_-f$","$f$","$L_+f$","$L_+^2f$","$f_t$"]
lz=["$-3\hbar$","$-2\hbar$","$-1\hbar$","$0\hbar$","$1\hbar$","$2\hbar$","$3\hbar$"]
for n in range(nmax):
    scale=0.5
    ax.plot(x, ones(size(x))*energy(n), color='0.5')
    ax.text(0, 0.2+energy(n), sa[n])
    ax.text(-2, 0.2+energy(n), lz[n])
    if n<nmax-1:
        ax.arrow(-3,energy(n), 0, 0.8*energy(0), width=0.1, length_includes_head=False, color='r' )
        ax.text(-4, 0.2+energy(n), "$L_+$")
        ax.arrow(2,energy(n+1), 0, -0.8*energy(0), width=0.1, length_includes_head=False, color='b' )
        ax.text(2.5, 0.2+energy(n), "$L_-$")
ax.set_xticks([])
ax.set_yticks([])
ax.set_ylim([0,8])
ax.set_axis_off();
```

But, this also implies $\ell=-\ell+N$ or $\ell=N/2$ which means that $\ell$ is either integer or half-integer.

We summarize now with the eigenfunctions $f_{\ell}^m$:

$$\begin{align*}
L^2 f_{\ell}^m&=\hbar^2 \ell(\ell+1) f_{\ell}^m\\
L_z f_{\ell}^m&=\hbar m f_{\ell}^m\\
\ell&=0,1 / 2,1,3 / 2, \ldots\\
m&=-\ell,-\ell+1, \ldots, \ell-1, \ell
\end{align*}$$(3d-am-5)

Exciting, half-integer values are possible - we will come back to this. But for the hydrogen atom, remember that particular properties of the spherical harmonics require that $\ell$ is integer.


## Quantum angular momentum example

:::{slidetag}
:::


We now discuss what the obtained relations imply for an example with $\ell=2$. First, we plot a 3D sphere with a radius of the length of $|L|=\sqrt{2(2+1)}\approx 2.45$ - classically $L$ could be oriented towards any point on this sphere.

```{code-cell} ipython3
:tags: [remove-input]
:label: am-l-two
:caption: Possible angular momentum orientations for $\ell=2$. We see allowed $L$ orientations at $L_z$-values of $-2,-1,0,1,2$.

from matplotlib import pyplot as plt
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
ax.view_init(elev=10, azim=15, roll=0)

rr=3.5
ax.add_artist(Arrow3D([-rr, rr], [0, 0], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [-rr, rr], [0, 0], **(arrow_prop_dict | dict(color="0.2"))))
ax.add_artist(Arrow3D([0, 0], [0, 0], [-rr, rr], **(arrow_prop_dict | dict(color="0.2"))))
ax.text3D(rr,-0.5,0.0,"$L_x$", fontsize=15)
ax.text3D(0,rr,0.2,"$L_y$", fontsize=15)
ax.text3D(rr,0.2,rr,"$L_z$", fontsize=15)


thax=linspace(-pi,pi,50);
fiax=linspace(0,2*pi,50)

ll=sqrt(2*(2+1))
c1=pol2cart(ll,thax,pi/2)
ax.plot(c1[0], c1[1], c1[2], color="0.5", alpha=0.5)
for m in [-2,-1,0,1,2]:
    c1=pol2cart(ll,arcsin(m/ll),fiax)
    ax.plot(c1[0], c1[1], c1[2], color="0.4")
    c1=pol2cart(ll,arcsin(m/ll),pi/2)
    ax.add_artist(Arrow3D([0,c1[0]],[0,c1[1]],[0,c1[2]], **(arrow_prop_dict | dict(color="r"))))

ax.text3D(0.1,1.7,2,r"$\vec{L}$", fontsize=15, color='r')
ax.set_xticks([]); ax.set_yticks([]); ax.set_zticks([-2,-1,0,1,2])
plt.show();
```

In quantum mechanics, however, the conditions on the quantum number $m$ determines which expectation values of $L_z$ can exist - and this only reaches $2$! This and the other $m$-values are indicated as circles on the sphere, because the polar orientation of $L$ is arbitrary.

This sounds crazy - why can't I choose the z-axis along $L$?, this should solve the problem that not all components of $L$ can be measured simultaneously?

Quantum mechanics predicts that this simply can't be done - and this agrees very well with observation as we will see in the future. 

## Quantum angular momentum eigenfunctions

<!-- [G4.3.2] -->
:::{slidetag}
:::


Now we want to derive the eigenfunctions of the orbital angular momentum operators, in particular again for the electron of the hydrogen atom. We first write the operators in spherical coordinates, we had $\vec{L}=-i \hbar(\vec{r} \times \vec{\nabla})$ with nabla operator in spherical coordinates, where the hat indicates unit coordinates:

$$
\vec{\nabla}=\hat{r} \frac{\partial}{\partial r}+\hat{\theta} \frac{1}{r} \frac{\partial}{\partial \theta}+\hat{\phi} \frac{1}{r \sin \theta} \frac{\partial}{\partial \phi}
$$(3d-am-6)

We write down the eigenvalue equations where we know already the eigenvalues, first for $L^2$ where the eigenvalue is $\hbar^2 \ell(\ell+1)$:

$$
L^2 f_{\ell}^m=-\hbar^2\left[\frac{1}{\sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{\sin ^2 \theta} \frac{\partial^2}{\partial \phi^2}\right] f_{\ell}^m=\hbar^2 \ell(\ell+1) f_{\ell}^m
$$(3d-am-7)

and for $L_z$ with eigenvalue $\hbar m$:

$$
L_z f_{\ell}^m=-i \hbar \frac{\partial}{\partial \phi} f_{\ell}^m=\hbar m f_{\ell}^m
$$(3d-am-8)

You might see that we have already seen these differential equations, and we know that the eigenfunctions are the spherical harmonics $Y_\ell^m$!

This is amazing - without assuming anything about the system, the spherical harmonics are found to be the eigenfunctions of the quantum angular momentum operators, now it is probably clear that the quantum numbers $\ell$ and $m$ indeed must properly describe the angular momentum of the electron. 

As we have mentioned before, here, using the algebraic theory of angular momentum operators, we have found that also half-integer values for $\ell$ are allowed eigenvalues of the differential equations. Before, where we were trying to find explicit solutions for the electron wave function using the method of separation of variables, we found only integer values for $\ell$. This is a crucial result - the algebraic theory of angular momentum leads to the concept of half-integer angular momentum which will turn out to be the "spin", discussed in the following lectures.
