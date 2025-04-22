import SwiftUI
import Combine

public final class ToastManager: ObservableObject {
    @Published @MainActor public var toast: Toast?
    
    public init() {}

    @MainActor
    public func show(
        title: String,
        subtitle: String? = nil,
        type: ToastType = .success,
        showIcon: Bool = true,
        duration: TimeInterval = 2.0
    ) {
        // 使用动画显示 toast
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            toast = Toast(
                title: title,
                subtitle: subtitle,
                type: type,
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
