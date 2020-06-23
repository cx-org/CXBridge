#if os(macOS)

import Dispatch
import CXShim

class DataSource: ObservableObject {
    
    @Published var data = 0
    
    var state = false
    
    private var canceller = Set<AnyCancellable>()
    
    init() {
        let queue = DispatchQueue.main.cx
        queue.schedule(after: queue.now, interval: 1) { [unowned self] in
            self.data += 1
        }.store(in: &canceller)
    }
}

#endif
