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

<!-- TODO: see docx 3.4, useful! or as exercise?

`TODO: here or later in dynamics: G Problem 4.36 An electron is at rest in an oscillating magnetic field` -->


## Time dependent perturbation theory 

<!-- G11, P9.4 -->

`[slide]`

We discuss - of course - qubits, that is a quantum system with two energy levels. We have seen that, for instance, the electron spin in a magnetic field is such a system. Now, we apply a time-dependent perturbation, that is a change in the potential or Hamiltonian, and see what happens, using standard non-degenerate perturbation theory.

We first define the orthonormal eigenstates of the unperturbed Hamiltonian:

$$\hat{H}^0 \psi_a=E_a \psi_a, \quad \text { and } \quad \hat{H}^0 \psi_b=E_b \psi_b$$

and any state can be expressed as a superposition of these:

$$\Psi(0)=c_a \psi_a+c_b \psi_b$$

We know already how the state evolves in time

$$\Psi(t)=c_a(t) \psi_a e^{-i E_a t / \hbar}+c_b(t) \psi_b e^{-i E_b t / \hbar}$$

In absence of a perturbation the two constants $c_i$ are time-independent and the state will *wiggle* with the two eigen-energies.

`[slide]`

We now assume that we are in a particular states, this means that we know $c_i(t=0)$. Now we add a time-dependent perturbation $\hat{H}^{\prime}(t)$, and we plug the state in the time-dependent Schrödinger equation:

$$\hat{H} \Psi=i \hbar \frac{\partial \Psi}{\partial t}, \quad \text { where } \quad \hat{H}=\hat{H}^0+\hat{H}^{\prime}(t)$$

We use the matrix elements 

$$H_{i j}^{\prime} \equiv\left\langle\psi_i\left|\hat{H}^{\prime}\right| \psi_j\right\rangle$$

where we additionally assume that $H_{aa}'=H_{bb}'=0$, which is reasonable since we usually wish to make transitions between the states and not just change the unperturbed states.

We obtain for the time-derivatives of the coefficients (where we assume $E_b\gt E_a$)

$$\dot{c}_a=-\frac{i}{\hbar} H_{a b}^{\prime} e^{-i \omega_0 t} c_b, \quad \dot{c}_b=-\frac{i}{\hbar} H_{b a}^{\prime} e^{i \omega_0 t} c_a,\quad \omega_0 \equiv \frac{E_b-E_a}{\hbar}$$(pt-1st)

## First order perturbation

`[slide]`

We start with the system in the lower state, $c_a(0)=1$ and $c_b(0)=0$. We insert these at the RHS of Eq. {eq}`pt-1st` abnd obtain after integration:

$$
\begin{align}
\frac{d c_a^{(1)}}{d t}=0 &\Rightarrow c_a^{(1)}(t)=1 \\
\frac{d c_b^{(1)}}{d t}=-\frac{i}{\hbar} H_{b a}^{\prime} e^{i \omega_0 t} &\Rightarrow c_b^{(1)}=-\frac{i}{\hbar} \int_0^t H_{b a}^{\prime}\left(t^{\prime}\right) e^{i \omega_0 t^{\prime}} d t^{\prime}
\end{align}
$$(pt-1st-res)

This clearly shows that it is an approximation, since $c_a$ remains at 1 and normalization is violated. 

## Sinusoidal perturbation

`[slide]`

Now we assume a sinusoidal perturbation, for instance in real space $\hat{H}^{\prime}(\mathbf{r}, t)=V(\mathbf{r}) \cos (\omega t)$, such that the we get

$$H_{a b}^{\prime}=V_{a b} \cos (\omega t)
\quad \textrm{with} \quad V_{a b} \equiv\left\langle\psi_a|V| \psi_b\right\rangle$$

We calculate Eq. {eq}`pt-1st-res` and obtain

$$c_b(t)\approx -\frac{V_{b a}}{2 \hbar}\left[\frac{e^{i\left(\omega_0+\omega\right) t}-1}{\omega_0+\omega}+\frac{e^{i\left(\omega_0-\omega\right) t}-1}{\omega_0-\omega}\right]$$

Experimentally, one often works with driving frequencies $\omega$ close to the transition frequency $\omega_0$. In this case, we can neglect the second term in brackets which is called the *rotating wave approximation*, and we obtain:

$$c_b(t)=-i \frac{V_{b a}}{\hbar} \frac{\sin \left[\left(\omega_0-\omega\right) t / 2\right]}{\omega_0-\omega} e^{i\left(\omega_0-\omega\right) t / 2}$$

From this we calculate the transition probability

$$P_{a \rightarrow b}(t)=\left|c_b(t)\right|^2 \approx \frac{\left|V_{a b}\right|^2}{\hbar^2} \frac{\sin ^2\left[\left(\omega_0-\omega\right) t / 2\right]}{\left(\omega_0-\omega\right)^2}$$

`[slide]`

This is an oscillatory function of time! What does this mean?
* After switching on the interaction, the probility to be in the upper state oscillates - and does not saturate as one might think classically.
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

$$\left[\frac{\left|V_{a b}\right|}{\hbar\left(\omega_0-\omega\right)}\right]^2$$

at times 

$$t_N=\frac{(2N+1)\pi}{\left|\omega_0-\omega\right|}$$

### Rabi oscillations

`[slide]`

Rabi noticed that if you make the rotating wave approximation at the beginning of the calculation, Eq. {eq}`pt-1st` can be solved exactly, and we obtain

$$c_b(t)=-\frac{i}{2 \hbar \omega_r} V_{b a} e^{i\left(\omega_0-\omega\right) t / 2} \sin \left(\omega_r t\right)$$

and a similar expresswion for $c_a$, and with the Rabi frequency

$$\omega_r \equiv \frac{1}{2} \sqrt{\left(\omega-\omega_0\right)^2+\left(\left|V_{a b}\right| / \hbar\right)^2}$$

This result is properly normalized, the transition probability doesn't exceed one and is also suited for strong drive. This effect is the work horse for qubit manipulation, but up to now we haven't clearly defined *how* we make the perturbation, which we will do now.



## Radiative transitions

`[slide]`

The atom or electron wavefunction is usually very small compared to the wavelengths of optical and even more microwave radiation. Therefore, we can ignore the spatial dependency. Additionally, physicists like to only discuss one frequency or wavelength, and then talk about *quasi-monochromatic* radiation. Perfect monochromatic waves cannot exist as you might guess from the Heisenberg uncertainty principle between energy and time.
The electric field is simply oscillatory, if we assume linear polarization along the $z$-axis we have:

$$\vec{E}=E_0 \cos (\omega t) \vec{z}$$

In principle, in electromagnetic radiation, the electric field is always accompanied by a magnetic field, but often one can neglect the one or the other - here we discuss only the electric field.

Now an electron in an electric field experiences an potential and therefore has an energy 

$$U=-q\int_C \vec{E}\cdot d\vec{l}$$

where $C$ is an arbitrary path e.g. from the origin, and $q$ the electron charge. We now assume that the electron will move instantaneously with the field. With this, the interaction Hamiltonian becomes:

$$H^{\prime}=-q E_0 z \cos (\omega t)$$

This is exactly what we used above for inducing Rabi oscillations!


