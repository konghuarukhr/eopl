# Inductive Sets of Data
## Recursively Specified Data
### Inductive Specification
* top-down definition
* bottom-up definition
* rules-of-inference
### Defining Sets Using Grammars
Specify sets with grammars simplfy the process of describing complex data types.  
* **grammar** are set of rules, which typically used to specify sets of strings, but we can use them to define sets of values as well.
    * **Nonterminal Symbols**: These are the names of the sets being defined. These sets are sometimes called syntactic categories.
    * **Terminal Symblos**: These are the characters in the external representation.
    * **Productions**: These rules are called *productions*.
* *syntactic derivation*
* *contex-free*: A rule defining a given syntactic category may be applied in any context that makes reference to that syntactic category.
* *contex-sensitive constraints* or *invariants*: Examples: Binary-search-tree; Variable declared before using.
### Induction
* Use the inductive definitions in two ways:
    * prove theorems about members of the set
    * write programs that manipulate them
* Proof by Structural Induction
    * To prove that a proposition IH(s) is true for all structures s, prove the following:
        1. IH is true on simple structures (those without substructures).
        2. If IH is true on the substructures of s, then it is true on s itself.
## Deriving Recursive Programs
The Smaller-Subproblem Principle  
If we can reduce a problem to a smaller subproblem, we can call the procedure
that solves the problem to solve the subproblem.  
The solution returned for the subproblem may then be used to solve the original problem.  

The decomposition of *subst* into two procedures, one for each syntactic category, is an important technique.
It allows us to think about one syntactic category at a time, which greatly simplifies our thinking about more complicated programs.  

Follow the Grammar!  
When defining a procedure that operates on inductively defined data, the structure of program should be patterned after the structure of the data.  

## Auxiliary Procedures and Context Arguments

