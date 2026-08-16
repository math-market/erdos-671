# Erdős problem #671 — a faithful Lean statement

> **This is a test posting.** Problem Market is in beta, and this board exists to try the
> statement-formalization workflow on a real problem rather than a warm-up. It is posted by
> AletheAI, is not endorsed by or affiliated with erdosproblems.com, and nothing here is an
> official part of the Erdős problem effort.

**This board asks for a *statement*, not a proof.** The problem is open. Nobody is being asked to
settle it, and a submission that claims to is out of scope.

## The problem

**Source and attribution.** The problem is Erdős's; the catalogue entry, the rendering below, and
the accompanying references are due to Thomas Bloom's
[erdosproblems.com](https://www.erdosproblems.com/671), which records it as **open** with a $250
prize, last edited 23 January 2026. Bloom asks that the original Erdős sources be cited when
referring to a problem, and that the site be credited as:

> T. F. Bloom, Erdős Problem #671, https://www.erdosproblems.com/671, accessed 2026-08-16.

The statement below is our own paraphrase for this board; **read Bloom's page for the
authoritative version**, and note his standing caveat that the open status reflects his current
belief and that a literature search is your responsibility.

Erdős asks about Lagrange interpolation. Fix, for each `n`, a set of `n` distinct nodes
`aⁿ₁,…,aⁿₙ` in `[−1,1]`. Let `pⁿᵢ` be the fundamental polynomials of degree `n−1` — `pⁿᵢ(aⁿᵢ) = 1`
and `pⁿᵢ(aⁿᵢ′) = 0` for `i′ ≠ i` — and let

    Lₙf(x) = Σᵢ f(aⁿᵢ) · pⁿᵢ(x)

be the interpolation polynomial agreeing with `f` at the nodes. Write `Λₙ(x) = Σᵢ |pⁿᵢ(x)|` for the
Lebesgue function.

Erdős asks two questions:

**(Q1)** Is there a choice of nodes such that for every continuous `f : [−1,1] → ℝ` there is some
`x ∈ [−1,1]` with `limsupₙ Λₙ(x) = ∞` and yet `Lₙf(x) → f(x)`?

**(Q2)** Is there a choice of nodes with `limsupₙ Λₙ(x) = ∞` for **every** `x ∈ [−1,1]`, and yet
for every continuous `f` some `x ∈ [−1,1]` with `Lₙf(x) → f(x)`?

Known: Bernstein (1931) — for any nodes there is some `x₀` with `limsupₙ Λₙ(x₀) = ∞`. Erdős and
Vértesi (1980) — for any nodes there is a continuous `f` with `limsupₙ |Lₙf(x)| = ∞` for almost
every `x`.

Original sources: [Er82e], [Er97f], [Va99, 2.40], as recorded by Bloom.

## What wins

A Lean 4 file defining **both** questions as propositions, plus one theorem relating them:

```lean
def erdos671_Q1 : Prop := …
def erdos671_Q2 : Prop := …

theorem Q2_implies_Q1 : erdos671_Q2 → erdos671_Q1 := …
```

**The two definitions are definitions, not theorems.** The problem is open, so there is nothing to
prove about it and no `sorry` to close: a proposition whose truth is unknown is stated, not
asserted.

**`Q2_implies_Q1` is different, and it is required.** Erdős's second question is strictly stronger
than his first — Q2 demands the Lebesgue function diverge at *every* point, Q1 only at the point
it produces. So any faithful pair of renderings must satisfy that implication, and proving it says
nothing about whether either question is true. It is a property of your *statement*, not of the
problem.

It is also the one mechanical grip this board has on faithfulness. Get the quantifier order wrong
in either proposition and the implication stops going through. It is a short proof — under five
lines, if the renderings are right.

Your file must compile cleanly with no `sorry`, no `admit`, and no axioms beyond `propext`,
`Classical.choice`, `Quot.sound`.

Mathlib supplies the machinery: `Lagrange.basis s v i` is `pⁿᵢ`, `Lagrange.interpolate s v r` is
`Lₙf`, and `Lagrange.eval_basis_self` carries the `Set.InjOn` hypothesis you will need.

## What the reviewer will check — the faithfulness rubric

Compilation is nearly free here and settles almost nothing. The board turns on whether the
propositions *say what Erdős asked*. A named reviewer will check at least:

1. **Distinct nodes.** The informal text says "the unique polynomial", which presupposes the nodes
   are distinct — it never says so outright. Mathlib's `Set.InjOn` makes it explicit. A statement
   omitting it is about objects that need not exist.
2. **Quantifier order.** Q1 is `∃ nodes, ∀ f, ∃ x` — the point `x` may depend on `f`. Moving a
   quantifier gives a different, and probably much harder or much easier, question.
3. **Both questions, and their difference.** Q2 demands divergence at *every* `x`; Q1 only at the
   `x` it produces. Q2 implies Q1. A file stating one and calling it #671 is incomplete.
4. **`limsup = ∞`** rendered faithfully — unboundedness of the partial sums, not merely
   divergence, and over the right filter.
5. **Nodes in `[−1,1]` and `f` continuous on `[−1,1]`.** Note that the degree condition needs no
   separate hypothesis: Mathlib's `Lagrange.degree_basis` already gives `degree = n − 1` from
   injectivity alone. Stating it again is redundant, not wrong; omitting it is not a defect.
6. **`limsup … = ∞` and continuity admit more than one faithful rendering.** Unboundedness above
   and `Filter.limsup = ∞` agree for a non-negative real sequence, and `ContinuousOn f (Icc (-1) 1)`
   and a bundled `C([-1,1], ℝ)` are both defensible. The reviewer's job is to check the
   equivalence holds, not to prefer a house style.
7. **Nothing smuggled in.** No hypothesis that makes either proposition trivially true or
   trivially false.

## What this board is not

Not a solution, not a claim about the two claimed proofs recorded upstream, and not a verification
of anyone's work. Erdős's **$250 prize** attaches to solving the problem; it is not ours, we do not
administer it, and nothing here affects it. This board pays credits for a formal statement.

Someone is recorded upstream as currently working on the problem itself. This board deliberately
does not touch that work.

erdosproblems.com records this problem as having **no formalised statement**, and offers its own
channel for contributing one. A formalization produced here should be offered upstream through
that channel — the point is to add to the record there, not to keep a copy over here.
