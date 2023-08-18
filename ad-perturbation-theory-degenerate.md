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



# Degenerate perturbation theory

## Example: 2D infinite square well

`[slide]`

Often a quantum systems has degenerate eigenvalues or energies - this happens if different solutions of the Hamiltonian result in the same energy. Then our previous expression for the first-order correction to energy blows up:

$$
\left|\psi_n^{(1)}\right\rangle=\sum_{m\neq n}\frac{\left\langle\psi_m^{(0)}\right|H'\left|\psi_n^{(0)}\right\rangle}{E_n^{(0)}-E_m^{(0)}}\left|\psi_m^{(0)}\right\rangle
$$

As an example we consider now a particle in a 2D infinite square well potential with $V(x,y)=0$ for $0\leq x \leq a$ $0\leq y \leq a$ otherwise $V(x,y)=\infty$.

We know the solutions, they are 

$$
\psi_{n_x,n_y}^{(0)}=\frac{2}{a} \sin\left(\frac{n_x \pi x}{a}\right)\sin\left(\frac{n_y \pi y}{a}\right)\,,\,n_x,n_y\geq 1
$$

The ground state with $n_x=n_y=1$ is non-degenerate since it is only one state, but the first excited states $\psi_{1,2}^{(0)}$ and $\psi_{2,1}^{(0)}$ are degenerate since both have the energy

$$
E_{1,2}=E_{2,1}=\frac{\hbar^2 \pi^2}{2m_0 a^2}(1^2+2^2)
$$

`[slide]`

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
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

ax1.plot_surface(X, Y, psi(1,2,X,Y,a), cmap=cm.coolwarm,
                       linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax2.plot_surface(X, Y, psi(2,1,X,Y,a), cmap=cm.coolwarm,
                       linewidth=0.2, rcount=20, ccount=20, edgecolor='0.7')
ax1.set_xticks([]); ax1.set_yticks([]); ax1.set_zticks([])
ax2.set_xticks([]); ax2.set_yticks([]); ax2.set_zticks([])
ax1.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100)
ax2.plot([1/4,1/4],[1/4,1/4],[-2,2],'k--',zorder = 100)

glue("potential-well-2d", fig, display=False)
```

(potential-well-2d)=
```{glue:figure} potential-well-2d
The two first excited wavefunctions of the 2d infinite square well potential. The line indicates where we will add the perturbation in the potential.
```


Now we add our perturbation, we use again a delta function, now placed off-center at one quarter in each direction, see {numref}`potential-well-2d`:

$$
H'=\lambda\,\delta(x-a/4)\,\delta(y-a/4)
$$

The increased potential at that position has as a consequence that "it is harder for the wavefunction to be there".

## The perturbation couples states

`[slide]`

Now we define $\psi_a^{(0)}\equiv\psi_{1,2}^{(0)}$ and $\psi_b^{(0)}\equiv\psi_{2,1}^{(0)}$ also to emphasize the generic nature of our procedure. First we calculate the matrix elements 

$$
H_{aa}'=\left\langle\psi_a^{(0)}\right|H'\left|\psi_a^{(0)}\right\rangle=
\\
\lambda \int \int dx\,dy \left(\psi_a^{(0)}\right)^2 \delta(x-a/4)\,\delta(y-a/4)
\\
=\frac{2\lambda}{a^2}
$$

Also, since as we were afraid that these eigenvalues are degenerate, we obtain

$$
H_{bb}'=H_{aa}'
$$

Interestingly, we obtain for the off-diagonal elements

$$
H_{ab}'=H_{ba}'=\frac{2\lambda}{a^2}
$$

which is non-zero! This implies coupling between the states. Similar to two coupled pendulums, we might already here expect that we get new eigenfunctions with different energies! If we use these states our previous non-degenerate perturbation theory procedure is applicable again. Instead of guessing the states, which often works, we give a formal procedure now.


## Finding good quantum states

`[slide]`

We go back to our power-series expansion up to first order from Eq. {eq}`pt-1storderseq` but with ommitted state number $n$:

$$
H_0 |\psi^{(1)}\rangle + H'|\psi^{(0)}\rangle=E^{(0)}|\psi^{(1)}\rangle + E^{(1)}|\psi^{(0)}\rangle
$$

We multiply from left with one of our degenerate solutions $\langle\psi_a^{(0)}|$:

$$
\langle\psi_a^{(0)}|H_0 |\psi^{(1)}\rangle + \langle\psi_a^{(0)}|H'|\psi^{(0)}\rangle=E^{(0)}\langle\psi_a^{(0)}|\psi^{(1)}\rangle + E^{(1)}\langle\psi_a^{(0)}|\psi^{(0)}\rangle
$$

For the first term, acting with $H_0$ to the left gives $E^{(0)}$ and therefore the first terms in the left and right hand side cancel.

Now we use as a test function a generic superposition of our two degenerate solutions:

$$
\psi^{(0)}=\alpha \psi_a^{(0)}+\beta \psi_b^{(0)}
$$

We obtain (remember that the solutions are orthogonal!):

$$
\alpha H_{aa}' + \beta H_{ab}' = \alpha E^{(1)}
$$

In the same way but by multiplying from left with $\langle\psi_b^{(0)}|$ we obtain:

$$
\alpha H_{ba}' + \beta H_{bb}' = \beta E^{(1)}
$$

This is an eigenvalue problem

$$
\left(\begin{array}{ll}
H_{a a}' & H_{a b}' \\
H_{b a}' & H_{b b}'
\end{array}\right)
\left(\begin{array}{l} \alpha \\ \beta\end{array}\right)
=E^{(1)}\left(\begin{array}{l} \alpha \\ \beta \end{array}\right)
$$

## The new quantum states

`[slide]`

Note that this is quite easy to be generalized to $n$-fold degeneracies, one basically just has to add all $n$ degenerate states to the superposition, and obtains an $n\times n$ matrix!

You know how to solve this (the eigenvalues of a matrix full of $x$ are $\{0,2x\}$ and the eigenvectors are $(1,1)$ and $(1,-1)$), we obtain as the perturbed energies

$$
E^{(1)}_+=\frac{4\lambda}{a^2}
\\
E^{(1)}_-=0
$$

With the wavefunctions

$$
\psi^{(0)}_\pm=\frac{1}{\sqrt{2}}\left(\psi^{(0)}_a \pm \psi^{(0)}_b \right)
$$


## Visualizing the new quantum states

`[slide]`

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
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

glue("potential-well-2d-pm", fig, display=False)
```

(potential-well-2d-pm)=
```{glue:figure} potential-well-2d-pm
The two new wavefunctions $\psi^{(0)}_+$ (left) and $\psi^{(0)}_-$ (right) lifting the degeneracy of first-order perturbation theory.
```

It is clear that $\psi^{(0)}_+$ has the higher energy, since it has a much higher expectation value at the position of the perturbation, this increases the energy of that state.

## Wrapping up

`[slide]`

We check if now our approach for degenerate perturbation theory works:

$$
\langle\psi_+^{(0)}|H' |\psi^{(0)}_-\rangle = 0
$$

which is exactly what we need that the expression for the perturbed states does not blow up!

$$
\left|\psi_n^{(1)}\right\rangle=\sum_{m\neq n}\frac{\left\langle\psi_m^{(0)}\right|H'\left|\psi_n^{(0)}\right\rangle}{E_n^{(0)}-E_m^{(0)}}\left|\psi_m^{(0)}\right\rangle
$$

Now we just have to re-formulate the sum and include our new states, this is a bit tedious and won't be done here. But in any case it is more important that we have seen that, naturally, energy degeneracies are (often) lifted under perturbations!

<!-- PD said yes leave it with this. -->

<!-- Example 7.3 & example 7.4 exercise etc. -->
