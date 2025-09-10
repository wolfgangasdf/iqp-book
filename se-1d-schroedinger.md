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

# Potentials and wavefunctions

In this section, we discuss the quantum behaviour of particles that are localized by some forces, and calculate expectation values of operators. 


## The potential energy

{{slidetag}}
<!-- [Ph2.2] -->
We want to describe quantum behaviour of particles, which usually are not in free space but bound by a certain potential – we need to add this to the Schrödinger equation, this is usually done by adding a potential energy that is dependent on position.

For example, an electron in a hydrogen atom is mainly bound to the positively charged proton core by the Coulomb force, which can be written by the potential energy 

$$V\left(r\right)=-\frac{e^2}{4\pi\epsilon_0r}$$(se-1d-cp)

This energy is negative, which means attractive for all radial distances, and strongest close to $r=0$. 

As you can imagine, this is not the end of the story, other forces, including the Pauli exclusion principle which we discuss later, and the so-called strong force will lead to a repulsive force for very small distances, but we can ignore this for now. 

We have seen before that the second-derivative term of the Schrödinger equation is simply the kinetic energy of the particle, therefore it is not too crazy to simply add the potential energy to it. The one-dimensional Schrödinger equation including a one-dimensional position-dependent potential $V(x)$ becomes: 

$$
i\hbar\frac{\partial\Psi}{\partial t}=-\frac{\hbar^2}{2m}\frac{\partial^2\Psi}{\partial x^2}+V\left(x\right)\Psi. 
$$(se-1d-se)

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(-7, 7, 200)
y=-1/abs(x)

ax.plot(x, y, color='red')
ax.set_ylim(-3,1)
ax.set_xlabel('$r$')
ax.set_ylabel('$V(r)$')
ax.set_xticks([0])
ax.set_yticks([0])
ax.text(-0.8,0.1,"⊕",fontsize=30)
ax.text(5,0.1,"⊖",fontsize=30)

glue("se-coulomb", fig, display=False)
```

(se-coulomb)=
```{glue:figure} se-coulomb
The Coloumb potential of the electron in the field of a positive charge (nucleus) at the origin.
```

```{seealso}
Further reading: Philips Chapter 2.2
```

## Separation of variables

{{slidetag}}
<!-- Gr 2.1. -->

We still carry the time dependence of the wave function, how fast does it actually oscillate for a realistic particle? This is very fast and we often average over this in experiments (as we do for the E-field oscillations for light), how can we simplify the equation?

This is the method of separation of variables, we try to write $\Psi$ as 

$$
\Psi\left(x,t\right)=\psi(x)\phi(t)
$$(se-1d-sv1)

Let’s put this back into the Schrödinger equation, we obtain for the derivatives 

$$
\begin{align}
\frac{\partial\Psi}{\partial t}&=\psi\frac{d\phi}{dt}
\\
\frac{\partial^2\Psi}{\partial x^2}&=\frac{d^2\psi}{dx^2}\phi
\end{align}
$$(se-1d-sv2)

With this the Schrödinger equation becomes 

$$
i\hbar\psi\frac{d\phi}{dt}=-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2}\phi+V\psi\phi
$$(se-1d-sv3)

Dividing by $\psi\phi$ gives

$$
i\hbar\frac{1}{\phi}\frac{d\phi}{dt}=-\frac{\hbar^2}{2m}\frac{1}{\psi}\frac{d^2\psi}{dx^2}+V
$$(se-1d-sv4)

On the left side is a function of only $t$, and the right side a function of only $x$ – both need therefore to be constant! We now set both sides equal to a constant $E$, and we end up with two ordinary differential equations: 

$$
\frac{d\phi}{dt}=-\frac{iE}{\hbar}\phi
$$(se-1d-sv5)

and 

$$
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2}+V\psi=E\psi.
$$(se-1d-sv6)

The first is independent on V and can be simply solved by integration, giving: 

$$
\phi\left(t\right)=e^{-\frac{iEt}{\hbar}}
$$(se-1d-sv7)

This is an oscillation, therefore $\phi$ is also called the "wiggle factor".

The second equation is the time-independent Schrödinger equation, and can only be solved when we know $V(x)$.

<!-- Quick check exercises: Gr 2.1a show that E must be real. Gr 2.2 Show that E must be positive.  [MB thinks last one is too hard] -->

```{seealso}
Further reading: Griffiths Chapter 2.1
```


## Probability density and Hamiltonian

{{slidetag}}

As already discussed for the case of light, now for position-space, the probability to find a particle at position $x$ is determined by the *probability density* 

$$\left|\Psi\left(x,t\right)\right|^2$$(se-1d-prob)

As we have seen, the wave function of a particle is time-dependent

$$
\Psi\left(x,t\right)=\psi\left(x\right)e^{-iEt/\hbar}
$$(se-1d-p1)

But in the case here, and in many other cases, the probability density is not: 

$$
\left|\Psi\left(x,t\right)\right|^2=\Psi^\ast\Psi=\psi^\ast e^{+iEt/\hbar}\psi e^{-iEt/\hbar}=\left|\psi\left(x\right)\right|^2
$$(se-1d-p2)

We call such solutions “stationary” states. This also means as we will see later, that the expectation value of any dynamical value such as position and momentum are time independent – this sounds reasonable for a large number of systems. For instance for a particle at rest, the expectation value of the position $x$ is constant, and momentum $p=0$ – nothing moves.

<!-- [G eq. 2.10] -->
Now we discuss what the appearance of the energy $E$ in the Schrödinger equation means. In classical mechanics, the total energy of a system is given by the sum of kinetic and potential energy:

$$
H(x, p)=\frac{p^2}{2 m}+V(x)
$$(se-1d-p3)

Using a procedure that physicists call “canonical replacement” and which will be proven to be reasonable, we can derive from this a Hamiltonian “operator” that acts on wave functions:

$$
\hat{H}=-\frac{\hbar^2}{2 m} \frac{\partial^2}{\partial x^2}+V(x)
$$(se-1d-p4)

The eigenvalues of this operator is the energy of the system for the specific wavefunction, and we are back to the Schrödinger equation:

$$
\hat{H} \psi=E \psi
$$(se-1d-p5)

:::{note}
Show that this makes sense with a de Broglie wave above!
:::

```{seealso}
Further reading: Griffiths Chapter 2.1 and Philips Chapter 2.2
```

## Expectation values of operators

{{slidetag}}
<!-- Ph3.5.  -->
As we have seen before, the outcome of a measurement in QM is a random variable, and we call the average value of this the expectation value. It can be determined by measuring an ensemble of identically prepared systems, or repeating the experiment many times.

Let us look at the position. We assume that we have a particle with a wavefunction $\Psi(x,t)$, which is the probability amplitude of the position observable and $|\Psi(x,t)|^2\cdot dx$ is the probability of finding the particle between $x$ and $x+dx$. The position expectation value is therefore

$$
\langle x\rangle=\int_{-\infty}^{+\infty} x|\Psi(x, t)|^2 \mathrm{~d} x
$$(se-1d-ev1)

If we have many copies of the same system and measure repeatedly the position, the position average will be this expectation value.

Similarly, if we have a wave function of the momentum observable $\tilde{\Psi}(p, t)$, the expectation value is

$$
\langle p\rangle=\int_{-\infty}^{+\infty} p|\tilde{\Psi}(p, t)|^2 \mathrm{~d} p
$$(se-1d-ev2)

The momentum and position expectation values are related by a classical relationship

$$
\langle p\rangle=m \frac{\mathrm{d}\langle\mathbf{x}\rangle}{\mathrm{d} t}
$$(se-1d-ev3)

For $x$ above it was not obvious, but this contains clear signs of an operator – a differential operator. 

The position and momentum operators are in the position basis: 

$$
\hat{x}=x,\quad\hat{p}=-i\hbar\frac{\partial}{\partial x}
$$(se-1d-ev4)

And we can calculate their expectation values e.g. like this: 

$$
\langle p\rangle=\int_{-\infty}^{\infty} \Psi^*(x, t)\left(-i \hbar \frac{\partial}{\partial x}\right) \Psi(x, t) d x
$$(se-1d-ev5)

The linear algebra becomes complete if we realize that for an operator $\hat{Q}$ $\langle Q\rangle$ is shorthand for 

$$
\langle Q\rangle \equiv \langle\Psi|Q|\Psi\rangle = \int dx\,\Psi^\ast Q \Psi
$$(se-1d-ev6)

Where in the last step we have have used the recipe that a *sandwich* of quantum states that calculates the expectation value of an operator, is don by integrating over the dependent variable $x$. This procedure might seem a bit ad-hoc right now, but you will see that it works.

```{seealso}
Further reading: Philips Chapter 3.5
```

## Heisenberg representation

So far, we have seen the "Schrödinger Representation" of quantum mechanics, where the wavefunction of the particle is defined as a function of time, while operators are time independent, unless they have explicit time dependence.

$$
\psi_S(t) = U(t)\, \psi_S(0), \quad \hat{A}_S(t) = \hat{A}_S
$$

where, $ U(t) = e^{-\frac{i}{\hbar} \hat{H} t}$ is the time evolution operator. We use here the convention that we will add a subscript "S" to denote the Schrödinger representation.

Since we know that the time dependent part of the wavefunction comes only from the time evolution operator as described by the Schrödinger equation, we can also choose to define the operators to be time dependent while the wavefunction is static. This is called the "Heisenberg Representation":

$$
\psi_H(t) = \psi_H(0) \equiv \psi_H
$$

where operators are transformed into their time-dependent versions

$$
\hat{A}_H(t) = U^\dagger(t) \, \hat{A}_S \, U(t)
$$

The time-evolution operator $U(t)$ is the same as in the Schrödinger picture.

Both of these representations are equivalent, and there is no physical difference when using one or the other. To see this explicitly, let us calculate the expectation value of the operator in both representations.

In the Schrödinger picture:

$$
\langle \hat{A} \rangle_S(t) = \bra{\psi_S(t)} \hat{A}_S \ket{\psi_S(t)}
$$

$$
\langle \hat{A} \rangle_S(t) = \bra{\psi_S(0)} U^\dagger(t) \, \hat{A}_S \, U(t) \ket{\psi_S(0)}
$$

In the Heisenberg picture, we defined $\ket{\psi_H} \equiv \ket{\psi_S(0)}$ and $\hat{A}_H(t) = U^\dagger(t) \hat{A}_S U(t)$, which gives us:

$$
\langle \hat{A} \rangle_H(t) = \bra{\psi_H} \hat{A}_H(t) \ket{\psi_H}
$$

$$
\langle \hat{A} \rangle_H(t) = \bra{\psi_S(0)} U^\dagger(t) \, \hat{A}_S \, U(t) \ket{\psi_S(0)}
$$

Thus:

$$
\langle \hat{A} \rangle_S(t) = \langle \hat{A} \rangle_H(t)
$$

As you will see in later courses, the Heisenberg representation happens to be quite useful to obtain dynamical equations of operators themselves. These equations will appear similar to Hamilton's equations from classical mechanics, making it easier to transfer classical intuition into certain quantum problems.
