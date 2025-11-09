---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---


(b-postulates-xr)=
# The postulates of quantum mechanics

**1. The quantum state of a system**

A state is represented by a state vector $|\psi\rangle$. Mathematically, this state vector belongs to the Hilbert space $\mathcal{H}$, called the state space.

It is useful to mention here that there are two different types of states, depending in which degrees of freedom they are encoded in:

- **Discrete degrees of freedom**, for instance a qubit, a spin system or polarization:
  $\mathcal{H}$ is finite-dimensional, e.g. $\mathbb{C}^2$.  
  A typical _discrete state_ looks like:

  $$
  |\psi\rangle = \alpha|0\rangle + \beta|1\rangle, \quad |\alpha|^2 + |\beta|^2 = 1.
  $$

  This might be familiar to most of you as this is how you define the state of qubits! However, apart from Chapter 4, we will mostly be working with systems involving continuous degrees of freedom.

- **Continuous-variable degrees of freedom**, for instance the position of a particle:
  $\mathcal{H} = L^2(\mathbb{R})$, the space of square-integrable wavefunctions.  
  The state vector is written in the position basis:

  $$
  |\psi\rangle = \int_{-\infty}^{\infty} \psi(x)\,|x\rangle \, dx,
  $$

  where

  $$
  \psi(x) = \langle x|\psi\rangle
  $$

  is the wavefunction, which we will use often in the following chapters. 

**2. Measurements**

This second postulate is also called the Born rule:
Every measurable physical quantity A is described by a Hermitian operator $\hat{A}$ acting in the state space of $\mathcal{H}$. The expectation value to measure A given the state $|\psi\rangle$ is $\langle\psi|\hat{A}|\psi\rangle$ - and the probability is $|\langle\psi|\hat{A}|\psi\rangle|^2$. We don't need the modulus since eigenvalues of hermitian operators are real.

Another consequence is the concept of *probability amplitude*, which we have used above: Let $\lambda_i$ be an eigenvalue of $\hat{A}$, then $\langle\lambda_i|\psi\rangle$ is the probability amplitude - we need to square it to obtain the probability of measuring $|\lambda_i\rangle$:

$$P(\lambda_i) = |\langle\lambda_i|\psi\rangle|^2$$

A related useful concept is the projection operator, for instance, $|\lambda_i\rangle \langle\lambda_i|$ is the projection operator projecting the state $|\psi\rangle$ onto $|\lambda_i\rangle$:

$$|\lambda_i\rangle \langle\lambda_i|\psi\rangle$$
The result is the state $|\lambda_i\rangle$ with the probability amplitude $\langle\lambda_i|\psi\rangle$.

**After the measurement.**
The evolution of the quantum state during a measurement is very complex, mainly because we usually want to assume a fully "classical" measurement result - but such a measurement process can't be easily described by quantum mechanics. The ["quantum measurement problem"](https://en.wikipedia.org/wiki/Measurement_problem) is an exciting field of research, but for all practical purposes there is a simple solution based on the [*Copenhagen interpretation of quantum mechanics*](https://en.wikipedia.org/wiki/Interpretations_of_quantum_mechanics). All experimental results to date are extremely well explained by this.

In short, if a measurement of $\hat{A}$ resulted in the eigenstate $|\lambda_i\rangle$, the system goes over into that state $|\lambda_i\rangle$. Mathematically, it is often written as this rule:

$$|\psi\rangle \rightarrow \frac{|\lambda_i\rangle \langle\lambda_i|\psi\rangle}{\sqrt{\langle\psi|\lambda_i\rangle
\langle\lambda_i|\psi\rangle}}$$

The renormalization is needed because the probability amplitude is not necessarily unity, and we assume that the system is in the measured states with unity probability.

**3. Time evolution**

The third postulate of quantum mechanics is that the time evolution of a system is determined by the Schrödinger equation - we will discuss this in the next chapter.
