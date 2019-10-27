import Foundation
import SwiftUI

internal extension UIApplication {
    class var mainWindow: UIWindow {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first ?? UIWindow()
    }
}