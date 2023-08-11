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

# Perturbation theory

`[slide] perturbation theory`

Let's assume that we have solved the Schrödinger equation for a particular Hamiltonian, for instance the infinite square well Hamiltonian that we now call $H_0$. As we have shown before, we have obtained a set of orthonormal eigenfunctions $\psi_n^{(0)}$ and energies or eigenvalues $E_n^{(0)}$. Now, there is a small time-indepentend perturbation of the system - for instance a small hump in the potential:

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(0, 1, 500)
y=exp(-(x-0.5)**2/0.03**2)
y[0]=10
y[-1]=10
ax.plot(x, y, color='red')
ax.set_xlabel('$x/a$')
ax.set_ylabel('$V(x)$')
ax.set_ylim(-1,5)

glue("potential-well-hump", fig, display=False)
```

(potential-well-hump)=
```{glue:figure} potential-well-hump
A potential with a hump.
```

We can write the Hamiltonian as a sum of the unperturbed one and the perturbation:


$$
H=H_0+\lambda H'
$$(pt-ham)

$H'$ in Eq. {eq}`pt-ham` can for instance be the potential for the "hump".

`[slide] power series`

Now we write the eigenfunction, the wavefunction $\psi_n$ and its energy $E_n$ of a particular state $n$ as power series in $\lambda$ - If you don't remember these check the [wikipedia page](https://en.wikipedia.org/wiki/Power_series)!

$$
E_n=E_n^{(0)}+\lambda E_n^{(1)}+\lambda^2 E_n^{(2)}+\ldots
$$

$$
\psi_n=\psi_n^{(0)}+\lambda \psi_n^{(1)}+\lambda^2 \psi_n^{(2)}+\ldots
$$

We call for instance $E_n^{(1)}$ the first-order correction to the $n$th eigenvalue and so on. Since the perturbation is assumed to be small, the energies and eigenstates should be similar to the unperturbed case, and higher-order correction terms should become small. How do we determine these corrections?

## First-order perturbation theory: energy

`[slide] perturbation theory: energy`

We plug in the power series into the Schrödinger equation and obtain:

$$
\left(H_0+\lambda H'\right) 
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle+\ldots\right)
=
\left(E_n=E_n^{(0)}+\lambda E_n^{(1)}+\ldots\right)
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle+\ldots\right)
$$

We now collect terms in $\lambda$ according to the order that we want to calculate and obtain:

For the zeroth order we get for the terms without $\lambda$: 

$$
H_0|\psi_n^{(0)}\rangle=E_n^{(0)}|\psi_n^{(0)}\rangle
$$

and for the first order, the terms with $\lambda$ are (after dividing by $\lambda$):

$$
H_0 |\psi_n^{(1)}\rangle + H'|\psi_n^{(0)}\rangle=E_n^{(0)}|\psi_n^{(1)}\rangle + E_n^{(1)}|\psi_n^{(0)}\rangle
$$(pt-1storderseq)

We multiply from left with $\langle\psi_n^{(0)}|$, note that $H_0$ is hermitian and can also be evaluated by acting to the left, and the first terms on the left and right hand side cancel. We obtain:

$$
E_n^{(1)}=\langle\psi_n^{(0)}|H'|\psi_n^{(0)}\rangle
$$

So, the first correction term to the energy is simply the expectation value of the perturbation Hamiltonian for the unperturbed eigenstate! This is a very important equation in quantum mechanics.

<!-- `G example 7.1+2 as exercise.` -->

## Normalisation

`[slide] normalization`

Now we want to find $|\psi_n^{(1)}\rangle$. For this, it is useful to know properties of the correction states $\psi_n^{(i)}\rangle$. In quantum mechanics, it is often useful to check and apply normalisation, let's do this! 

It is reasonable to assume that $\langle \psi_n^{(0)}|\psi_n^{(0)}\rangle=1$, but we know already that also $\langle \psi_n|\psi_n\rangle=1$ must hold. Let's impose normalization up to first order:

$$
\left(\langle \psi_n^{(0)}|+\lambda \langle \psi_n^{(1)}|\right)
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle\right)=1
\\
\langle \psi_n^{(0)}|\psi_n^{(0)}\rangle
+\lambda \langle \psi_n^{(0)}|\psi_n^{(1)}\rangle
+\lambda \langle \psi_n^{(1)}|\psi_n^{(0)}\rangle
+\cancel{\lambda^2 \langle \psi_n^{(1)}|\psi_n^{(1)}\rangle}
=1
\\
\langle \psi_n^{(0)}|\psi_n^{(1)}\rangle+
\langle \psi_n^{(1)}|\psi_n^{(0)}\rangle=0
$$

We can assume that the terms are real since in time-independent quantum mechanics the global phase can be set to 1, therefore we find that the zeroth and first order eigenstate are orthogonal: $\langle \psi_n^{(0)}|\psi_n^{(1)}\rangle$. Note that this is an unusual normalization and you might say this leads to errors - yes, but we check simply for normalization in the end.

## First-order eigenstates

`[slide] eigenstates 1`

We now need to play around with our equations to find an expression for $|\psi_n^{(1)}\rangle$, for the first order corrections! We use a trick that is often useful in quantum mechanics: we insert the identity and see what we can do with it.

First we re-arrange Eq. {eq}`pt-1storderseq`: 

$$
\left(H_0-E_n^{(0)}\right)|\psi_n^{(1)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
$$

Since $|\psi_n^{(0)}\rangle$ form a complete basis, we can express $|\psi_n^{(1)}\rangle$ with it:

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}c_m^{(n)}|\psi_m^{(0)}\rangle
$$

We left out $m=n$ due to the normalization choice above. Now we insert this into the preceeding equation:

$$
\sum_{m\neq n}
\left(H_0-E_n^{(0)}\right)c_m^{(n)}
|\psi_m^{(0)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
\\
\sum_{m\neq n}
\left(E_m^{(0)}-E_n^{(0)}\right)c_m^{(n)}
|\psi_m^{(0)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
$$

And we multiply from left with $\langle\psi_k^{(0)}$

$$
\sum_{m\neq n}
\left(E_m^{(0)}-E_n^{(0)}\right)c_m^{(n)}
\langle\psi_k^{(0)}|\psi_m^{(0)}\rangle = 
-\langle\psi_k^{(0)}|H'|\psi_n^{(0)}\rangle + 
E_n^{(1)} \langle\psi_k^{(0)}\psi_n^{(0)}\rangle
$$

`[slide] eigenstates 2`

The left hand side is zero for $k = n$ and we obtain again the Expression for the first-order Energy correction.

For $k \neq n$ we obtain

$$
\left(E_k^{(0)}-E_n^{(0)} \right)c_k^{(n)}=-\langle\psi_k^{(0)}|H'|\psi_n^{(0)}\rangle
$$

or after renaming the index $k$ and rearranging

$$
c_m^{(n)}=\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}
$$

With this we obtain the first-order correction to the eigenstate

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}|\psi_m^{(0)}\rangle
$$

`[slide] eigenstates 3`

Some observations:

* This only works if the energy spectrum of the unperturbed system is *nondegenerate, if the denominator is never 0. We come later to the degenerate perturbation theory
* We see that the perturbation requires potentially all unperturbed neigenstates to describe the perturbed system! 
* From the denominator we see that if the energies of the eigenstates lie closer in energy, the perturbation has a larger effect - since noise is a kind of perturbation, for qubits a spectrum with significant spacing can be advantageous.

## 1st order perturbation theory: example

`[slide] perturbation theory example `

`GProb7.1`

```{glue:figure} potential-well-hump
A potential with a hump.
```


In physics, the simplest "hump" is often described by a delta function due to its nice algebraic properties. We assume the bump is in the middle of the potential well and $\alpha$ is a constant describing the height of the hump:

$$
H'=\alpha \delta(x-a / 2)
$$

We know from before the wavefunction for the unperturbed case. 

Now we first find the first-order corrections to the energies of the eigenstates:

$$
\psi_n^{(0)}(x)=\sqrt{\frac{2}{a}} \sin \left(\frac{n \pi}{a} x\right)
\\
E_n^1=\left\langle\psi_n^{(0)}\left|H^{\prime}\right| \psi_n^{(0)}\right\rangle=\frac{2}{a} \alpha \int_0^a \sin ^2\left(\frac{n \pi}{a} x\right) \delta\left(x-\frac{a}{2}\right) d x \\
$$

Remember that the Poisson brackets can be taken literally 0 it is an integral over all parameters, in this case position. I will continue to use the ket notation although if one could often simply use the real-space wavefunction.

`[slide] example`

$$
E_n^{(1)}=\frac{2 \alpha}{a} \sin ^2\left(\frac{n \pi}{a} \frac{a}{2}\right)=\frac{2 \alpha}{a} \sin ^2\left(\frac{n \pi}{2}\right)=\left\{\begin{array}{cc}
0, & \text { if } n \text { is even, } \\
2 \alpha / a, & \text { if } n \text { is odd. }
\end{array}\right\}
$$


* We calculate the overlap integral with the unperturbed wavefunctions in a straight-forward way. 
* The argument sine function results in zero if n is even - meaning the energies are not perturbed. Looking at the unperturbed eigenfunctions, this makes a lot of sense - if the probability of the particle to be in the center is zero, our perturbation should not modify the energy levels!
* Only for odd $n$, we get a higher energy of the solution since the the wavefunction is non-zero in the middle for odd solutions - the particle feels the raised potantial in the middle.

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
    ax.plot(x, y)

ax.set_xlabel('$x/a$')
ax.set_ylabel('$\psi_n^{(0)}(x)$')
ax.set_ylim(-1,18)

glue("potential-well-wavefunctions2", fig, display=False)
```

(potential-well-wavefunctions2)=
```{glue:figure} potential-well-wavefunctions2
The unperturbed wavefunctions of an infinite-well potential
```



`[slide] example continued`

Now we want to find the 1st-order correction to the wavefunction for the ground state with $n=1$. Before, we derived for this the equation:

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}|\psi_m^{(0)}\rangle
$$

We need to calculate the numerator:

$$
\left\langle\psi_m^{(0)}\left|H^{\prime}\right| \psi_1^{(0)}\right\rangle=\frac{2 \alpha}{a} \int \sin \left(\frac{m \pi}{a} x\right) \delta\left(x-\frac{a}{2}\right) \sin \left(\frac{\pi}{a} x\right) d x
\\
=\frac{2 \alpha}{a} \sin \left(\frac{m \pi}{2}\right) \sin \left(\frac{\pi}{2}\right)=\frac{2 \alpha}{a} \sin \left(\frac{m \pi}{2}\right)
$$

This is nearly the same result as above, it is zero for even $m$.

We know the denominator from some weeks ago, we have called the mass of the particle $m_0$ to avoid confusion:

$$
E_1^{(0)}-E_m^{(0)}=\frac{\pi^2 \hbar^2}{2 m_0 a^2}\left(1-m^2\right)
$$

`[slide] example continued`

Now we can combine the results and obtain

$$
\left|\psi_1^{(1)}\right\rangle=
\frac{2 \alpha}{a} \frac{2 m_0 a^2}{\pi^2 \hbar^2}\left[\frac{-1}{1-9} \left|\psi_3^{(0)}\right\rangle+\frac{1}{1-25} \left|\psi_5^{(0)}\right\rangle+\frac{-1}{1-49} \left|\psi_7^{(0)}\right\rangle+\ldots\right]
$$

We see that the contribution of higher states reduces quadratically, which might also be used as an approximation. If you remember the shape of the odd wavefunctions, some have a maximum and some a minimum in the center - the result of the alternating sign of the corrections is that the central maximum of the $n=1$ wavefunction gets a small dip in the center where the potential hump is introduced. 

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

def psi0(n,x):
    return sqrt(2/a)*sin(n*pi/a*x)

def psi11summand(m,x):
    alpha=1
    hbar=1
    a=1
    m0=1
    return (2*alpha/a)*sin(m*pi/2) / (pi**2*hbar**2/(2*m0*a**2)*(1-m**2)) * psi0(m,x)

x = linspace(0, 1, 500)

y=psi0(1,x)
ax.plot(x, y)

for ii in range(3,20):
    y=y+psi11summand(ii,x)

ax.plot(x, y)
ax.set_xlabel('$x/a$')
ax.set_ylabel('$\psi(x)$')
# ax.set_ylim(-1,18)

glue("potential-well-perturbed-wf", fig, display=False)
```

(potential-well-perturbed-wf)=
```{glue:figure} potential-well-perturbed-wf
The unperturbed (blue) $n=1$ wavefunction and the perturbed one, calculate up to $m=20$.
```

<!--G problem 7.1 as exercise.-->

## Higher order corrections

<!--[slide] higher order -->

The procedure for the second-order corrections is in principle similar to the first-order ones above, but now we will obtain double sums. 

The energy correction is:
$$
E_n^{(2)}=\sum_{m \neq n} 
\frac{
\left|\left\langle\psi_m^{(0)}\right| H'\left| \psi_n^{(0)}\right\rangle\right|^2
}{
E_n^{(0)}-E_m^{(0)}
}
$$


Luckily, often the first-order corrections are sufficient to understand the behaviour of systems.

The behaviour of quantum systems under perturbations is very important, for instance to determine how small changes affect physical, realistic qubits. As we will see later, it is also crucial to calculate the dynamics and discover coherent control schemes of qubits.

But it is extremely hard to calculate quantum systems for arbitrary potentials and interactions. One important goal of quantum research and technology is to make a machine that can determine the ground state (and excited states) of quantum systems - of course including many "perturbations"!
