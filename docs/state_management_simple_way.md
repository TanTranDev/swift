# Basic knowledge State management in SwiftUI

SwiftUI is a declarative Component-Oriented framework. You have to forget about MVC where you have controllers mediating between view and model. SwiftUI uses diffing algorithm to understand changes and update only corresponding views.

## State (@State)

- A State property is connected to the view. A State property is permanently being read by the view. That means that every time the @State property gets changed/updated, the view gets re-rendered and eventually displays the content depending on the @State's data.

- State is accessible only to a particular view.

- Simple properties like strings, integers and booleans belongs to a single view - mark as private.

- All the fields marked as State are stored in special separated memory, where only corresponded view can access and update them.

## StateObject (@StateObject)

SwiftUI’s @StateObject property wrapper is designed to fill a very specific gap in state management. When you need to create a reference type inside one of your views and make sure it stays alive for use in that view.

If you want to use custom type that inside various views => create it inside one of your SwiftUI views and use @StateObject.

```swift
struct ContentView: View {
    @StateObject var user = User()

    var body: some View {
        Text("Username: \(user.username)")
    }
}
```

That will make sure the User instance does not get destroyed when the view updates.

Important: You should use @StateObject only once per object, which should be in whichever view is responsible for creating the object. All other views that share your object should use @ObservedObject.

StateObject vs ObservedObject: Previously you might have used @ObservedObject to get the same result, but that was dangerous – sometimes, and only sometimes, @ObservedObject could accidentally release the object it was storing, because it wasn’t designed to be the ultimate source of truth for the object. This won’t happen with @StateObject, so you should use it instead.

## Binding (@Binding)

- BindableObject protocol, which requires a didChange property. It makes possible to use it inside Environment and rebuild view as soon as it changes.

-The didChange property should be a Publisher, which is a part of a new Apple’s Reactive framework called Combine.

- The main goal of Publisher is to notify all subscribers when something changes. As soon as new values appear, SwiftUI will rebuild Views.

Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data. A binding connects a property to a source of truth stored elsewhere, instead of storing data directly. For example, a button that toggles between play and pause can create a binding to a property of its parent view using the Binding property wrapper.

```swift
struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
    }
}
```
The parent view declares a property to hold the playing state, using the State property wrapper to indicate that this property is the value’s source of truth.

```swift
struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title)
                .foregroundStyle(isPlaying ? .primary : .secondary)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
    }
}
```
When PlayerView initializes PlayButton, it passes a binding of its state property into the button’s binding property. Applying the $ prefix to a property wrapped value returns its projectedValue, which for a state property wrapper returns a binding to the value.

Whenever the user taps the PlayButton, the PlayerView updates its isPlaying state.

## ObservableObject (@ObservableObject)

The ObservableObject protocol is used with some sort of class that can store data, the @ObservedObject property wrapper is used inside a view to store an observable object instance, and the @Published property wrapper is added to any properties inside an observed object that should cause views to update when they change. 

For more complex properties – when you have a custom type you want to use that might have multiple properties and methods, or might be shared across multiple views – you will often use @ObservedObject instead.

In the simple thinking. ObservableObject is the Binding that working like State but external.

## Environment (@Environment)

A property wrapper that reads a value from a view’s environment.

Use the Environment property wrapper to read a value stored in a view’s environment like pixelLength, scenePhase, or locale, based on device characteristics, system state, or user settings.

SwiftUI updates some environment values automatically based on system settings and provides reasonable defaults for others.

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

