protocol Shape {
    func perimeter() -> Double
    func longestSideLegth() -> Double
}

struct Triangle: Shape {
    let a: Double
    let b: Double
    let c: Double

    func perimeter() -> Double {
        a+b+c
    }

    func longestSideLegth() -> Double {
        [a, b, c].max()!
    }
}

struct Rectangle: Shape {
    let a: Double
    let b: Double

    func perimeter() -> Double {
        (2.0*a) + (2.0*b)
    }

    func longestSideLegth() -> Double {
        [a, b].max()!
    }
}

struct Circle: Shape {
    let r: Double

    func perimeter() -> Double {
        2*3.14*r
    }

    func longestSideLegth() -> Double {
        0
    }
}

let shapes: [Shape] = [Triangle(a:4, b:5, c:3), Rectangle(a:3.0, b:4.0), Circle(r:2.0)]
shapes.forEach { shape in print("Longest side: \(shape.longestSideLegth())") }
