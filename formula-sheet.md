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


# Formula sheet

Basic qubit quantum states, e.g. photon polarization or spin: 

$$
\left\{|0\rangle,|1\rangle\right\},\;
\left\{|H\rangle,|V\rangle\right\},\;
\left\{|\uparrow\rangle,|\downarrow\rangle\right\},\;
\left\{\left(\begin{matrix}1\\0\\\end{matrix}\right),
\left(\begin{matrix}0\\1\\\end{matrix}\right)\right\}
$$

$$ P_{click}=\left|\left\langle\Psi_{\text {detector }} \mid \Psi\right\rangle\right|^2$$

Classical mechanics velocity and momentum: $v\ =\ p/m$, Kinetic energy: $E=p^2/2m$, de Broglie wavelength: $\lambda=\frac{h}{p}$. 

Plane wave $\Psi\left(x,t\right)=Ae^{i(kx-\omega t)}$, $p\ =\hbar k$


Schrödinger: 

$$
\nabla=\left( \frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z}  \right)
\quad ; \quad
H=-\frac{\hbar^2}{2m}\ \nabla^2+V
\quad ; \quad
H \psi=E \psi
$$


In spherical coordinates: 

$$
\vec{\nabla}=\hat{r} \frac{\partial}{\partial r}+\hat{\theta} \frac{1}{r} \frac{\partial}{\partial \theta}+\hat{\phi} \frac{1}{r \sin \theta} \frac{\partial}{\partial \phi}
$$

$$
\nabla^2=\frac{1}{r^2} \frac{\partial}{\partial^2}\left(r^2 \frac{\partial}{\partial r}\right)+\frac{1}{r^2 \sin \theta} \frac{\partial}{\partial \theta}\left(\sin \theta \frac{\partial}{\partial \theta}\right)+\frac{1}{r^2 \sin ^2 \theta}\left(\frac{\partial^2}{\partial \phi^2}\right)
$$


Operators: 

$$
\hat{x}=x,\quad\hat{p}=-i\hbar\frac{\partial}{\partial x}, \quad \hat{L}=\hat{r}\times\hat{p}
$$

Expectation values: 

$$
\langle Q\rangle \equiv \langle\Psi|Q|\Psi\rangle = \int dx\,\Psi^\ast Q \Psi
$$

Ladder operators:

$$
a^{\dagger}|n\rangle =\sqrt{n+1}|n+1\rangle
\quad ; \quad
a|n\rangle =\sqrt{n}|n-1\rangle
$$

Pauli:

$$
\sigma_x=\left(\begin{matrix}0&1\\1&0\\\end{matrix}\right), 		\sigma_y=\left(\begin{matrix}0&-i\\i&0\\\end{matrix}\right), 	\sigma_z=\left(\begin{matrix}1&0\\0&-1\\\end{matrix}\right)
; \quad
\vec{S}=\left(\hbar/2\right)\vec\sigma
; \quad
\vec\sigma=\left(\sigma_x,\sigma_y,\sigma_z\right)
$$

1st order non-degenerate perturbation theory:

$$
E_n^{(1)}=\langle\psi_n^{(0)}|H'|\psi_n^{(0)}\rangle,\quad |\psi_n^{(1)}\rangle=\sum_{m\neq n}\frac{\langle\psi_m^{(0)}|H'|\psi_n^{(0)}\rangle}{E_n^{(0)}-E_m^{(0)}}|\psi_m^{(0)}\rangle

$$

WKB:

$$\psi(x) \approx \frac{C}{\sqrt{p(x)}} e^{ \pm \frac{i}{\hbar} \int p(x) d x}, \quad p(x) \equiv \sqrt{2 m[E-V(x)]}$$

Useful integrals:

$$
\int_{-\infty}^{\infty}  e^{-a(x+b)^2}\,dx= \sqrt{\frac{\pi}{a}}
\quad ; \quad
\int_{-\infty}^{\infty} x^n e^{-a x^2} d x=\sqrt{\pi} a^{-(n+1) / 2} 2^{-n} \frac{n !}{(n / 2) !}
$$

