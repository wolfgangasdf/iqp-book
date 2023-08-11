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

# Evidence for quantum mechanics

## Quantizations

`[slide]`

What were the first indications that we need quantum mechanics to understand nature? We first have to clarify what "quantum means" - historically there happened two so-called "quantizations" of classical-mechanics models - and it clearly is a matter of taste if we do or do not consider both as describing true "quantum" effects:

The **first quantization** is the realization that we have to describe objects with (quantum) waves that are usually, or previously, assumed to be particles. This holds clearly for atoms, electrons, neutrons, protons and so on. But for light, I think that there was never the need for a first quantization since it was already considered to be a wave since Maxwell! 

But how do we get the quantum into light waves?

This is described by the **second quantization**, where wave fields become (again) quantized, for instance, by deriving a model where a light wave field can be excited with a single photon. Note, currently we think that the 2nd quantization is essential to build quantum machines which can do something really exciting - but this is still not fully known.


## Black body radiation

`[slide] black body`

Light has already long ago, since Newton, been postulated to consist of light particles but in a wrong way. More often it was thought to consist of electromagnetic waves since interference effects are evident even in every-day physics, think of the color of soap bubbles. In 1900, Max Planck published a theory of black-body radiation – this is about thermal radiation in equilibrium with a perfectly absorbing body – despite not black, the sun is to a good degree such a black body. The spectra of black body ratiation could not be explained with waves only, we had to assume that atoms emit and absorb discrete quanta of radiation with energy $E=hf$, where $f$ is the frequency of the radiation and $h$ is a fundamental constant of nature, the Planck constant with a value of $6.626\cdot 10^{-34}\,\mathrm{J s}$.

<!-- TODO: graph of planck spectrum. -->

## The energy of a photon
`[slide]`

Photons are particle-like quanta of electromagnetic radiation. In vacuum, they travel with speed $c$, another fundamental constant of nature. By using the property of any monochromatic (single-frequency) wave linking propagation speed to frequency and wavelength, $c=\lambda f$, $E=hc/\lambda$, and momentum $p=h/\lambda$. 

<!-- TODO: pic wave with c, lambda, frequency -->

Let us look at some numbers, for instance for a candle. A candle emits 1 *candela* and we assume the wavelength is (average) $\lambda=555nm$, which is yellow.

1 candela is 683 Joule per second. However, a Joule is a bad unit for photon energies since they are very small. We often use "electron Volts" $\mathrm{eV}$, and a single $555\,\mathrm{nm}$ photon has $2.23\,\mathrm{eV}$. Therefore, our candle emits around $10^{16}$ photons per second! In order to truly see quantum effects of light, one has to have environmental light very well under control.

## Double slit interference

`[slide] double slit]`

<!-- see Phillips fig. 1.2+1.3 -->

Nowadays we have access to arrayed cameras which have a noise level low enough to observe the absorption of single photons. This allows us to repeat known wave-optical experiments but see photons arriving one by one, if the light source is weak enough. 
Let's look at a classical interference experiment, the double-slit experiment. Here, a coherent laser source impinges on two narrow slits and far away an interference pattern can be observed:

<!-- TODO pic with interference pattern -->

We show in an exercise how this pattern can be calculated – for now it is enough to realize that the Huygens elementary waves emerging from the two slits have a path length difference that is proportional to $x$ and as a function of $x$, interference changes between destructive and constructive, therefore the wavy pattern visible on the right appears with intensity $I=E^2=\sin^2(c x)$ where $c$ depends on the parameters of the experiment.

Note that this is a wave-optical interference experiment and works in principle equally well for water waves.

### A single photon in a double slit

`[slide]`

Now we use our single-photon sensitive camera for detection. We see that each photon is detected at one specific position – but this position is largely random, however, if we wait and collect enough data we see that the probability follows the intensity distribution: $P(x)$ is like the intensity before $I(x)$ – which is the square of the electric field – as we see later, we can see the dimensionless and normalized $E(x)$ as the quantum wavefunction of photons – $\psi(x)$!
Note that the interference pattern disappears if one of the two slits is blocked – therefore the “photon” wave must have gone through both slits at once.
The double slit experiment with single-photon detection shows (i) quantum superpositions, that waves from one slit and the other perform quantum interferences, and (ii) that the wavefunction of a photon is truly non-local, it is nonzero for different positions. This sounds trivial here but becomes very fundamental if we take the particle aspect seriously – quantum nature is “nonlocal”, in contrast to our everyday experience of the “classical world”.

<!-- TODO: pic with single photon camera -->

`[slide] particle interference`

At the beginning of the 20th century, it was not clear that such interference doesn’t happen also for objects that people call particles. Nowadays, electron diffraction is observed regularly in transmission electron microscopes, neutrons are diffracted in crystals, and in dedicated experiments physicists have observed interference of buckeyballs (C60), many different molecules up to around 15000 atoms. 

<!-- [some pics from Aspelmeyer & Hornberger, Nat. Phys. 14, 271 (2014)].  -->

It is the theory of quantum mechanics that allows description of all these exciting experiments. There is a world-wide effort in increasing the size and mass of such “massive quantum superpositions” – we will see that the bigger the system gets, the harder is to exclude known reasons why we don’t see quantum interference – but currently the question why I find myself never in a spatial quantum superposition is not fully answered. The reason might lie that we don’t know how gravity acts in the quantum domain – we don’t have a quantum theory of gravity yet.

<!-- TODO: pics -->

## Atomic emission lines

`[slide] atomic emission lines`

Another strong indication that electrons also have wave character came from observing emission from molecular gasses and atomic vapour such as sodium. Physicists observe narrow bright “lines” and not a continuous emission spectrum as expected from black body radiation. Now, it turns out that these emission frequencies can be explained by assuming that the electron is described by a wave where allowed energies correspond waves with particular radii such that the electron wave repeats itself after one round trip., in the Born picture one calculates simply for which electron energies one obtains constructively interfering orbits of the electron and finds good agreement to experimental data.

```{figure} figures/basics/atomic-emission-lines.png
---
name: atomic-emission-lines
---
Hydrogen emission lines. The fact that they are lines in the first place is a very strong indication that electrons have wave-like properties.
```
<!-- TODO: figure from ph fig1.5 -->

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *

fig = plt.figure()
ax = fig.add_subplot(projection='3d')
ax.view_init(elev=20, azim=45, roll=0)
ax.set_aspect("equal")
u, v = mgrid[0:2*pi:20j, 0:pi:10j]
x = 0.2*cos(u)*sin(v)
y = 0.2*sin(u)*sin(v)
z = 0.2*cos(v)
ax.plot_wireframe(x, y, z, color="0.5", alpha=0.5)

fi=linspace(0,2*pi,100)
ax.plot(sin(fi), cos(fi), 0.2*sin(3*fi), color="r", linewidth=4)
ax.plot(sin(fi), cos(fi), 1+0.2*sin(6*fi), color="r", linewidth=4)
ax.plot(sin(fi), cos(fi), 2+0.2*sin(9*fi), color="r", linewidth=4)
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
plt.show()

glue("b-bohr", fig, display=False)
```

(b-bohr)=
```{glue:figure} b-bohr
If electrons are waves around the core of an atom, only particular wavelengths lead to closed orbits - with this simple model called the Bohr model, a surprisingly large amount of effects can be explained!
```

The underlying physics of all these phenomena will be explained in this course. Moreover, we will also show that quantum mechanics is needed to understand why atoms are stable in the first place, why the electron *does not fall* into the atomic nucleus.


