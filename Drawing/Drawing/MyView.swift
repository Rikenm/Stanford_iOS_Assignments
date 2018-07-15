//
//  MyView.swift
//  Drawing
//
//  Created by Riken Maharjan on 7/14/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var rank:Int = 5{ didSet{ setNeedsDisplay();setNeedsLayout()}} //setNeedsDisplay to redraw . setNeeds layout needs for subviews drawing}
   
    var suit: String = "❤️"{ didSet{ setNeedsDisplay();setNeedsLayout()}} // needs for subvie}
    
    var isFaceUp : Bool = true { didSet{ setNeedsDisplay();setNeedsLayout()}} // needs for subvie}
    
    
    
    
    
    private func centeredAttributedString(_ string:String, fontSize: CGFloat) -> NSAttributedString{
        
        
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle,.font: font])
        
        
    }
    
    private var CornerString: NSAttributedString{
    
            return centeredAttributedString(rank+"\n", fontSize: 0.0)
    
    }

    
    
    override func draw(_ rect: CGRect) {
        
//        if let context = UIGraphicsGetCurrentContext(){
//
//
//            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 130, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//
//            context.setLineWidth(5.0)
//            UIColor.green.setFill()  // sets the color for the fill
//            UIColor.red.setStroke() // sets the color for the stroke
//
//            context.strokePath() // only stroke is done
//            context.fillPath()
//
//
//        }
//
//        // reusable
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 150, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//
//        path.lineWidth = 5.0
//
//       UIColor.green.setFill()
//
//       UIColor.red.setStroke()
//
//        path.stroke()  // both stroke
//
//        path.fill() // and fill is done
//
//
//
//
//    }
        
        
      // drawing the card
        
        
     let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
     
        roundedRect.addClip() // clip everything(all the drawing ) outside of this view
        
        UIColor.white.setFill()
        
        roundedRect.fill()
 
}


}
