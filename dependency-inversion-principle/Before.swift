struct Triangle {
    let a: Double
    let b: Double
    let c: Double

    func perimeter() -> Double {
        a+b+c
    }
}

struct Rectangle {
    let a: Double
    let b: Double

    func perimeter() -> Double {
        (2.0*a) + (2.0*b)
    }
}

struct Circle {
    let r: Double

    func perimeter() -> Double {
        2*3.14*r
    }
}

struct ShapePerimeterCalculator {
    private let circle1 = Circle(r: 2.0)
    private let circle2 = Circle(r: 3.0)
    private let rectangle1 = Rectangle(a: 3.0, b: 2.0)
    private let rectangle2 = Rectangle(a: 4.0, b: 2.0)
    private let triangle1 = Triangle(a: 3.0, b: 2.0, c: 4.0)
    private let triangle2 = Triangle(a: 3.0, b: 3.0, c: 4.0)

    func calculetePerimeter() -> Double {
        circle1.perimeter() 
        + circle2.perimeter() 
        + rectangle1.perimeter()
        + rectangle2.perimeter()
        + triangle1.perimeter()
        + triangle2.perimeter()
    }
}

print("Total perimeter: \(ShapePerimeterCalculator().calculetePerimeter())")
