protocol RectangularShape {
    func resizeSides(by scale: Double)
}

class Rectangle: RectangularShape {
    private var a: Double
    private var b: Double

    init(a: Double, b: Double) {
        self.a = a
        self.b = b
    }

    func resizeSides(by scale: Double) {
        self.a *= scale
        self.b *= scale
    }
}

class Square: RectangularShape {
    private var a: Double

    init(a: Double) {
        self.a = a
    }

    func resizeSides(by scale: Double) {
        self.a *= scale
    }
}

struct RectangleService {
    var rectangles: [RectangularShape] = []
    
    func resizeSides(by factor: Double) {
        for rectangle in rectangles {
            rectangle.resizeSides(by: factor)
        }
    }
}

var rectangleService = RectangleService()
rectangleService.rectangles.append(Rectangle(a:2.0, b:3.0))
rectangleService.rectangles.append(Square(a:2.0))

rectangleService.resizeSides(by: 2.0)

