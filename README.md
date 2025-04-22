# WSToast

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