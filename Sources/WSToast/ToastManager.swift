import Observation
import SwiftUI

@Observable
public final class ToastManager {
    // 单例实例
    public static let shared = ToastManager()

    @MainActor public var toast: Toast?

    // 私有初始化方法确保只有一个实例
    private init() {}

    @MainActor
    public func show(
        title: String,
        subtitle: String? = nil,
        type: ToastType = .success,
        role: ToastRole? = nil,
        showIcon: Bool = true,
        duration: TimeInterval = 3.0
    ) {
        // 使用动画显示 toast
        withAnimation(.spring) {
            toast = Toast(
                title: title,
                subtitle: subtitle,
                image: nil,
                type: type,
                role: role,
                showIcon: showIcon,
                duration: duration
            )
        }

        Task {
            try? await Task.sleep(for: .seconds(duration))
            withAnimation {
                toast = nil
            }
        }
    }
}
