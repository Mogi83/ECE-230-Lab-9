# Sequential Circuits: Latches

In this lab, you learned about the basic building block of sequential circuits: the latch.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
Marina and Evan (Group 9)

## Summary
In this lab we introduced the concept of memory by first implementing a 1-bit D-latch, then scaled it up to a four-byte memory system.

## Lab Questions

###  Why can we not just use structural Verilog to implement latches?
Using structural Verilog for our latches wouldn't allow synthesis to pass because the looping condition can't be timed because timing analysis can’t handle a loop with no defined start or end point. In this lab's latch implementation we use behavioral Verilog to properly synthesize our circuit. 

### What is the meaning of always @(*) in a sensitivity block?
In a sensitivity block `always @(*)` tells Verilog to rerun the block anytime a signal the block reads changes. Both of our demux scripts do this because when we make a change to our data or the selector telling it where to go we want to immediately update their outputs.

### What importance is memory to digital circuits?
Without memory a circuit’s output only depends on its current inputs. Memory allows us to set values and states for some later purpose and gives us the opportunity to expand on what our circuits are capable of.
