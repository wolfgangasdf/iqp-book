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

# Spin one half

## Spin 1/2 quantum states

<!-- Griffiths 4.4.1 -->
`[slide]`

We now discuss $s=1/2$, for instance for an electron – once we have understood this case it is quite simple to work out the formalism for any other spin. As we have seen before, there are only two possible values for $m_s$ and therefore there are just two eigenstates, now in the notation $\left|sm_s\right\rangle$:

$$
\left|sm_s\right\rangle=\left\{\left|\frac{1}{2}\frac{1}{2}\right\rangle,\left|\frac{1}{2}-\frac{1}{2}\right\rangle\right\}, 
$$

which we often call spin up and down, and we can write the state vectors as $|\uparrow\rangle$ and $|\downarrow\rangle$. 

In quantum information, the preferred notation called the computational basis is $\left|0\right\rangle$ and $\left|1\right\rangle$. In many quantum mechanics books, the spin states are called spinors $\chi_+$ and $\chi_-$, and a general spin state that is a quantum superposition of these basis states is written as 

$$
\chi=\left(\begin{array}{l}
a \\
b
\end{array}\right)=a \chi_{+}+b \chi_{-}
$$

In contrast to an electron in a harmonic potential, where we needed to add an anharmonicity to obtain a good two-level system for a qubit, we see that the spin of a single particle already defines a very nice two-level system that is potentially usable for quantum information processing! 

## Spin 1/2 algebra

`[slide]`

Now we can use relatively simple algebra – we have two basis states, therefore our spin-1/2 Hilbert space is two-dimensional, and  operators are $2x2$ matrices. Since our spin states are eigenstates of the operators $S^2$ and $S_z$ , we can work them out simply by calculating their eigenvalues for $\left|0\right\rangle$ and $\left|1\right\rangle$:

$$
S^2\left|0\right\rangle=\hbar^2\ s(s=1)=\frac{3}{4}\hbar^2\left|0\right\rangle,\\

S^2\left|1\right\rangle=\frac{3}{4}\hbar^2\left|1\right\rangle\\

S_z\left|0\right\rangle=\frac{\hbar}{2}\left|0\right\rangle, 		S^2\left|1\right\rangle=\frac{\hbar}{2}\left|1\right\rangle
$$

And we get 

$$
S^2=\frac{3}{4}\hbar^2\left(\begin{matrix}1&0\\0&1\\\end{matrix}\right),	S_z=\frac{\hbar}{2}\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$

For the spin ladder operators, and the other projection operators we obtain in a similar way:

$$
\mathrm{S}_{+}=\hbar\left(\begin{array}{ll}
0 & 1 \\
0 & 0
\end{array}\right), \quad \mathrm{S}_{-}=\hbar\left(\begin{array}{ll}
0 & 0 \\
1 & 0
\end{array}\right)
$$

Since $S_{ \pm}=S_x \pm i S_y$, we have $S_x=(1 / 2)\left(S_{+}+S_{-}\right)$ and $S_y=(1 / 2 i)\left(S_{+}-S_{-}\right)$, and with this we obtain

$$
\mathrm{S}_x=\frac{\hbar}{2}\left(\begin{array}{ll}0 & 1 \\ 1 & 0\end{array}\right), \quad \mathrm{S}_y=\frac{\hbar}{2}\left(\begin{array}{cc}0 & -i \\ i & 0\end{array}\right)
$$

TODO: [ex: Griffith example 4.2 & see text below!]

## Pauli matrices

`[slide]`

It turns out that the S_i matrices are so fundamental in quantum mechanics that after pulling out the factor $\hbar/2$ they get another name, the spin Pauli matrices $\sigma_i$:

$$
\sigma_x=\left(\begin{matrix}0&1\\1&0\\\end{matrix}\right), 		\sigma_y=\left(\begin{matrix}0&-i\\i&0\\\end{matrix}\right), 	\sigma_x=\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
$$

The spin operator (vectorial here) can then be written as $\vec{S}=\left(\hbar/2\right)\vec\sigma$ with $\vec\sigma=\left(\sigma_x,\sigma_y,\sigma_z\right)$.

The Pauli matrices $\sigma$ form the basis of unitary operators on spin states. Since the spin-1/2 system is equivalent to any two-level system describing qubits, the whole algebra for qubits is based on them!

## Bloch sphere

`[slide]`

TODO: from http://www.vcpc.univie.ac.at/~ian/hotlist/qc/talks/bloch-sphere-rotations.pdf


















