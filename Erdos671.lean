/-
Copyright (c) 2026 AletheAI Inc. All rights reserved.
Released under Apache 2.0 license.

# Erdős problem #671 — statement only

**Fill this file in.** Replace each `TODO` with a proposition. Do not prove anything: the problem
is open, so `erdos671_Q1` and `erdos671_Q2` are *definitions* of propositions whose truth is
unknown. There is no `sorry` to close, and a file that asserts either proposition is wrong.

Problem catalogued at https://www.erdosproblems.com/671 (T. F. Bloom); original sources
[Er82e], [Er97f], [Va99, 2.40]. See TASK.md.

Mathlib supplies the machinery:
* `Lagrange.basis s v i`        — the fundamental polynomial `pⁿᵢ`
* `Lagrange.interpolate s v r`  — the interpolation polynomial `Lₙf`
* `Lagrange.eval_basis_self`    — note its `Set.InjOn` hypothesis

Document your rendering choices in the docstrings. The reviewer is judging whether these
propositions say what Erdős asked, and your reasoning is the evidence they will weigh.
-/
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.Analysis.SpecialFunctions.Polynomials
import Mathlib.Topology.ContinuousMap.Basic

namespace Erdos671

open Filter Polynomial
open scoped Topology

/-- **Erdős #671, first question.**

Is there a system of nodes such that for every continuous `f : [-1,1] → ℝ` there is some
`x ∈ [-1,1]` at which the Lebesgue function is unbounded and yet `Lₙf(x) → f(x)`?

TODO: state this. Mind the quantifier order — the point `x` may depend on `f`. -/
def erdos671_Q1 : Prop := TODO

/-- **Erdős #671, second question.**

Is there a system of nodes whose Lebesgue function is unbounded at *every* `x ∈ [-1,1]`, and yet
for every continuous `f` there is some `x ∈ [-1,1]` with `Lₙf(x) → f(x)`?

This is strictly stronger than `erdos671_Q1`.

TODO: state this. -/
def erdos671_Q2 : Prop := TODO

/-- **Required.** Erdős's second question is strictly stronger than his first, so any faithful
pair of renderings must satisfy this. Proving it says nothing about whether either question is
true — it is a property of the statements, not of the problem, and it is the one mechanical grip
this board has on whether the quantifiers are right.

Under five lines if the renderings above are correct. -/
theorem Q2_implies_Q1 : erdos671_Q2 → erdos671_Q1 := sorry

end Erdos671
