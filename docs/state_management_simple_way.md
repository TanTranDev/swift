# Basic knowledge State management in SwiftUI

SwiftUI is a declarative Component-Oriented framework. You have to forget about MVC where you have controllers mediating between view and model. SwiftUI uses diffing algorithm to understand changes and update only corresponding views.

## State (@State)

- A State property is connected to the view. A State property is permanently being read by the view. That means that every time the @State property gets changed/updated, the view gets re-rendered and eventually displays the content depending on the @State's data.

- State is accessible only to a particular view.

- Simple properties like strings, integers and booleans belongs to a single view - mark as private.

- All the fields marked as State are stored in special separated memory, where only corresponded view can access and update them.

## Binding (@Binding)

- BindableObject protocol, which requires a didChange property. It makes possible to use it inside Environment and rebuild view as soon as it changes.

-The didChange property should be a Publisher, which is a part of a new Apple’s Reactive framework called Combine.

- The main goal of Publisher is to notify all subscribers when something changes. As soon as new values appear, SwiftUI will rebuild Views.

## ObservableObject (@ObservableObject)

The ObservableObject protocol is used with some sort of class that can store data, the @ObservedObject property wrapper is used inside a view to store an observable object instance, and the @Published property wrapper is added to any properties inside an observed object that should cause views to update when they change. 

For more complex properties – when you have a custom type you want to use that might have multiple properties and methods, or might be shared across multiple views – you will often use @ObservedObject instead.

In the simple thinking. ObservableObject is the Binding that working like State but external.

## EnvironmentObject (@EnvironmentObject)

- It is a part of feature called Environment. You can populate your Environment with all needed service classes and then access them from any view inside that Environment.

- @EnvironmentObject is accessible for every view inside the Environment.

- @EnvironmentObject Properties created elsewhere such as shared data. App crashes if it is missing.

- The Environment is the right way of Dependency Injection with SwiftUI.

## State vs Binding

Both @State and @Binding are property wrappers.

@State

It is used to update the value of a variable every time.
We can also say it's a two way binding.
If we change the property state then SwiftUI will automatically reload the body of the view.
It is used for simple properties like strings, integers and booleans.

@Binding

Using this, you can access the state property of another view.
It will give you the read and write access for the variable.

