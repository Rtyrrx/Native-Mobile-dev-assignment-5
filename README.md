# Assignment #5 - Object-Oriented Programming in Swift

**Course**: Native Mobile Development
**Student**: Madias Bek
**Group**: SE-2430
**Date**: 13.01.2026




## Introduction

This assignment was all about Object-Oriented Programming in Swift. Overall, it felt pretty straightforward for me because I already understand OOP concepts from other languages. Here, I mostly focused on how Swift implements things like classes, structs, protocols, generics, ARC, and error handling. Nothing crazy or unexpected, I just followed the tasks, wrote the code, ran it, and checked that everything worked as expected.



## Part 1: Classes & Objects

In this part, I created a `Person` class with `name` and `age`, added an initializer, and wrote an `introduce()` method. Then I created several objects and called the method for each one. This is classic OOP stuff, so it was very easy.

**Q1: What is a class in Swift?**  
**Answer:**  
A class is a blueprint for creating objects. It defines properties and methods that objects will have.

**Q2: What is an object?**  
**Answer:**  
An object is an instance of a class, basically a real thing created from that blueprint.



## Part 2: Structs vs Classes

Here I compared structs and classes. I made a `Student` struct and a `Teacher` class, then copied them to show how value types and reference types behave differently. This clearly showed how structs copy values and classes share references.

**Q1: Explain how value types and reference types behave differently**  
**Answer:**  
Value types (structs) get copied when assigned, while reference types (classes) point to the same object in memory.

**Q2: What is the main difference between a struct and a class?**  
**Answer:**  
Structs are value types, classes are reference types.

**Q3: When should structs be preferred over classes?**  
**Answer:**  
When you want simple data models, safety, and no shared mutable state.



## Part 3: Enums

In this part, I created an enum representing military branches and used a `switch` to handle all cases. Swift forces you to cover every case, which makes the code safer.

**Q1: Why are enums considered type-safe?**  
**Answer:**  
Because a variable can only be one of the defined cases and nothing else.

**Q2: What does “switch must be exhaustive” mean?**  
**Answer:**  
It means every possible enum case must be handled in the switch.



## Part 4: Properties, Methods & Encapsulation

Here I worked with access control. I created a `BankAccount` class with a private balance, a computed property, and `didSet`. This part clearly shows how encapsulation works in Swift.

**Q1: What is encapsulation?**  
**Answer:**  
Encapsulation is hiding internal data and exposing only what’s necessary.

**Q2: Why should some properties be private?**  
**Answer:**  
To prevent unwanted changes and protect internal logic.



## Part 5: Initializers & Deinitializers

In this part, I created a class with a custom initializer and added a `deinit` to see when an object is removed from memory. I set the object to `nil` to trigger deallocation.

**Q1: Explain when deinit is called**  
**Answer:**  
It’s called when the object is removed from memory.

**Q2: What is the purpose of init?**  
**Answer:**  
To set up an object with initial values.

**Q3: Why are deinitializers only available in classes?**  
**Answer:**  
Because only classes use reference counting (ARC).



## Part 6: Inheritance, Overriding & Polymorphism

Here I created a base `Animal` class and subclasses like `Dog` and `Cat`. I overrode methods and stored them in a parent-type array to show polymorphism in action.

**Q1: What is inheritance?**  
**Answer:**  
Inheritance allows a class to reuse and extend another class.

**Q2: What is polymorphism?**  
**Answer:**  
It’s when different objects respond differently to the same method call.



## Part 7: Protocols & Delegation

In this part, I created a protocol and made a struct conform to it. Protocols define behavior without implementation, which is very flexible.

**Q1: What problem do protocols solve?**  
**Answer:**  
They allow shared behavior without forcing inheritance.

**Q2: How are protocols different from classes?**  
**Answer:**  
Protocols define rules, classes provide implementation and storage.



## Part 8: OOP vs POP

Here I showed how behavior can be implemented using protocols instead of inheritance. Swift really pushes this style.

**Q1: Difference between OOP and POP**  
**Answer:**  
OOP focuses on classes and inheritance, POP focuses on protocols and composition.

**Q2: Why does Swift prefer value types?**  
**Answer:**  
They’re safer, faster, and avoid shared mutable state.



## Part 9: Generics

I wrote generic functions with constraints. This allows code to work with different types without duplication.

**Q1: What problem do generics solve?**  
**Answer:**  
They remove code duplication while keeping type safety.



## Part 10: Error Handling

In this part, I created a custom error enum and used `throws` with `do-catch`. Error handling in Swift is very explicit, which I like.

**Q1: What is the purpose of throw?**  
**Answer:**  
To signal that something went wrong.

**Q2: Difference between try, try?, and try!?**  
**Answer:**  
`try` throws errors, `try?` returns nil on error, `try!` crashes if there’s an error.



## Part 11: Memory Management (ARC)

Here I explained strong vs weak references and showed how retain cycles can happen. I used `weak` to break the cycle.

**Q1: How does [weak self] solve it?**  
**Answer:**  
It prevents objects from keeping each other alive forever.

**Q2: What is ARC?**  
**Answer:**  
Automatic Reference Counting is Swift’s memory management system.



## Part 12: Practical Challenge (OOP System)

This was the most interesting part. I built a full battle system using protocols, enums, classes, inheritance, delegation, generics, error handling, and functional programming. Everything worked together smoothly, and the output showed character stats, battles, logs, and sorted results.

---

## Overall Conclusion

Overall, this assignment was pretty easy for me. Most concepts were already familiar, but implementing them in Swift helped me understand Swift’s OOP style better. The practical part was fun, and everything ran without issues. This assignment reinforced my understanding of OOP, ARC, protocols, and Swift-specific design patterns.
