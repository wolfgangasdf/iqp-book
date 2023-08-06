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

# Qubit realizations

## Light's polarization

`[slide] polarization`

Many important aspects of quantum mechanics and qubits can be shown with the polarization of light, which you might know.

The state of a qubit is written in the ket notation often as |Psi>, Psi reminding of the quantum wave function of a particle. However, the state of a qubit is a mathematical concept, disconnected from physical realizations, which makes it possible to study quantum information theory without understanding physical realizations of it – quantum mechanics provides the physical substance. We say that we can “encode” the quantum state in a DOF of a physical system.
We now show how we can encode qubits in the polarization of light, for instance of a laser pointer beam. In this case, the polarization is fully defined by the horizontal H and a vertical V electric field amplitude, and we have with the known basis vectors: 

$$
\vec{E}=\left(\begin{matrix}E_H\\E_V\\\end{matrix}\right)=\ E_0\left( E_H\left(\begin{matrix}1\\0\\\end{matrix}\right)+E_V\left(\begin{matrix}0\\1\\\end{matrix}\right) \right)
$$

Here we have absorbed the e-field units into E0, and Eh, Ev are dimensionless.

Now to the quantum state, the Psi ket-vector. By analogy, the dimensionless polarization vector is simply our qubit state vector, with the basis states H and V, where we assume normalization $|E|=1$:

$$
\left|\left.\Psi\right\rangle\right.=\left(\begin{matrix}E_H\\E_V\\\end{matrix}\right)=E_H\left|\left.H\right\rangle\right.\>+E_V\left|\left.V\right\rangle\right.
$$

$E_H$ and $E_V$ are truly quantum amplitudes, where the squared amplitude gives the probability to measure the specific state. This is very similar to polarization in optics, where we often can not measure directly the electric field, but detectors measure the intensity, which is $I=\vec{E}^2=\vec{E}* \vec{E}$. This can again be written in the bra-ket notation where  $\langle E|$ is the complex transpose of ket $|E\rangle$, with this we can mathematically correct calculate quantum state overlaps, as an example, we can express the normalization condition like this:

$$
\langle\Psi \mid \Psi\rangle=\left(\begin{array}{ll}
E_x^* & E_y^*
\end{array}\right) \cdot\left(\begin{array}{l}
E_x \\
E_y
\end{array}\right)=E_x^* E_x+E_y^* E_y=\left|E_x\right|^2+\left|E_y\right|^2=1
$$

`[slide] quantum measurement & probabilities`

Let’s consider one example, where $E_H=E_V=1/\sqrt{2}$. If we have a detector which only detects a certain polarization, with chance 1/2 we detect one $H$ photon and same for $V$.
Formally, we can describe quantum measurements like this: the probability that a detector that detects state $|\psi_{meas}\rangle$ clicks for a state $|\psi\rangle$ is $|\langle\psi_{meas}|\psi\rangle|^2$. By repeating the measurement many times, we can derive the detection probabilities of the states., e.g.:

$$
\left|\left\langle\Psi_{\text {detector }} \mid \Psi_{\text {photon }}\right\rangle\right|^2
\\
|\langle V \mid H\rangle|^2=0
\\
|\langle D \mid H\rangle|^2
= \left| \frac{1}{\sqrt{2}}(\langle H \mid+\langle V|) \, |H\rangle\right|^ 2=\frac{1}{2}
$$

`TODO: Q: how can we derive the quantum amplitudes, and can we do this unambiguously? [square root, but phase unclear, requires other measurements]`

Quantum mechanics (like any other theories) is based on a number of postulates, one postulate of quantum mechanics is, that if we measure the detection state $|\psi_{meas}\rangle$, then the state of the system will be in that state. 

`[slide] bases`

With this, we can easily calculate the probability of a detector that detects a different polarization. For instance, having again $|\psi\rangle = 1/\sqrt{2}(1,1)$, if we rotate the detector by 45 degrees so it detects only
$|D\rangle = 1/\sqrt{2}(1,1)$ photons, it would click every time, and $|A\rangle = 1/\sqrt{2}(1,-1)$ would never detect anything. This is because $|\psi\rangle$ is actually diagonally polarized.

We say that $H$ and $V$ polarizations form a basis, there are two orthogonal basis vectors because our state space is two-dimensional here (the quantum state is described by a 2-element vector). 

The other bases, in fact quantum superpositions of the HV-basis, are the DA basis 

$$
|D/A\rangle=1/\sqrt{2}(|H\rangle+/-|V\rangle)
$$

which corresponds to diagonal/antidiagonal linear polarization and 

$$
|R/L\rangle=1/\sqrt{2}(|H\rangle+/-i |V\rangle)
$$

which corresponds to right/left circular polarization.

`[slide] quantum measurement & normalization`

With this, we can already explain a first quantum experiment that highlights the meaning of quantum superpositions: 

A linear polarizer transmits light only completely of a certain orientation of the linear polarization, indicated by the angle alpha – which can be written as the jones vector $(\sin\alpha,\cos\alpha)$. 

We can think of this as a quantum measurement, with a state vector $|\psi_{meas}\rangle=(\sin\alpha,\cos\alpha)$. 

The probability to measure this state for horizontally polarized input light state $|H\rangl=(1,0)$ is as we had above $\sin^2(\alpha)$. 

For $\alpha=\pi/2$, vertical polarization, this is zero. 

Now we place a 3rd polarizer oriented at an angle $\pi/4$ in between the two polarizers, what is the transmission up to this point? It is 0.5 as $\sin^2(\pi/4)=0.5$. Now, the transmission of this light through the 3rd polarizer is again 50% of this, we obtain 0.25 total transmission. This might be seen surprising, but in terms of Jones vectors it is probably clear.

Now to a quantum description:
According to the rules of quantum mechanics, if the “measurement” of the middle polarizer is successful, the state after the middle polarizer is $(\sin(\pi/4),\cos(\pi/4)$, but this happens only with 50% chance. The last polarizer does the same, where we with a probability of in total 0.25 obtain the state.

This highlights the importance of quantum superpositions, which probably seem very natural for the polarization of light, but is in fact the cornerstone of quantum mechanics. In IQP we will see that quantum superpositions are also possible for matter systems, like electrons and other fundamental particles, and also for composite systems like electronic – photonic excitations or lattice vibrations.

