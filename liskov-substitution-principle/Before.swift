
class Rectangle {
    fileprivate var a: Double
    fileprivate var b: Double

    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }

    func setA(_ a: Double) {
        self.a = a
    }

    func getA() -> Double {
        self.a
    }

    func setB(_ b: Double) {
        self.b = b
    }

    func getB() -> Double {
        self.b
    }

    func computeArea() -> Double {
        a * b
    }
}

class Square: Rectangle {
    
    init(a: Double) {
        super.init(a: a, b: a)
    }

    override func setB(_ b: Double) {
        fatalError("Do not use b side for a square")
    }

    override func getB() -> Double {
        fatalError("Do not use b side for a square")
    }

    override func computeArea() -> Double {
        a * a
    }

}

struct RectangleService {
    var rectangles: [Rectangle] = []
    
    func resizeSides(by scale: Double) {
        for rectangle in rectangles {
            rectangle.setA(rectangle.getA() * scale)
            rectangle.setB(rectangle.getB() * scale)
        }
    }
}

var rectangleService = RectangleService()
rectangleService.rectangles.append(Rectangle(a:2.0, b:3.0))
rectangleService.rectangles.append(Square(a:2.0))

rectangleService.resizeSides(by: 2.0)

