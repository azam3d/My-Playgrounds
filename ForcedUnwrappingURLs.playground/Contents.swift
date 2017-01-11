//: Playground - noun: a place where people can play

import UIKit

// Returns `URL` with guided fail
public enum SocketEndPoint: String {
    case events = "http://nowhere.com/events"
    case live = "http://nowhere.com/live"
    
    public var url: URL {
        guard let url = URL(string: self.rawValue) else {
            fatalError("Unconstructable URL: \(self.rawValue)")
        }
        return url
    }
}

class Test {
    fileprivate init() {
        let event = SocketEndPoint.events.url
        let liveSocket = SocketEndPoint.live.url
    }
}
