import UIKit

class Model {
    
    var id: Int
    
    var posX: Float
    var posY: Float
    
    init(id: Int, posX: Float, posY: Float) {
        
        self.id = id
        
        self.posX = posX
        self.posY = posY
        
    }
    
    func Draw(){
        
    }
}

class Circle: Model {
    
    var radius: Float
    var diameter: Float
    
    init(id: Int, posX: Float, posY: Float, radius: Float) {
        
        self.radius = radius
        self.diameter = radius * 2
        
        super.init(id: id, posX: posX, posY: posY)
        
    }
    
    override func Draw() {
        
        print("Circle \(self.id) draw at \(self.posX) - \(self.posY). R: \(self.radius), D: \(self.diameter)")
        
    }
    
}

class Rectangle: Model {
    
    var width: Float
    var height: Float
    
    init(id: Int, posX: Float, posY: Float, width: Float, height: Float) {
        
        self.width = width
        self.height = height
        
        super.init(id: id, posX: posX, posY: posY)
        
    }
    
    override func Draw() {

        print("Rectangle \(self.id) draw at \(self.posX) - \(self.posY). R: \(self.width), D: \(self.height)")
        
    }

}

struct Render <T: Model> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    
    subscript(index: Int) -> Int? {
        
        return elements[ index ].id
    }
    
    mutating func Draw(){
        
        for element in elements {
            
            element.Draw()
            
        }
        
    }
}

var render = Render<Circle>()
var render_2 = Render<Rectangle>()

for i in 1...5 {
    
    render.push(Circle(id: i, posX: Float.random(in: -1 ..< 1), posY: Float.random(in: -1 ..< 1), radius: Float.random(in: 0 ..< 10)))
    
    render_2.push(Rectangle(id: i, posX: Float.random(in: -1..<1), posY: Float.random(in: -1..<1), width: Float.random(in: -1..<1), height: Float.random(in: -1..<1)))
    
}

render.Draw()
