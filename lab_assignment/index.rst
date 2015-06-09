###########################
Grid Connected Inverter Lab
###########################

*Lab assignment material*.


[TODO: move most of this content in a Intro page]

Technical context
=================

Historically, power plants (thermal power plants, hydroelectric dams, …)
were connected *directly* to the electrical grid.
Indeed, electric generators used in these plants (synchronous or induction machines)
are meant to be connected directly to a three-phase power system.
Only a transformer may be used as an interface to match voltage levels
between the machine and the grid.

Since the late 20th century, with the development of renewable (solar and wind)
power generation, there are more and more power generators
that are connected indirectly to the grid,
using a *power electronics converter* as an interface.
This particularly true for solar photovoltaics (PV) systems,
where a converter is required to reshape the direct current (DC) produced
by the PV cells into an alternating current (AC) at a suitable frequency
(often 50 Hz or 60 Hz) that can be fed into the grid.

A device that transfer energy from DC source to an AC source is called an :term:`inverter`.
Grid connected inverters brings a lot of flexibility in terms of power transfer,
because the power flows (active and reactive power) can be controlled precisely.
It this power flow control that we want to study in this lab course.

Grid connected inverters can also provide other services to the grid,
like power quality improvement (e.g. reducing the harmonic distortion),
but these are not covered in this lab.


.. index:: Learning objectives

Learning objectives
===================

Objective of this series of four lab sessions:

    Being able to *understand the structure*, *design* and *implement in simulation*
    the control of the power flows of a three-phase grid connected inverter

Why controlling P,Q: to support the grid blablalba


Systems under study

In this course, we will consider a **three-phase** rooftop PV system
with an :term:`apparent power` of 20 kVA (see as an example the `Sunny Tripower`_ inverter by the German manufacturer SMA).
Such a system could be installed on a small commercial building
using 80 typical 250 W modules of about 1.5 m²
(see for example `PV modules by Suntech`_, a large manufacter based in Wuxi, China).


Note that we will focus on the operation of the grid connected converter,
which is used in other systems (wind generation, motor drives).
As a consequence, we will not cover the details of the solar power conversion.
In particular, we will not cover the typical issue of :abbr:`MPPT (Maximum power point tracking)`,
which is performed using additional DC-DC converters.
Instead, we will use a *fixed voltage source* as a (simplistic) model for the PV panels.

.. index:: Prerequisites

**Prerequisites**: this course requires that you are already familiar with:

* Modeling an electrical circuit

  * in the *time domain* (differential equations),
  * in *complex plane* (phasor equations) and
  * in the *Laplace domain* (transfer functions)

* Pulse Width Modulation (PWM) operation of a simple power electronics converter
  (e.g. a buck or a boost DC-DC converter).
* Assessing the stability of a closed loop system given its open loop frequency response.
  This include finding the phase margin on a Bode or Nyquist diagram.
* Tuning a :abbr:`PI (Proportional-Integral)` controller so that the
  performance of the closed loop system matches a given performance level
  (response time, overshoot).



Lab timeline
============

.. toctree::
   :maxdepth: 2
   :numbered:
   
   10-discover
   20-modeling
   30-control
   40-robustness

.. extra documents

.. toctree::
    :hidden:
    
    90-references
    glossary

Index
=====

* :ref:`genindex`
* :ref:`search`
* :ref:`glossary`


.. external links

.. _Sunny Tripower: http://www.sma.de/en/products/solarinverters/sunny-tripower-20000tl-25000tl.html
.. _PV modules by Suntech: http://www.suntech-power.com/menu/monocrystalline.html


