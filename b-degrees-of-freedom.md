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

In this section we briefly discuss different degrees of freedom in which we can encode quantum information, and give a glimpse into the physical systems which can carry quantum information - from fundamental particles to composite systems.


## Degrees of freedom of light
`[slide]`

To start, we continue with light, we have used the polarization as an example, what else? Frequency or wavelength, the time of light pulses or single photons, or the spatial structure are equally valid degrees of freedom in which we can encode information. In contrast to polarization of a light beam, which only has 2 orthogonal basis vectors, the others are what we call continuous degrees of freedom, therefore we would need to make a discrete and orthogonal basis. Examples are time “bins”, frequency bins, or spatial bins or modes. Important is that in the other cases, we do not only have two basis states, but we can have more – higher-dimensional (d) spaces.

As an interesting side note, in principle one can do universal quantum computation with laser beams – but the amount of optical elements needed scales exponentially with the number of qubits, similar to classical simulation of a quantum computer. You will learn more in other courses, basically, it is the overall dimension of the state space (the vectors before!), or Hilbert space, that counts. This is $d^N$, where $d$ is the dimension of the single quantum state from before, and $N$ is the number of particles. We can think of a particle as an entity on which we can do measurements.

## Fundamental particles and composite systems
`[slide]`

For quantum technologies, very important is the understanding of the quantum behaviour of fundamental particles, how they can be controlled on the quantum level. In this course, we will study the quantum behaviour of free electrons and other massive particles like neutrons and protons, electrons bound in potential wells and atoms like the hydrogen atom - those are shown in the figure. Besdides that we will study the angular momentum degree of freedom, and in particular the “spin” of electrons and other fundamental particles.

Which particles are useful for quantum technologies depends on our ability to isolate them from the environment, and the ability to control quantum states, but to figure this out, first their behaviour on the quantum level must be understood. 

You might object that protons and neutrons are fundamental particles, since they consist of quarks. Yes, also composite systems show quantum behaviour and can often be treated as if they were a "single" particles, as long as we don't *look inside* the composite system, for which we would need high energies as we will see. For instance, for all normal-energy experiments, the nucleus of an atom can be considered as a single entity - only in large particle accellerators the interior of the nucleus can be investigated.

```{figure} figures/basics/atom.pdf
---
name: b-atom
scale: 50%
---
The constituents of an atom.
```


Therefore, understanding how fundamental particles behave quantum mechanically can be directly translated for understanding of composite systems. Nowadays we can control the quantum state of billions of electrons forming supercurrents in superconducting qubits, and control crystal lattice vibrations of millions of atoms. We have seen quantum interference of molecules with thousand of atoms, and we are working towards quantum control of nanometer-sized objects.

```{figure} figures/basics/nanobeam.png
---
name: nanobeam
scale: 50%
---
A so-called optomechanical nanobeam resonator, where a mechanical breathing mode has shown clear quantum behaviour, despite it consists of a very large number of atoms, the diameter of the nanobeam is a few 100 nano meters. The top panel shows a computer simulation of such a mode, the bottom panel an electron microscope picture. Image credit: [Gröblacher lab](https://groeblacherlab.tudelft.nl/)
```


