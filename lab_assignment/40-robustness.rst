############################
Robustness of the controller
############################


Until now, we have developped a current controller that gives
appropriate performance under *ideal conditions*.
In particular, we have assumed:

1. **perfect knowledge** of the system behavior.
   In particular, perfect knowlegdge of the R and L parameters.
2. **sinusoidal** grid voltages: no harmonics
3. **balanced** three-phase grid voltages: :math:`v_a, v_b, v_c` are
   exactly the same signals, shifted of by 20/3 ms.

In reality, each of these assumptions will not be entirely satisfied in practice.


.. admonition:: Question: why ?
    :class: attention
    
    For each of these assumptions, find possible reasons
    that could explain why they may not be entirely satisfied in practice.


Imperfect knowledge of the resistance
=====================================

The series resistance of inductances may not always be well specified
by its manufacturer.


.. admonition:: Question
    :class: attention
    
    For a given setting of PI controller, study the effect of varying the
    resistance between 0 and 10 times its value (for which the controller was tuned):
    
    * in the frequency domain, with an open loop behavior diagram (Bode, Black or Nyquist).
    
      * effect on the phase margin.
      * effect on the gain at low frequencies gain
    
    * in the time domain, with a step response (Simulink or a `step` command)
    
      * effect on current overshoot
      * effect on the current settling time

In the end, it may be necessary to change the PI tuning and
*trade off* a bit of performance with the nominal system
for more performance with the imperfect system.


Imbalanced three-phase voltages
===============================

In this section, we consider a small imbalance in the grid voltage.
For that purpose, we redefine the grid voltages:

* :math:`v_a = \qquad V_{grid} \cos(\omega t)`
* :math:`v_b = (1+a)  V_{grid} \cos(\omega t - 2\pi/3)`
* :math:`v_c = (1+b)  V_{grid} \cos(\omega t - 4\pi/3)`

where the unbalance is *parametrized* by the pair of real numbers :math:`a, b`
that will slightly deviate from zero.
For example, we can use a test case with (+1%, -1%).

.. admonition:: Question: observation
    :class: attention
    
    Implement the unbalanced voltages in a physical simulation of the closed-loop system.
    
    What can you see on grid voltages, on the current ?
    What measurement can be used to *quantify the defect*?

.. only:: with_solutions

    .. hint::
        Currents appear unbalanced and **non sinusoidal**
        (setting: L=2 mH, R = 10 mΩ, and K=2 Ω, Ti= 10 ms).
        
        Total Harmonic Distortion (THD) can be used to quantify the
        magnitude of the harmonics.


Investigating the problem
-------------------------

The unbalanced grid voltages can affect the current controller in two ways:
in a direct and indirect manner.

* the indirect effect is related to the *grid synchronization process*:
  the grid phase angle needs to be estimated to feed the dq transorms.
  The imbalance can perturb this estimation and yield a disturbed phase angle.
  This in turn would perturb all the dq transformed values.
* the direct effect: the unbalanced voltages are perturbation input on
  the closed loop system.

.. admonition:: Question
    :class: attention
    
    Compute (numerically) the dq tranform of the unbalanced grid voltages,
    assuming that the phase reference is ideally estimated (:math:`\theta = \omega t`).
    You should observe that dq components are *not constant anymore*.
    
    For a given value of the imbalance (e.g. +1%, -1%), describe the perturbation
    *quantitatively* (amplitude, ...).

Coming back the system equations in the dq reference frame, the imbalance
can be seen to act as an additive perturbation :math:`w` on the voltage commands.

.. admonition:: Question
    :class: attention
    
    Add the perturbation in the DC block diagram simulation of the inverter.
    Does the simulated behavior reproduce the one observed with the physical
    simulation?


The effect of the perturbation can be studied using transfer functions,
which will help understanding how to reject it.

.. admonition:: Question
    :class: attention
    
    Derive the expression of the "Perturbtion → Output" transfer function
    (:math:`I(s)/W(s)`).
    
    Evaluate the transfer at the frequency of the perturbation.

.. only:: with_solutions

    .. hint::
        Perturbation transfer:
        
        .. math:: \frac{I(s)}{W(s)} = \frac{H}{1+HC} =  \frac{1}{C} H_{cl}
        
        where H is the sytem transfer (R + Ls) and C is the controller.
        
        It needs to be evaluated at 100 Hz, i.e. at :math:`s = j2\pi .100`


Rejecting the perturbation
--------------------------

Using the expression of the transfer function, we can get a clue on how to tune
the frequency behavior of the controller to reject the perturbation caused by
the grid voltage imbalance.

.. admonition:: Question
    :class: attention
    
    How should the controller be tuned to better reject the perturbation ?
    
.. only:: with_solutions

    .. hint::
        Increase the gain at the frequency of the perturbation (100 Hz).

.. admonition:: Question
    :class: attention
    
    Implement the new tuning of the current controller and check:
    
    * the effect on the perturbation rejection (should be better!)
    * the effect on the stability (e.g. current overshoot)



.. note:: About robust control design

    The design of a robust controller is the subject of many research articles.
    See for example the book [Zhong-2013]_ which contains several examples
    (H∞ design, repetitive or resonant controller).
