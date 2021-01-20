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

class Car {
    var brand: String
    let color: UIColor
    let year: UInt
    var engine: EngineState
    let transmission: Transmission
    var door: DoorState
    
    var trunkState: TrunkState
    var trunkVol: Double
    let trunkMax: Double
    
    var fuelState: FuelState
    var fuelVol: Double
    let fuelMax: Double
    
    var speedVol: Double
    let speedMax: Double
    
    init(brand: String, color: UIColor, year: UInt, transmission: Transmission, trunkMax: Double, fuelMax: Double, speedMax: Double){
        
        self.brand = brand
        self.color = color
        self.year = year
        self.engine = .stop
        self.transmission = transmission
        self.door = .open
        self.trunkState = .empty
        self.trunkVol = 0
        self.trunkMax = trunkMax
        self.fuelState = .empty
        self.fuelVol = 0
        self.fuelMax = fuelMax
        self.speedVol = 0
        self.speedMax = speedMax
    }
    
    func Refuel(litres: Double){
        
        let newVol = fuelVol + litres;
        
        if(newVol == 0){
            
            fuelState = .empty
            print("\(brand)'s fuel is empty")
            
        }else if (newVol > 0 && newVol < fuelMax ){
            
            fuelState = .noempty
            fuelVol = newVol
            print("\(brand)'s fuel volume = \(fuelVol)")
            
        }else if (newVol == fuelMax){
            
            fuelState = .full
            fuelVol = newVol
            print("\(brand)'s fuel is full")
            
        }else if (newVol > trunkMax){
            
            print("\(brand)'s Refuel() input error! Max Fuel volume = \(fuelMax)")
            
        }
        
    }
    
    func TrunkLoad(volume: Double){
        
        let newVol = trunkVol + volume;
        
        if(newVol == 0){
            
            trunkState = .empty
            print("\(brand)'s trunk is empty")
            
        }else if (newVol > 0 && newVol < trunkMax ){
            
            trunkState = .noempty
            trunkVol = newVol
            print("\(brand)'s trunk volume = \(trunkVol)")
            
        }else if (newVol == trunkMax){
            
            trunkState = .full
            trunkVol = newVol
            print("\(brand)'s trunk is full")
            
        }else if (newVol > trunkMax){
            
            print("\(brand)'s TrunkLoad() input error! Max trunk volume = \(trunkMax)")
            
        }
        
    }
    
    func TrunkFree(){
        
        trunkVol = 0
        trunkState = .empty
        print("\(brand)'s trunk is empty")
        
    }
    
    func EngineStart(){
        engine = .start
        print("\(brand) has started")
    }
    
    func EngineStop(){
        
        if(speedVol > 0){
            print("\(brand)'s engine can't stop! Speed = \(speedVol)")
        }else{
            engine = .stop
            print("\(brand) has started")
        }
    }
    
    func DoorOpen(){
        if(speedVol > 0){
            print("\(brand)'s door can't open! Speed = \(speedVol)")
        }else{
            door = .open
            print("\(brand)'s door has open")
        }
    }
    
    func DoorClose(){
        door = .close
    }
    
    func Drive(speed: Double){
        
        var canDrive: Bool = true
        let newSpeed: Double = speedVol + speed
        
        if(door == .open){
            canDrive = false
            print("\(brand) can't drive - door is open")
        }
        
        if(fuelState == .empty){
            canDrive = false
            print("\(brand) can't drive - fuel is empty")
        }
        
        if(engine == .stop){
            canDrive = false
            print("\(brand) can't drive - engine has no started")
        }
        
        if(newSpeed > speedMax){
            speedVol = speedMax
            print("\(brand) - I believe I can fly!!!")
        }
        
        if(canDrive == true){
            speedVol = newSpeed
            print("\(brand) drive! Speed = \(speedVol)")
        }
        
    }
    
    func Stop(speed: Double){
        
        let newSpeed: Double = speedVol - speed
        
        if(newSpeed <= 0){
            print("\(brand) stoped")
        }else{
            speedVol = newSpeed
            print("\(brand) drive! Speed = \(speedVol)")
        }
    }
}

class SportCar: Car {
    
    var driveMode: DriveMode = .eco
    
    func ChangeMode(mode: DriveMode){
        
        driveMode = mode
        print("\(brand)'s mode = \(driveMode)")
        
    }
    
}

class TruckCar: Car {
    
    override func EngineStop(){
        engine = .stop
        print("\(brand) has started")
    }
    
    override func DoorOpen(){
        door = .open
        print("\(brand)'s door has open")
    }
    
    override func Drive(speed: Double){
        
        var canDrive: Bool = true
        let newSpeed: Double = speedVol + speed
        
        if(fuelState == .empty){
            canDrive = false
            print("\(brand) can't drive - fuel is empty")
        }
        
        if(engine == .stop){
            canDrive = false
            print("\(brand) can't drive - engine has no started")
        }
        
        if(newSpeed > speedMax){
            speedVol = speedMax
            print("\(brand) - I believe I can fly!!!")
        }
        
        if(canDrive == true){
            speedVol = newSpeed
            print("\(brand) drive! Speed = \(speedVol)")
        }
        
    }
    
}

var Honda = SportCar(brand: "Honda", color: .brown, year: 2020, transmission: .manual, trunkMax: 150, fuelMax: 65, speedMax: 220);

Honda.Refuel(litres: 25)
Honda.TrunkLoad(volume: 15)
Honda.EngineStart()
Honda.DoorClose()
Honda.Drive(speed: 25)
Honda.ChangeMode(mode: .sport)
Honda.Stop(speed: 15)
Honda.DoorOpen()
Honda.EngineStop()

var Scania = TruckCar(brand: "Scania", color: .white, year: 2010, transmission: .manual, trunkMax: 500, fuelMax: 1500, speedMax: 160)

Scania.Refuel(litres: 500)
Scania.TrunkLoad(volume: 250)
Scania.EngineStart()
Scania.Drive(speed: 15)
