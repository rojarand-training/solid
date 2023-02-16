
protocol Shape {
    func computeArea() -> Double
}

struct Square: Shape {
    let a: Double
    func computeArea() -> Double {
        a * a
    }
}

struct Rectangle: Shape {
    let a: Double
    let b: Double
    func computeArea() -> Double {
        a * b
    }
}

struct Circle: Shape {
    let r: Double
    func computeArea() -> Double {
        3.14 * r * r
    }
}

struct AreaComputer {
    var shapes: [Shape] = []
    /*
    Issues solved:
    1. No gigantic switch needed  
    2. We need to conform to protocol requirements
    3. No casting needed, we use polymorphism here
    4. Less coding needed to achieve the same effect
    */ 
    func computeEntireArea() -> Double {
        shapes.reduce(0.0) { sum, shape in sum + shape.computeArea() }
    }
}

var areaComputer = AreaComputer()
areaComputer.shapes.append(Rectangle(a:2.0, b:3.0))
areaComputer.shapes.append(Square(a:2.0))
areaComputer.shapes.append(Circle(r:2.0))

print("Area of shapes: \(areaComputer.computeEntireArea())")
