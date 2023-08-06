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

TODO: until page 5 word
