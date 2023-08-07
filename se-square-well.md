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

# The Square well potential

## A particle in a box

`[slide]`
<!-- Gr 2.2.  -->

Suppose now that the potential energy describes an infinite square well: 

$$
V\left(x\right)=\begin{cases}
    0, & \text{if } 0\le x \le a\\
    \infty, & \text{otherwise}.
  \end{cases}
$$

A particle in this potential can move freely inside the well and the probability of finding the particle outside of it is zero: $\psi\left(x\right)=0$. 

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(0, 1, 500)
y = 0*x
y[0]=10
y[-1]=10
ax.plot(x, y, color='red')
ax.set_xlabel('$x/a$')
ax.set_ylabel('$V(x)$')
ax.set_ylim(-1,5)

glue("potential-well", fig, display=False)
```

(potential-well)=
```{glue:figure} potential-well
The infinite square potential well.
```


Inside the well the potential energy is zero such that the time independent Schrodinger equation reads: 

$$
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2}=E\psi, or \frac{d^2\psi}{dx^2}=-k^2\psi,\quad \text{where } k\equiv\sqrt{2mE}/\hbar
$$

This equation is the simple classical harmonic oscillator equation, where the general solution is:
$$
\psi\left(x\right)=A\sin{\left(kx\right)}+B\cos(kx)
$$
where $A$ and $B$ are constants. These constants are fixed by the boundary conditions $\psi\left(0\right)=\psi\left(a\right)=0$ and general conditions on $\Psi$: Usually, both $\psi$ and $d\psi/dx$ must be continuous – the latter however does not apply here because the potential goes to infinity. 

`[slide]`

Since $\psi(0)=0$, we require that $B=0$.

We are left with $\psi\left(x\right)=A\sin(kx)$. Then $\psi\left(a\right)=A\sin{\left(ka\right)}=0$ gives that either $A=0$, which is a non-normalizable trivial solution, there would be no particle, or else $\sin{\left(ka\right)}=0$, which means that $ka=0,\ \pm\pi,\ \pm2\pi,\ \ldots$

Here $k=0$ again gives a non-normalizable solution, and the negative solutions give nothing new except for a minus sign which we can absorb into the constant $A$. Therefore, the distinct solutions are: $k_n=\frac{n\pi}{a}$ with $n=1,2,3,\ldots$ Therefore, the second boundary condition does not determine the constant $A$, but gives discrete possible values of energy $E$: 

$$
E_n=\frac{\hbar^2k_n^2}{2m}=\frac{n^2\pi^2\hbar^2}{2ma^2}
$$

We see that the energy for a particle in a box is quantized, it cannot have just any value. We can find the value of $A$ by normalizing the wavefunction: 

$$
\int_{0}^{a}{\left|A\right|^2\ sin^2\left(kx\right)dx}=\left|A\right|^2\frac{a}{2}=1
$$

This gives $A=\sqrt{2/a}$. 

With this, inside the well, the solutions are: 

$$
\psi_n\left(x\right)=\sqrt{\frac{2}{a}}\sin\left(\frac{n\pi}{a}x\right)
$$


These solutions are mutually orthogonal, one case show that

$$
\int \psi_m(x)^* \psi_n(x) d x=\delta_{m n}
$$

where the Kronecker delta is defined by 

$$
\delta_{m n}= \begin{cases}0, & m \neq n \\ 1, & m=n\end{cases}
$$

## Particle in a box wavefunctions

`[slide]`
The particle in the state $n=1$ has the lowest energy and is therefore called the ground state, the other states we call excited states. They have $n-1$ nodes:

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(0, 1, 500)

a=1
for n in range(6):
    y=sqrt(2/a)*sin(n*pi/a*x) + 3*n # offset curves
    ax.plot(x, y, label="$\psi_" + str(n) + "(x)$")

ax.set_xlabel('$x/a$')
ax.set_ylabel('$\psi_n^{(0)}(x)$')
ax.set_ylim(-1,18)
fig.legend(loc='outside right')

glue("potential-well-wavefunctions", fig, display=False)
```

(potential-well-wavefunctions)=
```{glue:figure} potential-well-wavefunctions
The first wavefunctions of an infinite-well potential. All wavefunctions oscillate around zero, they are shown vertically offsetted for better visibility.
```

`[slide]`

The solution to the time-dependent Schrodinger equation are found by taking into account the time dependent solution:

$$
\Psi_n\left(x,t\right)=\sqrt{\frac{2}{a}}\sin{\left(\frac{n\pi}{a}x\right)}e^{-i\left(\frac{n^2\pi^2\hbar^2}{2ma^2}\right)t}
$$

which means that the most general solution to the time-dependent Schrodinger equation is a linear combination of these states: 

$$
\Psi\left(x,t\right)=\sum_{n=1}^{\infty}{c_n\sqrt{\frac{2}{a}}\sin{\left(\frac{n\pi}{a}x\right)}e^{-i\left(\frac{n^2\pi^2\hbar^2}{2ma^2}\right)t}}
$$

These wave functions $\Psi_n(x,t)$ form a complete set, which means that all possible $\Psi(x,0)$ can be expressed by choosing appropriate coefficients $c_n$.

TODO ex: Exercise: show that this solves the time-dep S.EQ.

TODO Homework assignment: Finite barriers; see applications wikipedia; 


