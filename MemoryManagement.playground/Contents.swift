//: Playground - noun: a place where people can play
// https://www.raywenderlich.com/134411/arc-memory-management-swift

import UIKit

class User {
    var name: String
    private(set) var phones: [Phone] = []
    var subscriptions: [CarrierSubscription] = []
    
    func add(phone: Phone) {
        phones.append(phone)
        phone.owner = self
    }
    
    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class Phone {
    let model: String
    weak var owner: User?
    var carrierSubscription: CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription) {
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission() {
        self.carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) is initialized")
    }
    
    deinit {
        print("Phone \(model) is being deallocated")
    }
}

class CarrierSubscription {
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User
    lazy var completePhoneNumber: () -> String = { [unowned self] in
        self.countryCode + " " + self.number
    }
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        
        user.subscriptions.append(self)
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("CarrierSubscription \(name) is being deallocated")
    }
}

do {
    let user1 = User(name: "John")
    let iPhone = Phone(model: "iPhone 6s Plus")
    user1.add(phone: iPhone)
    
    let subscription1 = CarrierSubscription(name: "TelBel", countryCode: "0032", number: "31415926", user: user1)
    iPhone.provision(carrierSubscription: subscription1)
    
    print(subscription1.completePhoneNumber())
}



class WWDCGreeting {
    let who: String
    
    init(who: String) {
        self.who = who
    }
    
    lazy var greetingMaker: () -> String = {
        [weak self] in
        guard let strongSelf = self else {
            return "No greeting available."
        }
        return "Hello \(strongSelf.who)."
    }
}

let greetingMaker: () -> String

do {
    let mermaid = WWDCGreeting(who: "mermaid")
    greetingMaker = mermaid.greetingMaker
}

greetingMaker()
