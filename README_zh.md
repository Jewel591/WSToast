# WSToast

[English](README.md) | 简体中文

一个简洁优雅的SwiftUI Toast通知组件

## 功能特点

- 简单易用的API
- 支持不同类型的Toast（成功、错误、警告、信息）
- 自定义图标和显示时间
- 使用最新的Observation框架和单例模式
- 支持iOS 17+和macOS 14+

## 安装

### Swift Package Manager

1. 在Xcode中，选择"File" > "Add Packages..."
2. 输入本仓库的URL
3. 选择版本规则并点击"Add Package"

## 使用方法

### 基本设置

在你的App入口添加WSToast修饰器，并使用`@_exported`导入包：

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

### 在模态视图中使用

在 `.sheet` 或 `.fullScreenCover` 等模态视图中，Toast 无法正常显示。在这种情况下，需要在模态视图的内容中再次添加 `.wsToast()` 修饰器：

```swift
struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("显示模态") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ModalView()
                .wsToast() // 在模态视图中必须再次添加wsToast修饰器
        }
        .wsToast() // 主视图的wsToast修饰器
    }
}

struct ModalView: View {
    var body: some View {
        Button("在模态中显示Toast") {
            showToast(title: "模态中的Toast", type: .info)
        }
    }
}
```

### 显示Toast

使用全局函数`showToast()`，可以在应用的任何地方调用：

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

### 自定义Toast类型

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

## 支持

如有任何问题或建议，请提交Issue。 