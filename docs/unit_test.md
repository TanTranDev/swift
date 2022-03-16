# UNIT TEST

## What is Unit test

A unit test is a way of testing a unit - the smallest piece of code that can be logically isolated in a system.

The isolated part of the definition is important. In his book "Working Effectively with Legacy Code", author Michael Feathers states that such tests are not unit tests when they rely on external systems: “If it talks to the database, it talks across the network, it touches the file system, it requires system configuration, or it can't be run at the same time as any other test." 

source: https://smartbear.com/learn/automated-testing/what-is-unit-testing/

## Why do we need Unit test

Tests keep the sparkling app from turning into a bug-ridden piece of junk, it’s necessary.

### Notice

Generally, tests should cover:

- Core functionality: Model classes and methods and their interactions with the controller
- The most common UI workflows
- Boundary conditions
- Bug fixes
  
Criteria:

- Fast: Tests should run quickly.
- Independent/Isolated: Tests shouldn’t share state with each other.
- Repeatable: You should obtain the same results every time you run a test. External data providers or concurrency issues could cause intermittent failures.
- Self-validating: Tests should be fully automated. The output should be either “pass” or “fail”, rather than relying on a programmer’s interpretation of a log file.
- Timely: Ideally, you should write your tests before writing the production code they test. This is known as test-driven development.