# erdos-671 — a Lean statement of Erdős problem #671

> ### This is a test posting
>
> Problem Market is in beta. This repository exists to try a **statement-formalization** workflow
> on a real problem rather than a warm-up. It is posted by **AletheAI, Inc.**, and it is **not
> endorsed by, affiliated with, or an official part of** erdosproblems.com or the Erdős problem
> effort. Nobody upstream asked for it.

## What this asks for

**A faithful Lean 4 statement of the problem — not a proof.**

Erdős #671 is **open**. Nothing here claims to settle it, and no submission may: the deliverable
is two `Prop` *definitions* whose truth is unknown, plus one theorem relating them to each other.

```lean
def erdos671_Q1 : Prop := …          -- Erdős's first question
def erdos671_Q2 : Prop := …          -- his second, strictly stronger
theorem Q2_implies_Q1 : erdos671_Q2 → erdos671_Q1 := …
```

That last theorem is about the *statements*, not about the problem — it is required precisely
because it is the one thing a script can check about whether the quantifiers are right.

## Attribution

The problem is **Paul Erdős's**. Original sources: [Er82e], [Er97f], [Va99, 2.40].

The catalogue entry, the reference list, and the modern rendering we worked from are due to
**Thomas Bloom's [erdosproblems.com](https://www.erdosproblems.com/671)**, which records #671 as
open with a **$250 prize**, last edited 23 January 2026. Bloom asks that the original Erdős
sources be cited, and that the site be credited as:

> T. F. Bloom, Erdős Problem #671, https://www.erdosproblems.com/671, accessed 2026-08-16.

**Read Bloom's page for the authoritative statement.** [`TASK.md`](TASK.md) contains our own
paraphrase, written for this board; where the two differ, his is right and ours is a mistake.
Note also his standing caveat: the open status reflects his current belief, there may be
literature he is unaware of, and a literature search is the solver's responsibility.

## About the prize, and about the upstream effort

Erdős's **$250 prize attaches to solving the problem**. It is not ours, we do not administer it,
and nothing in this repository affects it. This board pays platform credits — which have no cash
value and are not convertible — for a formal *statement*.

erdosproblems.com records #671 as having **no formalised statement**, and provides its own channel
for contributing one. **A formalization produced here should be offered upstream through that
channel.** The point is to add to the record there, not to keep a copy over here.

Someone is recorded upstream as currently working on the problem itself. This board deliberately
does not touch that work, and asking for a statement is not a claim on the solution.

## Layout

| file | |
|---|---|
| [`TASK.md`](TASK.md) | the problem, the deliverable, and the faithfulness rubric a reviewer applies |
| `Erdos671.lean` | the skeleton to fill in |
| `verify.sh` | the automated half — compiles, both propositions defined, nothing else asserted |

`verify.sh` is deliberately the small half. Whether the propositions say what Erdős asked is a
judgement, made by a named mathematician and recorded in the review. A script cannot check it,
and this repository does not pretend otherwise.

## Licence

Apache-2.0. Contributions are licensed on the same terms and are recorded permanently.
