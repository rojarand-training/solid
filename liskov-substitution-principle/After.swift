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

struct RectangleResizer {
    var rectangles: [RectangularShape] = []
    
    func resizeSides(by scale: Double) {
        for rectangle in rectangles {
            rectangle.resizeSides(by: scale)
        }
    }
}

var rectangleResizer = RectangleResizer()
rectangleResizer.rectangles.append(Rectangle(a:2.0, b:3.0))
rectangleResizer.rectangles.append(Square(a:2.0))

rectangleResizer.resizeSides(by: 2.0)

