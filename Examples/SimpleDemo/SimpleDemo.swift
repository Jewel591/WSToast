import SwiftUI
import WSToast

@main
struct SimpleDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .wsToast()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("WSToast 示例")
                .font(.largeTitle)
                .padding(.bottom, 30)
            
            Button("显示成功提示") {
                showToast(
                    title: "操作成功",
                    subtitle: "数据已保存",
                    type: .success
                )
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button("显示错误提示") {
                showToast(
                    title: "操作失败",
                    subtitle: "请稍后重试",
                    type: .error
                )
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            Button("显示警告提示") {
                showToast(
                    title: "电量低",
                    type: .warning
                )
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            
            Button("显示信息提示") {
                showToast(
                    title: "有新消息",
                    type: .info
                )
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Button("自定义图标提示") {
                showToast(
                    title: "音乐已添加到播放列表",
                    image: "music.note",
                    type: .success
                )
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            
            Button("无图标提示") {
                showToast(
                    title: "简洁提示",
                    showIcon: false
                )
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .wsToast()
}
