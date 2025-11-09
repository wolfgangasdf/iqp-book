---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---



# Degenerate perturbation theory

In this section we discuss an extension of perturbation theory for the case that two quantum states have the same energy - this happens often in reality. We will see that in this case, the perturbation is mixing the states and new eigenstates appear.

```{seealso}
Further reading: Griffiths Chapter 7.2
```


## Example: 2D infinite square well

:::{slidetag}
:::


Often a quantum systems has degenerate eigenvalues or energies - this happens if different solutions of the Hamiltonian result in the same energy. Then our previous expression for the first-order correction to energy blows up:

$$
\left|\psi_n^{(1)}\right\rangle=\sum_{m\neq n}\frac{\left\langle\psi_m^{(0)}\right|H'\left|\psi_n^{(0)}\right\rangle}{E_n^{(0)}-E_m^{(0)}}\left|\psi_m^{(0)}\right\rangle
$$(ad-ptd-1)

As an example we consider now a particle in a 2D infinite square well potential with $V(x,y)=0$ for $0\leq x \leq a$ and $0\leq y \leq a$, otherwise $V(x,y)=\infty$.

The solutions are simply superpositions, that is products, of two one-dimensional infinite square well solutions along $x$ and $y$, and they are 

$$
\psi_{n_x,n_y}^{(0)}=\frac{2}{a} \sin\left(\frac{n_x \pi x}{a}\right)\sin\left(\frac{n_y \pi y}{a}\right)\,,\,n_x,n_y\geq 1
$$(ad-ptd-2)

with the energy

$$
E_{n_x,n_y}=\frac{\hbar^2 \pi^2}{2m_0 a^2}(n_x^2+n_y^2)
$$(ad-ptd-2a)

The ground state with quantum numbers $n_x=n_y=1$ is non-degenerate since it is only one state, but the first excited states $\psi_{1,2}^{(0)}$ and $\psi_{2,1}^{(0)}$ are degenerate since both have the energy

$$
E_{1,2}=E_{2,1}=\frac{\hbar^2 \pi^2}{2m_0 a^2}(1^2+2^2)
$$(ad-ptd-3)

:::{slidetag}
:::


We show the two solutions in the figure:

```{code-cell} ipython3
:tags: [remove-input]
:label: potential-well-2d
:caption: The two first excited wavefunctions of the 2d infinite square well potential. The line indicates where we will add the perturbation in the potential.

from matplotlib import pyplot as plt
from numpy import *
from matplotlib import cm
fig = plt.figure(figsize=(8,3))
ax1 = fig.add_subplot(1,2, 1, projection='3d')
ax2 = fig.add_subplot(1,2, 2, projection='3d')
def psi(nx,ny,x,y,a):
    return (2/a)*sin(nx*pi*x/a)*sin(ny*pi*y/a)
a=1
x = linspace(0,a,100);
X, Y = meshgrid(x,x)
ax1.plot_surface(X, Y, psi(1,2,X,Y,a), cmap=cm.coolwarm, linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax2.plot_surface(X, Y, psi(2,1,X,Y,a), cmap=cm.coolwarm, linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax1.set_xticks([]); ax1.set_yticks([]); ax1.set_zticks([])
ax2.set_xticks([]); ax2.set_yticks([]); ax2.set_zticks([])
ax1.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100)
ax2.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100);
```

Now we add our perturbation, we use again a delta function, now placed off-center at one quarter in each direction, indicated by the dashed line in the figure:

$$
H'=\lambda\,\delta(x-a/4)\,\delta(y-a/4)
$$(ad-ptd-4)

Remember, the increased potential at the position of the perturbation has as the consequence that "it is harder for the wavefunction to be there".

## The perturbation couples states

:::{slidetag}
:::


Now we redefine the two states $\psi_a^{(0)}\equiv\psi_{1,2}^{(0)}$ and $\psi_b^{(0)}\equiv\psi_{2,1}^{(0)}$ also to emphasize the generic nature of our procedure. First, we calculate the matrix elements of $H'$ by integrating now over two coordinates:

$$
H_{aa}'=\left\langle\psi_a^{(0)}\right|H'\left|\psi_a^{(0)}\right\rangle=
\\
\lambda \int \int dx\,dy \left(\psi_a^{(0)}\right)^2 \delta(x-a/4)\,\delta(y-a/4)
\\
=\frac{2\lambda}{a^2}
$$(ad-ptd-5)

The same holds for $H_{bb}'$, so we have

$$
H_{bb}'=H_{aa}'
$$(ad-ptd-6)

Interestingly, we obtain for the off-diagonal elements

$$
H_{ab}'=H_{ba}'=\frac{2\lambda}{a^2}
$$(ad-ptd-7)

which are non-zero! Clearly the states are not eigenstates of the system, the fact that the off-dianonal elements are not zero implies coupling between the states $a$ and $b$. 
Similar to two coupled but otherwise equal pendulums, we might already here expect that we get new eigenfunctions with different energies! In the case of two coupled pendulums the new eigenstates are in-phase and out of phase oscillations. 
If we use these new states, we will now show that our previous non-degenerate perturbation theory procedure is applicable again. But, instead of guessing the states, which often works, we first give a formal procedure how to find new *good* quantum states.


## Finding good quantum states

:::{slidetag}
:::


We go back to our power-series Schrödinger equation, up to first order, from Eq. {eq}`pt-1storderseq` but with ommitted state number $n$:

$$
H_0 |\psi^{(1)}\rangle + H'|\psi^{(0)}\rangle=E^{(0)}|\psi^{(1)}\rangle + E^{(1)}|\psi^{(0)}\rangle
$$(ad-ptd-8)

As before, we multiply from left with one of our degenerate solutions $\langle\psi_a^{(0)}|$:

$$
\langle\psi_a^{(0)}|H_0 |\psi^{(1)}\rangle + \langle\psi_a^{(0)}|H'|\psi^{(0)}\rangle=E^{(0)}\langle\psi_a^{(0)}|\psi^{(1)}\rangle + E^{(1)}\langle\psi_a^{(0)}|\psi^{(0)}\rangle
$$(ad-ptd-9)

For the first term, acting with $H_0$ to the left gives $E^{(0)}$ and therefore the first terms in the left and right hand side cancel.

Now we use as a test function a generic superposition of our two degenerate solutions:

$$
\psi^{(0)}=\alpha \psi_a^{(0)}+\beta \psi_b^{(0)}
$$(ad-ptd-10)

We obtain (remember that the solutions are orthogonal!):

$$
\alpha H_{aa}' + \beta H_{ab}' = \alpha E^{(1)}
$$(ad-ptd-11)

In the same way but by multiplying from left with $\langle\psi_b^{(0)}|$ we obtain:

$$
\alpha H_{ba}' + \beta H_{bb}' = \beta E^{(1)}
$$(ad-ptd-12)

These two equations describe the eigenvalue problem

$$
\left(\begin{array}{ll}
H_{a a}' & H_{a b}' \\
H_{b a}' & H_{b b}'
\end{array}\right)
\left(\begin{array}{l} \alpha \\ \beta\end{array}\right)
=E^{(1)}\left(\begin{array}{l} \alpha \\ \beta \end{array}\right)
$$(ad-ptd-13)

Note that this procedure can be generalized to $n$-fold degeneracies, one basically just has to add all $n$ degenerate states to the superposition, and obtains an $n\times n$ matrix.


## The new quantum states

:::{slidetag}
:::

By inserting our matrix elements from before we obtain:

$$
\frac{2\lambda}{a^2}\left(\begin{array}{ll}
1 & 1 \\
1 & 1
\end{array}\right)
\left(\begin{array}{l} \alpha \\ \beta\end{array}\right)
=E^{(1)}\left(\begin{array}{l} \alpha \\ \beta \end{array}\right)
$$(ad-ptd-13b)

You know how to solve this, the eigenvalues of a matrix full of 1's are $0$ and $2$ and the eigenvectors are $(1,1)$ and $(1,-1)$). So we obtain as the perturbed energies

$$
E^{(1)}_+=\frac{4\lambda}{a^2}
\\
E^{(1)}_-=0
$$(ad-ptd-14)

With the wavefunctions

$$
\psi^{(0)}_\pm=\frac{1}{\sqrt{2}}\left(\psi^{(0)}_a \pm \psi^{(0)}_b \right)
$$(ad-ptd-15)

As we had anticipated before, they are superpositions of the unperturbed but degenerate eigenstates.

## The new quantum states and solutions

:::{slidetag}
:::


We plot the newly found states in the figure, the dashed line again indicates the position of our perturbation.

```{code-cell} ipython3
:tags: [remove-input]
:label: potential-well-2d-pm
:caption: The two new wavefunctions $\psi^{(0)}_+$ (left) and $\psi^{(0)}_-$ (right) lifting the degeneracy of first-order perturbation theory.

from matplotlib import pyplot as plt
from numpy import *
from matplotlib import cm
fig = plt.figure(figsize=(8,3))
ax1 = fig.add_subplot(1,2, 1, projection='3d')
ax2 = fig.add_subplot(1,2, 2, projection='3d')
def psi(nx,ny,x,y,a):
    return (2/a)*sin(nx*pi*x/a)*sin(ny*pi*y/a)
a=1
x = linspace(0,a,100);
X, Y = meshgrid(x,x)
ax1.plot_surface(X, Y, 1/sqrt(2)*psi(1,2,X,Y,a)+psi(2,1,X,Y,a), cmap=cm.coolwarm,
                       linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax2.plot_surface(X, Y, 1/sqrt(2)*psi(1,2,X,Y,a)-psi(2,1,X,Y,a), cmap=cm.coolwarm,
                       linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax1.set_xticks([]); ax1.set_yticks([]); ax1.set_zticks([])
ax2.set_xticks([]); ax2.set_yticks([]); ax2.set_zticks([])
ax1.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100)
ax2.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100)
ax1.text2D(0.02,0.03,r"$\psi^{(0)}_+$")
ax2.text2D(0.02,0.03,r"$\psi^{(0)}_-$");
```

It is clear that $\psi^{(0)}_+$ must have a higher energy, since it has a higher expectation value at the position of the perturbation, and this increases the energy of that state.

We check if now our approach for degenerate perturbation theory works for the new states, and calculate the numerator:

$$
\langle\psi_+^{(0)}|H' |\psi^{(0)}_-\rangle = 0
$$(ad-ptd-16)

This is exactly what we need such that the expression for the perturbed states does not blow up!

$$
\left|\psi_n^{(1)}\right\rangle=\sum_{m\neq n}\frac{\left\langle\psi_m^{(0)}\right|H'\left|\psi_n^{(0)}\right\rangle}{E_n^{(0)}-E_m^{(0)}}\left|\psi_m^{(0)}\right\rangle
$$(ad-ptd-17)

Now we just have to re-formulate the sum and include our new states, this is a bit tedious and won't be done here. But in any case it is more important that we have seen that, naturally, energy degeneracies are (often) lifted under perturbations!

