Response Letter
===

For Reviewer #1
---

- Does canonicalization fixes one such (class of) scheduler?
> Nope. Canonicalization does not change the behavior of an automaton.

- Do the transitions in a group have the same guard?
> No, they don't. Transitions in a group are not organized with priority, i.e. they are non-deteministically choosed to fire when multiple of them are activated. While the ungrouped transitions are literally ordered, as illustrated in the definition of transitions.

- Wouldn’t it be more general to assume that all transitions are non-deterministic and constraint them as needed? It seems to me that the first requirement of being canonical would be naturally fulfilled.
> For a theoretic model this could be easier to handle. However, in practice priorities could be important to simplify the encodings. That's why we introduce priority here.

- page 12, should or are?
> Corrected. Use `are` instead.

- What about final states? Are you working with $\omega$-languages? What is the acceptance notion?
> Since we mainly consider react systems, this model do not have explicitly defined acceptance condition. In other words, all possible executions are accepted.

For Reviewer #2
---

* Composition: the distinction between “system” and “component” seems artificial; no methodological concern (as claimed by the authors) can justify that composition of two components does not yield another component, but a system. Can the latter be composed?
> Basically, compsition of components must yield a system. We use system as an encapsulation of components and connections, then provide Algorithm 1. and 2. to flat a system as a basic automaton.

* Assignments within functions (does not seem to be restricted to local variables …)
> In assignment statements (in functions), local variables, parameters and arguments are readable but only local variables are writable. So such assignments are not strictly restricted to local variables. Now this is declared in the definition of functions.

* The concept of “adjoint variable” (certainly not local) needs to be clarified. Btw: what is the meaning of the sentence “Syntactically, adjoint variables are denoted as built-in fields of ports.” (page 6)?
> Adjoint variables are denoted as fields of port, i.e. they come up with ports. For example, a port $A$ has three corresponding adjoint variables $A.reqRead$, $A.reqWrite$ and $A.value$ that describes its reading status, writing status and value. In the latest version, we rename it as `port variables` for clarity.

* The role the “synchronizing statements” in scheduling assignments is stated but not explained. BTW: how are priorities specified?
> The description on priorities are formally rewritten. And explanation on how synchronizing statements work is also added to Section 3.3.

* Internal nodes (page 9): are declared as a type of “connections” and as “internals” … what is the envisaged role?
> As suggested in the paper, internal nodes are used when we need to combine multiple connections to construct complex coordinating behavior. Let's consider an simple example where we try to use two synchronous channel to connect component A's port **out** and component B's port **in**
    
	```
	internals { M };
	connections {
		Sync(A.out, M);
		Sync(M, B.in);
	}
	```
> It's obvious that without *M*, it is hard to encode such connections (or declare one of the Sync channel as an component, but it seems not that natural). We also update Figure 1 labelling its connections, components and internal nodes to make it more clear. 

* Semantics: everything boils down to trivial LTS? Not clear, for example, how priorities are considered in the semantic model. In def 5, where does $i$ come from?
> 1) Priorities are resolved when the automaton is canonicalized. In other words, it can be easily encoded through a set of non-deterministic transitions with no priority on syntax level. 2) Def 5 is modified and $i$ denotes the internal action.

### Minor Issues

- page 1, line 4: “Currently, there are various tool supports on component-based modeling.” —> “Currently, there are various tools supporting component-based modeling.”
> Corrected.

- page 4, line 1: “a function that have” —> “a function that has”
> Corrected.

- page 4, line 6: “Queue is a well-known data structure being used in” —> “A queue is a well-known data structure used in”
> Corrected.

- page 6, line 11: “boolean” —> “Boolean”
> Corrected.

- page 8, line -6: “textural” —> “textual”
> Corrected.

- page 8, figure 1: “A Senerio where” —> “A scenario where”
> Corrected.

- page 10, line 8: “how to canonicalize them.” —> “how to make them canonical.”
> Corrected.

- page 18, line 1: what do you mean by “This paper is a preface of a set of under-development tools.”?

For Reviewer #3
---

- The main concern about this work is that the conversion from the system to automaton, (explained in Section 3.3) should be defined formally. More importantly, the equivalency between the system and the obtained automaton has to be proved. To make the Algorithms 1 and 2 more clear, it's better to explain a simple example.
> A new example and its corresponding description is added to illustrate the algorithms.

- As authors mentioned in the conclusion section, the language does not provide any tool for model checking at this stage, so how can the authors show that the proposed modeling language works more efficiently comparing to other languages in terms of the needed time and memory?
> It's not clear for me what "needed time" refers to. If you are talking about the efficiency of a Mediator program, we have to admit that currently we don't have any guarantee in this paper since it is only a language proposal. Actually, it highly relies on the code-generator that we are implementing.

- It's not clear for me how the underlying LTS is generated from a Mediator program. Section 3.4 should be completed and explained better to make the semantics clear. What is "i" appearing over transitions in SOS rules?
> "i" is used to denote internal actions, where synchronization is not performed. We have added more examples and illustration on the algorithms, but due to the page limit, it is difficult for us to spend more paragraphs on the LTS semantics.


### Minor Issues

- what is identical assignments used in Definition 3? It should be defined formally when it’s used for the first time.
> $t=g\rightarrow S$ is used to denote a transition $t$ with guard $g$ and a set of ordered statements $S$. The notation is introduced in section 2.3 (on page 7) when describing the structure of an automaton.

- The meaning of the question mark (?) should be explained when defining the syntax in Section 2.
> We added a detailed description on the variant of EBNF we used in this paper. It is placed in the very beginning of Section 2.

- Example 2, page 5: the expression": int 0..(size-1) {" in the first line does not match the syntax defined for the function.
> This is caused by a old version of function specification. No we have updated the syntax block to avoid this problem.

- Page 1: There are also a set of formal tools -> There is also a set of formal tools
> Corrected.

- Page 2: Composite types can be used to contruct complex data -> Composite types can be used to construct complex data
> Corrected.

- Page 3: a binary operator that support various operations -> a binary operator that supports various operations
> Corrected.

- Page 5: Type of a function is determined by its number and types of arguments -> Type of a function is determined by the number and types of its arguments
> Corrected.

- Page 5: in formal verification. And its variations -> in formal verification, and its variations,
> Corrected.

- Page 6: For an output port, the reqRead field is read-only and the reqWrite field is writable. -> this sentence should be rewritten. The mentioned fields are type of Boolean. What do you mean from writable and read-only for Boolean variables?
> Now the sentence has been rewritten. Basically to avoid data conflict, *reqRead, reqWrite and value* variables are only permitted to be rewritten in certain automata. For example, an automataon only determines when it wants to read data (i.e. to rewrite the value of $A.reqRead$ where $A$ is an input port) and when it wants to write data (i.e. to rewrite the value of $B.reqWrite$ and $B.value$ where $B$ is an output port).

- Page 6: Assignment Statement (var_1, ..., var_n := term_1, ..., term_n). -> this does not match the syntax defined for an assignment statement
> This is a tuple-assignment. Since a term may also be a tuple, this code fragement is syntactically correct. However, since we do not present the syntax of *term* (due to space limit), we also modify the syntax of assignments so that it looks more clear. 

- Page 7: Transitions in Mediator automata are organized with priority. -> the priority of transitions should be explained formally.
> Corrected.

- Page 8: of formal tools. And that is exactly -> of formal tools, and that is exactly
> Corrected.

- Page 11: is canonical iff. its statements is a non-empty -> is canonical iff. its statements are a non-empty
> Corrected.

- Page 14: it should be referred that the proof of Theorem 1 is presented in the appendix.
> Corrected.

- Page 16: its successor. And when a process -> its successor, and when a process
> Corrected.

- Page 16: take e process itself as a leader -> take the process itself as a leader
> Corrected.