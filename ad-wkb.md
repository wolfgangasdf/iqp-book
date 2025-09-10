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


# Tunneling and WKB theory

<!-- G9.2 -->
In this section, we show how to calculate quantum tunneling, the passage of particles through a barrier that is not possible classically.

{{slidetag}}

You might see quantum tunneling every day! Many fingerprint sensors are based on *frustrated total internal reflection* of light, or your fingers on the outer side of a glass when seen through water - see [wikipedia](https://en.wikipedia.org/wiki/Total_internal_reflection#Frustrated_total_internal_reflection) for some nice examples.

The same also occurs for quantum wavefunctions also for massive particles - because in the end, Maxwell's equations describing light results in a wave equation as is the Schrödinger equation.

```{seealso}
Further reading: Griffiths Chapter 9
```

## The WKB method

{{slidetag}}

The WKB method named after Wentzel, Kramers and Brillouin is a very useful method to calculate localized (bound) states and tunneling through potential barriers. We want to calculate what happens to a quantum wave incident from the left for the case shown in the figure.

A quantum wave is incident on a potential barrier described by $V(x)$. For an incident quantum wave with energy $E$ and amplitude $A$, we want to calculate the coefficients for the reflected ($B$) and transmitted ($F$) wave.


```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(figsize=(7,3))

ee=5
a=1
x = linspace(-a/2, 1.5*a, 201)
v = piecewise(x, [x < 0, x >= 0, x>a], [0, lambda x: 1.5*ee+(sin(10*pi*x/a)+sin(19*pi*x/a))+3*x, 0])
ax.plot(x, v, color='red')
ax.plot(x,x*0+ee,'--',color="0.5")
ax.set_xlabel('$x$')
ax.set_ylabel('$V(x)$')
ax.set_xticks([0,a])
ax.set_xticklabels(["0","a"])
ax.text(-0.2,ee+0.5,"$E$",fontsize=15)
ax.arrow(-0.3,3,0.2,0,width=0.2, head_length=0.05, color='black')
ax.text(-0.4,2.6,"$A$",fontsize=15)
ax.arrow(-0.06,1.5,-0.2,0,width=0.2, head_length=0.05, color='black')
ax.text(-0.4,1.1,"$B$",fontsize=15)
ax.arrow(a+0.1,3,0.2,0,width=0.2, head_length=0.05, color='black')
ax.text(a+0.4,2.6,"$F$",fontsize=15)
ax.set_yticks([])

glue("wkb-potential", fig, display=False)
```

(wkb-potential)=
```{glue:figure} wkb-potential
Quantum tunneling.
```

{{slidetag}}

Usually, the Schrödinger equation is written in the following form: 

$$\frac{d^2 \psi}{d x^2}=-\frac{p^2}{\hbar^2} \psi$$(ad-wkb-1)

where

$$p(x) \equiv \sqrt{2 m[E-V(x)]}$$(ad-wkb-2)

If $E\gt V(x)$, $p$ is real and we call this the classical region, in our case for $x<0$ and $x>a$. $p$ is in this case the classical momentum for a particle with energy $E$ in the potential $V(x)$.

We can express the complex wavefunction $\psi$ as $\psi(x)=A(x) e^{i \phi(x)}$ where $A(x)$ and $\phi(x)$ are real functions. We plug this into the Schrödinger equation and solve it (see Griffiths 9.1 for details). If we now make the approximation that the amplitude $A$ of $\psi$ changes slowly (or more precisely that $A''/A$ is very small), we obtain with $C$ some real constant:

$$\psi(x) \approx \frac{C}{\sqrt{p(x)}} e^{ \pm \frac{i}{\hbar} \int p(x) d x}$$(ad-wkb-3)

Both positive and negative exponents are solutions, and we have written it with an indefinite integral for now. The probability amplitude is 

$$|\psi(x)|^2 \approx \frac{|C|^2}{p(x)}$$(ad-wkb-4)

Which makes sense - we see that the probability of finding a particle is inversely proportional to its momentum, this makes sense also classically.

The WKB method of obtaining wavefunctions is very powerful to calculate localized bound states or if potentials change slowly - see Griffiths for examples.

## Tunneling

{{slidetag}}

Now we return to our problem in {numref}`wkb-potential`. We assume that the potential is slowly varying only for $0\leq x \leq a$, and we treat the hard steps at $x=0$ and $x=a$ by discussing the 3 cases separately. To the left of the barrier ($x<0$) everything is fine and we can write the wavefunction as a right and left propagating wave:

$$\psi(x)=A e^{i k x}+B e^{-i k x}$$(ad-wkb-5)

And on the right we have only a right-propagating wave:

$$\psi(x)=F e^{i k x}$$(ad-wkb-6)

In the tunneling region which is classically forbidden for the particle, $p(x)$ is imaginary and therefore the wavefunction is real! It is useful to write the WKB expression slightly differently:

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{ \pm \frac{1}{\hbar} \int|p(x)| d x}$$(ad-wkb-7)

Taking the modulus of $p$ is allowed since only $p^2$ appears in the Schrödinger equation. This describes an exponentially increasing or decreasing function, which in strong contrast to the plane wave is non-oscillatory!

{{slidetag}}

In the tunneling region we therefore have in the barrier the two possible contributions:

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}+\frac{D}{\sqrt{|p(x)|}} e^{-\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}$$(ad-wkb-8)

where the $C$ constant is of a term that is exponentially increasing, and $D$ the constant for an exponentially decreasing term.

By enforcing continuity of the wavefunction, we can calculate from this the tunneling probability:

$$T=\frac{|F|^2}{|A|^2} = e^{-2\gamma}\quad \textrm{with}\quad\gamma \equiv \frac{1}{\hbar} \int_0^a|p(x)| d x
$$(ad-wkb-9)

The wave function looks like this:


```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(7,3))
ee=5
a=1
x = linspace(-a/2, 1.5*a, 601)
v = piecewise(x, [x < 0, x >= 0, x>a], [0, lambda x: 1.5*ee+(sin(10*pi*x/a)+sin(19*pi*x/a))+3*x, 0])
ax.plot(x, v, color='red')
psi= 15*piecewise(x, [x < 0, x >= 0, x>a], [lambda x: sin(20*pi*x+pi/2), lambda x: exp(-x), lambda x: exp(-a)*sin(20*ee*x++pi/2)])
ax.plot(x, psi, color='blue')
ax.set_xlabel('$x$')
ax.set_ylabel('$\psi(x),V(x)$')
ax.set_xticks([0,a])
ax.set_xticklabels(["0","a"])
ax.plot(x,x*0+15,'--',color="0.5")
ax.plot(x,x*0+15*exp(-a),'--',color="0.5")
ax.set_yticks([0,15*exp(-a),15*a])
ax.set_yticklabels(["0","F", "A"])

glue("wkb-wave", fig, display=False)
```

(wkb-wave)=
```{glue:figure} wkb-wave
Quantitative plot of the wave function for the tunneling problem.
```

We see that, in the classically forbidden region, the probability density is exponentially decaying, but also behind the barrier is a nonzero probability to find our quantum particle! This is quantum tunneling. If you calculate explicit tunneling probabilities, you will find that only for very thin barriers, on the order of the de Broglie wavelength, allow for significant tunneling.

:::{admonition} Quantum tunneling and fusion reactions in stars
:class: dropdown

In classical physics, two positively charged nuclei repel each other due to the Coulomb force. For example, in the Sun, protons would need kinetic energies on the order of hundreds of keV to overcome this repulsion. However, the typical thermal energy of protons in the Sun’s core (at $T \sim 1.5 \times 10^7\ \text{K}$) is only about 1 keV — far too small to classically overcome the barrier. If fusion were purely classical, nuclear reactions in stars would not occur at observable rates.

However, quantum tunneling allows for the nuclei to cross the Coulomb barrier, even if its energy is below the barrier height. Despite the tiny tunneling probability, the huge number of protons in a star and the long timescales involved make nuclear fusion possible.

Thus, *the Sun shines because of quantum tunneling* — it allows nuclear fusion to proceed at stellar core temperatures, powering stars for billions of years.

:::