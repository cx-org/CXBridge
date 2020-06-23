#if canImport(Combine)

import Combine

#if USE_COMBINE

import CXNamespace

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Combine.Cancellable {
    
    public var ac: Self {
        return self
    }
}

#elseif USE_COMBINEX

import CombineX
import CXNamespace

// MARK: - From Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Combine.Cancellable {
    
    public var cx: CombineX.AnyCancellable {
        return .init(cancel)
    }
}

// MARK: - To Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CombineX.Cancellable {
    
    public var ac: Combine.AnyCancellable {
        return .init(cancel)
    }
}

#endif // USE_COMBINE

#endif // canImport(Combine)
