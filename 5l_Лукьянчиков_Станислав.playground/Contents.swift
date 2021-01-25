import UIKit

enum EngineState {
    case start, stop
}

enum Transmission {
    case auto, manual
}

enum DoorState {
    case open, close
}

enum TrunkState {
    case empty, noempty, full
}

enum FuelState {
    case empty, noempty, full
}

enum DriveMode {
    case eco, comfort, sport
}

protocol Car {

    var brand: String {get}
    var color: UIColor {get}
    var year: UInt {get}
    var transmission: Transmission {get}
    
    var engine: EngineState {get set}
    var door: DoorState {get set}
    
    var trunkState: TrunkState {get set}
    var trunkVol: Double {get set}
    var trunkMax: Double {get set}
    
    var fuelState: FuelState {get set}
    var fuelVol: Double {get set}
    var fuelMax: Double {get set}
    
    var speedVol: Double {get set}
    var speedMax: Double {get set}
    
}

extension Car {
    
    mutating func setEngineState(state: EngineState){
        self.engine = state
    }
    
    mutating func setDoorState(state: DoorState){
        self.door = state
    }
    
    mutating func setTrunkState(state: TrunkState){
        self.trunkState = state
    }
    
    mutating func setFuelState(state: FuelState){
        self.fuelState = state
    }
    
}

class vehicle: Car {
    
    var brand: String
    var color: UIColor
    var year: UInt
    var transmission: Transmission
    
    var engine: EngineState = .stop
    var door: DoorState = .close
    
    var trunkState: TrunkState = .empty
    var trunkVol: Double = 0
    var trunkMax: Double
    
    var fuelState: FuelState = .empty
    var fuelVol: Double = 0
    var fuelMax: Double
    
    var speedVol: Double = 0
    var speedMax: Double
    
    init(brand: String, color: UIColor, year: UInt, transmission: Transmission, trunkMax: Double, fuelMax: Double, speedMax: Double) {
        
        self.brand = brand
        self.color = color
        self.year = year
        self.transmission = transmission
        self.trunkMax = trunkMax
        self.fuelMax = fuelMax
        self.speedMax = speedMax
        
    }
    
}

class SportCar: vehicle, CustomStringConvertible {
    
    var description: String {
        
        return "\(brand)'s check info: engine \(engine), door \(door), fuel \(fuelState) (\(fuelVol)), trunk \(trunkState) (\(trunkVol))"
    }
}

class TrunkCar: vehicle, CustomStringConvertible {
    
    var description: String {
     
        return "\(brand)'s check info: engine \(engine), door \(door), fuel \(fuelState) (\(fuelVol)), trunk \(trunkState) (\(trunkVol))"
    }
}

var Honda = SportCar(brand: "Honda", color: .black, year: 2020, transmission: .manual, trunkMax: 150, fuelMax: 65, speedMax: 220)
var Scania = TrunkCar(brand: "Scania", color: .white, year: 1995, transmission: .auto, trunkMax: 500, fuelMax: 1500, speedMax: 160)

Honda.setDoorState(state: .open)
Honda.setEngineState(state: .start)

print(Honda.description)
print(Scania.description)
