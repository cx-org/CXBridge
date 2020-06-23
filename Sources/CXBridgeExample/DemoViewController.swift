#if os(macOS)

import AppKit
import CXShim

class DemoViewController: NSViewController {
    
    let dataSource: DataSource
    
    private var dataLabel: NSTextField!
    private var stateButton: NSButton!
    
    private var canceller = Set<AnyCancellable>()
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        guard #available(OSX 10.12, *) else {
            fatalError("not supported")
        }
        let view = FlippedView(frame: NSRect(x: 0, y: 0, width: 400, height: 300))
        let title = NSTextField(labelWithString: "Cocoa View")
        title.font = NSFont.systemFont(ofSize: 20)
        title.alignment = .center
        title.frame = NSRect(x: 0, y: 0, width: 400, height: 50)
        title.autoresizingMask = [.width, .minYMargin]
        view.addSubview(title)
        dataLabel = NSTextField(labelWithString: "data")
        dataLabel.frame.origin = NSPoint(x: 8, y: 58)
        dataLabel.autoresizingMask = [.maxXMargin, .maxYMargin]
        view.addSubview(dataLabel)
        stateButton = NSButton(checkboxWithTitle: "state", target: self, action: #selector(onClickCheckbox))
        stateButton.frame.origin = NSPoint(x: 8, y: 86)
        stateButton.autoresizingMask = [.maxXMargin, .maxYMargin]
        view.addSubview(stateButton)
        self.view = view
    }
    
    @IBAction func onClickCheckbox(sender: NSButton) {
        dataSource.state = stateButton.state == .on
    }
    
    override func viewDidLoad() {
        dataSource.objectWillChange.receive(on: RunLoop.main.cx).sink { [unowned self] in
            self.dataLabel.stringValue = "data: \(self.dataSource.data)"
            self.stateButton.state = self.dataSource.state ? .on : .off
            self.dataLabel.sizeToFit()
        }.store(in: &canceller)
    }
}

private class FlippedView: NSView {
    override var isFlipped: Bool {
        return true
    }
}

#endif
