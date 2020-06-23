#if canImport(Combine)

import Combine

#if USE_COMBINE

import CXNamespace

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Combine.CombineIdentifier: ACSelfWrapping {}

#elseif USE_COMBINEX

import CombineX
import CXNamespace

// MARK: - From Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Combine.CombineIdentifier: CXWrapping {
    
    public var cx: CombineX.CombineIdentifier {
        return unsafeBitCast(self, to: CombineX.CombineIdentifier.self)
    }
}

// MARK: - To Combine

@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension CombineX.CombineIdentifier: ACWrapping {
    
    public var ac: Combine.CombineIdentifier {
        return unsafeBitCast(self, to: Combine.CombineIdentifier.self)
    }
}

#endif // USE_COMBINE

#endif // canImport(Combine)
