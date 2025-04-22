# WSToast

[English](README.md) | 简体中文

一个简洁、符合 Apple 原生设计的 SwiftUI Toast 通知组件

## 功能特点

- 简单易用的 API
- 支持不同类型的 Toast（成功、错误、警告、信息）
- 自定义图标和显示时间
- 支持 iOS 17+和 macOS 14+
- 使用纯 SwiftUI 开发，支持跨平台
- 使用简单，无需过多的自定义选项

## 安装

### Swift Package Manager

1. 在 Xcode 中，选择 "File" > "Add Packages..."
2. 输入本仓库的 URL
3. 选择版本规则并点击 "Add Package"

## 使用方法

### 基本设置

在你的 App 入口添加 WSToast 修饰器，并使用 `@_exported` 导入包：

```swift
// App主入口文件
@_exported import WSToast  // 使用@_exported导入，避免在子组件中重复导入
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .wsToast() // 添加Toast支持
        }
    }
}
```

### 显示 Toast

使用全局函数 `showToast()`，可以在应用的任何地方调用：

```swift
struct AnyView: View {
    var body: some View {
        Button("显示Toast") {
            showToast(
                title: "操作成功",
                subtitle: "数据已保存",
                type: .success
            )
        }
    }
}
```

### 在模态视图中使用

当在模态视图（如 `.sheet` 或 `.fullScreenCover`）中使用显示 Toast 的组件时，需要在该组件上添加 `.wsToast()` 修饰器：

```swift
// 组件A，通过模态窗口显示组件B
struct ComponentA: View {
    @State private var showModal = false
    
    var body: some View {
        Button("显示模态") {
            showModal = true
        }
        .sheet(isPresented: $showModal) {
            ComponentB() // ComponentB已经应用了.wsToast()
        }
        .wsToast() // 用于ComponentA中的toasts
    }
}

// 组件B，在模态中显示toasts
struct ComponentB: View {
    var body: some View {
        VStack {
            Text("模态内容")
            Button("在模态中显示Toast") {
                showToast(title: "模态中的Toast", type: .info)
            }
        }
        .wsToast() // 在模态组件中显示toasts所必需
    }
}
```

### 自定义 Toast 类型

```swift
// 成功提示
showToast(
    title: "上传成功",
    type: .success
)

// 错误提示
showToast(
    title: "连接失败",
    subtitle: "请检查网络连接",
    type: .error
)

// 警告提示
showToast(
    title: "电量低",
    type: .warning
)

// 信息提示
showToast(
    title: "有新消息",
    type: .info
)

// 自定义图标
showToast(
    title: "音乐已添加",
    image: "music.note",
    type: .success
)
```

### 使用预设 Role

你可以使用 `role` 参数来显示带有为常见苹果设备和操作预设图标的 toast。当指定 role 时，它在图标选择上的优先级高于 `type` 参数。

```swift
// 使用 AirPods 角色
showToast(
    title: "AirPods 已连接",
    role: .airpods
)

// 使用 Apple Watch 角色
showToast(
    title: "Apple Watch 已同步",
    role: .appleWatch
)

// 使用下载角色
showToast(
    title: "下载完成",
    role: .download
)

// 可用角色包括：
// .download, .search, .airpods, .appleWatch, .printer,
// .homePod, .bad, .appleTv, .airPodMax, .safari
```

## 支持

如有任何问题或建议，请提交 Issue。 