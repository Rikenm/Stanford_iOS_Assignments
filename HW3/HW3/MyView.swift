//
//  MyView.swift
//  HW3
//
//  Created by Riken Maharjan on 7/15/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

@IBDesignable
class MyView: UIView {
    
    
   

//
//     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        
//        let roundedRect = UIBezierPath(roundedRect:CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height), cornerRadius: 16.0)
//        
//       
//        
//        roundedRect.addClip() // clip everything(all the drawing ) outside of this view
//        
//        UIColor.blue.setFill()
//        
//        roundedRect.fill()
        
        
        
        //
        
        let layout = Grid.Layout.aspectRatio(CGFloat(0.65))
        
    
        
        var myGrid = Grid(layout: layout,frame:bounds)
        myGrid.cellCount = 12
        
        
       
        
//        let roundedRect = UIBezierPath(roundedRect:frame, cornerRadius: 0)
//
//
//       let frame1 = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height)
//        
//        let roundedRect = UIBezierPath(roundedRect:frame1, cornerRadius: 0)
//                roundedRect.addClip() // clip everything(all the drawing ) outside of this view
//
//                UIColor.blue.setFill()
//
//                roundedRect.fill()
        
        
        for i in 0...myGrid.cellCount{
        
            if let x = myGrid[i]?.minX,let y = myGrid[i]?.minY, let width = myGrid[i]?.width, let height = myGrid[i]?.height{
            
               
            
                let myframe = CGRect(x: x, y: y, width: width-1, height: height-1)
                
                
                
                let roundedRect2 = UIBezierPath(roundedRect:myframe, cornerRadius: 17)
                
                //roundedRect2.addClip() // clip everything(all the drawing ) outside of this view
                
                UIColor.blue.setFill()
                
                roundedRect2.fill()
                
                
                // if you have only one
                
//                    let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.width/6, y: myframe.midY-myframe.height/6, width: myframe.width/3, height: myframe.height/3))
                
               
                // middle one
              
//                let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.midY-myframe.width/6, width: myframe.height/3, height: myframe.width/3))
//
//
//
//
//
//                UIColor.red.setStroke()
//
//
//                ovalPath.stroke()
                
               
                
                let ovalPath2 = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.minY, width: myframe.height/3, height: myframe.width/3))
                
                let context = UIGraphicsGetCurrentContext()
                context?.saveGState()
                   ovalPath2.addClip()
                
                
               ovalPath2.lineWidth = 3
                
                
                   UIColor.red.setStroke()
                
                 ovalPath2.stroke()
                
                // first line
                let stripes = UIBezierPath()
                stripes.move(to: CGPoint(x: x, y: y+10))
                stripes.addLine(to: CGPoint(x: x+width-2, y: y+10))
                
                stripes.lineWidth = 2
                
                
                 UIColor.red.setStroke()
                
                stripes.close()
                
                

                
                stripes.stroke()
                
                //second line
                
                let stripes2 = UIBezierPath()
                stripes2.move(to: CGPoint(x: x, y: y+16))
                stripes2.addLine(to: CGPoint(x: x+width-2, y: y+16))
                
                stripes2.lineWidth = 2
                
                UIColor.red.setStroke()
                
                stripes2.close()
                
                
                
                
                stripes2.stroke()
                
                
                
                context?.restoreGState()
                
                
                
                let diamond = UIBezierPath()
                
                diamond.move(to: CGPoint(x: myframe.midX, y: myframe.midY+40))
                diamond.addLine(to: CGPoint(x: myframe.midX+8, y: myframe.midY+40+8))
                diamond.addLine(to: CGPoint(x: myframe.midX, y: myframe.midY+40+8+8))
                diamond.addLine(to: CGPoint(x: myframe.midX-8, y: myframe.midY+40+8))
                
                diamond.close()
                
                
                diamond.lineWidth = 2
                
                UIColor.red.setStroke()
                
                diamond.stroke()
                
                
                
                let weirdarch = UIBezierPath()
                weirdarch.move(to: CGPoint(x: myframe.midX+10, y: myframe.midY+myframe.width/6))
                weirdarch.addQuadCurve(to: CGPoint(x: myframe.midX-10, y: myframe.midY+myframe.width/6), controlPoint: CGPoint(x: myframe.midX, y: myframe.minY))
                weirdarch.close()
                
                
                
                
//                let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.midY-myframe.width/6, width: myframe.height/3, height: myframe.width/3))
                
                
                
                weirdarch.lineWidth = 2
                
                                UIColor.red.setStroke()
                
                
                                weirdarch.stroke()
                
 
                
                
                
                
                
                
        }
        
        
        }
        
        
        
       
        
        
        
        
    }
    
    
    
    
    func drawOval(in frame: CGRect, count: Int,withShade shade:Int){
        
        
        
    }
    
    
    func drawSquiggle(in frame:CGRect,count:Int,withShade shade:Int){
        
        
    }
    
    func drawDiamond(in frame:CGRect,count:Int,withShade shade:Int){
        
        
    }
    
    

}
