import SwiftUI

// 主要的Toast修饰器
public struct WSToastModifier: ViewModifier {
    // 直接使用单例
    @State private var toastManager = ToastManager.shared

    public func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ToastContainerView()
            }
    }
}

// 托管Toast显示的容器视图
private struct ToastContainerView: View {
    var body: some View {
        Group {
            if let toast = ToastManager.shared.toast {
                ToastView(toast: toast)
                    .padding(.top, 60)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
    }
}

// 主要的View扩展
extension View {
    public func wsToast() -> some View {
        self.modifier(WSToastModifier())
    }
}

// 全局函数，用于显示Toast
public func showToast(
    title: String,
    subtitle: String? = nil,
    type: ToastType = .success,
    role: ToastRole? = nil,
    showIcon: Bool = true,
    duration: TimeInterval = 3.0
) {
    // 创建异步任务在主线程上执行
    Task { @MainActor in
        ToastManager.shared.show(
            title: title,
            subtitle: subtitle,
            type: type,
            role: role,
            showIcon: showIcon,
            duration: duration
        )
    }
}
