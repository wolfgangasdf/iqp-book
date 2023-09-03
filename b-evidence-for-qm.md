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

In this section, we briefly outline the key experimental observations more than 100 years ago that showed that quantum mechanics is an essential model to explain the bahaviour of nature, at least on the microscopic scale.


## Black body radiation

`[slide]`

Already long ago, since Newton, light has been postulated to consist of light particles. But, more often light was thought to consist of electromagnetic waves since interference effects are evident even in every-day physics, think of the color of soap bubbles. In 1900, Max Planck published a theory of black-body radiation. It was known that hot materials such as a glowing piece of metal emit light, and in a so-called *black body*, thermal radiation is in equilibrium with the body. Our sun is such a black body, and it is quite easy to measure the spectrum of the sun, that is the color- or frequency dependent intensity. These spectra of black body ratiation could not be explained with classical light waves - as shown in the figure, the classical *Rayleigh-Jeans* model predicts a divergence of the intensity towards short wavelengths which is clearly in contradiction to the yellow color of the sun. 

Only after Planck and others assumed that atoms emit and absorb discrete quanta of radiation, this issue was solved and the models resulted in the observed spectra. These quanta or photons have an energy $E=hf$, where $f$ is the frequency of the radiation and $h$ is a fundamental constant of nature, the Planck constant with a value of $h=6.626\cdot 10^{-34}\,\mathrm{J s}$.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(4,3))
lam=asarray([300.0, 305.0, 310.0, 315.0, 320.0, 325.0, 330.0, 335.0, 340.0, 345.0, 350.0, 360.0, 370.0, 380.0, 390.0, 400.0, 410.0, 420.0, 430.0, 440.0, 450.0, 460.0, 470.0, 480.0, 490.0, 500.0, 510.0, 520.0, 530.0, 540.0, 550.0, 570.0, 593.0, 610.0, 630.0, 656.0, 667.6, 690.0, 710.0, 718.0, 724.4, 740.0, 752.5, 757.5, 762.5, 767.5, 780.0, 800.0, 816.0, 823.7, 831.5, 840.0, 860.0, 880.0, 905.0, 915.0, 925.0, 930.0, 937.0, 948.0, 965.0, 980.0, 993.5, 1040.0, 1070.0, 1100.0, 1120.0, 1130.0, 1145.0, 1161.0, 1170.0, 1200.0, 1240.0, 1270.0, 1290.0, 1320.0, 1350.0, 1395.0, 1442.5, 1462.5, 1477.0, 1497.0, 1520.0, 1539.0, 1558.0, 1578.0, 1592.0, 1610.0, 1630.0, 1646.0, 1678.0, 1740.0, 1800.0, 1860.0, 1920.0, 1960.0, 1985.0, 2005.0, 2035.0, 2065.0, 2100.0, 2148.0, 2198.0, 2270.0, 2360.0, 2450.0, 2500.0, 2600.0, 2700.0, 2800.0, 2900.0, 3000.0, 3100.0, 3200.0, 3300.0, 3400.0, 3500.0, 3600.0, 3700.0, 3800.0, 3900.0, 4000.0])
sunirrad = asarray([0.5359, 0.5583, 0.622, 0.6927, 0.7151, 0.8329, 0.9619, 0.9319, 0.9006, 0.9113, 0.9755, 0.9759, 1.1199, 1.1038, 1.0338, 1.4791, 1.7013, 1.7404, 1.5872, 1.837, 2.005, 2.043, 1.987, 2.027, 1.896, 1.909, 1.927, 1.831, 1.891, 1.898, 1.892, 1.84, 1.768, 1.728, 1.658, 1.524, 1.531, 1.42, 1.399, 1.374, 1.373, 1.298, 1.269, 1.245, 1.223, 1.205, 1.183, 1.148, 1.091, 1.062, 1.038, 1.022, 0.9987, 0.9472, 0.8932, 0.8682, 0.8297, 0.8303, 0.814, 0.7869, 0.7683, 0.767, 0.7576, 0.6881, 0.6407, 0.6062, 0.5859, 0.5702, 0.5641, 0.5442, 0.5334, 0.5016, 0.4775, 0.4427, 0.44, 0.4168, 0.3914, 0.3589, 0.3275, 0.3175, 0.3073, 0.3004, 0.2928, 0.2755, 0.2721, 0.2593, 0.2469, 0.244, 0.2435, 0.2348, 0.2205, 0.1908, 0.1711, 0.1445, 0.1357, 0.123, 0.1238, 0.113, 0.1085, 0.0975, 0.0924, 0.0824, 0.0746, 0.0683, 0.0638, 0.0495, 0.0485, 0.0386, 0.0366, 0.032, 0.0281, 0.0248, 0.0221, 0.0196, 0.0175, 0.0157, 0.0141, 0.0127, 0.0115, 0.0104, 0.0095, 0.0086 ]) # W/m^2/nm
x=linspace(0.1, 3, 501)
c=3e14
h=6.626e-22
k=1.38e-11
pt=[4000,5000,6000]
for t in pt:
    p=1e-6*2*h*c**2/(x**5*(exp(h*c/(x*k*t))-1))
    ax.plot(x, p, label="Planck T=" + str(t))
rj=1e-6*2*c*k*5000/(x**4) #Rayleigh-Jeans
ax.plot(x,rj,label="Rayleigh-Jeans T=5000", color='gray')
ax.plot(lam/1000,sunirrad*12,label="sun, rescaled", color='red')
ax.set_xlabel('Wavelength (µm)')
ax.set_ylabel('Spectral radiance ($kW\cdot sr^{-1}\cdot m^{-2}\cdot nm^{-1}$)')
ax.set_ylim([0,35])
ax.legend()

glue("b-planck", fig, display=False)
```

(b-planck)=
```{glue:figure} b-planck
Optical spectra of blackbody radiators for different temperatures, comparing the non-quantum Rayleigh-Jeans model to the Planck model.
```


## The energy of a photon
`[slide]`

Photons are particle-like quanta of electromagnetic radiation. In vacuum, they travel with speed $c$, another fundamental constant of nature. By using the property of any monochromatic (single-frequency) wave linking propagation speed to frequency and wavelength, $c=\lambda f$, $E=hc/\lambda$, and momentum $p=h/\lambda$. 

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(1,2,figsize=(8,3))
x=linspace(0, 3e-6, 501)
c=3e8
lam=1e-6
f=c/lam
k=2*pi/lam
ax[0].plot(x/(1.0e-6),sin(k*x))
ax[0].set_xlabel('Position $x$ (µm)')
ax[0].set_ylabel('Field amplitude (arb. u.) $u(x,t=0)$')
t=linspace(0, 10e-15, 501)
ax[1].plot(t/(1.0e-15),sin(2*pi*f*t))
ax[1].set_xlabel('Time $t$ (fs)')
ax[1].set_ylabel('Field amplitude (arb. u.) $u(x=0,t)$')
ax[1].yaxis.tick_right()

glue("b-wave", fig, display=False)
```

(b-wave)=
```{glue:figure} b-wave
An electromagnetic wave moving in $x$-direction as a function of $x$-position and time $t$. The wave is monochromatic with wavelength $\lambda=1$ µm, which corresponds in free-space to a frequency of $f=c/\lambda=3\cdot 10^{14}\, \mathrm{Hz}$ which is 300 Tera Hertz.
```

Let us look at some numbers, for instance for a candle. A candle emits 1 *candela* and we assume the wavelength is (average) $\lambda=555\,\mathrm{nm}$, which is yellow.

1 candela is 683 Joule per second. However, a Joule is a bad unit for photon energies since they are very small. We often use "electron Volts" $\mathrm{eV}$, and a single $555\,\mathrm{nm}$ photon has $2.23\,\mathrm{eV}$. Therefore, our candle emits around $10^{16}$ photons per second! In order to truly see quantum effects of light, one has to have environmental light very well under control.

## Double slit interference

`[slide]`

Nowadays we have access to arrayed cameras which have a noise level low enough to observe the absorption of single photons. This allows us to repeat known wave-optical experiments but see photons arriving one by one, if the light source is weak enough. 
Let's look at a classical interference experiment, the double-slit experiment. Here, a coherent laser source impinges on two narrow slits and far away an interference pattern can be observed:

We show in an exercise how this pattern can be calculated – for now it is enough to realize that the Huygens elementary waves emerging from the two slits have a path length difference that is proportional to $x$ and, as a function of $x$, interference changes between destructive and constructive, therefore the wavy pattern visible on the right appears!

Note that this is a wave-optical interference experiment and works in principle equally well for water waves.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(8,6))
ax.set_aspect("equal")
fi=linspace(0,pi,200)
fin=linspace(pi/4,3/4*pi,200)
ax.add_patch(plt.Rectangle((-0.2,-0.9),0.2,1.8, color="black"))
ax.add_patch(plt.Rectangle((-0.2,-4),0.2,2.9, color="black"))
ax.add_patch(plt.Rectangle((-0.2,4),0.2,-2.9, color="black"))
ax.plot(-6+5*sin(fi),5*cos(fi),color='gray')
ax.plot(-6+4*sin(fi),4*cos(fi),color='gray')
ax.plot(1*sin(fin),1+1*cos(fin),color='gray')
ax.plot(2*sin(fin),1+2*cos(fin),color='gray')
ax.plot(1*sin(fin),-1+1*cos(fin),color='gray')
ax.plot(2*sin(fin),-1+2*cos(fin),color='gray')
xs=5
ax.add_patch(plt.Rectangle((xs-0.2,-4),0.2,8, color="black"))
y=linspace(-4,4,300)
def ds(th,lam,b,d):
    return (cos(pi*d*sin(th)/lam)*sinc(pi*b*sin(th)/lam))**2
yds=ds(y/xs,0.2,0.1,2)
ax.plot(xs+0.2+yds,y,color="darkorange") 
ax.fill_betweenx(y, xs+0.2+yds,xs+0.2,color="orange") 
ax.plot([0,xs],[-1,1.2],':',color="gray")
ax.plot([0,xs],[1,1.2],':',color="gray")
ax.text(xs,4.1,"x",fontsize=15)
ax.set_xlim([-3,13])
ax.set_ylim([-5,5])
ax.axis("off")

glue("b-ds", fig, display=False)
```

(b-ds)=
```{glue:figure} b-ds
In the double-slit experiment, a coherent wave is incident from the left, excites elementary waves at both slits which then interfere constructively and destructively on the screen on the right - forming an interference pattern.
```


## A single photon in a double slit

`[slide]`

Now we use our single-photon sensitive camera for detection. We see that each photon is detected at one specific position, most clear on the right for $N=100$ photons. The individual position of the detected photons appears largely random, however, if we wait and collect more photons we see that the probability follows the intensity distribution from the classical experiment before!

We see that the probability distribution to detect a photon at a position $x$, $P(x)$, has the same shape as the intensity $I(x)$ before. The intensity is the square of the electric field $E(x)$, and analogous, the photon detection probability distribution is the square of the the quantum wavefunction of photons – $\psi(x)$, as you will see later in more detail.

It is also important to realize that, as in the classical case, the interference pattern disappears if one of the two slits is blocked – therefore the *photon wave* must have gone through both slits at once. The double slit experiment with single-photon detection shows (i) quantum superpositions, that waves from one slit and the other perform quantum interferences, and (ii) that the wavefunction of a photon is truly non-local, it is nonzero for different positions. This sounds trivial here but becomes very fundamental if we take the particle aspect seriously – quantum nature is “nonlocal”, in contrast to our everyday experience of the “classical world”. This coexistence of wave and particle properties is called *wave-particle duality*.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(8,6))
ax.set_aspect("equal")
fi=linspace(0,pi,200)
fin=linspace(pi/4,3/4*pi,200)
ax.add_patch(plt.Rectangle((-0.2,-0.9),0.2,1.8, color="black"))
ax.add_patch(plt.Rectangle((-0.2,-4),0.2,2.9, color="black"))
ax.add_patch(plt.Rectangle((-0.2,4),0.2,-2.9, color="black"))
ax.plot(-6+5*sin(fi),5*cos(fi),color='gray')
ax.plot(-6+4*sin(fi),4*cos(fi),color='gray')
ax.plot(1*sin(fin),1+1*cos(fin),color='gray')
ax.plot(2*sin(fin),1+2*cos(fin),color='gray')
ax.plot(1*sin(fin),-1+1*cos(fin),color='gray')
ax.plot(2*sin(fin),-1+2*cos(fin),color='gray')
xs=5
ax.add_patch(plt.Rectangle((xs-0.2,-4),0.2,8, color="black"))
y=linspace(-4,4,300)
def ds(th,lam,b,d):
    return (cos(pi*d*sin(th)/lam)*sinc(pi*b*sin(th)/lam))**2
yds=ds(y/xs,0.2,0.1,2)
ax.plot(xs+0.2+yds,y,color="darkorange") 
ax.fill_betweenx(y, xs+0.2+yds,xs+0.2,color="orange") 
xs=7
yr=random.choice(y, size=100, p=yds/sum(yds))
ax.scatter(xs+0.2+1.0*random.random(size=shape(yr)),yr,marker=".",s=1,color="black")
ax.text(xs,4,"N=100")
xs=8.5
yr=random.choice(y, size=300, p=yds/sum(yds))
ax.scatter(xs+0.2+1.0*random.random(size=shape(yr)),yr,marker=".",s=1,color="black")
ax.text(xs,4,"N=300")
xs=10
yr=random.choice(y, size=1000, p=yds/sum(yds))
ax.scatter(xs+0.2+1.0*random.random(size=shape(yr)),yr,marker=".",s=1,color="black")
ax.text(xs,4,"N=1000")
ax.axis("off")
ax.set_xlim([-3,13])
ax.set_ylim([-5,5])

glue("b-dssp", fig, display=False)
```

(b-dssp)=
```{glue:figure} b-dssp
If we use a single-photon sensitive camera, we can see the build-up of the interference pattern - but before being detected at a particular position, each photon's wavepacket must have passed both slits, otherwise the interference pattern would not be visible.
```

`[slide]`

At the beginning of the 20th century, it was not clear that such interference doesn’t happen also for objects that people call particles. Nowadays, electron diffraction is observed regularly in transmission electron microscopes, neutrons are diffracted in crystals, and in dedicated experiments physicists have observed interference of buckeyballs (C60), and many different molecules up to around 2000 atoms. 

It is the theory of quantum mechanics that allows description of all these exciting experiments. There is a world-wide effort in increasing the size and mass of such “massive quantum superpositions” – we will see that the bigger the system gets, the harder it is to exclude known reasons why we don’t see quantum interference. We have good theories and models explaining why I find myself never in a spatial quantum superposition, but for smaller massive particles say of one micro meter, the case is less clear. The reason might lie in the fact that we don’t know how gravity acts in the quantum domain – we don’t have a quantum theory of gravity yet.

```{figure} figures/basics/fein2019.png
---
name: macromolecule-interference
---
Double-slit like interference of a macromolecule. This experiment done in M. Arndt's group in Vienna uses molecules consisting of around 2000 atoms and a mass of more than 25,000 Da - and it behaves beautifully quantum mechanically if everything is controlled very carefully. Image from [Fein et al., Nat. Phys. 15, 1242 (2019)](https://doi.org/10.1038/s41567-019-0663-9).
```

## Atomic emission lines

`[slide]`

Another strong indication that electrons also have wave character came from observing emission from molecular gasses and atomic vapour such as sodium. Physicists observe narrow bright “lines” and not a continuous emission spectrum as expected from black body radiation. Now, it turns out that these emission frequencies can be explained by assuming that the electron is described by a wave circling around the atom nucleus, and that allowed energies correspond to waves with particular radii such that the electron wave repeats itself after one round trip: The so-called Bohr model. With this simple and as you will later see very crude picture, one finds good agreement to experimental data!

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(4,2))
# from https://physics.nist.gov/PhysRefData/Handbook/Tables/hydrogentable2.htm
h_int=array([15,20,30,50,100,300,1000,500,5,6,8,15,30,30,10,60,90,30,180,5,7,12,20,40,5,8,15,4,6,3])
h_ang=array([926.2256,930.7482,937.8034,949.743,972.5367,1025.7222,1215.66824,1215.67364,3835.384,3889.049,3970.072,4101.74,4340.462,4861.2786,4861.287,4861.3615,6562.711,6562.7248,6562.8518,9545.97,10049.4,10938.1,12818.07,18751.01,21655.3,26251.5,40511.6,46525.1,74578,123685])
ax.stem(h_ang/10, log(h_int),markerfmt=' ')
ax.set_xlabel('Wavelength / nm')
ax.set_ylabel('Intensity')
ax.set_xlim([50,500])

glue("h-lines", fig, display=False)
```

(h-lines)=
```{glue:figure} h-lines
Hydrogen emission lines. The fact that they are lines in the first place is a very strong indication that electrons have wave-like properties.
```



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
ax.plot_wireframe(x, y, 1+z, color="0.5", alpha=0.5)
ax.plot(sin(fi), cos(fi), 1+0.2*sin(6*fi), color="r", linewidth=4)
ax.plot_wireframe(x, y, 2+z, color="0.5", alpha=0.5)
ax.plot(sin(fi), cos(fi), 2+0.2*sin(9*fi), color="r", linewidth=4)
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
ax.axis("off")
plt.show()

glue("b-bohr", fig, display=False)
```

(b-bohr)=
```{glue:figure} b-bohr
If electrons are waves around the core of an atom, only particular wavelengths lead to closed orbits - with this simple model called the Bohr model, a surprisingly large amount of effects can be explained - including the atomic emission lines in the previous figure!
```

The underlying physics of all these phenomena will be explained in this course. Moreover, we will also show that quantum mechanics is needed to understand why atoms are stable in the first place, why the electron *does not fall* into the atomic nucleus.

## The two quantizations

`[slide]`

You will see in this course that *quantum* can mean different things, and it sometimes is also a matter of taste. Historically, two so-called "quantizations" happened:

The **first quantization** is the realization that we have to describe objects with (quantum) waves that are usually, or previously, assumed to be particles. This holds clearly for atoms, electrons, neutrons, protons and so on. But for light, I think that there was never the need for a first quantization since it was already considered to be a wave since Maxwell! 

But how do we get the quantum into light waves?

This is described by the **second quantization**, where wave fields become (again) quantized, for instance, by deriving a model where a light wave field can be excited with a single photon. Note, currently we think that the 2nd quantization is essential to build quantum machines which can do something really exciting.

```{code-cell} ipython3
:tags: [hide-input, remove-output]

from matplotlib import pyplot as plt
from myst_nb import glue
from numpy import *
fig, ax = plt.subplots(figsize=(8,6))
ax.set_aspect("equal")
ax.add_patch(plt.Circle((0,0),0.3, color="orange"))
ax.arrow(0.6,0,0.3,0, linewidth=3, head_width=0.05, color='black')
x=linspace(-0.5, 0.5, 101)
y=sin(x*50)*exp(-x**2/0.05)
ax.plot(x+2,y)
ax.arrow(3,1,0.3,0.5, linewidth=3, head_width=0.05, color='black')
ax.arrow(3,0,0.3,0, linewidth=3, head_width=0.05, color='black')
ax.arrow(3,-1,0.3,-0.5, linewidth=3, head_width=0.05, color='black')
ax.text(1.5,0.5,"$\Psi$",fontsize=20)
dx=4
ax.plot(dx+x,y+2,color="tab:blue")
ax.plot(dx+x,y,color="tab:blue")
ax.plot(dx+x,y-2,color="tab:blue")
ax.add_patch(plt.Circle((dx,2),0.15, color="orange",zorder=100))
ax.add_patch(plt.Circle((dx-0.2,0),0.15, color="orange",zorder=100))
ax.add_patch(plt.Circle((dx+0.2,0),0.15, color="orange",zorder=100))
ax.add_patch(plt.Circle((dx+0.2,-2.2),0.15, color="orange",zorder=100))
ax.add_patch(plt.Circle((dx-0.2,-2.2),0.15, color="orange",zorder=100))
ax.add_patch(plt.Circle((dx,-1.8),0.15, color="orange",zorder=100))
ax.text(0.2,0.5,"1st\nquantization")
ax.text(2.3,0.5,"2nd\nquantization")
ax.axis("off")

glue("b-quant", fig, display=False)
```

(b-quant)=
```{glue:figure} b-quant
In the first quantization, a particle gets wave properties, and in the second quantization, a quantum wave can be exited a discrete number of times - corresponding again to particles.
```



