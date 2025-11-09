---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
authors:
  - name: ''
---

# Density Matrix

Here we introduce the density matrix formalism, which is an essential method to describe probabilistic results of quantum measurements, ensembles of quantum states, and realistic quantum states where interaction with the environment has introduced "noise".


:::{note}
About the density matrix, you can watch the following video lecture from QuTech:

https://www.youtube.com/watch?v=xC5PvbbU-TI&t=58s
:::

## Motivation

Where does our description of quantum states using pure states fall short? We want to mention 3 examples:

1. Quantum measurements. We have discussed quantum measurements in the section on the [postulates of quantum mechanics](#b-postulates-xr), and for instance in the example of [measuring a spin in another basis](#sp-half-ex-meas), the outcome often is probabilistic. After the measurement, we obtain different pure states $\ket{\psi_i}$ with certain probabilities. This cannot be described by a single pure state and we had to use a textual description of the complete outcomes. The density matrix formalism can describe such outcomes in a very elegant way.

2. Ensembles of quantum states. In order to obtain the required information about the probabilities of different outcomes of a quantum experiments, but also of larger quantum algorithms running on larger quantum computers, we can either perform the same experiment many times in parallel or sequentially repeat the experiment. The result is that we have an ensemble of resulting quantum states, so-called mixed states; pure states are often not suitable to describe these results. 

3. Noisy quantum systems. It is a major task of quantum research to prevent quantum states becoming "noisy" - with this we mean that any quantum system couples unavoidably to the environment. Because it is very hard to describe this interaction fully quantum mechanically, and the environment is often assumed to be classical - and pure states are not suitable to describe noisy quantum states.

The density matrix formalisms allows us to describe quantum states that appear in these situations.

## Density Matrix definition

We want to describe an ensemble of quantum systems that is a mixture of the pure states

$$
\ket{\psi_i} = \alpha_i \ket{0} + \beta_i \ket{1}
$$

where $\ket{\psi_i}$ appears with probability $p_i$.

The density matrix of this system is defined as

$$
\rho = \sum_i p_i \ket{\psi_i}\bra{\psi_i}
$$

The density matrix can be seen as a generalization of the state ket-vectors or wavefunctions. The density matrix definition works also for quantum states written as continuous-variable wavefunctions such as $\psi_i(x)$, but we focus in the following on qubits.

<!-- Reference: https://www.youtube.com/watch?v=xC5PvbbU-TI&t=58s -->

## Pure and mixed states

Now we compare the density matrix of a pure state to that of mixed states. Let us first write the density matrix of a normalized pure state $\ket{\psi} = \alpha \ket{0} + \beta \ket{1}$: 

$$
\rho = \ket{\psi}\bra{\psi}
$$

Simply by substituting $\ket{\psi} = \alpha \ket{0} + \beta \ket{1}$, we get:

$$
\rho = \begin{bmatrix}
\alpha \\
\beta
\end{bmatrix}
\begin{bmatrix}
\alpha ^\star & \beta ^\star
\end{bmatrix} = 
\begin{bmatrix}
|\alpha|^2 & \alpha\beta^\star\\
\beta\alpha^\star & |\beta|^2
\end{bmatrix}
$$

If the trace of the density matrix is 1, then the quantum state (pure or mixed) is properly normalised. In our example, this holds because we assume $\ket{\psi}$ is normalised and thus, $|\alpha|^2 + |\beta|^2 = 1$.

Now, let us see what the density matrix of a mixed state looks like. As an example we use the situation that our system is with 50% chance in either state $\ket{0}$ or $\ket{1}$. This state is called the maximally mixed state, as it indicates complete uncertainty about the system quantum state in any basis.

The density matrix of this system looks like:

$$
\rho = \frac{1}{2} \ket{0}\bra{0} + \frac{1}{2} \ket{1}\bra{1} = \begin{bmatrix}
\frac{1}{2} & 0 \\
0 & \frac{1}{2}
\end{bmatrix}
$$

With this insight, we see that 

* the diagonal elements of the density matrix decribe the probabilities of finding a system in the basis states corresponding to rows or colums of the density matrix,
* the off-diagonal elements describe "coherences" of the system - if they are zero, the system is classical.

In the ket notation, the quantum states are explicitly written so it is always clear which coefficients belong to which state - this seems to be confusing for the density matrix, to which states do the matrix entries correspond? You will see that there is actually no confusion if you follow the convention that density matrices are written in the "computational" basis consisting here of $\{\ket{0},\ket{1}\}$ - but it doesn't hurt to label the matrix:

$$
\begin{array}{c} 
& \begin{array}{c c} \bra{0} & \bra{1} \\ \end{array} \\
\begin{array}{c c}\ket{0}\\ \ket{1} \end{array} &
\left[
\begin{array}{c c}
|\alpha|^2 & \alpha\beta^\star\\
\beta\alpha^\star & |\beta|^2
\end{array}
\right]
\end{array}
$$


:::{note}
As an exercise, try to calculate the density matrix of the pure state $\ket{+}$ and see how it differs from the maximally mixed state described above. The $\ket{+}$ state is defined in the Z basis as:

$$
\ket{+} = \frac{1}{\sqrt{2}} (\ket{0}+\ket{1})
$$
:::


### Purity

There are several properties of mixed quantum states which can be calculated from the density matrix, here we discuss one: The purity, which is a measure of how "mixed" a state is. It can be calculated by:

$$
\text{Purity} = \text{Tr}(\rho^2)
$$  

- For a pure state, $ \text{Tr}(\rho^2) = 1 $
- For a maximally mixed state, $ \text{Tr}(\rho^2) = \frac{1}{d} $, where $d$ is the dimension of the Hilbert space, 2 for qubits.

The purity of a quantum system is independent of the measurement basis.


## Calculating observables with a density matrix

The density matrix formalism allows us to compute the expectation value of any observable, even when the system is in a mixed state. As a reminder, for a pure state $\ket{\psi}$ and an observable (represented by a Hermitian operator) $A$, the expectation value is:

$$
\langle A \rangle = \bra{\psi} A \ket{\psi}
$$

In the density matrix formalism, this generalizes to both pure and mixed states as:

$$
\langle A \rangle = \text{Tr}(\rho A)
$$

where $\rho$ is the density matrix of the system. For a mixed state described as:

$$
\rho = \sum_i p_i \ket{\psi_i}\bra{\psi_i}
$$

The expectation value becomes:

$$
\langle A \rangle = \text{Tr}\left( \sum_i p_i \ket{\psi_i}\bra{\psi_i} A \right)
= \sum_i p_i \bra{\psi_i} A \ket{\psi_i}
$$

which is the weighted average of the expectation values for each pure state in the ensemble, exactly as we would expect physically.

:::{note}
**Example**\
Let us measure the expectation value of the $\ket{+}$ state in the Z-basis using the density matrix formalism.

We know that 

$$
\rho = \ket{+}\bra{+} = \frac{1}{2} \begin{bmatrix}
1 & 1 \\
1 & 1
\end{bmatrix}
$$

$$
\langle Z \rangle = \text{Tr}(\rho Z) = \text{Tr} \left( \frac{1}{2} \begin{bmatrix} 1 & 1 \\
1 & 1
\end{bmatrix}  \begin{bmatrix} 1 & 0 \\
0 & -1
\end{bmatrix} \right)
$$

Thus,

$$
\langle Z \rangle = \text{Tr} \left(\frac{1}{2} \begin{bmatrix} 1 & -1 \\
1 & -1
\end{bmatrix} \right) = 0
$$

In fact, if you want to calculate the probability of getting the $\ket{0}$ state on measuring the $\ket{+}$ state, you can calculate it as follows:

$$
p_{\ket{0}} = \text{Tr}(\rho \ket{0}\bra{0})
$$

This should give you a value of $\frac{1}{2}$, which is what we might expect.

As an exercise, try to calculate the expectation value of the Pauli-X operator for the state:

$$
\ket{\psi} = \frac{1}{\sqrt{3}} (\ket{0}+\sqrt{2}\ket{1})
$$

::: 
