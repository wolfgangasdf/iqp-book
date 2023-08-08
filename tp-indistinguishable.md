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

## Bosons and Fermions

`[slide]`

<!-- [G5.1.1 is partially conceptually wrong and not very rigorous, use P10.1] -->

We have discussed different degrees of freedom of fundamental quantum particles, like mass, frequency, time of arrival, spatial wavefunction; and just before we learned about the spin. 

Now, we discuss two particles a and b that are exactly the same except for their positions r1 and r2, we call these idential particles. We assume that they are noninteracting so the joint wavefunction is again described by $\psi\left(r_1,r_2\right)=\psi_a\left(r_1\right)\psi_b\left(r_2\right)$.

Now, the probability of finding particle a in the volume element $dr_1$ and b in $dr_2$ is given by $|\psi(r1,r2)|^2 dr_1 dr_2$. Since we assume that the particles are identical (except for their position), the wave function must give identical properties for each particle. 

For instance, the probability of finding particle a at $r_1$ and b at $r_2$ must be equal to the probability of finding particle a at $r_2$ and b at $r_1$:

$$\left|\psi\left(r_1,r_2\right)\right|^2=\left|\psi\left(r_2,r_1\right)\right|^2$$

This implies that the two wavefunctions on the LHS and RHS differ mostly by a phase factor and so $\psi\left(r_1,r_2\right)=e^{i\ \phi}\psi\left(r_2,r_1\right)$  - if we apply the procedure again we obtain $\psi\left(r_1,r_2\right)=e^{i\ \phi}e^{i\ \phi}\psi\left(r_1,r_2\right)$
Which implies that $e^{i\ \phi}$ equals to $+1$ or $-1$.
This means that the wave function of identical particles is either *symmetric* under particle exchange 

$$\psi\left(r_1,r_2\right)=+\psi\left(r_2,r_1\right)$$

or antisymmetric 

$$\psi\left(r_1,r_2\right)=-\psi\left(r_2,r_1\right)$$

This classifies the quantum behaviour of particles in a very fundamental way - particles with symmetric wavefunctions under particle exchange are called **bosons**, and with antisymmetric wavefunctions are **fermions**. From before, you might already know that bosons are also all particles with integer spin, and fermions with half-integer spin. This is a very important connection, the so-called spin-statistics theorem – which in standard quantum mechanics must remain a theorem, it can be proven in relativistic quantum mechanics – have a read through the "suggestive but bogus argument" on [wikipedia](https://en.wikipedia.org/wiki/Spin%E2%80%93statistics_theorem#Suggestive_bogus_argument).

Note: This is in 3 dimensions, for 2 dimensions such as used in quantum hall systems, other exchange phase as $\pm1$ are allowed – this gives rise to anyons and potentially majorana quasi-particles.

## The Pauli exclusion principle 

`[slide]`

<!-- [part from G5.1.1, part from P10.2 but all very unclear, also wikipedia not much better. This is crap!] -->

Let us now go back and construct from scratch two-particle wavefunctions that are either symmetric and anti-symmetric under particle exchange:

$$\psi_\pm\left(r_1,r_2\right)=A\left[\psi_a\left(r_1\right)\psi_b\left(r_2\right)\pm\psi_b\left(r_1\right)\psi_a\left(r_2\right)\right]$$

You can easily check that 

$$\psi_\pm\left(r_1,r_2\right)=\pm\psi_\pm\left(r_2,r_1\right)$$

And you might note that these states are quantum entangled, but this is not relevant here.

This is actually a very useful procedure of symmetrization (+) or anti-symmetrization (-) that will come back often in quantum mechanics. 

From this seemingly trivial superposition we can now test what happens if the particles are indistinguishable and at the same position. For the symmetric bosonic state $\psi_+$ nothing special happens so we focus on the anti-symmetric fermionic state:

$$\psi_-\left(r_1,r_2\right)=A\left[\psi_a\left(r_1\right)\psi_a\left(r_2\right)\ -\ \psi_a\left(r_1\right)\psi_a\left(r_2\right)\right]=0$$

This is not normalizable and therefore doesn't make sense and is not possible -n o two antisymmetric particles can be in the same state! “State” means now everything, same spin, color, etcetera - and position! The latter we see also by letting $r1=r2$, where we also obtain 0.

This is the famous **Pauli exclusion principle** for fermions – no two fermions can be in the same state. Amongst other things, this makes electrons in higher atomic levels stable and thus makes matter “hard” – in combination with coloumb repulsion. 

TODO [exercises: G5.4,5] [TODO from MB from jos thijssen dictaat] WL: too hard

## Bosons bunch

`[slide]`

Now we ask the question, has indistinguishability also an effect for bosons? We calculate the probability for finding both particles at the same location, for the non-entangled state of two distinguishable particles

$$\Psi\left(r_{1},r_1\right)=\psi_a\left(r_1)\ \psi_b(r_1\right)$$

and for the symmetrized entangled state

$$\begin{align*}\psi_+\left(r_1,r_1\right)&=\frac{1}{\sqrt2}\left[\psi_a\left(r_1\right)\psi_b\left(r_1\right)\ +\ \psi_a\left(r_1\right)\psi_b\left(r_1\right)\right]\\&=\sqrt2\ \psi_a\left(r_1\right)\psi_b\left(r_1\right)\end{align*}$$

The latter has a factor $\sqrt{2}$ which becomes 2 in probability! Apparently, the chance of finding both particles at the same position is twice as high for indistinguishable particles compared to distinguishable particles! 

Another way of looking at this is the following: For distinguishable bosons with internal state $+$ or $-$, we can discriminate the states $\left|++\right\rangle$, $\left|+-\right\rangle$, $\left|-+\right\rangle$, $\left|--\right\rangle$. 

If the particles are not distinguishable, $\left|+-\right\rangle$ and $\left|-+\right\rangle$ are the same state, therefore 2 of the 3 possible states are equal - compared to 2 of 4 if they are distinguishable. 

All this might seem like magic because we have started with a different state – but in fact the state space for identical particles must be either in the symmetric or antisymmetric state – one can call this the symmetrization postulate or theorem.

TODO [exercise: QuantumNotes.pdf 7.2.2]

[TODO check Jos Thijssen - LECTURE NOTES STATISTICAL PHYSICS TN2624.pdf]

## The exchange force
<!-- G5.1.2 -->
`[slide]`

Intuitively, if we trust in the Pauli exclusion principle, the particles must feel a "force" if they get closer. To investigate this we calculate the expectation value of the squared distance between the particles:

$$\left\langle\left(x_1-x_2\right)^2\right\rangle=\left\langle x_1^2\right\rangle+\left\langle x_2^2\right\rangle-2\left\langle x_1 x_2\right\rangle$$

Note, we often use the square and not the modulus, because the latter is far nastier mathematically.

We calculate this expectation value first for two distinguishable particles

$$\Psi\left(r_{1},r_1\right)=\psi_a\left(r_1)\ \psi_b(r_1\right)$$

We obtain:

$$\left\langle\left(x_1-x_2\right)^2\right\rangle_d=\left\langle x^2\right\rangle_a+\left\langle x^2\right\rangle_b-2\langle x\rangle_a\langle x\rangle_b$$

Instread, if we calculate it for the either bosonic or fermionic indistinguishable particle wavefunction

$$\psi_\pm\left(r_1,r_2\right)=A\left[\psi_a\left(r_1\right)\psi_b\left(r_2\right)\pm\psi_b\left(r_1\right)\psi_a\left(r_2\right)\right]$$

We obtain

$$\left\langle\left(x_1-x_2\right)^2\right\rangle_{ \pm}=\left\langle x^2\right\rangle_a+\left\langle x^2\right\rangle_b-2\langle x\rangle_a\langle x\rangle_b \mp 2\left|\langle x\rangle_{a b}\right|^2$$

Where
$$\int x_2 \psi_a\left(x_2\right)^* \psi_b\left(x_2\right) dx_2 = \langle x\rangle_{a b}$$

describes the wave function overlap between the particles.

We observe:
* If the wavefunctions don't overlap spatially, $\langle x\rangle_{a b}=0$ and it doesn't matter if the particles are bosons, fermions, or if we have (anti) symmetrizised their wavefunctions or not.
* If the wavefunctions do overlap, then bosons are pulled together, and fermions pushed apart. We didn't use a potential for this, so it is not a real force - it is the consequence of the symmetrization requirement - nevertheless we call the virtual force the **exchange force**.
