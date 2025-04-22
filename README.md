# WSToast

English | [简体中文](README_zh.md)

A lightweight SwiftUI toast notification component that adheres to Apple's native design guidelines.


## Features

- Simple and easy-to-use API
- Support for different Toast types (success, error, warning, info)
- Customizable icons and display time
- Supports iOS 17+ and macOS 14+
- Developed with pure SwiftUI, supporting cross-platform
- Simple to use, no need for many customization options

## Installation

### Swift Package Manager

1. In Xcode, select "File" > "Add Packages..."
2. Enter the URL of this repository
3. Select version rules and click "Add Package"

## Usage

### Basic Setup

Add the WSToast modifier to your App entry and use `@_exported` to import the package:

```swift
// App main entry file
@_exported import WSToast  // Use @_exported to avoid reimporting in subcomponents
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .wsToast() // Add Toast support
        }
    }
}
```

### Showing a Toast

Use the global function `showToast()`, which can be called anywhere in your app:

```swift
struct AnyView: View {
    var body: some View {
        Button("Show Toast") {
            showToast(
                title: "Operation Successful",
                subtitle: "Data has been saved",
                type: .success
            )
        }
    }
}
```

### Using in Modal Views

When using a component that displays Toasts inside a modal view (like `.sheet` or `.fullScreenCover`), you need to add the `.wsToast()` modifier to that component:

```swift
// Component A that displays Component B in a modal
struct ComponentA: View {
    @State private var showModal = false
    
    var body: some View {
        Button("Show Modal") {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            ComponentB() // ComponentB already has .wsToast() applied
        }
        .wsToast() // For toasts in ComponentA
    }
}

// Component B that shows toasts inside a modal
struct ComponentB: View {
    var body: some View {
        VStack {
            Text("Modal Content")
            Button("Show Toast in Modal") {
                showToast(title: "Toast in Modal", type: .info)
            }
        }
        .wsToast() // Required to show toasts in this modal component
    }
}
```

### Customizing Toast Types

```swift
// Success notification
showToast(
    title: "Upload Successful",
    type: .success
)

// Error notification
showToast(
    title: "Connection Failed",
    subtitle: "Please check your network connection",
    type: .error
)

// Warning notification
showToast(
    title: "Low Battery",
    type: .warning
)

// Info notification
showToast(
    title: "New Message",
    type: .info
)

// Custom icon
showToast(
    title: "Music Added",
    image: "music.note",
    type: .success
)
```

### Using Predefined Roles

You can use the `role` parameter to display toasts with predefined icons for common Apple devices and actions. When a role is specified, it takes precedence over the `type` parameter for icon selection.

```swift
// Using a role for AirPods
showToast(
    title: "AirPods Connected",
    role: .airpods
)

// Using a role for Apple Watch
showToast(
    title: "Apple Watch Synced",
    role: .appleWatch
)

// Using a role for download
showToast(
    title: "Download Complete",
    role: .download
)

// Available roles include:
// .download, .search, .airpods, .appleWatch, .printer,
// .homePod, .bad, .appleTv, .airPodMax, .safari
```

## Support

If you have any questions or suggestions, please submit an Issue. 