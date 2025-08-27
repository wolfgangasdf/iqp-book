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

# Indinstinguishable particles

In this section, we study an in particular fascinating consequence of quantum mechanics - the concept of indistinguishable particles. We will see that for such particles, if we calculate what happens if we swap their positions, only two classes of particles are possible - on the one hand particles which like to huddle up, called bosons, and on the other hand particles which prefer to stay apart, fermions.


## Bosons and Fermions

{{slidetag}}

<!-- [G5.1.1 is partially conceptually wrong and not very rigorous, use P10.1] -->

We have discussed different degrees of freedom of fundamental quantum particles, like mass, frequency, time of arrival, spatial wavefunction; and just before we learned about the spin. 

Let us discuss now two particles where all these degrees of freedom are summarized by the subscript $a$ and $b$ for particles a and b. We assume that they are noninteracting so the joint wavefunction is again described by $\psi\left(x_1,x_2\right)=\psi_a\left(x_1\right)\psi_b\left(x_2\right)$.

Note that the wavefunction with subscript $a$ and $b$ also describes the position of the particles, in the figure named $x_a$ and $x_b$. the variables $x_1$ and $x_2$ indicate for which positions we *evaluate* the wavefunction. You can probably better think of this as a *two-point wavefunction* which happens to contain two particles. The figure also shows this two-point wavefunction $\psi(x_1,x_2)$ - to visualize this, we need to use a 2D plot.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(1,2,figsize=(8,3))
x = linspace(0, 10, 101)
xa=2.5; xb=7.5
psia=exp(-power(x-xa,2))
psib=exp(-power(x-xb,2))
ax[0].plot(x, psia, color='tab:blue', label=r"$\psi_a(x)$")
ax[0].plot(x, psib, color='tab:orange', label=r"$\psi_b(x)$")
ax[0].set_xticks([xa, xb])
ax[0].set_xticklabels([r"$x_a$", r"$x_b$"])
ax[0].set_xlabel('$x$')
ax[0].set_ylabel(r'$\psi_{a,b}(x)$')
ax[0].legend()
X, Y = meshgrid(x, x)
psiab=exp(-power(X-xa,2))*exp(-power(Y-xb,2))
cp = ax[1].contourf(X, Y, psiab)
cb=fig.colorbar(cp)
cb.set_ticks([])
ax[1].set_xticks([xa, xb])
ax[1].set_xticklabels([r"$x_a$", r"$x_b$"])
ax[1].set_yticks([xa, xb])
ax[1].set_yticklabels([r"$x_a$", r"$x_b$"])
ax[1].set_xlabel('$x_1$')
ax[1].set_ylabel('$x_2$')
ax[1].text(5,5,r"$\psi(x_1,x_2)$", color='w')

glue("ip-two", fig, display=False)
```

(ip-two)=
```{glue:figure} ip-two
Left: the wavefunctions of two indistinguishable particles at two different positions. Right: the joint wavefunction $\psi\left(x_1,x_2\right)=\psi_a\left(x_1\right)\psi_b\left(x_2\right)$.
```

Now, the probability of finding particle a in the volume element $dx_1$ and particle b in $dx_2$ is given by $|\psi(x_1,x_2)|^2 dx_1 dx_2$.

We now discuss *identical particles*, particles which are equal in all degrees of freedom. Often it is useful to discuss two particles which are identical except for their position - the english language has no precise term for this case, but the Dutch language has: "eendere deeltjes". 

For such identical particles at different positions, the wave function therefore must give identical properties for each particle. For instance, the probability of finding particle a at $x_1$ and b at $x_2$ must be equal to the probability of finding particle a at $x_2$ and b at $x_1$:

$$\left|\psi\left(x_1,x_2\right)\right|^2=\left|\psi\left(x_2,x_1\right)\right|^2$$(tp-i-1)

This implies that the two wavefunctions on the LHS and RHS differ mostly by a phase factor and so 

$$\psi\left(x_1,x_2\right)=e^{i\phi}\psi\left(x_2,x_1\right)$$

Now, let us do this again, and we obtain 

$$\psi\left(x_1,x_2\right)=e^{i\phi}e^{i\phi}\psi\left(x_1,x_2\right)$$

This implies that $e^{i\phi}$ must equal to $+1$ or $-1$.
This means that 

$$\begin{align}
\psi\left(x_1,x_2\right)&=+\psi\left(x_2,x_1\right)\quad\text{or}\\
\psi\left(x_1,x_2\right)&=-\psi\left(x_2,x_1\right)
\end{align}
$$(tp-i-2)

Where we call the first case a *symmetric* wavefunction under particle exchange, the second case an *antisymmetric* wavefunction under particle exchange.

This classifies the quantum behaviour of particles in a very fundamental way - particles with symmetric wavefunctions under particle exchange are called **bosons**, and with antisymmetric wavefunctions are **fermions**. From before, you might already know that bosons are also all particles with integer spin, and fermions with half-integer spin. This is a very important connection, the so-called *spin-statistics theorem* – but it can only be proven in relativistic quantum mechanics. One can try simpler explanations – you can have a read through the "suggestive bogus argument" on [wikipedia](https://en.wikipedia.org/wiki/Spin%E2%80%93statistics_theorem#Suggestive_bogus_argument).

:::{admonition} Anyons and Topological Quantum Computing
:class: dropdown

So far we have discussed indistinguishable particles in 3D, where exchange symmetry allows only two possibilities. However, in 2D systems such as those that appear in the quantum hall effect, the situation is richer. When two particles are exchanged, the wavefunction is not restricted to pick up only a phase of $\pm 1$. Instead, it can acquire any phase $e^{i\theta}$, or even undergo a more general unitary transformation. Such quasiparticles are called **anyons**.

In a special class of anyons which are called non-Abelian anyons, the order in which exchanges (called *braids*) are performed matters - giving rise to a kind of “quantum memory” stored in the system’s topology. This is precisely the principle behind **topological quantum computing**. Since the information stored depends only on the *topology* of the braids and not on microscopic details, it is inherently protected from many sources of noise and decoherence. 

```{figure} figures/two-particles/anyons.png
---
name: anyon-braiding
---
Picture of anyon braiding, credits to [Hormozi, L.](https://repository.lib.fsu.edu/islandora/object/fsu%3A182026).
```

In short, the same exchange symmetry principles we saw for bosons and fermions in 3D extend in 2D to anyons, and these exotic particles open a potential route to building fault-tolerant quantum computers. However, it is important to note that non-Abelian anyons have not yet been conclusively realized in hardware, and remain an active area of research.
:::

## The Pauli exclusion principle 

{{slidetag}}

<!-- [part from G5.1.1, part from P10.2 but all very unclear, also wikipedia not much better. This is crap!] -->

Let us now go back and construct from scratch two-particle wavefunctions that are either symmetric and anti-symmetric under particle exchange, indicated by the $\pm$ subscript:

$$\psi_\pm\left(x_1,x_2\right)=A\left[\psi_a\left(x_1\right)\psi_b\left(x_2\right)\pm\psi_b\left(x_1\right)\psi_a\left(x_2\right)\right]$$(tp-p-1)

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
import matplotlib as mpl
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(1,2,figsize=(8,3))
x = linspace(0, 10, 101)
xa=2.5; xb=7.5
X, Y = meshgrid(x, x)
psip=exp(-power(X-xa,2))*exp(-power(Y-xb,2)) + exp(-power(X-xb,2))*exp(-power(Y-xa,2))
cp = ax[0].contourf(X, Y, psip, cmap=mpl.colormaps["PiYG"], levels=linspace(-1, 1, 20))
cb=fig.colorbar(cp)
cb.set_ticks([-1,0,1])
ax[0].text(5,5,r"$\psi_+(x_1,x_2)$", color='k')
psim=exp(-power(X-xa,2))*exp(-power(Y-xb,2)) - exp(-power(X-xb,2))*exp(-power(Y-xa,2))
cp = ax[1].contourf(X, Y, psim, cmap=mpl.colormaps["PiYG"], levels=linspace(-1, 1, 20))
cb=fig.colorbar(cp)
cb.set_ticks([-1,0,1])
ax[1].text(5,5,r"$\psi_-(x_1,x_2)$", color='k')
for i in [0,1]:
    ax[i].set_xticks([xa, xb])
    ax[i].set_xticklabels([r"$x_a$", r"$x_b$"])
    ax[i].set_yticks([xa, xb])
    ax[i].set_yticklabels([r"$x_a$", r"$x_b$"])
    ax[i].set_xlabel('$x_1$')
    ax[i].set_ylabel('$x_2$')

glue("ip-pm", fig, display=False)
```

(ip-pm)=
```{glue:figure} ip-pm
The symmetric and antisymmetric wavefunctions.
```

From the plots in the figure you can easily check that indeed they behave as intended under particle exchange:

$$\psi_\pm\left(x_1,x_2\right)=\pm\psi_\pm\left(x_2,x_1\right)$$(tp-p-2)

And you might note that these states are quantum entangled, but this is not relevant here.

This is actually a very useful procedure of symmetrization (+) or anti-symmetrization (-) that will come back often in quantum mechanics. 

From this seemingly trivial superposition we can now test what happens if the particles are not only indistinguishable, but also at the same position, meaning that $\psi_a=\psi_b$. For the symmetric bosonic state $\psi_+$ nothing special happens so we focus on the anti-symmetric fermionic state:

$$\psi_-\left(x_1,x_2\right)=A\left[\psi_a\left(x_1\right)\psi_a\left(x_2\right)\ -\ \psi_a\left(x_1\right)\psi_a\left(x_2\right)\right]=0$$(tp-p-3)

This is not normalizable and therefore does not make sense - no two antisymmetric particles can be in the same state! “State” now means really everything, same spin, energy, etcetera - and position!

This is the famous **Pauli exclusion principle** for fermions – no two fermions can be in the same state. Amongst other things, this makes electrons in higher atomic levels stable and thus makes matter “hard” – in combination with Coulomb repulsion. 

<!-- [exercises: G5.4,5] -->

## Bosons bunch

{{slidetag}}

Now we ask the question, has indistinguishability also an effect for bosons? We calculate the probability for finding both particles at the same location, for the non-entangled state of two distinguishable particles

$$\Psi\left(x_{1},x_1\right)=\psi_a\left(x_1)\ \psi_b(x_1\right)$$(tp-b-1)

and for the symmetrized entangled state, where we now use $A=1/\sqrt{2}$ for proper normalization:

$$\begin{align*}\psi_+\left(x_1,x_1\right)&=\frac{1}{\sqrt2}\left[\psi_a\left(x_1\right)\psi_b\left(x_1\right)\ +\ \psi_a\left(x_1\right)\psi_b\left(x_1\right)\right]\\&=\sqrt2\ \psi_a\left(x_1\right)\psi_b\left(x_1\right)\end{align*}$$(tp-b-2)

The latter has a factor $\sqrt{2}$ which becomes 2 in probability! Apparently, the chance of finding both particles at the same position is twice as high for indistinguishable particles compared to distinguishable particles! 

All this might seem like magic because we have started with a different state – but in fact the state space for identical particles must be either in the symmetric or antisymmetric state – one can call this the symmetrization postulate or theorem.

Another way of looking at this is to consider the statistics of measuring two particles with internal states $+$ and $-$ and collecting statistics how often a particular state combination is measured. We assume the particles are interacting with an environment and that all possible two-particle states have equal probability.

For two distinguishable particles $a$ and $b$ we can discriminate the four states $\left|+_a+_b\right\rangle$, $\left|+_a-_b\right\rangle$, $\left|-_a+_b\right\rangle$, $\left|-_a-_b\right\rangle$. From measurements we therefore obtain that the probability of obtaining both particles in the $+$ state is $1/4$, also $1/4$ for both in the $-$ state, and a probability of $1/2$ for obtaining one particle in the $+$ state and the other in the $-$ state.

Now we discuss indistinguishable, where we now need to discriminate bosons and fermions. If the particles are indistinguishable bosons, the two-particle system only has 3 states $\left|++\right\rangle$, $\left|--\right\rangle$, and $\left|+-\right\rangle$ - because the latter is the same as $\left|-+\right\rangle$. We therefore measure these 3 different possibilities, twice $+$, twice $-$, and one $+$ and one $-$, with equal probability of $1/3$.

Finally, if the particles are indistinguishable fermions, no two particles can be in the same state and therefore we only can measure $+$ for one particle and $-$ for the other - with unity probability.

<!-- [exercise: QuantumNotes.pdf 7.2.2]
see also Jos Thijssen - LECTURE NOTES STATISTICAL PHYSICS TN2624.pdf but too hard -->

## The exchange force
<!-- G5.1.2 -->
{{slidetag}}

Intuitively, if we trust in the Pauli exclusion principle, at least fermions must feel a "force" if they get closer. To investigate this, we calculate the expectation value of the squared distance between the particles:

$$\left\langle\left(x_1-x_2\right)^2\right\rangle=\left\langle x_1^2\right\rangle+\left\langle x_2^2\right\rangle-2\left\langle x_1 x_2\right\rangle$$(tp-ef-1)

Note, we often use the squared distance and not the modulus, because the latter is less nice mathematically.

We calculate this expectation value first for two distinguishable particles

$$\Psi\left(x_{1},x_2\right)=\psi_a\left(x_1)\ \psi_b(x_2\right)$$(tp-ef-2)

We can work out the following identities:

$$
\left\langle x_1^2\right\rangle = \left\langle x^2\right\rangle_a,\quad 
\left\langle x_2^2\right\rangle = \left\langle x^2\right\rangle_b,\quad 
\left\langle x_1 x_2\right\rangle = 
\left\langle x\right\rangle_a
\left\langle x\right\rangle_b
$$(tp-d-id)

We obtain:

$$\left\langle\left(x_1-x_2\right)^2\right\rangle=\left\langle x^2\right\rangle_a+\left\langle x^2\right\rangle_b-2\langle x\rangle_a\langle x\rangle_b$$(tp-ef-3)

Instead, if we calculate it for the either bosonic or fermionic **indistinguishable** particle wavefunction

$$\psi_\pm\left(x_1,x_2\right)=A\left[\psi_a\left(x_1\right)\psi_b\left(x_2\right)\pm\psi_b\left(x_1\right)\psi_a\left(x_2\right)\right]$$(tp-ef-4)

We first can calculate the identities

$$
\left\langle x_1^2\right\rangle=
\left\langle x_2^2\right\rangle=
\frac{1}{2}\left(\left\langle x^2\right\rangle_a+\left\langle x^2\right\rangle_b\right)
,\quad
\left\langle x_1 x_2\right\rangle=
\langle x\rangle_a\langle x\rangle_b \pm \left|\langle x\rangle_{a b}\right|^2
$$(tp-id-id)

and with the wave function overlap between the particles given by

$$\langle x\rangle_{a b} = 
\int x\,\psi_a\left(x\right)^* \psi_b\left(x\right) dx$$(tp-ef-6)

we obtain

$$\left\langle\left(x_1-x_2\right)^2\right\rangle_{ \pm}=\left\langle x^2\right\rangle_a+\left\langle x^2\right\rangle_b-2\langle x\rangle_a\langle x\rangle_b \mp 2\left|\langle x\rangle_{a b}\right|^2$$(tp-ef-5)


We observe:
* If the wavefunctions don't overlap spatially, $\langle x\rangle_{a b}=0$ and it doesn't matter if the particles are bosons, fermions, or if we have (anti) symmetrizised their wavefunctions or not.
* If the wavefunctions do overlap, then bosons are pulled together, and fermions pushed apart. We didn't use a potential for this, so it is not a real force - it is the consequence of the symmetrization requirement - nevertheless we call the virtual force the **exchange force**.
