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

In this section we introduce a powerful method, perturbation theory, to obtain an approximation to what happens to a quantum system if we add a small change, for instance a perturbation to the potential. This is important because we can only obtain analytical solutions for very simple quantum systems, but we would like to also be able to predict the quantum properties of more complex systems.

## A small perturbation & power series

{{slidetag}}

Let us assume that we have solved the Schrödinger equation for a particular Hamiltonian - as an example we discuss a quantum particle in the infinite square well potential, we call the  original unperturbed Hamiltonian $H_0$. Earlier in this course, we have obtained for this case a set of orthonormal eigenfunctions $\psi_n^{(0)}$ with corresponding energies or eigenvalues $E_n^{(0)}$. Now, we add a small time-indepentend perturbation to the system - for instance a small hump at the middle of the potential as shown in the figure:

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
The infinite square well potential with a hump in the middle.
```

We can write the Hamiltonian as a sum of the unperturbed Hamiltonian one and the perturbation:


$$
H=H_0+\lambda H'
$$(pt-ham)

$H'$ describes the "hump", and $\lambda$ is a real constant which is assumed to be small.

Now we write the eigenfunctions, the wavefunctions $\psi_n$ and their energies $E_n$ as power series in $\lambda$ - If you don't remember these check the [wikipedia page](https://en.wikipedia.org/wiki/Power_series)!

$$
E_n=E_n^{(0)}+\lambda E_n^{(1)}+\lambda^2 E_n^{(2)}+\ldots
$$(ad-pt-1)

$$
\psi_n=\psi_n^{(0)}+\lambda \psi_n^{(1)}+\lambda^2 \psi_n^{(2)}+\ldots
$$(ad-pt-2)

We call $E_n^{(1)}$ the *first-order correction* to the $n$th eigenvalue, and $\psi_n^{(1)}$ the first-order correction to the wavefunction, and so on. Since the perturbation is assumed to be small, the energies and eigenstates should be similar to the unperturbed case, and higher-order correction terms should become small. How do we calculate these corrections?

## First-order perturbation theory: energy

{{slidetag}}

We plug in the power series into the Schrödinger equation and obtain:

$$
\left(H_0+\lambda H'\right) 
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle+\ldots\right)
=
\left(E_n^{(0)}+\lambda E_n^{(1)}+\ldots\right)
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle+\ldots\right)
$$(ad-pt-3)

We now collect terms in $\lambda$ according to the order that we want to calculate and obtain:

For the zeroth order we collect the terms without $\lambda$ and obtain again our unperturbed Schrödinger equation 

$$
H_0|\psi_n^{(0)}\rangle=E_n^{(0)}|\psi_n^{(0)}\rangle
$$(ad-pt-4)

For the first order, we collect terms linear in $\lambda$ and obtain after dividing by $\lambda$:

$$
H_0 |\psi_n^{(1)}\rangle + H'|\psi_n^{(0)}\rangle=E_n^{(0)}|\psi_n^{(1)}\rangle + E_n^{(1)}|\psi_n^{(0)}\rangle
$$(pt-1storderseq)

We multiply this equation from left with $\langle\psi_n^{(0)}|$ and use the fact that we can evaluate eigenvalues also to the left or $\langle\psi_n^{(0)}|H_0=E_n^{(0)}$, then the first terms on the left and right hand side cancel. We obtain:

$$
E_n^{(1)}=\langle\psi_n^{(0)}|H'|\psi_n^{(0)}\rangle
$$(ad-pt-5)

So, the first-order correction to the energy is simply the expectation value of the perturbation Hamiltonian for the unperturbed eigenstate! This is a very important equation in quantum mechanics.

## Normalisation

{{slidetag}}

Now we want to find the first-order correction to the wavefunction, $|\psi_n^{(1)}\rangle$. In quantum mechanics, it is often useful to check and apply normalisation, let's do this! 

Our unperturbed states were normalized so we have $\langle \psi_n^{(0)}|\psi_n^{(0)}\rangle=1$, but it is also reasonable to require also our full solutions of the perturbed system to be normalized, so $\langle \psi_n|\psi_n\rangle=1$. You might object that both cannot exactly be true, but we only want to calculate approximate solutions, so let's continue by imposing normalization up to first order, then it must hold:

$$\left(\langle \psi_n^{(0)}|+\lambda \langle \psi_n^{(1)}|\right)
\left(|\psi_n^{(0)}\rangle+\lambda |\psi_n^{(1)}\rangle\right)=1$$(ad-pt-7a)

By evaluating this we get a second-order term in $\lambda$ which we ignore: 

$$\langle \psi_n^{(0)}|\psi_n^{(0)}\rangle
+\lambda \langle \psi_n^{(0)}|\psi_n^{(1)}\rangle
+\lambda \langle \psi_n^{(1)}|\psi_n^{(0)}\rangle
+\cancel{\lambda^2 \langle \psi_n^{(1)}|\psi_n^{(1)}\rangle}
=1
$$(ad-pt-7b)

The first term is equal to $1$ and after dividing by $\lambda$ we obtain

$$
\langle \psi_n^{(0)}|\psi_n^{(1)}\rangle+
\langle \psi_n^{(1)}|\psi_n^{(0)}\rangle=0
$$(ad-pt-7c)

We can assume that the terms are real since in time-independent quantum mechanics the global phase can be set to 1, therefore this equation means that the zeroth and first order eigenstates are orthogonal: $\langle \psi_n^{(0)}|\psi_n^{(1)}\rangle=0$. Note that this is an unusual way of using normalization and you might say this leads to errors - you are correct, but we are only want to obtain approximate solutions! In the end, success determines if a method is useful or not.

## First-order eigenstates

{{slidetag}}

We now need to play around with our equations to find an expression for $|\psi_n^{(1)}\rangle$, for the first order corrections! We use a trick that is often useful in quantum mechanics: we insert the identity and see what we can do with it.

First we re-arrange our first-order Schrödinger equation (Eq. {eq}`pt-1storderseq`) and obtain: 

$$
\left(H_0-E_n^{(0)}\right)|\psi_n^{(1)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
$$(ad-pt-8)

Since $|\psi_n^{(0)}\rangle$ form a complete basis, we can express $|\psi_n^{(1)}\rangle$ with it:

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}c_m^{(n)}|\psi_m^{(0)}\rangle
$$(ad-pt-9)

We left out $m=n$ due to the normalization result above. Now we insert this into the Schrödinger equation and obtain:

$$
\sum_{m\neq n}
\left(H_0-E_n^{(0)}\right)c_m^{(n)}
|\psi_m^{(0)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
$$(ad-pt-10a)

We can evaluate $H_0$ and obtain

$$
\sum_{m\neq n}
\left(E_m^{(0)}-E_n^{(0)}\right)c_m^{(n)}
|\psi_m^{(0)}\rangle = 
-\left(H'-E_n^{(1)}\right)|\psi_n^{(0)}\rangle
$$(ad-pt-10b)

Finally we multiply from left with $\langle\psi_k^{(0)}|$ and we get

$$
\sum_{m\neq n}
\left(E_m^{(0)}-E_n^{(0)}\right)c_m^{(n)}
\langle\psi_k^{(0)}|\psi_m^{(0)}\rangle = 
-\langle\psi_k^{(0)}|H'|\psi_n^{(0)}\rangle + 
E_n^{(1)} \langle\psi_k^{(0)}|\psi_n^{(0)}\rangle
$$(ad-pt-11)

{{slidetag}}

Let's examine this. For $k = n$, the left hand side is zero and we obtain again the expression for the first-order energy correction.

For $k \neq n$ only the $m=k$ term of the sum is nonzero, and the rightmost term is zero, and we obtain

$$
\left(E_k^{(0)}-E_n^{(0)} \right)c_k^{(n)}=-\langle\psi_k^{(0)}|H'|\psi_n^{(0)}\rangle
$$(ad-pt-12)

or after renaming the index $k$ to $m$, and rearranging

$$
c_m^{(n)}=\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}
$$(ad-pt-13)

With this we obtain the first-order correction to the eigenstate

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}|\psi_m^{(0)}\rangle
$$(ad-pt-14)

Some observations:

* We see that perturbation theory requires potentially many - infinitely manny - unperturbed neigenstates to describe the perturbed system! But we will see that often, only a few states already give a good result.
* The procedure only works if the energy spectrum of the unperturbed system is *nondegenerate*, if the denominator is not $0$ - otherwise the correction diverges which cannot be physical. Later we see that this is indeed not the case, we have to use degenerate perturbation theory.
* From the denominator we see that, if the energies of the eigenstates lie close in energy, the perturbation has a larg effect. In quantum systems, noise can often be seen as a kind of perturbation. Therefore, for qubits, it can be advantageous to use quantum systems with a large energy spacing - the effect of perturbations is smaller than for systems with small energy spacing!


## 1st order perturbation theory: example

{{slidetag}}

<!-- GProb7.1 -->

```{glue:figure} potential-well-hump
A potential with a hump.
```


In physics, the simplest "hump" is often described by a delta function due to its nice algebraic properties. We assume the bump is in the middle of the potential well and $\alpha$ is a constant describing the height of the hump:

$$
H'=\alpha \delta(x-a / 2)
$$(ad-pt-15)

We know from before the wavefunctions for the unperturbed case:

$$\psi_n^{(0)}(x)=\sqrt{\frac{2}{a}} \sin \left(\frac{n \pi}{a} x\right)$$(ad-pt-swup)

Now we first find the first-order corrections to the energies of the eigenstates:

$$
E_n^{(1)}=\left\langle\psi_n^{(0)}\left|H^{\prime}\right| \psi_n^{(0)}\right\rangle=\frac{2}{a} \alpha \int_0^a \sin ^2\left(\frac{n \pi}{a} x\right) \delta\left(x-\frac{a}{2}\right) d x \\
$$(ad-pt-16)

Remember that the Poisson brackets can be taken literally as an integral over all parameters, in this case position. We will continue to use the ket notation although one could also use the real-space wavefunction - since we have explicit expressions for it.

{{slidetag}}

We obtain as the first-order correction to the energy

$$
E_n^{(1)}=\frac{2 \alpha}{a} \sin ^2\left(\frac{n \pi}{a} \frac{a}{2}\right)=\frac{2 \alpha}{a} \sin ^2\left(\frac{n \pi}{2}\right)=\left\{\begin{array}{cc}
0, & \text { if } n \text { is even, } \\
2 \alpha / a, & \text { if } n \text { is odd. }
\end{array}\right\}
$$(ad-pt-17)

This means that if $n$ is even, there is correction needed!. Remember that the wavefunctions for even $n$ have a node in the center - they simply don't *feel* the perturbation in the first-order perturbation theory! The unperturbed wavefunctions are again shown in the Figure.


```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(4,3))
x = linspace(0, 1, 500)
a=1
for n in range(1,6):
    y=sqrt(2/a)*sin(n*pi/a*x) + 3*(n-1) # offset curves
    ax.plot(x, y, label="$\psi_" + str(n) + "^{(0)}(x)$")
ax.set_xlabel('$x/a$')
ax.set_ylabel('$\psi_n^{(0)}(x)$')
ax.set_ylim(-1,15)
ax.set_yticks([0])
fig.legend(loc='outside right')

glue("potential-well-wavefunctions2", fig, display=False)
```

(potential-well-wavefunctions2)=
```{glue:figure} potential-well-wavefunctions2
The first wavefunctions of the unperturbed infinite square well potential. All wavefunctions oscillate around zero, they are shown vertically offsetted for better visibility.
```


For odd $n$, we obtain a slightly higher energy, which can be explained that the wavefunction *feels* the raised potantial in the middle.

{{slidetag}}

Now we want to find explicitly the 1st-order correction to the wavefunction for the ground state with $n=1$. Before, we derived for this the equation:

$$
|\psi_n^{(1)}\rangle=\sum_{m\neq n}\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}|\psi_m^{(0)}\rangle
$$(ad-pt-18)

We need to calculate the numerator and we obtain an integral, evaluation of this is simple because we can use the property of the delta function that it is only nonzero if its argument is zero, and that the integral over the delta function is $1$:

$$
\left\langle\psi_m^{(0)}\left|H^{\prime}\right| \psi_1^{(0)}\right\rangle=\frac{2 \alpha}{a} \int \sin \left(\frac{m \pi}{a} x\right) \delta\left(x-\frac{a}{2}\right) \sin \left(\frac{\pi}{a} x\right) d x
\\
=\frac{2 \alpha}{a} \sin \left(\frac{m \pi}{2}\right) \sin \left(\frac{\pi}{2}\right)=\frac{2 \alpha}{a} \sin \left(\frac{m \pi}{2}\right)
$$(ad-pt-19)

This is nearly the same result as above, it is zero for even $m$, these solutions don't *feel* the perturbation.

We know the denominator from before, here we have renamed the mass of the particle to $m_0$ to avoid confusion:

$$
E_1^{(0)}-E_m^{(0)}=\frac{\pi^2 \hbar^2}{2 m_0 a^2}\left(1-m^2\right)
$$(ad-pt-20)

{{slidetag}}

Now we can combine the results and obtain

$$
\left|\psi_1^{(1)}\right\rangle=
\frac{2 \alpha}{a} \frac{2 m_0 a^2}{\pi^2 \hbar^2}\left[\frac{-1}{1-9} \left|\psi_3^{(0)}\right\rangle+\frac{1}{1-25} \left|\psi_5^{(0)}\right\rangle+\frac{-1}{1-49} \left|\psi_7^{(0)}\right\rangle+\ldots\right]
$$(ad-pt-21)

We see that the contribution of higher states decreases quadratically, so, luckily, we don't have to consider an infinite amount of states! If you remember the shape of the odd wavefunctions, some have a maximum and some a minimum in the center - therefore the alternating sign of the correction terms is not surprising. The result is that the central maximum of the $n=1$ wavefunction gets a small dip in the center where the potential hump is introduced, as shown in the Figure. For the result shown in the Figure, states up to $m=20$ have been taken into account.


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
The unperturbed (blue) $n=1$ wavefunction and the perturbed one, calculated up to $m=20$.
```

<!--G problem 7.1 as exercise.-->

## Higher order corrections

{{slidetag}}

The procedure for the second-order corrections is in principle similar to the first-order ones above, but now we will obtain double sums. 

For instance, the second-order energy correction given by

$$
E_n^{(2)}=\sum_{m \neq n} 
\frac{
\left|\left\langle\psi_m^{(0)}\right| H'\left| \psi_n^{(0)}\right\rangle\right|^2
}{
E_n^{(0)}-E_m^{(0)}
}
$$(ad-pt-22)

We won't discuss this further - luckily, often the first-order corrections are sufficient to understand the effect of perturbations on the behaviour of quantum systems.

The behaviour of quantum systems under perturbations is very important, for instance to determine how small changes affect physical, realistic qubits. As we will see later, it is also crucial to understand coherent control of physical qubits.

In general and for complex potentials and interactions, it is extremely hard to calculate the energies and states of quantum systems. One important goal of quantum research and technology is to develop machines, quantum simulators, that can do this in a short time.
