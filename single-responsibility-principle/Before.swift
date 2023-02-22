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

struct ShapePerimeterComputer {
    private let shapes: [Shape]

    init(_ shapes: Shape...) {
        self.shapes = Array(shapes)
    }

    func computePerimeter() -> Double {
        shapes.reduce(0.0) { partialResult, shape in partialResult + shape.perimeter() }
    }

    func output() {
        print("Hello there, computed perimeter: \(computePerimeter())")
    }
}

let shapePerimeterComputer = ShapePerimeterComputer(
    Circle(r: 2.0), 
    Rectangle(a: 3.0, b: 2.0),
    Triangle(a: 3.0, b: 3.0, c: 4.0))

shapePerimeterComputer.output()
