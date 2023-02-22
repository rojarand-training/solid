struct Square {
    let a: Double
    func calculeteArea() -> Double {
        a * a
    }
}

struct Rectangle {
    let a: Double
    let b: Double
    func calculeteArea() -> Double {
        a * b
    }
}

struct Circle {
    let r: Double
    func calculeteArea() -> Double {
        3.14 * r * r
    }
}

struct AreaCalculator {
    var shapes: [Any] = []
    
    /*
    Issues:
    1. Each new type of shape requires additional change in the switch clause
    2. We are not protected by the compiler so we can forget to add new case in big code base
    3. This antipattern may lead to gigantic switch
    4. Casting is needed, it is a smell because casting may cause crashes
    */
    func calculeteEntireArea() -> Double {
        var area = 0.0
        for shape in shapes {
            switch shape {
                case let square as Square:
                    area += square.calculeteArea()
                case let rectangle as Rectangle:
                    area += rectangle.calculeteArea()
                case let circle as Circle:
                    area += circle.calculeteArea()
                default:
                    break
            }
        }
        return area
    }
}

var areaCalculator = AreaCalculator()
areaCalculator.shapes.append(Rectangle(a:2.0, b:3.0))
areaCalculator.shapes.append(Square(a:2.0))
areaCalculator.shapes.append(Circle(r:2.0))

print("Area of shapes: \(areaCalculator.calculeteEntireArea())")
