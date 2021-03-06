/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

@IBDesignable
class ScoopView: UIView {
  
  // MARK: Variables
  @IBInspectable var topColor: UIColor = Flavor.vanilla().topColor {
    didSet {
        // Viewのboundsの矩形全体に再描画が必要であることを示す。
      setNeedsDisplay()
    }
  }
  
  @IBInspectable var bottomColor: UIColor = Flavor.vanilla().bottomColor {
    didSet {
        // Viewのboundsの矩形全体に再描画が必要であることを示す。
      setNeedsDisplay()
    }
  }
  
  // MARK: View Lifecycle
  override func draw(_ rect: CGRect) {
    
    let context = UIGraphicsGetCurrentContext()!
    
    let path = CGPath(ellipseIn: bounds, transform: nil)
    context.addPath(path)
    context.clip()
    
    let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [topColor.cgColor, bottomColor.cgColor] as CFArray, locations: [0, 1])
    let startPoint = CGPoint(x: bounds.midX, y: bounds.minY)
    let endPoint = CGPoint(x: bounds.midX, y: bounds.maxY)
    
    context.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
  }
}
