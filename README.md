# WSToast

English | [简体中文](README_zh.md)

A concise and elegant SwiftUI Toast notification component

## Features

- Simple and easy-to-use API
- Support for different Toast types (success, error, warning, info)
- Customizable icons and display time
- Uses the latest Observation framework and singleton pattern
- Supports iOS 17+ and macOS 14+

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

### Using in Modal Views

In `.sheet` or `.fullScreenCover` modal views, Toast cannot display properly. In this case, you need to add the `.wsToast()` modifier again to the modal content:

```swift
struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Show Modal") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ModalView()
                .wsToast() // Must add wsToast modifier again in modal view
        }
        .wsToast() // Main view wsToast modifier
    }
}

struct ModalView: View {
    var body: some View {
        Button("Show Toast in Modal") {
            showToast(title: "Toast in Modal", type: .info)
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

## Support

If you have any questions or suggestions, please submit an Issue. 