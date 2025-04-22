import SwiftUI

public struct ToastView: View {
    @Environment(\.colorScheme) var colorScheme
    let toast: Toast

    public init(toast: Toast) {
        self.toast = toast
    }

    public var body: some View {
        HStack(spacing: 16) {
            if toast.showIcon {
                if let image = toast.image {
                    Image(systemName: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(toast.type.iconColor)
                } else {
                    Image(systemName: toast.type.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(toast.type.iconColor)
                }
            }

            VStack(alignment: .center) {
                Text(toast.title)
                    .lineLimit(1)
                    .font(.headline)

                if let subtitle = toast.subtitle {
                    Text(subtitle)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(toast.showIcon ? .trailing : .horizontal)
        }
        .padding(.horizontal)
        .frame(height: 56)
        .background(
            Color(
                colorScheme == .dark
                    ? UIColor.secondarySystemBackground
                    : UIColor.systemBackground
            )
        )
        .cornerRadius(28)
        .shadow(
            color: Color(UIColor.black.withAlphaComponent(0.08)),
            radius: 8,
            x: 0,
            y: 4
        )
    }
}
