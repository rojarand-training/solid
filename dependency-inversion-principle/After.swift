protocol Shape {
    func perimeter() -> Double
}

struct Triangle: Shape {
    let a: Double
    let b: Double
    let c: Double

    func perimeter() -> Double {
        a+b+c
    }
}

struct Rectangle: Shape {
    let a: Double
    let b: Double

    func perimeter() -> Double {
        (2.0*a) + (2.0*b)
    }
}

struct Circle: Shape {
    let r: Double

    func perimeter() -> Double {
        2*3.14*r
    }
}

struct ShapePerimeterCalculator {
    private let shapes: [Shape]

    init(_ shapes: Shape...) {
        self.shapes = Array(shapes)
    }

    func calculetePerimeter() -> Double {
        shapes.reduce(0.0) { partialResult, shape in partialResult + shape.perimeter() }
    }
}

let shapePerimeterCalculator = ShapePerimeterCalculator(
    Circle(r: 2.0), 
    Circle(r: 3.0), 
    Rectangle(a: 3.0, b: 2.0),
    Rectangle(a: 4.0, b: 2.0), 
    Triangle(a: 3.0, b: 2.0, c: 4.0), 
    Triangle(a: 3.0, b: 3.0, c: 4.0))

print("Total perimeter: \(shapePerimeterCalculator.calculetePerimeter())")
