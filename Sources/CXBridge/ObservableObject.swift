#if canImport(Combine)

import Combine
import CombineX
import CXNamespace

// MARK: - From Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Combine.ObservableObject {
    
    public var cx: CXWrappers.AnyObservableObject<Self> {
        return .init(wrapping: self)
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CXWrappers {
    
    public final class AnyObservableObject<Base: Combine.ObservableObject>: CXWrapper, CombineX.ObservableObject {
        
        public let base: Base
        
        public init(wrapping base: Base) {
            self.base = base
        }
        
        public var objectWillChange: CombineX.AnyPublisher<Base.ObjectWillChangePublisher.Output, Never> {
            return base.objectWillChange.cx
        }
    }
}

// MARK: - To Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CombineX.ObservableObject {
    
    public var ac: ACWrappers.AnyObservableObject<Self> {
        return .init(wrapping: self)
    }
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension ACWrappers {
    
    public final class AnyObservableObject<Base: CombineX.ObservableObject>: ACWrapper, Combine.ObservableObject {
        
        // Mutable due to SwiftUI's ObservedObject.Wrapper which requires ReferenceWritableKeyPath.
        public var base: Base
        
        public init(wrapping base: Base) {
            self.base = base
        }
        
        public var objectWillChange: Combine.AnyPublisher<Base.ObjectWillChangePublisher.Output, Never> {
            return base.objectWillChange.ac
        }
    }
}

#endif
