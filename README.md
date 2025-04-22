# WSToast

一个简洁优雅的SwiftUI Toast通知组件

## 功能特点

- 简单易用的API
- 支持不同类型的Toast（成功、错误、警告、信息）
- 自定义图标和显示时间
- 支持iOS 17+和macOS 14+

## 安装

### Swift Package Manager

1. 在Xcode中，选择"File" > "Add Packages..."
2. 输入本仓库的URL
3. 选择版本规则并点击"Add Package"

## 使用方法

### 基本设置

首先，在你的App入口或主视图中添加WSToast修饰器：

```swift
import SwiftUI
import WSToast

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

使用环境对象:

```swift
import SwiftUI
import WSToast

struct ContentView: View {
    @EnvironmentObject private var toastManager: ToastManager
    
    var body: some View {
        Button("显示成功提示") {
            Task { @MainActor in
                toastManager.show(
                    title: "操作成功",
                    subtitle: "数据已保存",
                    type: .success
                )
            }
        }
    }
}
```

### 自定义Toast类型

```swift
// 成功提示
Task { @MainActor in
    toastManager.show(
        title: "上传成功",
        type: .success
    )
}

// 错误提示
Task { @MainActor in
    toastManager.show(
        title: "连接失败",
        subtitle: "请检查网络连接",
        type: .error
    )
}

// 警告提示
Task { @MainActor in
    toastManager.show(
        title: "电量低",
        type: .warning
    )
}

// 信息提示
Task { @MainActor in
    toastManager.show(
        title: "有新消息",
        type: .info
    )
}

// 自定义图标
Task { @MainActor in
    toastManager.show(
        title: "音乐已添加",
        image: "music.note",
        type: .success
    )
}
```

## 支持

如有任何问题或建议，请提交Issue。 