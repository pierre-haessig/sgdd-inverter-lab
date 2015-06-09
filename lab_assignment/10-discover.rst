###########################################
Introduction to the Grid Connected Inverter
###########################################



Preamble: AC Power transmission
===============================

Before entering the details of a grid connected inverter, we need to understand
the basic principle of *power transmission between two AC voltage sources*.
To this end, let's study the single-phase circuit represented on :numref:`power_transfer_inductor`.


.. figure:: ../diagrams/power_transfer_inductor.png
    :name: power_transfer_inductor
    :width: 30 em
    
    Power transfer between two voltage source (e.g. an inverter and the grid)
    through an inductive line

The power flow can be explained in *sinusoidal regime* using
*complex representations* for the voltages and currents.
These complex amplitudes can then be represented on a phasor diagram.
When working with complex currents, it is usual to use a polar notation like
:math:`\underline{I} = Ie^{-j\phi}`, with :math:`\phi` the phase lag
with respect to some reference, and :math:`I` the amplitude.
However, for reasons that will becomes clearer after, it will be better
in this control lab to express complex amplitudes in cartesian coordinates
:math:`\underline{I} = I_d + j I_q` [#dq]_

.. admonition:: Question
    :class: attention
    
    Relate the active and reactive power *received* by the grid
    to the current components :math:`I_d, I_q`.

.. only:: with_solutions

    .. hint::
        Formula relating the complex power *received* by a load
        to its complex voltage U and current I in *receptor convention*:
        
        .. math:: \underline{S} = P + jQ = 1/2 \underline{U} . \underline{I}^*
        
        ("*" means complex conjugate)
        
        Applying this to the grid voltage :math:`\underline{U} = V_{grid}`, we have:
        
        * Active power :math:`P = V_{grid} I_d / 2`
        * Reactive power :math:`Q = -V_{grid} I_q / 2`
        
        Observation: Q is positive when the current is lagging (:math:`I_q <0`).


For a given grid voltage, the current flowing between the two sources
is *controlled by the inverter voltage* :math:`\underline{V}_{inv} = V_d + j V_q`.

.. admonition:: Question
    :class: attention
    
    Draw a phasor diagram, taking the fixed grid voltage as a reference,
    to show how the inverter voltage influence the current flowing through
    the inductor, and thus the power flows.
    
    When the resistance is negligible (*compared to what ?*),
    what is the equation that relates P,Q to the inverter voltage dq components.

.. only:: with_solutions

    .. hint::
        When resistance is zero, the complex current is:
        
        .. math:: \underline{I} = [ V_q - j( V_d - V_{grid})]/L\omega
        
        So we have:
        
        * Active power :math:`P = V_d V_{grid}  / 2L\omega`.
          Positive when :math:`V_d > 0`.
        * Reactive power :math:`Q = (V_d - V_{grid}) V_{grid} / 2L\omega`.
          Positive when :math:`V_q > V_{grid}`.


[Simulate figure 1.1 on on Simulink ?]

Keeping these results in mind, we can now turn to the real inverter, with two
changes

* three-phase system
* PWM operation

System under study
==================

Model
-----

.. figure:: ../diagrams/grid_connected_inverter_control.png
    :width: 50 em
    
    Control of a grid connected three-phase inverter



Simulink wiring
===============

We will run numerical simulations using `SimPowerSystems`_ toolbox for Simulink.



PMW: moving average value
=========================

.. _SimPowerSystems: http://www.mathworks.com/products/simpower/


.. rubric:: Footnotes

.. [#dq] "d" and "q" stand for "direct" and "quadrature" axes respectively.
   They will be detailed when introducing the dq (Park) transform (TODO: ref).
