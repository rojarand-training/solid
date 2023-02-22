
protocol Shape {
    func calculeteArea() -> Double
}

struct Square: Shape {
    let a: Double
    func calculeteArea() -> Double {
        a * a
    }
}

struct Rectangle: Shape {
    let a: Double
    let b: Double
    func calculeteArea() -> Double {
        a * b
    }
}

struct Circle: Shape {
    let r: Double
    func calculeteArea() -> Double {
        3.14 * r * r
    }
}

struct AreaCalculator {
    var shapes: [Shape] = []
    /*
    Issues solved:
    1. No gigantic switch needed  
    2. We need to conform to protocol requirements
    3. No casting needed, we use polymorphism here
    4. Less coding needed to achieve the same effect
    */ 
    func calculeteEntireArea() -> Double {
        shapes.reduce(0.0) { sum, shape in sum + shape.calculeteArea() }
    }
}

var areaCalculator = AreaCalculator()
areaCalculator.shapes.append(Rectangle(a:2.0, b:3.0))
areaCalculator.shapes.append(Square(a:2.0))
areaCalculator.shapes.append(Circle(r:2.0))

print("Area of shapes: \(areaCalculator.calculeteEntireArea())")
