import Dispatch
import CombineX
import CXFoundation

class DataSource: ObservableObject {
    
    @Published var data = 0
    
    private var canceller = Set<AnyCancellable>()
    
    init() {
        let runloop = DispatchQueue.main.cx
        runloop.schedule(after: runloop.now, interval: 1) { [unowned self] in
            self.data += 1
        }.store(in: &canceller)
    }
}
