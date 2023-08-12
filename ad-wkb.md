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


## Tunneling and WKB theory

<!-- G9.2 -->

`[slide]`

You might see quantum tunnelling every day! Many fingerprint sensors are based on *frustrated total internal reflection* of light, or your fingers on the outer side of a glass when seen through water - see [wikipedia](https://en.wikipedia.org/wiki/Total_internal_reflection#Frustrated_total_internal_reflection) for some nice examples.

The same also occurs for quantum wavefunctions also for massive particles - because in the end, Maxwell's equations describing light results in a wave equation as is the Schrödinger equation.

### The WKB method

The WKB method named after Wentzel, Kramers and Brillouin is a very useful method to calculate localized (bound) states and tunneling through potential barriers. We want to calculate what happens to a quantum wave incident from the left for this case:

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
The setup for studying quantum tunneling. An incident quantum wave with energy $E$ and amplitude $A$ is reflected ($B$) and transmitted ($F$) by the potential $V(x)$.
```

`[slide]`

Usually, the Schrödinger is written in a different form: 

$$\frac{d^2 \psi}{d x^2}=-\frac{p^2}{\hbar^2} \psi$$

where

$$p(x) \equiv \sqrt{2 m[E-V(x)]}$$

If $E\gt V(x)$, $p$ is real and we call this the classical region, in our case for $x<0$ and $x>a$. is the classical momentum for a particle with energy $E$ in the potential $V(x)$.

We can express the complex function $psi$ as $\psi(x)=A(x) e^{i \phi(x)}$ where $A(x)$ and $\phi(x)$ are real functions. We plug this into the Schrödinger equation and solve it (see Griffith 9.1 for details). If we now make the approximation that the amplitude of $\psi$ changes slowly, we obtain with $C$ some real constant:

$$\psi(x) \approx \frac{C}{\sqrt{p(x)}} e^{ \pm \frac{i}{\hbar} \int p(x) d x}$$

The probability amplitude is 

$$|\psi(x)|^2 \approx \frac{|C|^2}{p(x)}$$

Which makes sense - we see that the probability of finding a particle is inversely proportional to its momentum, this makes sense also classically.

The WKB method of obtaining wavefunctions is very powerful to calculate localized bound states or if potentials change slowly - see Griffith for examples.

### Tunneling

`[slide]`

Now we return to our problem in {numref}`wkb-potential`. To the left of the barrier ($x<0$) everything is fine and we can write the wavefunction as a right and left propagating wave:

$$\psi(x)=A e^{i k x}+B e^{-i k x}$$

And on the right we have only a right-propagating wave:

$$\psi(x)=F e^{i k x}$$

In the tunneling region which is classically forbidden for the particle, $p(x)$ is imaginary and it is useful to write 

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{ \pm \frac{1}{\hbar} \int|p(x)| d x}$$

Note that only $p^2$ appears in the Schrödinger equation, and you can test that taking the modulus of $p$ works. This describes an exxponentially increasing or decreasing function, which is non-oscillatory!

In the tunneling region we therefore have

$$\psi(x) \approx \frac{C}{\sqrt{|p(x)|}} e^{\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}+\frac{D}{\sqrt{|p(x)|}} e^{-\frac{1}{\hbar} \int_0^x\left|p\left(x^{\prime}\right)\right| d x^{\prime}}$$

By enforcing continuity of the wavefunction, we can calculate from this the tunneling probability:

$$T=\frac{|F|^2}{|A|^2} = e^{-2\gamma}\quad \textrm{with}\quad\gamma \equiv \frac{1}{\hbar} \int_0^a|p(x)| d x
$$

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
Quantitative plot of the wave function for the tunneling problem, in the classically forbidden region it is exponentially decaying.
```
<!-- could calculate correctly, exercise? -->
