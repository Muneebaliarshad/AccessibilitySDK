// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

import UIKit

open class MagnifyingView: UIView {

    //MARK: - Properties
    open var viewToMagnify: UIView!
    var touchPoint: CGPoint!

    //MARK: - Init Method
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 50
        layer.masksToBounds = true
        isUserInteractionEnabled = true
    }

    open func setTouchPoint(pt: CGPoint) {
        touchPoint = pt
        center = CGPoint(x: pt.x, y: pt.y - 80)
    }

    open override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.translateBy(x: 1 * (self.frame.size.width * 0.5), y: 1 * (self.frame.size.height * 0.5))
        context.scaleBy(x: 1.5, y: 1.5) // 1.5 is the zoom scale
        context.translateBy(x: -1 * (touchPoint.x), y: -1 * (touchPoint.y))
        viewToMagnify.layer.render(in: context)
    }

}
