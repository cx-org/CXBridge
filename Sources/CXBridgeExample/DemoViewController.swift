import AppKit
import CombineX

class DemoViewController: NSViewController {
    
    let dataSource: DataSource
    
    private var dataLabel: NSTextField!
    
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
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 300))
        let title = NSTextField(labelWithString: "Cocoa View")
        title.font = NSFont.systemFont(ofSize: 20)
        title.alignment = .center
        title.frame = NSRect(x: 0, y: 250, width: 400, height: 50)
        title.autoresizingMask = [.width, .minYMargin]
        view.addSubview(title)
        dataLabel = NSTextField(labelWithString: "")
        dataLabel.frame = NSRect(x: 0, y: 0, width: 400, height: 250)
        dataLabel.autoresizingMask = [.width, .height]
        view.addSubview(dataLabel)
        self.view = view
    }
    
    override func viewDidLoad() {
        dataSource.$data.sink { [unowned self] data in
            self.dataLabel.stringValue = "data: \(data)"
        }.store(in: &canceller)
    }
}
