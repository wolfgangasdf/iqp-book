---
kernelspec:
    display_name: Python 3
    language: python
    name: python3
numbering:
    headings: true
    figure:
        continue: true
        enumerator: "2.%s"
    equation:
        continue: true
        enumerator: "2.%s"
---

# The square well potential

In this section, we discuss the square well potential, this appears often in quantum physics, and is useful to learn various concept. We will solve the Schrödinger equation and find the eigenstates or wavefunctions along with their eigenvalues, the energies.

```{seealso}
Further reading: Griffiths Chapter 2.2
```

## A particle in a box

:::{slidetag}
:::

<!-- Gr 2.2.  -->

The square well potential is described by the following function: 

$$
V\left(x\right)=\begin{cases}
    0, & \text{if } 0\le x \le a\\
    \infty, & \text{otherwise}.
  \end{cases}
$$(se-sw-1)

This means that a particle in this potential can move freely inside the well and the probability of finding the particle outside of it is zero: $\psi\left(x\right)=0$. 

```{code-cell} ipython3
:tags: [remove-input]
:label: potential-well
:caption: The infinite square potential well. The particle is confined to the region $0<x<a$, where $V(x)=0$, while the potential is infinite outside the well.

from matplotlib import pyplot as plt
from numpy import *

fig, ax = plt.subplots(figsize=(4, 3))

# Plot limits
x_min = -0.2
x_max = 1.2
wall_height = 5

# Grey forbidden regions
ax.axvspan(x_min, 0, color="0.85", zorder=0)
ax.axvspan(1, x_max, color="0.85", zorder=0)

# Potential inside the well
x = linspace(0, 1, 500)
ax.plot(x, zeros_like(x), color="red", linewidth=2)

# Infinite walls — start exactly at x/a = 0 and x/a = 1
ax.plot([0, 0], [0, wall_height], color="red", linewidth=2.5)
ax.plot([1, 1], [0, wall_height], color="red", linewidth=2.5)

# Labels
ax.text(0.5, 0.25, r"$V=0$", ha="center", va="bottom", fontsize=10)
ax.text(-0.04, 4.2, r"$V=\infty$", ha="right", va="center", fontsize=10)
ax.text(1.04, 4.2, r"$V=\infty$", ha="left", va="center", fontsize=10)

# Axes
ax.set_xlabel(r"$x/a$")
ax.set_ylabel(r"$V(x)$")

ax.set_xlim(x_min, x_max)
ax.set_ylim(0, wall_height)

ax.set_xticks([0, 1])
ax.set_yticks([])

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

fig.tight_layout()
```



Inside the well the potential energy is zero such that the time independent Schrödinger equation reads: 

$$
-\frac{\hbar^2}{2m}\frac{d^2\psi}{dx^2}=E\psi\quad \text{or}\quad  \frac{d^2\psi}{dx^2}=-k^2\psi\quad \text{where } k\equiv\sqrt{2mE}/\hbar
$$(se-sw-2)

This equation is the classical harmonic oscillator equation describing for instance a mass on a spring. The general solution is:

$$\psi\left(x\right)=A\sin{\left(kx\right)}+B\cos(kx)$$(se-sw-3)

where $A$ and $B$ are constants. 

:::{slidetag}
:::


These constants are fixed by the boundary conditions $\psi\left(0\right)=\psi\left(a\right)=0$ and general conditions on $\Psi$: Usually, both $\psi$ and $d\psi/dx$ must be continuous – the latter however does not apply here because the potential goes to infinity. 

:::{note}
Show that this solution solves the differential equation!
::: 


Since $\psi(0)=0$, we require that $B=0$.

We are left with $\psi\left(x\right)=A\sin(kx)$. Then $\psi\left(a\right)=A\sin{\left(ka\right)}=0$ gives that either $A=0$, which is a non-normalizable trivial solution, there would be no particle, or else $\sin{\left(ka\right)}=0$, which means that $ka=0,\ \pm\pi,\ \pm2\pi,\ \ldots$

Here $k=0$ again gives a non-normalizable solution, and the negative solutions give nothing new except for a minus sign which we can absorb into the constant $A$. Therefore, the distinct solutions are: $k_n=\frac{n\pi}{a}$ with $n=1,2,3,\ldots$ We see that, the second boundary condition does not determine the constant $A$, but gives discrete possible values for it, which leads to discrete possible values for the energy $E$: 

$$
E_n=\frac{\hbar^2k_n^2}{2m}=\frac{n^2\pi^2\hbar^2}{2ma^2}
$$(se-sw-4)

We see that the energy for a particle in a box is quantized, it cannot have just any value!

:::{slidetag}
:::


Now, we can find the value of $A$ by normalizing the wavefunction, since want to study the situation where we have a particle in our potential well: 

$$
\int_{0}^{a}{\left|A\right|^2\sin^2\left(kx\right)dx}=\left|A\right|^2\frac{a}{2}=1
$$(se-sw-5)

This gives $A=\sqrt{2/a}$. 

With this, inside the well, the solutions are: 

$$
\psi_n\left(x\right)=\sqrt{\frac{2}{a}}\sin\left(\frac{n\pi}{a}x\right)
$$(se-sw-6)


These solutions are mutually orthogonal, one case show that

$$
\int \psi_m(x)^* \psi_n(x) d x=\delta_{m n}
$$(se-sw-7)

where the Kronecker delta is defined by 

$$
\delta_{m n}= \begin{cases}0, & m \neq n \\ 1, & m=n\end{cases}
$$(se-sw-8)

## Particle in a box wavefunctions

:::{slidetag}
:::


Here we show the first 5 wavefunctions of the square well. The particle in the state $n=1$ has the lowest energy and is therefore called the ground state, the other states we call excited states. They have $n-1$ nodes as visible in the figure, where we have vertically offsetted the curves - all oscillate around zero!

```{code-cell} ipython3
:tags: [remove-input]
:label: potential-well-wavefunctions
:caption: The first wavefunctions of an infinite-well potential. All wavefunctions oscillate around zero, they are shown vertically offsetted for better visibility.

import altair as alt
import numpy as np
import pandas as pd
from altair.vegalite.v6.display import html_renderer, png_renderer

def html_png_renderer(spec, **metadata):
    bundles = [html_renderer(spec, template="inline", **metadata), png_renderer(spec, scale_factor=2)]
    return {k: v for b in bundles for k, v in (b[0] if isinstance(b, tuple) else b).items()}

alt.renderers.register("html_png", html_png_renderer)
alt.renderers.enable("html_png")

# Slider for the well width a; its value is available as "a" in the expressions below
a = alt.param(name="a", value=1.0, bind=alt.binding_range(min=0.5, max=1.5, step=0.01, name="Well width a: "))

# Data: n = 1..5 and u = x/a from 0 to 1. Everything else is computed in the browser from a.
df = pd.DataFrame([(n, u) for n in range(1, 6) for u in np.linspace(0, 1, 80)], columns=["n", "u"])
# In the formulas, datum.<col> is the current row and a is the slider value
waves = alt.Chart(df).transform_calculate(
    x="a * datum.u",
    E="datum.n * datum.n / (a * a)",                               # E_n in units of E_1(a=1)
    psi="datum.E + 2 * sqrt(2 / a) * sin(datum.n * PI * datum.u)",  # psi_n, shifted up by E_n
)
curves = waves.mark_line(clip=True).encode(
    x=alt.X("x:Q", title="x", scale=alt.Scale(domain=[-0.25, 1.75], nice=False)),
    y=alt.Y("psi:Q", title="E / E₀", scale=alt.Scale(domain=[0, 28])),
    color="n:N",
)
levels = waves.mark_line(clip=True, color="black", strokeDash=[5, 5], strokeWidth=1).encode(
    x="x:Q", y="E:Q", detail="n:N"
)

# The well: white inside (the background outside is grey), red potential (0,28) -> (0,0) -> (a,0) -> (a,28)
inside = alt.Chart(df.head(1)).transform_calculate(left="0", right="a").mark_rect(color="white").encode(
    x="left:Q", x2="right:Q", y=alt.datum(0), y2=alt.datum(28)
)
potential = alt.Chart(pd.DataFrame({"u": [0, 0, 1, 1], "y": [28, 0, 0, 28], "step": [1, 2, 3, 4]})).transform_calculate(
    x="a * datum.u"
).mark_line(color="red", strokeWidth=2.5).encode(x="x:Q", y="y:Q", order="step:Q")

alt.layer(inside, potential, levels, curves).add_params(a).properties(width=600, height=450).configure_view(
    fill="lightgray", stroke=None
).configure_axis(grid=False, labelFontSize=16, titleFontSize=20).configure_legend(labelFontSize=16, titleFontSize=18)
```

Finally, the solution to the time-dependent Schrödinger equation are found by taking into account the time dependent solution:

$$
\Psi_n\left(x,t\right)=\sqrt{\frac{2}{a}}\sin{\left(\frac{n\pi}{a}x\right)}e^{-i\left(\frac{n^2\pi^2\hbar}{2ma^2}\right)t}
$$

which means that the most general solution to the time-dependent Schrödinger equation is a linear combination of these states: 

$$
\Psi\left(x,t\right)=\sum_{n=1}^{\infty}{c_n\sqrt{\frac{2}{a}}\sin{\left(\frac{n\pi}{a}x\right)}e^{-i\left(\frac{n^2\pi^2\hbar}{2ma^2}\right)t}}
$$

These wave functions $\Psi_n(x,t)$ form a complete set, which means that all possible $\Psi(x,0)$ can be expressed by choosing appropriate coefficients $c_n$.

:::{note}
Exercise: show that this solves the time-dep Schrödinger equation!
:::

<!-- Homework assignment: Finite barriers; see applications wikipedia;  -->


