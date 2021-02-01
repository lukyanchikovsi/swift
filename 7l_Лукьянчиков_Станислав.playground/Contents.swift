import UIKit

enum BarnError: Error {
    case empty
    case invalidSelection
}

class Barn {
    
    fileprivate var animals = [
        "Cow":      500.0,
        "Rabbit":   2.5,
        "Cat":      2
    ]
    
    func getWeight(name: String) -> (Double?, BarnError?) {
        
        guard let weight = animals[name] else {
            return (nil, BarnError.invalidSelection)
        }
        
        return (weight, nil)
    }
    
    func averageWeight() -> (Double?, BarnError?) {
        
        guard animals.count > 0 else {
            return (nil, BarnError.empty)
        }
        
        var total_weight: Double = 0
        
        for animal in animals {
            total_weight += animal.value
        }
        
        return (total_weight / Double(animals.count), nil)
    }
}

var barn = Barn()

barn.getWeight(name: "Cow")
barn.getWeight(name: "Dog")
barn.averageWeight()

class Movie {
    
    var roles = [
        "Bilbo Baggins": 169.0,
        "Frodo Baggins": 168.0,
        "Samwise Gamgee": 170.0
    ]
    
    func getGrowth(name: String) throws -> Double {
        
        guard let role = roles[name] else {
            throw BarnError.invalidSelection
        }
        
        return role
    }
    
    func awerageGrowth() throws -> Double {
        
        guard roles.count > 0 else {
            throw BarnError.empty
        }
        
        var total_growht: Double = 0
        
        for role in roles {
            
            total_growht += role.value
            
        }
        
        return total_growht / Double(roles.count)
    }
}

var ring = Movie()

do {
    
    let awerage = try ring.awerageGrowth()
    
    let bb = try ring.getGrowth(name: "Bilbo Baggins")
    let fb = try ring.getGrowth(name: "Frodo Baggins")
    let dw = try ring.getGrowth(name: "Darth Vader")
    
} catch BarnError.empty {
    
    print(BarnError.empty)
    
} catch BarnError.invalidSelection {
    
    print(BarnError.invalidSelection)
    
}
