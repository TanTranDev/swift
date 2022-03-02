# Properties Wrapper

SwiftUI offers 17 property wrappers for our applications, each of which provide different functionality.

- **@AppStorage** reads and writes values from UserDefaults. This owns its data.

- **@Binding** refers to value type data owned by a different view. Changing the binding locally changes the remote data too. This does not own its data.

- **@Environment** lets us read data from the system, such as color scheme, accessibility options, and trait collections, but you can add your own keys here if you want. This does not own its data.

- **@EnvironmentObject** reads a shared object that we placed into the environment. This does not own its data.

- **@FetchRequest** starts a Core Data fetch request for a particular entity. This owns its data.

- **@FocusedBinding** is designed to watch for values in the key window, such as a text field that is currently selected. This does not own its data.

- **@FocusedValue** is a simpler version of @FocusedBinding that doesn’t unwrap the bound value for you. This does not own its data.

- **@GestureState** stores values associated with a gesture that is currently in progress, such as how far you have swiped, except it will be reset to its default value when the gesture stops. This owns its data.

- **@Namespace** creates an animation namespace to allow matched geometry effects, which can be shared by other views. This owns its data.

- **@NSApplicationDelegateAdaptor** is used to create and register a class as the app delegate for a macOS app. This owns its data.

- **@ObservedObject** refers to an instance of an external class that conforms to the ObservableObject protocol. This does not own its data. 

- **@Published** is attached to properties inside an ObservableObject, and tells SwiftUI that it should refresh any views that use this property when it is changed. This owns its data. 

- **@ScaledMetric** reads the user’s Dynamic Type setting and scales numbers up or down based on an original value you provide. This owns its data.

- **@SceneStorage** lets us save and restore small amounts of data for state restoration. This owns its data.

- **@State** lets us manipulate small amounts of value type data locally to a view. This owns its data.

- **@StateObject** is used to store new instances of reference type data that conforms to the ObservableObject protocol. This owns its data.

- **@UIApplicationDelegateAdaptor** is used to create and register a class as the app delegate for an iOS app. This owns its data.