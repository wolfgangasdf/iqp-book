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

# The quantum harmonic oscillator

In this section we discuss a slightly different potential than the square-well potential: the quantum harmonic oscillator. This is a key model system of quantum mechanics, introducing also the concepts of excitations and ladder operators. The same equations appear at many places in physics including even quantum optics!


## Harmonic potentials

`[slide]`
<!-- [Sakurai 2.3] [Griffiths 2.3] -->

The harmonic oscillator is as it is in classical mechanics, one of the most important systems in quantum mechanics – because it appears everywhere in nature, and it is simple enough to solve it analytically and highlights many of the basic concepts and methods of quantum mechanics. It appears everywhere in nature because nearly any potential landscape can be approximated by a harmonic oscillator, from optical systems over molecular vibrations to the dynamics of nuclear particles. 

The paradigm for a classical one-dimensional harmonic oscillator is a mass m attached to a spring of force constant k. The motion is governed by Hooke’s law, $F=-kx=m\ddot{x}$ (ignoring friction), and the solution is $x(t)=A\sin(\omega t)+B\cos(\omega t)$, where $k\equiv m\omega^2$ is the (angular) frequency of the oscillation. 

The potential energy has therefore a parabolic shape $V(x)=kx^2/2$.
Note that in nature there is no perfect harmonic oscillator — Hooke’s law does only approximately apply, and there are often many technical issues, e.g. a spring breaks if it is extended too far. But practically any potential is approximately parabolic in the neighbourhood of a local minimum – this can be seen from a Taylor expansion of any potential around a minimum:

$$
V(x)=V\left(x_0\right)+V^{\prime}\left(x_0\right)\left(x-x_0\right)+\frac{1}{2} V^{\prime \prime}\left(x_0\right)\left(x-x_0\right)^2+\cdots
$$(se-qho-v1)

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(-5, 20, 500)

y=-x+(x-3)**2-0.1*(x-5)**3
ax.plot(x, y)
y1=((x-3.7)/0.7)**2
ax.plot(x, y1)

ax.set_xlabel('$x$')
ax.set_ylabel('$V(x)$')
ax.set_ylim(-75,180)

glue("potential-taylor", fig, display=False)
```

(potential-taylor)=
```{glue:figure} potential-taylor
All potential minima can be approximated by a quadratic potential in the neighborhood of the minimum.
```

## A Schrödinger equation for the harmonic oscillator

`[slide]`

For a one-dimensional harmonic oscillator, we need to solve the Schrödinger equation for the potential

$$
V(x)=\frac{1}{2}m\omega^2x^2
$$(se-qho-v2)

where we have eliminated the spring constant using the relation between spring constant, mass, and frequency:

$$
\omega \equiv \sqrt{\frac{k}{m}}
$$(se-qho-v3)
 
We can again split off the time dependence and we obtain for the time-independent Schrödinger equation: 

$$
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2}+\frac{1}{2}m\omega^2x^2\psi=E\psi 
$$(se-qho-v4)


Solving this differential equation means finding the Eigenfunctions $\Psi$ and corresponding energies $E$. This can be done by looking up the solution for this particular differential equation. We will use another approach (Griffiths 2.3.1) and introduce a very important algebraic technique involving so-called ladder or creation and annihilation operators - which create and annihilate quantum excitations in quantum systems.

## Ladder operators

`[slide]`

We can write the Schrodinger equation $H\psi=E\psi$ using the momentum operator as

$$
H=\frac{1}{2m}\left[p^2+(m\omega x)^2\right]
$$(se-qho-lo1)

The idea is now to factor this term, motivated by  and using some hindsight we can construct these composite operators involving the position and momentum operator:

$$
a_{ \pm} \equiv \frac{1}{\sqrt{2 \hbar m \omega}}(\mp i p+m \omega x)
$$(se-qho-lo2)

With the commutation relation

$$
[\hat{x}, \hat{p}]=i \hbar
$$(se-qho-lo3)

:::{note}
Show this! Also note: This is called a *canonical* commutation relation because it is of great fundamental importance. $\hat{x}$ and $\hat{p}$ are conjugate variables with non-zero commutator, which always leads to an uncertainty relation as we have discussed before.
:::

we obtain $\hat{a}_{-} \hat{a}_{+}=\frac{1}{\hbar \omega} \hat{H}+\frac{1}{2}$, or written differently

$$
H=\hbar \omega\left(\hat{a}_{+} \hat{a}_{-}+1 / 2\right)
$$(se-qho-lo4)

:::{note}
Exercise: show that $[a_-,a_+]=1$
:::

Up to now, this was just rewriting the Schrodinger equation, now we will see that the ladder operators allow us to find the solutions.

`[slide]`

We now assume that some wavefunction $|\psi\rangle$ satisfies the Schrödinger equation with energy $E$, that is $H|\psi\rangle=E|\psi\rangle$.

Then we can calculate quite easily that 

$$
H\left(a_{+}|\psi\rangle\right)=(E+\hbar \omega)\left(a_{+}|\psi\rangle\right)
$$(se-qho-lo5)

where apparently $a_{+}$ has added $\hbar\omega$ to the energy of the system!

Similarly, we find that

$$
H\left(a_{-}|\psi\rangle\right)=(E-\hbar \omega)\left(a_{-}|\psi\rangle\right)
$$(se-qho-lo6)

So, $a_-$ lowers the energy of the system by $\hbar\omega$!

Therefore, $a_\pm$ are called "ladder operators", because they allow us to climb up and down in energy; $a_+$ is the raising operator, and $a_-$ is the lowering operator. As you can show, the hermitian conjugate of $a_-$ is $a_+$ and vice versa - therefore you often also read simply $a$ for $a_-$ and $a^\dagger$ for $a_+$.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

hbar=1
m=1
omega=1
nmax = 6

def potential(x):
    return 1/2*m*omega**2*x**2

def energy(n):
    return hbar*omega*(1/2+n)

fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-5, 5, 500)

for n in range(nmax):
    scale=0.5
    ax.plot(x, ones(size(x))*energy(n), color='0.5')
    ax.text(0, 0.2+energy(n), "$E_" + str(n) + "$")
    ax.arrow(-2,energy(n), 0, 0.8*energy(0), width=0.1, length_includes_head=False, color='r' )
    ax.text(-3, 0.2+energy(n), "$a^\dagger$")
    ax.arrow(2,energy(n+1), 0, -0.8*energy(0), width=0.1, length_includes_head=False, color='b' )
    ax.text(2.5, 0.2+energy(n), "$a$")

fudge=2.5
ax.plot(x,potential(x*fudge) / max(potential(x)), label="$V(x)$")

ax.set_xlabel('$x$')
ax.set_xticks([])
ax.set_yticks([])
fig.legend(loc='outside right')

glue("qho-ladder", fig, display=False)
```

(qho-ladder)=
```{glue:figure} qho-ladder
The first few energies of the quantum harmonic oscillator and the action of the ladder operators. 
```


## The ground state

`[slide]`

There has to be a catch, if we apply $a_-$ repeatedly we eventually will reach negative energies, which do not make sense - applying $a_-$ on the lowest-energy state which we call $\Psi_0$ should probably better result in "nothing":

$$
a_{-}\left|\psi_0\right\rangle=0
$$(se-qho-gs1)

The energy of the ground state $\Psi_0$ is $E_0=\frac{1}{2}\hbar\omega$ which can be easily be seen from the Schrödinger equation.

Now we can finally calculate an explicit wavefunction, working out $a_{-}\left|\psi_0\right\rangle=0$ results in the simple differential equation $\frac{d \psi_0}{d x}=-\frac{m \omega}{\hbar} x \psi_0$ which can be solved by integration:

$$
\psi_0(x)=\left(\frac{m \omega}{\pi \hbar}\right)^{1 / 4} e^{-\frac{m \omega}{2 \hbar} x^2}
$$(se-qho-gs2)

This is a simple Gaussian distribution, meaning that in the quantum ground state the probability to find the particle is highest at $x=0$ - this might still be intuitively explainable by classical thoughts - the particle is at rest.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(4,3))

x = linspace(-10, 10, 500)

m=1
omega=1
hbar=1
y=(m*omega/(pi*hbar))**(1/4) * exp(-1*m*omega/(2*hbar)*x**2)
ax.plot(x, y)

ax.set_xlabel('$x$')
ax.set_ylabel('$\psi(x)$')

glue("qho-groundstate", fig, display=False)
```

(qho-groundstate)=
```{glue:figure} qho-groundstate
The quantum ground state wavefunction of the harmonic oscillator.
```

## Excited states

`[slide]`

Having the ground state energy and wave function, we can now find all excited states and energies by repeatedly applying the raising or creation operator $a^\dagger$:

$$
\psi_n=\frac{1}{\sqrt{n !}}\left(\hat{a}_{+}\right)^n \psi_0
$$(se-qho-es1)

We first find all energies:

$$
E_n=\left(n+\frac{1}{2}\right) \hbar \omega
$$(se-qho-es2)

The momentum operator in $a^\dagger$ basically leads to a spatial derivative of the previous state - resuklting in the so-called Hermite functions 

$$
\psi_n(x) = \frac{1}{\sqrt{2^n\,n!}}  \left(\frac{m\omega}{\pi \hbar}\right)^{1/4}  e^{
- \frac{m\omega x^2}{2 \hbar}} H_n\left(\sqrt{\frac{m\omega}{\hbar}} x \right), \qquad n = 0,1,2,\ldots.
$$(se-qho-es3)

which look like this: 

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
from numpy.polynomial.hermite import hermval

hbar=1
m=1
omega=1
nmax = 6

def psi(n, x):
    c1=1/(sqrt(2**n*math.factorial(n))) * (m*omega/(pi*hbar))**(1/4) * exp(-m*omega*x**2/(2*hbar))
    hcoeff=zeros(n+1)
    hcoeff[n]=1
    return c1*hermval(sqrt(m*omega/hbar)*x, hcoeff)

def potential(x):
    return 1/2*m*omega**2*x**2

def energy(n):
    return hbar*omega*(1/2+n)

fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-5, 5, 500)

for n in range(nmax):
    scale=0.5
    ax.plot(x, energy(n)+psi(n,x)*scale, label="$\psi_" + str(n) + "(x)$")
    ax.plot(x, ones(size(x))*energy(n), color='0.5')

fudge=2.5
ax.plot(x,potential(x*fudge) / max(potential(x)), label="$V(x)$")

ax.set_xlabel('$x$')
ax.set_xticks([])
ax.set_yticks([])
fig.legend(loc='outside right')

glue("qho-wavefunctions", fig, display=False)
```

(qho-wavefunctions)=
```{glue:figure} qho-wavefunctions
The first few wavefunctions of the quantum harmonic oscillator. All wavefunctions oscillate around zero, they are shown vertically offsetted for better visibility.
```

The corresponding probability density is the square of these wavefunctions:

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
from numpy.polynomial.hermite import hermval

hbar=1
m=1
omega=1
nmax = 6

def psi(n, x):
    c1=1/(sqrt(2**n*math.factorial(n))) * (m*omega/(pi*hbar))**(1/4) * exp(-m*omega*x**2/(2*hbar))
    hcoeff=zeros(n+1)
    hcoeff[n]=1
    return c1*hermval(sqrt(m*omega/hbar)*x, hcoeff)

def potential(x):
    return 1/2*m*omega**2*x**2

def energy(n):
    return hbar*omega*(1/2+n)

fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-5, 5, 500)

for n in range(nmax):
    scale=1.3
    ax.plot(x, energy(n)+abs(psi(n,x))**2 *scale, label="$|\psi_" + str(n) + "(x)|^2$")
    ax.plot(x, ones(size(x))*energy(n), color='0.5')

fudge=2.5
ax.plot(x,potential(x*fudge) / max(potential(x)), label="$V(x)$")

ax.set_xlabel('$x$')
ax.set_xticks([])
ax.set_yticks([])
fig.legend(loc='outside right')

glue("qho-probdens", fig, display=False)
```

(qho-probdens)=
```{glue:figure} qho-probdens
The probability density of the first few states of the quantum harmonic oscillator, vertically offsetted for better visibility.
```

  
Here we see a rather evenly distributed probability density. This is in strong contrast to the classical harmonic oscillator like a swing, where the probability is highest at the extremal turning points where the velocity is lowest. 

As a side remark, we can again construct highly excited quantum states that mimic classical behaviour - but these are complex superpositions of many $\Psi_n$ eigenstates and are called coherent states.

## Number states and number operator 

`[slide]`

Often, the states $|\Psi_n\rangle$ are written as $|n\rangle$, and are called *number states* or Fock states, which live in special Hilbert space called Fock space. They are called number states because the same system can be excited multiple times. We need to know how the ladder operators act on arbitrary number states, we obtain:

$$
\begin{aligned}
a^{\dagger}|n\rangle & =\sqrt{n+1}|n+1\rangle \\
a|n\rangle & =\sqrt{n}|n-1\rangle
\end{aligned}
$$(se-qho-ns1)

Another important operator in Fock space is the number operator:

$$
\begin{aligned}
N & = a^{\dagger} a \\
N|n\rangle & = n|n\rangle \\
\end{aligned}
$$(se-qho-ns2)

Its eigenvalue is simply $n$, the number of excitations.

:::{warning}
The number states are very different to the states $|H\rangle$, $|0\rangle$, $|1\rangle$ etcetera which we discussed in the introduction - there, we always "had" a qubit or quantum state, and the ket vector described the state of the particular degree of freedom.

Number states are different, they describe the excitations of a particular system. They can describe an "empty" system without excitations , the ground state $n=0$, one excitation (like one photon!), two excitations (two photons!) and so on.

If we also want to make clear which particular internal state is meant, we use e.g. $|n_H\rangle$ - this would mean for instance $n$ photons with $H$ polarization. Make it always clear what you mean!
:::

## The need for anharmonicity

`[slide]`

I hope that with the harmonic oscillator we could introduce the basics of quantum mechanics to you. The harmonic oscillator appears everywhere in nature because every potential minimum has a quadratic term in the Taylor expansion. 

However, for making qubits for quantum computers, such harmonic potentials are actually not very useful: 

Assume that we want to use the number states $|0\rangle$ and $|1\rangle$ to encode our qubit. For a useful qubit, we need to make the transition from state 0 to 1 - we now know that this can be done simply with the ladder operators, later we will see how microwave or optical fields often can do the job. 

But, since the spacing between all levels of a harmonic oscillator is equal, we will make the transition from 0 to 1, but immediately also from 1 to 2 and so on - we cannot selectively address transitions.

Therefore, in order to implement a qubit, we actually need to use an anharmonic oscillator as shown here with a cubic term added to the Hamiltonian: 

$$
H=\frac{\hat{p}^2}{2 m}+\frac{1}{2} \omega^2 x^2+\lambda x^4
$$(se-qho-ah1)


```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

hbar=1
m=1
omega=1
nmax = 3

def potential(x):
    return 1/2*m*omega**2*x**2-0.0015*x**4

def energy(n):
    return array([0.5,1.5,2.1])[n]

fig, ax = plt.subplots(figsize=(4,3))
x = linspace(-5, 5, 500)

for n in range(nmax):
    scale=0.5
    ax.plot(x, ones(size(x))*energy(n), color='0.5')
    ax.text(0, 0.2+energy(n), "$E_" + str(n) + "$")
    if n>0:
        ax.arrow(-2,energy(n-1), 0, (energy(n)-energy(n-1)), width=0.1, head_length=0.2, length_includes_head=True, color='r' )
        ax.arrow(-2,energy(n), 0, (energy(n-1)-energy(n)), width=0.1, head_length=0.2, length_includes_head=True, color='r' )

fudge=2.5
ax.plot(x,potential(x*fudge) / max(potential(x)), label="$V(x)$")

ax.set_xlabel('$x$')
# ax.set_xticks([])
# ax.set_yticks([])
fig.legend(loc='outside right')

glue("qho-anharmonic", fig, display=False)
```

(qho-anharmonic)=
```{glue:figure} qho-anharmonic
The first three energies of an anharmonic quantum oscillator - now state-selective transitions are possible. 
```


