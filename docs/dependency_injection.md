# DEPENDENCY INJECTION

## What

Dependency injection is a technique whereby one object (or static method) supplies the dependencies of another object. A dependency is an object that can be used (a service).

Dependency or dependent means relying on something for support. Like if I say we are relying too much on mobile phones than it means we are dependent on them. In programming means: When class A uses some functionality of class B, then its said that class A has a dependency of class B. So, transferring the task of creating the object to someone else and directly using the dependency is called dependency injection.

## Why

"Let’s say we have a car class which contains various objects such as wheels, engine, etc.

Here the car class is responsible for creating all the dependency objects. Now, what if we decide to ditch MRFWheels in the future and want to use Yokohama Wheels?" - freecodecamp

We will need to recreate the car object with a new Yokohama dependency. But when using dependency injection (DI), we can change the Wheels at runtime (because dependencies can be injected at runtime rather than at compile time). It makes our Car class independent from creating the objects of Wheels, Battery, etc.

## Inversion of control — the concept behind DI

Class should not configure its dependencies statically but should be configured by some other class from outside.

It is the fifth principle of S.O.L.I.D -  that a class should depend on abstraction and not upon concretions.

According to the principles, a class should concentrate on fulfilling its responsibilities and not on creating objects that it requires to fulfill those responsibilities. And that’s where dependency injection comes into play: it provides the class with the required objects.


// Implement
## There are basically three types of dependency injection:
- constructor injection: the dependencies are provided through a class constructor.
- setter injection: the client exposes a setter method that the injector uses to inject the dependency.
- interface injection: the dependency provides an injector method that will inject the dependency into any client passed to it. Clients must implement an interface that exposes a setter method that accepts the dependency.

## Responsibility: - by frameworks
- Create the objects
- Know which classes require those objects
- And provide them all those objects


// implement DI -> should be another file
## Benefits of using DI

- Helps in Unit testing.
- Boiler plate code is reduced, as initializing of dependencies is done by the injector component.
- Extending the application becomes easier.
- Helps to enable loose coupling, which is important in application programming.

## Disadvantages of DI

- It’s a bit complex to learn, and if overused can lead to management issues and other problems.
- Many compile time errors are pushed to run-time.
- Dependency injection frameworks are implemented with reflection or dynamic programming. This can hinder use of IDE automation, such as “find references”, “show call hierarchy” and safe refactoring.

// chon 1 package - framework swift DI 

// Option: Unit test