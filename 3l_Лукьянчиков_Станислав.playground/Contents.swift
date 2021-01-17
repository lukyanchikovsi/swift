import UIKit

enum DoorState {
    case open, close
}

enum EngineState {
    case start, stop
}

enum TrunkState {
    case full, empty, noempty
}

enum FuelState {
    case full, empty, noempty
}

enum Transmission {
    case auto, manual
}

struct SportCar {
    var brand: String
    var engine: EngineState = .stop {
        willSet {
            if newValue == .start {
                print("\(brand) has started")
            } else {
                print("\(brand) has stoped")
            }
        }
    }
    var transmission: Transmission = .auto
    var color: UIColor
    let year: UInt
    var mileage: UInt = 0
    let maxTrunk: Double
    var trunkVol: Double = 0 {
        willSet {
            if newValue == 0 {
                trunkState = .empty
                print("\(brand) trunk is empty")
            }else if newValue < maxTrunk {
                trunkState = .noempty
                print("\(brand) trunk no empty - \(newValue)")
            }else if newValue == maxTrunk {
                trunkState = .full
                print("\(brand) trunk is full.")
            }
        }
    }
    var trunkState: TrunkState = .empty
    var doorState: DoorState = .close {
        willSet {
            if newValue == .open {
                print("\(brand) door is open")
            } else {
                print("\(brand) door id closed")
            }
        }
    }
    var maxFuel: Double
    var fuelVol: Double = 0 {
        willSet {
            if newValue == 0 {
                fuelState = .empty
                print("\(brand) fuel is empty")
            }else if newValue < maxFuel {
                fuelState = .noempty
                print("\(brand) fuel no empty - \(newValue)")
            }else if newValue == maxFuel {
                fuelState = .full
                print("\(brand) fuel is full.")
            }
            
            if(newValue > maxFuel){
                print("Error! \(brand) has max fuel - \(maxFuel)")
            }
        }
    }
    var fuelState: FuelState = .empty
    var maxSpeed: Double
    var speed: Double = 0
    
    mutating func Refuel(litres: Double){
        fuelVol = fuelVol + litres
    }
}

struct TruckCar {
    var brand: String
    var engine: EngineState = .stop {
        willSet {
            if newValue == .start {
                print("\(brand) has started")
            } else {
                print("\(brand) has stoped")
            }
        }
    }
    var transmission: Transmission = .manual
    var color: UIColor
    let year: UInt
    var mileage: UInt = 0
    let maxTrunk: Double
    var trunkVol: Double = 0 {
        willSet {
            if newValue == 0 {
                trunkState = .empty
                print("\(brand) trunk is empty")
            }else if newValue < maxTrunk {
                trunkState = .noempty
                print("\(brand) trunk no empty - \(newValue)")
            }else if newValue == maxTrunk {
                trunkState = .full
                print("\(brand) trunk is full.")
            }
        }
    }
    var trunkState: TrunkState = .empty
    var doorState: DoorState = .close {
        willSet {
            if newValue == .open {
                print("\(brand) door is open")
            } else {
                print("\(brand) door id closed")
            }
        }
    }
    var maxFuel: Double
    var fuelVol: Double = 0 {
        willSet {
            if newValue == 0 {
                fuelState = .empty
                print("\(brand) fuel is empty")
            }else if newValue < maxFuel {
                fuelState = .noempty
                print("\(brand) fuel no empty - \(newValue)")
            }else if newValue == maxFuel {
                fuelState = .full
                print("\(brand) fuel is full.")
            }
            
            if(newValue > maxFuel){
                print("Error! \(brand) has max fuel - \(maxFuel)")
            }
        }
    }
    var fuelState: FuelState = .empty
    var maxSpeed: Double
    var speed: Double = 0
    
    mutating func Refuel(litres: Double){
        fuelVol = fuelVol + litres
    }
    
    mutating func FreeTrunk(){
        trunkVol = 0
    }
}

var Honda = SportCar(brand: "Honda", engine: .stop, color: .black, year: 2020, mileage: 1, maxTrunk: 150, trunkVol: 0, trunkState: .empty, doorState: .close, maxFuel: 75, fuelVol: 15, fuelState: .noempty, maxSpeed: 220)

var Toyota = SportCar(brand: "Toyota", color: .red, year: 2021, maxTrunk: 150, maxFuel: 65, maxSpeed: 220)

var Scania = TruckCar(brand: "Scania", color: .brown, year: 2000, maxTrunk: 550, maxFuel: 1500, maxSpeed: 120)
var Mercedes = TruckCar(brand: "Mercedes", color: .white, year: 2010, maxTrunk: 400, maxFuel: 1500, maxSpeed: 180)

Honda.Refuel(litres: 10)
Honda.Refuel(litres: 45)
Honda.Refuel(litres: 10)

Honda.doorState = .open
Honda.doorState = .close

Toyota.Refuel(litres: 25)
Toyota.engine = .start
Toyota.trunkVol = 75

Mercedes.FreeTrunk()
