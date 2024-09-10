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

# A free quantum particle

In this section, we introduce the concept of a wave and a wave function for particles, derive a differential equation describing the dynamics of such waves, and investigate how such wavefunctions should look alike if they should describe particles.

## De Broglie & Heisenberg

`[slide]`

<!-- Ph 1.2.  -->
An important step towards a quantum mechanical description of massive particles was done by Louis de Broglie in 1923. He proposed that a fundamental or composite particle with momentum p also has the properties of a quantum wave (like light) with wavelength $\lambda=\frac{h}{p}$, now called the de Broglie wavelength. 

<!-- Ph 2.2.  -->
With this as a starting point, we can already propose a wave equation for a freely moving particle if its speed is non-relativistic. We assume that the particle is moving at a velocity $v\ =\ p/m$ in the $x$ direction with mass $m$, momentum $p$ and energy $E=p^2/2m$. 

With this we can already describe the Heisenberg uncertainty principle:

The de Broglie wave can also be described with wavenumber $k=\ \frac{2\pi}{\lambda}$ and we can rewrite the momentum to be $p=\hbar k$. Now, a wave packet consisting of a range of wave numbers between $k-\Delta k$ and $k+\Delta k$ describes a particle with an uncertain in momentum: $\Delta p\approx\hbar\Delta k$. 

The length of this wavepacket is a measure of the uncertainty in position, and it can be shown to be simply $\Delta x\approx\ 2\pi/\Delta k$. Note, the derivation of this requires a fourier transform! 

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig, ax = plt.subplots(1,2, figsize=(9,4))

k=2*pi/0.5
xax=linspace(-3,3,500)
uxe=exp(-xax**2/1**2)
ux=sin(k*xax)*uxe
kax=linspace(-3,3,500)
uk=exp(-kax**2/(1)**2)

ax[0].plot(xax, uxe, color="k")
ax[0].plot(xax, ux, color="0.5")
ax[0].set_xlabel("$x/m$")
ax[0].set_ylabel("$u(x)$")
ax[0].set_yticks([0]); 
ax[1].plot(k+kax, uk, color="k")
ax[1].set_xlabel("$k/(1/m)$")
ax[1].set_ylabel("$u(k)$")
ax[1].set_yticks([0]); 
plt.show()

glue("b-uncertainty", fig, display=False)
```

(b-uncertainty)=
```{glue:figure} b-uncertainty
The same de Broglie wavepacket plotted in position space (left) and momentum/wavevector space (right).
```


If we multiply these uncertainties we obtain $\Delta x\Delta p\approx h$, therefore de Broglie wave packets automatically lead to the Heisenberg uncertainty principle! 

Two notes: first, this is the maximum precision so we better write $\Delta x\Delta p\ge\ h$, and second, the precise numeric value on the right-hand side depends on the specific waveform of our wavefunction.

% TODO new
We can also use this example of wave packets to explore another uncertainty relation: Energy and time. This is more involved as there is no *time* operator, but we can discuss the case for a Gaussian wave packet of light, travelling at the speed of light. We obtain

$$
\begin{split}
\Delta p & = \frac{h\,\Delta f}{c}=\frac{\Delta E}{c}\\
\Delta x & = c\, \Delta t
\end{split}
$$(se-ur-et1)

which results in

$$\Delta E\,\Delta t \ge \hbar$$(se-ur-et)

:::{admonition} Note: Fourier transforms and uncertainty
:class: dropdown
If you like to dive deeper into Fourier transforms and the Heisenberg uncertainty principle, have a look here: 
https://quantummechanics.ucsd.edu/ph130a/130_notes/node88.html
:::

## The Schrödinger equation

<!-- Additional: Philips 2.1 -->
`[slide]`

In physics, the dynamics of a system is described by differential equations, which are equations that naturally appear if conservation of a quantity - often the total energy - is assumed. For derivation of our differential wave equation, it is essential to find how the energy of the particle depends on the wave vector or frequency of the wave. From $E=\hbar\omega$ and previous equations we find the dispersion relation $\omega\ =\hbar k^2/2m$. The task is to find a differential equation that obeys this dispersion relation. 

The skilled eye will see that the equation  

$$
i\hbar\frac{\partial\Psi}{\partial t}=-\frac{\hbar^2}{2m}\frac{\partial^2\Psi}{\partial x^2}
$$(se-fp-se)

will be such an equation – this is the Schrödinger equation for a "quantum wave function" $\Psi$ describing a free particle moving in one dimension.

Note that the main goal of physics research is to develop models to describe nature, and not to explain "why" something is like it is - of course it is most satisfying when we can explain "why" something is - but often this is just in relation to our models. So, please accept this equation for now - we will see it works often extremely well!

One solution to this wave equation is 
$\Psi\left(x,t\right)=Ae^{i(kx-\omega t)}$, which is called a plane wave moving in the $x$ direction. The wavevector $k$ and with this the momentum $p\ =\hbar k$ is well defined, and we see that the wave has a non-vanishing amplitude all over space – therefore Heisenberg uncertainty is preserved: $\Delta k=\Delta p=0$ and $\Delta x=\infty$. The energy is $E=p^2/2m=\hbar\omega$.

<!-- Quick question: verify that real functions Acos(k x – w t) and Asin(k x – w t) are not solutions – remind yourselves of Euler’s formula. -->
<!-- Ph problem 2.3 -->

:::{note}
Plot the plane wave amplitude and phase in 2 dimensions for specific wave vector and frequency, and think about its properties!
:::

## Plane-wave superpositions and wavepackets

`[slide]`

Since $\Psi$ appears only linearly (no powers) in the differential equation, we say that the Schrödinger equation is linear in the wavefunction $\Psi$. As a consequence, any superposition of solutions for instance with a different wavelength or wavevector $k$, is also a solution. 

:::{note}
Quick question: confirm that $\Psi(x,t)=A_1 e^{i(k_1x-\omega_1 t)}+A_2 e^{i(k_2x-\omega_2 t)}$ is also a solution. 
:::

It turns out that our plane waves form a complete orthogonal basis to describe, in our case, one-dimensional functions, but this also holds for 3 dimensions. Therefore, the most general solution of our one-dimensional Schrödinger equation is a superposition of complex-exponential waves with many angular frequencies and wavenumbers: 

$$\Psi\left(x,t\right)=\ \sum_{n=1}^{\infty}{A_n(k_n)e^{i\left(k_nx-\omega_nt\right)}}$$(se-fp-wf)

where $\hbar\omega_n=\frac{\hbar^2k_n^2}{2m}$. If $A_n(k_n)$ is such that the sum involves only a narrow range of wave numbers around a positive value $k$, this superposition yields a **wave packet** moving in the positive $x$ direction (group) velocity $v=\hbar k/m$, preserving shape during propagation. The position and momentum uncertainties are in agreement with the Heisenberg uncertainty principle at all times as explained before.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(2,2, figsize=(6,4))
k=2*pi*4
xax=linspace(-3,3,500)
kax=linspace(-10,10,500)
wx=[0.3,1]
uxe=[1,2]
uk=[1,2]
for i in range(2):
    uxe[i]=exp(-xax**2/wx[i]**2)
    uk[i]=exp(-kax**2/(1/wx[i])**2)
    ax[i,0].plot(xax, uxe[i]*sin(k*xax), color="k")
    ax[i,0].plot(xax, uxe[i], color="0.5")
    ax[i,0].set_xlabel("$x/m$")
    ax[i,0].set_ylabel("$u(x)$")
    ax[i,0].set_yticks([0]); 
    ax[i,1].plot(k+kax, uk[i], color="k")
    ax[i,1].set_xlabel("$k/(1/m)$")
    ax[i,1].set_ylabel("$u(k)$")
    ax[i,1].set_yticks([0]); 
ax[0,0].set_title("Real space")
ax[0,1].set_title("Momentum space")
plt.gcf().text(0.93, 0.65, "narrow", fontsize=14, rotation='vertical')
plt.gcf().text(0.93, 0.10, "Spatially wide", fontsize=14, rotation='vertical')
plt.show()

glue("b-wavepackets", fig, display=False)
```

(b-wavepackets)=
```{glue:figure} b-wavepackets
The real-space (left) and wavevector-space (right) wavepacket envelope of a spatially narrow (top) and wider (bottom) wavefunction.
```

The figure shows two examples of a wavefunction, one more narrow and one wider in real space - we see what the Heisenberg uncertainty principle implies: If a wavepacket is more localized in real space, it is wider in momentum space. This is because there are fewer oscillations in the narrower wavepacket, therefore the frequency or momentum of the wave is less good defined. This is what the frequency spectrum shows us.

:::{note}
Think where and why the [Heisenberg microscope](https://en.wikipedia.org/wiki/Heisenberg%27s_microscope) falls short in explaining the essence of the Heisenberg uncertainty relation!
:::
% quantum particles *have* no fixed x or p, independently if we measure it or not!
