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

# Quantum dynamics

In this section, we show how to calculate the effect of a time-dependent perturbation, which is key for controlling qubits in the lab.


<!-- exercise: G Problem 4.36 An electron is at rest in an oscillating magnetic field` -->


## Time dependent perturbation theory 

<!-- G11, P9.4 -->

{{slidetag}}

We discuss - of course - qubits, that is a quantum system with two energy levels. We have seen that, for instance, the electron spin in a magnetic field is such a system. Now, we apply a time-dependent perturbation, that is a change in the potential or Hamiltonian, and see what happens, using standard non-degenerate perturbation theory.

We first define the orthonormal eigenstates of the unperturbed Hamiltonian:

$$\hat{H}_0 \psi_a=E_a \psi_a, \quad \text { and } \quad \hat{H}_0 \psi_b=E_b \psi_b$$(ad-qd-1)

and any state can be expressed as a superposition of these:

$$\Psi(0)=c_a \psi_a+c_b \psi_b$$(ad-qd-2)

We know already how the state evolves in time

$$\Psi(t)=c_a(t) \psi_a e^{-i E_a t / \hbar}+c_b(t) \psi_b e^{-i E_b t / \hbar}$$(ad-qd-3)

In absence of a perturbation the two constants $c_i$ are time-independent and the state will *wiggle* with the two eigen-energies.

{{slidetag}}

We now assume that the system is in a particular state, this means that we know $c_i(t=0)$. Now we add a time-dependent perturbation $\hat{H}^{\prime}(t)$, and we plug the state in the time-dependent Schrödinger equation.

$$\hat{H} \Psi=i \hbar \frac{\partial \Psi}{\partial t}, \quad \text { where } \quad \hat{H}=\hat{H}_0+\hat{H}^{\prime}(t)$$(ad-qd-4)

First, we expand our state in the eigenbasis of $\hat H_0$:

$$
\Psi(t)=\sum_n c_n(t)\,\psi_n\,e^{-iE_n t/\hbar},\qquad
\hat H_0\psi_n=E_n\psi_n.
$$

For the right-hand side of the Schrödinger equation, we differentiate $\Psi(t)$:

$$
\frac{\partial\Psi}{\partial t}=\sum_n \dot c_n(t)\,\psi_n\,e^{-iE_n t/\hbar}
+ \sum_n c_n(t)\,\psi_n\left(-\frac{iE_n}{\hbar}\right)e^{-iE_n t/\hbar}
$$

$$
i\hbar\frac{\partial\Psi}{\partial t}
= i\hbar\sum_n \dot c_n\,\psi_n e^{-iE_n t/\hbar} + \sum_n c_n E_n\,\psi_n e^{-iE_n t/\hbar}
$$

For the left-hand side we obtain

$$
\hat H\Psi = (\hat H_0+\hat H')\sum_n c_n\psi_n e^{-iE_n t/\hbar}
= \sum_n c_n E_n\psi_n e^{-iE_n t/\hbar} + \sum_n c_n e^{-iE_n t/\hbar}\,\hat H'\psi_n.
$$

Now we equate the left- and right-hand side. The terms with $E_n$ cancel and we get

$$
i\hbar\sum_n \dot c_n\,\psi_n e^{-iE_n t/\hbar}
= \sum_n c_n e^{-iE_n t/\hbar}\,\hat H'\psi_n.
$$

Now we project onto a particular basis state $\psi_m$ and make use of their orthonormality $\langle\psi_m|\psi_n\rangle=\delta_{mn}$:

$$
i\hbar\,\dot c_m\,e^{-iE_m t/\hbar}
= \sum_n c_n e^{-iE_n t/\hbar}\,\langle\psi_m|\hat H'|\psi_n\rangle.
$$

We now use the matrix elements 

$$H_{m n}^{\prime} \equiv\left\langle\psi_m\left|\hat{H}^{\prime}\right| \psi_n\right\rangle,$$(ad-qd-5)

where we additionally assume that $H_{mm}'=H_{nn}'=0$, which is reasonable because we apply a time-dependent drive to induce transitions between stationary states, and don't redefine the states as was done in time-independent perturbation theory.

We multiply both sides by $e^{iE_m t/\hbar}$ and obtain

$$
i\hbar\,\dot c_m
= \sum_n c_n\,H'_{mn}\,e^{-i(E_n-E_m)t/\hbar}
$$

or

$$
{\;\dot c_m = -\frac{i}{\hbar}\sum_n H'_{mn}\,c_n\,e^{-i\omega_{nm}t}\;},
\; \text{ where }\; \omega_{nm}\equiv\frac{E_n-E_m}{\hbar}
$$

Thus, assuming that $E_b\gt E_a$, we have obtained the time-derivatives of the coefficients

$$\dot{c}_a=-\frac{i}{\hbar} H_{a b}^{\prime} e^{-i \omega_0 t} c_b, \quad \dot{c}_b=-\frac{i}{\hbar} H_{b a}^{\prime} e^{i \omega_0 t} c_a,\quad \omega_0 \equiv \frac{E_b-E_a}{\hbar}$$(pt-1st)

:::{note}

{{slidetag}}

If we start with the system in the lower state, $c_a(0)=1$ and $c_b(0)=0$, on inserting these at the right-hand side of Eq. {eq}`pt-1st`, we obtain after integration:

$$
\begin{align}
\frac{d c_a^{(1)}}{d t}=0 &\Rightarrow c_a^{(1)}(t)=1 \\
\frac{d c_b^{(1)}}{d t}=-\frac{i}{\hbar} H_{b a}^{\prime} e^{i \omega_0 t} &\Rightarrow c_b^{(1)}=-\frac{i}{\hbar} \int_0^t H_{b a}^{\prime}\left(t^{\prime}\right) e^{i \omega_0 t^{\prime}} d t^{\prime}
\end{align}
$$(pt-1st-res)

This clearly shows that it is an approximation, since $c_a$ remains at 1 and normalization is therefore violated.
:::

## Sinusoidal perturbation

{{slidetag}}

Now we assume a sinusoidal perturbation, for instance in real space $\hat{H}^{\prime}(\mathbf{r}, t)=V(\mathbf{r}) \cos (\omega t)$, such that the we get

$$H_{a b}^{\prime}=V_{a b} \cos (\omega t)
\quad \textrm{with} \quad V_{a b} \equiv\left\langle\psi_a|V| \psi_b\right\rangle$$(ad-qd-7)

We calculate Eq. {eq}`pt-1st-res` and obtain

$$c_b(t)\approx -\frac{V_{b a}}{2 \hbar}\left[\frac{e^{i\left(\omega_0+\omega\right) t}-1}{\omega_0+\omega}+\frac{e^{i\left(\omega_0-\omega\right) t}-1}{\omega_0-\omega}\right]$$(ad-qd-8)

Experimentally, one often works with driving frequencies $\omega$ close to the transition frequency $\omega_0$. In this case, we can neglect the first term in brackets since $\omega_0+\omega \gg \omega_0-\omega$. This approximation is called the *rotating wave approximation*, a very important concept. We obtain:

$$c_b(t)=-i \frac{V_{b a}}{\hbar} \frac{\sin \left[\left(\omega_0-\omega\right) t / 2\right]}{\omega_0-\omega} e^{i\left(\omega_0-\omega\right) t / 2}$$(ad-qd-9)

From this we calculate the transition probability

$$P_{a \rightarrow b}(t)=\left|c_b(t)\right|^2 \approx \frac{\left|V_{a b}\right|^2}{\hbar^2} \frac{\sin ^2\left[\left(\omega_0-\omega\right) t / 2\right]}{\left(\omega_0-\omega\right)^2}$$(ad-qd-10)

{{slidetag}}

This is an oscillatory function of time! What does this mean?
* After switching on the interaction, the probability to be in the upper state oscillates - and does not saturate as one might think classically.
* After a specific time, the probability to be in the upper state is maximal - if we wish to make a transition to the upper state, we should switch our perturbation off at this time.
* Since we work in first-order perturbation theory, the probability needs to remain small in any case, otherwise our assumption is not valid. It turns out, however, that we can make transitions with near-unity probability this way.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(7,3))
ee=5
a=1
x = linspace(0,10, 601)
cb = sin(x)**2
ax.plot(x, cb, color='red')
ax.set_xlabel('$t$')
ax.set_ylabel('$P(t)$')
ax.set_xticks([0])
ax.set_xticklabels(["0"])
ax.plot(x,x*0+1,'--',color="0.5")
ax.set_yticks([0])
ax.set_yticklabels(["0"])

glue("ad-rabipt", fig, display=False)
```

(ad-rabipt)=
```{glue:figure} ad-rabipt
Excited-state probability as a function of time.  
```

In the figure, the maximum excited-state probability reaches 

$$\left[\frac{\left|V_{a b}\right|}{\hbar\left(\omega_0-\omega\right)}\right]^2$$(ad-qd-11)

at times 

$$t_N=\frac{(2N+1)\pi}{\left|\omega_0-\omega\right|}$$(ad-qd-12)

## Rabi oscillations

{{slidetag}}

So far, we have worked with approximate, perturbative, solutions for transitions between two quantum states under a time-dependent drive. However, there is a famous result by Rabi that goes beyond approximation: if we make the rotating wave approximation right from the beginning, Eq. {eq}`pt-1st` can actually be solved exactly! While a more detailed treatment is outside the scope of this course, we obtain these exact solutions:

$$c_b(t)=-\frac{i}{2 \hbar \omega_r} V_{b a} e^{i\left(\omega_0-\omega\right) t / 2} \sin \left(\omega_r t\right)$$(ad-qd-13)

and a similar expression for $c_a$. Here we have used the Rabi frequency

$$\omega_r \equiv \frac{1}{2} \sqrt{\left(\omega-\omega_0\right)^2+\left(\left|V_{a b}\right| / \hbar\right)^2}$$(ad-qd-14)

This result is properly normalized, the transition probability does not exceed 1 and the solutions also describe a strong drive. This effect, the so-called Rabi oscillations, is the work horse for qubit manipulation. 

However, up to now we haven't clearly defined *how* we realize the time-dependent perturbation, which we will do now.

:::{note}
Recap: What do Rabi oscillations mean intuitively?

Imagine a qubit which can be in its ground state $|a\rangle$ or excited state $|b\rangle$. We shine light on it, or apply a microwave field, at a frequency $\omega$ that is close to the transition frequency $\omega_0$ between the two states.

Instead of staying in one state, the system now *coherently* oscillates between the two states. This oscillation is what we call Rabi oscillations. The probability of being in the excited state $|b\rangle$ oscillates, and the rate of this oscillation is set by the Rabi frequency $\omega_r$.
:::


## Radiative transitions

{{slidetag}}

The atom or electron wavefunction is usually very small compared to the wavelengths of optical and even more microwave radiation. Therefore, we can often ignore the spatial dependency of a light wave or radio wave field. Additionally, physicists like to only discuss a single frequency or wavelength, and then talk about *quasi-monochromatic* radiation. We had seen before that perfect monochromatic waves cannot exist because of the Heisenberg uncertainty relation between energy and time.

Therefore, at the location of the atom, the electric field is simply oscillatory, if we assume linear polarization along the $z$-axis we have:

$$\vec{E}=E_0 \cos (\omega t) \vec{z}$$(ad-qd-15)

In principle, in electromagnetic radiation, the electric field is always accompanied by a magnetic field, but often one can neglect the one or the other - here we discuss only the electric field.

Now an electron in an electric field experiences an potential and therefore has an energy 

$$U=-q\int_C \vec{E}\cdot d\vec{l}$$(ad-qd-16)

where $C$ is an arbitrary path e.g. from the origin, and $q$ the electron charge. We now assume that the electron will move instantaneously with the field. With this, the interaction Hamiltonian becomes:

$$H^{\prime}=-q E_0 z \cos (\omega t)$$(ad-qd-17)

This is exactly what we needed in the previous section for inducing Rabi oscillations! So, optical or microwave radiation can be used to coherently control qubits encoded into different energy levels of quantum systems.
