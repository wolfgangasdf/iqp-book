---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---


# Tunneling and WKB theory

<!-- G9.2 -->
In this section, we show how to calculate quantum tunneling, the passage of particles through a barrier that is not possible classically.

:::{slidetag}
:::


You might see quantum tunneling every day! Many fingerprint sensors are based on *frustrated total internal reflection* of light, or your fingers on the outer side of a glass when seen through water - see [wikipedia](https://en.wikipedia.org/wiki/Total_internal_reflection#Frustrated_total_internal_reflection) for some nice examples.

The same also occurs for quantum wavefunctions also for massive particles - because in the end, Maxwell's equations describing light results in a wave equation as is the Schrödinger equation.

```{seealso}
Further reading: Griffiths Chapter 9
```

## The WKB method

:::{slidetag}
:::


The WKB method named after Wentzel, Kramers and Brillouin is a very useful method to calculate localized (bound) states and tunneling through potential barriers. We want to calculate what happens to a quantum wave incident from the left for the case shown in the figure, where the potential barrier is described by $V(x)$.

For a particle with energy $E$, in a region of constant potential $V$, if $E>V$, we know already that solutions to the Schrödinger equation are plane waves $\psi(x)=C e^{\pm i k x}$, the plus sign is for a right, the minus sign for a left travelling wave, and its amplitude is $C$. Now, to find out what happens at the potential barrier, for an incident particle with energy $E$ and amplitude $A$ from the left, we need to determine the coefficients for the reflected ($B$) and transmitted ($F$) waves.


```{code-cell} ipython3
:tags: [remove-input]
:label: wkb-potential
:caption: Quantum tunneling.

from matplotlib import pyplot as plt
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
ax.set_yticks([]);
```

:::{slidetag}
:::

We can write the Schrödinger equation in this form

$$\frac{d^2 \psi}{d x^2}=-\frac{p^2}{\hbar^2} \psi,$$(ad-wkb-1)

where

$$p(x) \equiv \sqrt{2 m[E-V(x)]}.$$(ad-wkb-2)

If $E\gt V(x)$, $p$ is real and we call this the classical region, in our case for $x<0$ and $x>a$. $p$ is in this case the classical momentum for a particle with energy $E$ in the potential $V(x)$.

No we can write the complex wavefunction as $\psi$ as 

$$\psi(x)=A(x) e^{i \phi(x)}$$ 

where $A(x)$ and $\phi(x)$ are real functions. We plug this into the Schrödinger equation and solve it (see Griffiths 9.1 for details). If we now make the approximation that the amplitude $A$ of $\psi$ changes slowly, we obtain with $C$ some real constant:

$$
\phi(x)\approx\frac{1}{\hbar}\int p(x) d x\quad\text{or}\quad
\psi(x) \approx \frac{C}{\sqrt{p(x)}} e^{ \pm \frac{i}{\hbar} \int p(x) d x}
$$(ad-wkb-3)

This WKB formula is very useful - we can calculate wavefunctions by solving an integral which depends on the potential, instead of solving a differential equation, the Schrödinger equation. 

Both positive and negative exponents are solutions, and we have written it with an indefinite integral, since constants can be put into the coefficient $C$.


It is interesting to calculate the probability amplitude, which is 

$$|\psi(x)|^2 \approx \frac{|C|^2}{p(x)}$$(ad-wkb-4)

This makes sense - we see that the probability of finding a particle is inversely proportional to its momentum, this makes sense also classically.

The WKB method of obtaining wavefunctions is very powerful to calculate localized bound states or if potentials change slowly - see Griffiths for examples.

## Tunneling

:::{slidetag}
:::


Now we return to our problem in {numref}`wkb-potential`. We assume that the potential is slowly varying only for $0\leq x \leq a$, and we treat the hard steps at $x=0$ and $x=a$ by discussing the 3 cases separately. To the left of the barrier ($x<0$) everything is fine and we can write the wavefunction as a right and left propagating wave:

$$\psi(x)=A e^{i k x}+B e^{-i k x}$$(ad-wkb-5)

And on the right we have only a right-propagating wave:

$$\psi(x)=F e^{i k x}$$(ad-wkb-6)

In the tunneling region which is classically forbidden for the particle, $p(x)$ is imaginary and therefore the wavefunction is real! It is useful to write the WKB expression slightly differently:

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{ \pm \frac{1}{\hbar} \int|p(x)| d x}$$(ad-wkb-7)

Taking the modulus of $p$ is allowed since only $p^2$ appears in the Schrödinger equation. This describes an exponentially increasing or decreasing function, which in strong contrast to the plane wave is non-oscillatory!

:::{slidetag}
:::


In the tunneling region we therefore have in the barrier the two possible contributions:

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}+\frac{D}{\sqrt{|p(x)|}} e^{-\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}$$(ad-wkb-8)

where the $C$ constant is of a term that is exponentially increasing, and $D$ the constant for an exponentially decreasing term.

By enforcing continuity of the wavefunction, we can calculate from this the tunneling probability:

$$T=\frac{|F|^2}{|A|^2} = e^{-2\gamma}\quad \textrm{with}\quad\gamma \equiv \frac{1}{\hbar} \int_0^a|p(x)| d x
$$(ad-wkb-9)

The wave function looks like this:


```{code-cell} ipython3
:tags: [remove-input]
:label: wkb-wave
:caption: Quantitative plot of the wave function for the tunneling problem.

from matplotlib import pyplot as plt
from numpy import *
fig, ax = plt.subplots(figsize=(7,3))
ee=5
a=1
x = linspace(-a/2, 1.5*a, 601)
v = piecewise(x, [x < 0, x >= 0, x>a], [0, lambda x: 1.5*ee+(sin(10*pi*x/a)+sin(19*pi*x/a))+3*x, 0])
ax.plot(x, v, color='red')
psi= 15*piecewise(x, [x < 0, x >= 0, x>a], [lambda x: sin(20*pi*x+pi/2), lambda x: exp(-x), lambda x: exp(-a)*sin(20*pi*x+pi/2)])
ax.plot(x, psi, color='blue')
ax.set_xlabel('$x$')
ax.set_ylabel('$\psi(x),V(x)$')
ax.set_xticks([0,a])
ax.set_xticklabels(["0","a"])
ax.plot(x,x*0+15,'--',color="0.5")
ax.plot(x,x*0+15*exp(-a),'--',color="0.5")
ax.set_yticks([0,15*exp(-a),15*a])
ax.set_yticklabels(["0","F", "A"]);
```

We see that, in the classically forbidden region, the probability density is exponentially decaying, but also behind the barrier is a nonzero probability to find our quantum particle! This is quantum tunneling. If you calculate explicit tunneling probabilities, you will find that only for very thin barriers, on the order of the de Broglie wavelength, allow for significant tunneling.

:::{note} Quantum tunneling and fusion reactions in stars
:class: dropdown

In classical physics, two positively charged nuclei repel each other due to the Coulomb force. For example, in the Sun, protons would need kinetic energies on the order of hundreds of keV to overcome this repulsion. However, the typical thermal energy of protons in the Sun’s core (at $T \sim 1.5 \times 10^7\ \text{K}$) is only about 1 keV — far too small to classically overcome the barrier. If fusion were purely classical, nuclear reactions in stars would not occur at observable rates.

However, quantum tunneling allows for the nuclei to cross the Coulomb barrier, even if its energy is below the barrier height. Despite the tiny tunneling probability, the huge number of protons in a star and the long timescales involved make nuclear fusion possible.

Thus, *the Sun shines because of quantum tunneling* — it allows nuclear fusion to proceed at stellar core temperatures, powering stars for billions of years.
:::

## Localized states

:::{slidetag}
:::

<!-- G example 9.1 -->
With the WKB method, we can also derive approximate solutions for the quantum wavefunction and allowed energies in potential wells, like that shown in the figure:


```{code-cell} ipython3
:tags: [remove-input]
:label: wkb-potentialwell
:caption: WKB potential well.

from matplotlib import pyplot as plt
from numpy import *
fig, ax = plt.subplots(figsize=(7,3))
ee=5
a=1
x = linspace(-a/2, 1.5*a, 201)
v = piecewise(x, [x < 0, x >= 0, x>a], [100, lambda x: -1.5*ee+(sin(10*pi*x/a)+sin(19*pi*x/a))+3*x, 100])
ax.plot(x, v, color='red')
ax.set_xlabel('$x$')
ax.set_ylabel('$V(x)$')
ax.set_xticks([0,a])
ax.set_xticklabels(["0","a"])
ax.set_yticks([]);
ax.set_ylim([-10,50])
```

:::{slidetag}
:::

To start, we write the general wavefunction solution as the superposition of the two WKB solutions

$$\psi(x)\approx \frac{1}{\sqrt{p(x)}}\left( C_+ e^{i \phi(x)} + C_- e^{-i \phi(x)}\right)$$ 

which can also be written as

$$\psi(x)\approx \frac{1}{\sqrt{p(x)}}\left( C_1 \sin\phi(x) + C_2 \cos\phi(x)\right)$$ 

Now we assume that the potential is infinite outside of $x=0\dots a$. Therefore, the wavefunction must vanish at $x=0$, from which we derive that $C_2=0$, because it also must vanish at $x=a$, we obtain $\phi(a)=n\pi$ with $n=1,2,3,...$, or

$$\int_0^a p(x) dx = n \pi \hbar$$

This formula gives us the quantization condition and the allowed energies, in WKB approximation! 

For instance, for the 1D potential well with a flat bottom ($V(x)=0$), we have $p(x)=\sqrt{2mE}$ which is constant. With this and the quantization condition we obtain

$$E_n=\frac{n^2\pi^2\hbar^2}{2m a^2},$$

which is the exact result that we had obtained before!

