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

# Two quantum particles

<!-- [G 5.1] -->
In this section we briefly introduce the Schrödinger equation for two particles, and what inter-particle interactions mean for the two-particle potential.


## The two particle Hamiltonian

{{slidetag}}

In the previous section we have seen that simple coupling of two particles with spins lead to surprising results in quantum mechanics. What about two-particle Schrödinger quantum dynamics in general? The state of a two-particle system can be described by a wavefunction that depends on the position of both particles: 

$$\Psi=\Psi\left(r_1,r_2,t\right)$$(tp-in-1)

The superposition principle tells us that the Hamilton operator of the two-particle Schrödinger equation is simply the sum of two single-particle equations:

$$H=-\frac{\hbar^2}{2m_1}\nabla_1^2-\frac{\hbar^2}{2m_2}\nabla_2^2+V\left(r_1,r_2,t\right)$$(tp-in-3)

We have added a potential term that depends on the positions of both particles. The wavefunction should again be normalized, for all possible position combinations of particle 1 and 2 the probability to find the particles should still be 1:

$$\int\left|\Psi\left(r_1,r_2,t\right)\right|^2{d^3r}_1{d^3r}_2=1$$(tp-in-4)

We assume that our potential is time independent, seperation of variables again results in:

$$\Psi\left(r_{`1},r_2,t\right)=\psi\left(r_1,r_2\right)e^{-iEt/\hbar}$$(tp-in-5)

And we obtain the time-independent Schrödinger equation

$$-\frac{\hbar^2}{2m_1}\nabla_1^2\psi-\frac{\hbar^2}{2m_2}\nabla_2^2\psi+V\left(r_1,r_2\right)\psi=E\psi$$(tp-in-6)

## Two-particle potentials and wavefunctions

{{slidetag}}

The potential term describes possible interactions between the particles. If we can write 

$$V\left(r_1,r_2\right)=V_1\left(r_1\right)+V_2\left(r_2\right)$$(tp-in-7)

there is no interaction between the particles, we have effectively two uncoupled Schrödinger equations. We have two solutions for the two particles, for example $\psi_a\left(r_1\right)$ and $\psi_b\left(r_2\right)$. They each satify their respective one-particle Schrödinger equation, and the two-particle wavefunction is simply the product of the one-particle wavefunctions – you can test easily that this works out!

$$\Psi\left(r_1,r_2,t\right)=\psi_a\left(r_1,t)\ \psi_b(r_2,t\right)$$(tp-in-9)

Such a state we call *separable* or *not entangled*, it is a *product state* of particle 1 and 2.

If there is interaction, for instance Coloumb interaction, we cannot do this and might obtain a potential that depends on the distance between our particles:

$$V\left(r_1,r_2\right)=V\left(\left|r_1-r_2\right|\right)$$(tp-in-8)

In the other case, if the potential depends on both positions, this interaction will often lead to states that makes it impossible to write the 2-particle wavefunction as a product – these states are *quantum entangled* or *non-separable*.

