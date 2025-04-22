import SwiftUI

// 主要的Toast修饰器
public struct WSToastModifier: ViewModifier {
    @StateObject private var toastManager = ToastManager()
    
    public func body(content: Content) -> some View {
        content
            .environmentObject(toastManager)
            .overlay(alignment: .top) {
                ToastContainerView()
            }
    }
}

// 托管Toast显示的容器视图
private struct ToastContainerView: View {
    @EnvironmentObject private var toastManager: ToastManager
    @State private var currentToast: Toast?
    
    var body: some View {
        Group {
            if let toast = currentToast {
                ToastView(toast: toast)
                    .padding(.top, 60)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .task {
            for await _ in AsyncStream<Void>(unfolding: { .some(()) }) {
                await updateToast()
            }
        }
    }
    
    @MainActor
    private func updateToast() {
        currentToast = toastManager.toast
    }
}

// 主要的View扩展
public extension View {
    func wsToast() -> some View {
        self.modifier(WSToastModifier())
    }
    
    // 便捷方法用于显示Toast
    func showToast(
        title: String,
        subtitle: String? = nil,
        type: ToastType = .success,
        showIcon: Bool = true,
        duration: TimeInterval = 2.0
    ) -> some View {
        self.modifier(ToastActionModifier(
            title: title,
            subtitle: subtitle,
            type: type,
            showIcon: showIcon,
            duration: duration
        ))
    }
}

// 用于显示Toast消息的修饰器
public struct ToastActionModifier: ViewModifier {
    @EnvironmentObject private var toastManager: ToastManager
    
    let title: String
    let subtitle: String?
    let type: ToastType
    let showIcon: Bool
    let duration: TimeInterval
    
    public init(
        title: String,
        subtitle: String? = nil,
        type: ToastType = .success,
        showIcon: Bool = true,
        duration: TimeInterval = 2.0
    ) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.showIcon = showIcon
        self.duration = duration
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                showToastMessage()
            }
    }
    
    private func showToastMessage() {
        Task { @MainActor in
            toastManager.show(
                title: title,
                subtitle: subtitle,
                type: type,
                showIcon: showIcon,
                duration: duration
            )
        }
    }
} 