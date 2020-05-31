import SwiftUI
import CXBridge

@available(OSX 10.15, *)
struct DemoView: View {
    
    @ObservedObject var dataSource: ACWrappers.AnyObservableObject<DataSource>
    
    var body: some View {
        VStack {
            Text("SwiftUI View")
                .font(.headline)
                .padding(10)
            List {
                Text("data: \(dataSource.base.data)")
            }
        }
    }
}
