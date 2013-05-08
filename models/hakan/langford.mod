/*

  Langford's number problem in AMPL+CP.

  http://www.cs.st-andrews.ac.uk/~andrea/examples/langford/langford.eprime
  """
  Langford's number problem (CSP lib problem 24)

  Arrange 2 sets of positive integers 1..k to a sequence,
  such that, following the first occurence of an integer i, 
  each subsequent occurrence of i, appears i+1 indices later
  than the last. 
  For example, for k=4, a solution would be 41312432
  """
  
  Also see: http://www.csplib.org/prob/prob024/

  See langford1.mod for a version where there's no solution
  array and hence no need for the element simulation (and
  is much faster).

  Model created by Hakan Kjellerstrand, hakank@gmail.com
  See also my AMPL page: http://www.hakank.org/ampl/

*/


param k;

# Positions
var position{1..2*k} >= 1 <= 2*k integer;
# Positions converted to a readable solution.
var solution{1..2*k} >= 1 <= k integer;

#
# constraints
#

s.t. c1{i in 1..k}:
     position[i+k] = position[i] + i+1;

s.t. c2: alldiff{i in 1..2*k} position[i];

# MiniZinc code for this:
# 
#    forall(i in 1..k) (
#       solution[position[i]] = i /\ 
#       solution[position[k+i]] = i
#    )
# but since AMPL don't support the element constraint
# we simulate it via exists. Note: the propagation is 
# not as good.
#
s.t. c3a{i in 1..k}:
           exists{p1 in 1..k*2}
              # solution[position[i]] = i
              position[i] = p1 and
              solution[p1] = i
;

s.t. c3b{i in 1..k}:
           exists{p2 in 1..k*2}
              # solution[position[k+i]] = i
              position[i+k] = p2 and
              solution[p2] = i
;

# Symmetry breaking
s.t. c4:  solution[1] > solution[2*k];


data;

# Note: k mod 4 = 0 or k mod 4 = 3
param k := 31;

if k mod 4 = 0 or k mod 4 = 3 then {

  option solver gecode;
  option gecode_options "var_branching=size_min val_branching=rnd outlev=1 outfreq=1";
  # option solver ilogcp;

  solve;

  # display position;
  # display solution

  printf "Positions: ";
  for{p in 1..2*k} {
    printf "%2d ", position[p];
  }
  printf "\nSolution:  ";
  for{s in 1..2*k} {
    printf "%d, ", solution[s];
  }
  printf "\n";

} else {

  printf "Sorry k (%d) is not mod 4 = 0|3. Exit.\n", k;

}
