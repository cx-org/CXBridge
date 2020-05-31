import AppKit
import SwiftUI
import CXBridge

class AppDelegate: NSObject, NSApplicationDelegate {
    
    let dataSource = DataSource()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        var controllers: [NSViewController] = []
        let cocoaView = DemoViewController(dataSource: dataSource)
        cocoaView.title = "Cocoa View"
        controllers += [cocoaView]
        if #available(OSX 10.15, *) {
            let swiftUIView = NSHostingController(rootView: DemoView(dataSource: dataSource.ac))
            swiftUIView.title = "SwiftUI View"
            controllers += [swiftUIView]
        }
        for controller in controllers {
            let window = NSWindow(contentViewController: controller)
            window.setContentSize(NSSize(width:400, height:300))
            window.styleMask = [.titled, .closable, .miniaturizable, .resizable]
            window.makeKeyAndOrderFront(nil)
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

let app = NSApplication.shared
let del = AppDelegate()
app.delegate = del
app.run()
