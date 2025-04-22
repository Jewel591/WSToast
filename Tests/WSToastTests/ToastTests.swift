import XCTest
@testable import WSToast

final class ToastTests: XCTestCase {
    func testToastCreation() {
        let toast = Toast(
            title: "测试标题",
            subtitle: "测试副标题",
            type: .success
        )
        
        XCTAssertEqual(toast.title, "测试标题")
        XCTAssertEqual(toast.subtitle, "测试副标题")
        XCTAssertEqual(toast.type, .success)
        XCTAssertTrue(toast.showIcon)
        XCTAssertEqual(toast.duration, 2.0)
    }
    
    func testToastTypeIcons() {
        XCTAssertEqual(ToastType.success.iconName, "checkmark.circle")
        XCTAssertEqual(ToastType.error.iconName, "exclamationmark.circle")
        XCTAssertEqual(ToastType.warning.iconName, "exclamationmark.triangle")
        XCTAssertEqual(ToastType.info.iconName, "info.circle")
    }
    
    func testToastEquality() {
        let toast1 = Toast(title: "测试", type: .success)
        let toast2 = Toast(title: "测试", type: .success)
        let toast3 = Toast(title: "不同标题", type: .success)
        
        XCTAssertNotEqual(toast1, toast2) // 因为ID不同
        XCTAssertNotEqual(toast1, toast3)
    }
    
    @MainActor
    func testToastManager() async {
        let manager = ToastManager()
        
        XCTAssertNil(manager.toast)
        
        manager.show(title: "测试Toast")
        
        XCTAssertNotNil(manager.toast)
        XCTAssertEqual(manager.toast?.title, "测试Toast")
        
        // 等待Toast消失
        try? await Task.sleep(for: .seconds(2.1))
        
        XCTAssertNil(manager.toast)
    }
} 