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

# Angular momentum coupling

<!-- G 4.4.3 -->
In this section we investigate what happens if two angular momenta couple quantum-mechanically, for instance of two electrons - we will find that contrary to the classical case which is rather boring, quantum angular momenta couple in a very peculiar way!


## Coupling of two angular momenta

{{slidetag}}

Most physical systems consist of more than one particle, and as mentioned before they usually have nonzero spin – we now study the consequences of this. 

Even in the hydrogen atom, we have for instance the spin of the nucleus and the spin of the bound electron, or the orbital angular momentum of the electron and the spin of the electron – and they all couple. This changes the energy levels of atoms and ions and knowledge thereof is important for quantum technologies. But also for instance in chemistry, it is important to understand how the angular momenta of two electrons of two different atoms interact as this will determine chemical reactions. 

We start with two particles, with the spins $s_1$ and $s_2$ and the $z$-components $m_1$ and $m_2$, their states are $\left|s_1m_1\right\rangle$ and $\left|s_2m_2\right\rangle$. 

Without doing anything new, the state of the composite system can be written as $\left|s_1s_2m_1m_2\right\rangle$, and the squares of the total spin of particle 1 and 2, as well as the $z$-component can be calculated as before. Note that e.g. the operator $\left(S^{(1)}\right)^2$ acts only on particle one. We obtain:

$$
\begin{align}\left(S^{(1)}\right)^2\left|s_1s_2m_1m_2\right\rangle&=s_1\left(s_1+1\right)\hbar^2\left|s_1s_2m_1m_2\right\rangle\\
\left(S^{(2)}\right)^2\left|s_1s_2m_1m_2\right\rangle&=s_2\left(s_2+1\right)\hbar^2\left|s_1s_2m_1m_2\right\rangle\\
S_z^{\left(1\right)}\left|s_1s_2m_1m_2\right\rangle&=m_1\hbar\left|s_1s_2m_1m_2\right\rangle\\
S_z^{\left(2\right)}\left|s_1s_2m_1m_2\right\rangle&=m_2\hbar\left|s_1s_2m_1m_2\right\rangle\\\end{align}
$$(sp-cg-ops)

We now ask ourselves the seemingly simple question, what is the total angular momentum $\vec{S}=\vec{S}^{\left(1\right)}+\vec{S}^{\left(2\right)}$ and the total z-component $S_z=S_z^{\left(1\right)}+S_z^{\left(2\right)}$ of it of the composite system.

{{slidetag}}

More specific, the question is: what are the possible net spins $s$ of the combined system, and the $z$-components $m$? 

The total $z$-component is easy as the operator only appears linearly and can straight-forwardly be calculated: 

$$
\begin{align*}S_z\left|s_1s_2m_1m_2\right\rangle&=S_z^{\left(1\right)}\left|s_1s_2m_1m_2\right\rangle+S_z^{\left(2\right)}\left|s_1s_2m_1m_2\right\rangle\\
&=\hbar\left(m_1+m_2\right)\left|s_1s_2m_1m_2\right\rangle\\
&=\hbar m\left|s_1s_2m_1m_2\right\rangle\\
\end{align*}
$$(sp-cg-sz)

So, $m=m_1+m_2$ is just the sum. But the total spin $S$ and its eigenvalues $s$ are more complex, we need to discuss a specific example. 

## Two spin-1/2 particles

{{slidetag}}

We consider two $s=1/2$ spins, for instance the proton and the electron of the ground-state of the hydrogen atom, or two electrons. For all possible spin orientations we calculate first $m$:

$$
\begin{align*}
|\uparrow \uparrow\rangle&=\left|\frac{1}{2} \frac{1}{2} \frac{1}{2} \frac{1}{2}\right\rangle, \quad m=1 \\
|\uparrow \downarrow\rangle&=\left|\frac{1}{2} \frac{1}{2} \frac{1}{2} \frac{-1}{2}\right\rangle, \quad m=0 \\
|\downarrow \uparrow\rangle&=\left|\frac{1}{2} \frac{1}{2} \frac{-1}{2} \frac{1}{2}\right\rangle, \quad m=0 \\
|\downarrow \downarrow\rangle&=\left|\frac{1}{2} \frac{1}{2} \frac{-1}{2} \frac{-1}{2}\right\rangle, \quad m=-1
\end{align*}
$$(sp-cg-m)

This is a bit weird, since $m$ runs from -1 to +1, $s$ should be equal to 1. But there are two $m=0$ states, we probably have to approach the problem from a different angle. The problem is that the 4 states are eigenstates of $S_z$ but not of $S^2$. For calculation of this operator we fist write it out:

$$
\begin{gather*}
S^2=\left(\vec{S}^{(1)}+\vec{S}^{(2)}\right) \cdot\left(\vec{S}^{(1)}+\vec{S}^{(2)}\right)=\left(S^{(1)}\right)^2+\left(S^{(2)}\right)^2+2 \vec{S}^{(1)} \cdot \vec{S}^{(2)}\\
\vec{S}^{(1)} \cdot \vec{S}^{(2)}=S_x^{(1)}S_x^{(2)} + S_y^{(1)}S_y^{(2)} + S_z^{(1)}S_z^{(2)}
\end{gather*}
$$(sp-cg-s2)

Using the matrix expressions for the operators we can calculate it now:

$$
\vec{S}^2|\uparrow \downarrow\rangle=\vec{S}^2|\downarrow \uparrow\rangle=\hbar^2(|\uparrow \downarrow\rangle+|\downarrow \uparrow\rangle)
$$(sp-cg-s2a)

As we hypothesized before, $|\uparrow \downarrow\rangle$ is not an eigenstate of $S^2$ - but the superposition on the right hand side gives a hint - let us try superposition states:

$$\begin{align*}
\vec{S}^2 \frac{1}{\sqrt{2}}(|\uparrow \downarrow\rangle+|\downarrow \uparrow\rangle)&=2 \hbar^2 \frac{1}{\sqrt{2}}(|\uparrow \downarrow\rangle+|\downarrow \uparrow\rangle)\\
\vec{S}^2 \frac{1}{\sqrt{2}}(|\uparrow \downarrow\rangle-|\downarrow \uparrow\rangle)&=0(|\uparrow \downarrow\rangle-|\downarrow \uparrow\rangle)
\end{align*}$$(sp-cg-es)

So these two superposition states are both eigenstates of $S^2$!

{{slidetag}}

Another approach is to use the ladder operators, for instance starting with the undoubtedly highest spin state $|\uparrow\uparrow\rangle = |1,1\rangle$ and applying $S_-$ results in the same superposition states.

To conclude: We have 3 states with $s=1$, the so-called **triplet states**

$$
\left\{\begin{aligned}
|11\rangle & =|\uparrow \uparrow\rangle \\
|10\rangle & =\frac{1}{\sqrt{2}}(|\uparrow \downarrow\rangle+|\downarrow \uparrow\rangle) \\
|1\,−1\rangle & =|\downarrow \downarrow\rangle
\end{aligned}\right\} \quad s=1
$$(sp-cg-t)

and one **singlet state** with $s=0$

$$
\left\{|00\rangle=\frac{1}{\sqrt{2}}(|\uparrow \downarrow\rangle-|\downarrow \uparrow\rangle)\right\} \quad s=0
$$(sp-cg-s)

## Higher spins

{{slidetag}}

In general for higher spins $s_1$ and $s_2$, one can show (check Cohen-Tannoudji or so) that possible values for $s$ are 

$$
s=\left(s_1+s_2\right),\left(s_1+s_2-1\right),\left(s_1+s_2-2\right), \ldots,\left|s_1-s_2\right|
$$(sp-cg-hs)
 
This is not very surprising, as the upper bound is if both spins are aligned in parallel, the lower bound anti-parallel. Note also that since we have used only general angular momentum algebra, this holds for all angular momenta.

But what are the specific superposition states that form the total spin states? They can be written as 

$$
|s m\rangle=\sum_{m_1+m_2=m} C_{m_1 m_2 m}^{s_1 s_2 s}\left|s_1 s_2 m_1 m_2\right\rangle
$$(sp-cg-cg)

where $C_{m_1 m_2 m}^{s_1 s_2 s}$ are the so-called Clebsch Gordan coefficients. You know now how to calculate these coefficients - but luckily these values are tabulated, a very useful table is on [wikipedia](https://en.wikipedia.org/wiki/Table_of_Clebsch%E2%80%93Gordan_coefficients).
