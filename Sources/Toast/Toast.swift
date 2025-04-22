import SwiftUI

public struct Toast: Identifiable, Equatable {
    public let id = UUID()
    public let title: String
    public let subtitle: String?
    public let image: String?
    public let type: ToastType
    public let showIcon: Bool
    public let duration: TimeInterval

    public init(
        title: String,
        subtitle: String? = nil,
        image: String? = nil,
        type: ToastType = .success,
        showIcon: Bool = true,
        duration: TimeInterval = 2.0
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.type = type
        self.showIcon = showIcon
        self.duration = duration
    }

    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title
            && lhs.subtitle == rhs.subtitle && lhs.image == rhs.image
            && lhs.type == rhs.type
    }
}

public enum ToastType: Equatable {
    case success, error, warning, info
    
    /// 获取类型对应的默认图标名称
    public var iconName: String {
        switch self {
        case .success: return "checkmark.circle"
        case .error: return "exclamationmark.circle"
        case .warning: return "exclamationmark.triangle"
        case .info: return "info.circle"
        }
    }
    
    /// 获取类型对应的图标颜色
    public var iconColor: Color {
        switch self {
        case .success: return .green
        case .error: return .red
        case .warning: return .orange
        case .info: return .blue
        }
    }
}
