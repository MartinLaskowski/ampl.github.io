# XPRESS Changelog


## 20240115
- *Solve result codes*
  - List codes by running (solver) -!
  - [BREAKING] Standardized codes. Major changes:
    - 100-199 (solved?) means solution candidate
      provided, but can be suboptimal/infeasible
    - 300-349 means unbounded problem but
      feasible solution returned
    - 400-449 means limit/interrupt but feasible
  - [BREAKING] sol:chk:fail returns code 150 (solved?)
- Improved translation of *SOCP constraints*.
  - Options cvt:socp, cvt:socp2qc.
- Compact solution check warnings
- Fixed presolve of the power function #226.


## 20231117
- MP update: fixed graceful exit on Ctrl-C from AMPL in Linux
  and fixed issue with reading text-format NL files


## 20231103
- Improved translation of logical constraints:
  inlining of nested disjunctions and conjunctions;
  fewer auxiliary binary variables.


## 20231017
- Fixed a bug in NL reader on Windows.


## 20230919
- *mp_options*.
	Receive mp_options from AMPL (for all MP solvers).
	They are parsed before (solvername)_options.
- Solution checking: relative tolerance
	sol:chk:feastolrel; options sol:chk:round, sol:chk:prec.


## 20230831
- Solution checking, options sol:chk:* (experimental).
- Preprocess And/Or constraints.


## 20230817
- Alternative solutions: solve status equal to that
  of the final solution.
- Fixed a bug causing repeated names for
  auxiliary variables and constraints.
- Option values can be assigned without '='.
- Fixed a bug where equivalent conditional
  comparisons were not unified.


## 20230808
- Updates for Xpress 9.2 (42.01.01), which include many performance
  improvements in the MIP solver. 
- Non-convex quadratic problems are now solved to global optimality 
  by default.
- Added options 'mip:heurshiftprop', 'tech:backgroundthreads' and
 'tech:backgroundselect'.
- The range of the control 'mip:feasibilityjump' was extended.


## 20230728
- Option 'tech:writesolution'.


## 20230727
- Fixed a memory leak #217
- Fixed quadratic constraints


## 20230726
- MP: fixed inequalities of integer expressions with
  non-integer constants, see test_int_non_int.mod.


## 20230724
- Option [solver_]auxfiles rc; transfers names
	of variables and linear constraints into the model;
	(solver)_options 'cvt:names=0-3' controls names.


## 20230714
- Options barrier/primal/dual/network like in ASL.


## 20230621
- Fix quadratic objective with repeated subexpressions.
- Fix reformulation of ==> / else.


## 20230616
- Changes in MP.
- Eliminated spurious warnings
- Fixed passing of quadratic objective


## 20230607
- Amended detection and display of licensing errors
- Licensing allows now usage of an XPRESS license from an AMPL-based
  deployment


## 20230603
- Added option 'tech:logfile' to enable output to a log file


## 20230424
- *Changes in the MP library*: added variable names support
  and removed spurious starting solution

  
## 20230227
- Eliminated warning message when a non feasible solution is added as a starting
  point for the MIP search


## 20230207
- *Changes in the MP library*


## 20221228
- Changes in MP


## 20221222
- Bug fixes in MP


## 20221211
- *Changes in MP: added the ==> else operator*
   Implemented implication with 'else': *constr1* ==> *constr2* [else *constr3*]   

- *Changes in MP: PLApproxRelTol, PLApproxDomain*
   Parameters to control piecewise-linear approximation.
   cvt:plapprox:reltol default value changed from 1e-5 to 0.01.


## 20221208
- First release of the MP-based driver for Xpress (solver version 9.0)