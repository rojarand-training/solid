struct Square {
    let a: Double
    func computeArea() -> Double {
        a * a
    }
}

struct Rectangle {
    let a: Double
    let b: Double
    func computeArea() -> Double {
        a * b
    }
}

struct Circle {
    let r: Double
    func computeArea() -> Double {
        3.14 * r * r
    }
}

struct AreaComputer {
    var shapes: [Any] = []
    
    /*
    Issues:
    1. Each new type of shape requires additional change in the switch clause
    2. We are not protected by the compiler so we can forget to add new case in big code base
    3. This antipattern may lead to gigantic switch
    4. Casting is needed, it is a smell because casting may cause crashes
    */
    func computeEntireArea() -> Double {
        var area = 0.0
        for shape in shapes {
            switch shape {
                case let square as Square:
                    area += square.computeArea()
                case let rectangle as Rectangle:
                    area += rectangle.computeArea()
                case let circle as Circle:
                    area += circle.computeArea()
                default:
                    break
            }
        }
        return area
    }
}

var areaComputer = AreaComputer()
areaComputer.shapes.append(Rectangle(a:2.0, b:3.0))
areaComputer.shapes.append(Square(a:2.0))
areaComputer.shapes.append(Circle(r:2.0))

print("Area of shapes: \(areaComputer.computeEntireArea())")
