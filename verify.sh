#!/usr/bin/env bash
# verify.sh — the automated half of this board, which is deliberately the small half.
#
# A statement board settles on FAITHFULNESS, which no script can check. What a
# script can check is that the file compiles, defines both propositions, and
# asserts nothing. That is all this does, and it is not evidence that the
# statement is right.
set -uo pipefail
fail=0
echo "== build =="
lake exe cache get >/dev/null 2>&1 || echo "  (cache unavailable; building from source will be slow)"
lake build || { echo "build FAILED"; exit 1; }

echo "== both propositions defined, and they are Props =="
cat > .check.lean <<'LEAN'
import Erdos671
open Erdos671
example : Prop := erdos671_Q1
example : Prop := erdos671_Q2
#print axioms erdos671_Q1
#print axioms erdos671_Q2
LEAN
lake env lean .check.lean > axiom-report.txt 2>&1; rc=$?
rm -f .check.lean
cat axiom-report.txt
[ $rc -eq 0 ] || { echo "FAILED: both erdos671_Q1 and erdos671_Q2 must be defined, of type Prop"; fail=1; }

echo "== nothing asserted =="
# The problem is OPEN. A theorem proving either proposition would be a solution,
# not a statement, and almost certainly an error.
if grep -nE "^ *(theorem|lemma) " Erdos671.lean; then
  echo "FAILED: this board asks for definitions, not theorems. The problem is open."; fail=1
fi
if grep -q "sorryAx" axiom-report.txt || grep -nE "\bsorry\b|\badmit\b" Erdos671.lean; then
  echo "FAILED: a proposition is stated, not proved — there is nothing to leave sorry"; fail=1
fi

[ "$fail" = 0 ] && echo "PASS — compiles, both propositions defined, nothing asserted" || echo "FAIL"
exit $fail
