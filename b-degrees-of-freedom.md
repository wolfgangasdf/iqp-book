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

# Degrees of freedom

## Degrees of freedom of light
`[slide]`

To start, we continue with light, we have used the polarization as an example, what else? Frequency or wavelength, the time of light pulses or single photons, or the spatial structure are equally valid degrees of freedom in which we can encode information. In contrast to polarization of a light beam, which only has 2 orthogonal basis vectors, the others are what we call continuous degrees of freedom, therefore we would need to make a discrete and orthogonal basis. Examples are time “bins”, frequency bins, or spatial bins or modes. Important is that in the other cases, we do not only have two basis states, but we can have more – higher-dimensional (d) spaces.

As an interesting side note, in principle one can do universal quantum computation with laser beams – but the amount of optical elements needed scales exponentially with the number of qubits, similar to classical simulation of a quantum computer. You will learn more in other courses, basically, it is the overall dimension of the state space (the vectors before!), or Hilbert space, that counts. This is $d^N$, where $d$ is the dimension of the single quantum state from before, and $N$ is the number of particles. We can think of a particle as an entity on which we can do measurements.

<!-- TODO pics: polarization, positions, frequencies, also more. -->

## Fundamental particles
`[slide]`

For quantum technologies, very important is the understanding of the quantum behaviour of fundamental particles, how they can be controlled on the quantum level. In this course, we will study the quantum behaviour of free electrons and other massive particles like neutrons and protons, electrons bound in potential wells and atoms like the hydrogen atom, the angular momentum degree of freedom, and in particular the “spin” of electrons and other fundamental particles.

Which particles are useful for quantum technologies depends on our ability to isolate them from the environment, and the ability to control quantum states, but to figure this out, first their behaviour on the quantum level must be understood. 

<!-- TODO: pics of particles: photon, electron, neutron, proton, 
then atom: it's already composite! -->

## Composite quantum systems
`[slide]`

You might object that protons and neutrons are fundamental particles, since they consist of quarks. Yes, also composite systems show quantum behaviour and can often be treated as if they were a "single" particles, as long as we don't *look inside* the composite system, for which we would need high energies as we will see. For instance, for all normal-energy experiments, the nucleus of an atom can be considered as a single entity - only in large particle accellerators the interior of the nucleus can be investigated.

Therefore, understanding how fundamental particles behave quantum mechanically can be directly translated for understanding of composite systems. Nowadays we can control the quantum state of billions of electrons forming supercurrents in superconducting qubits, and control crystal lattice vibrations of millions of atoms. We have seen quantum interference of molecules with thousand of atoms, and we are working towards quantum control of nanometer-sized objects.

<!-- TODO: pics -->


