//
//  MyView.swift
//  HW3
//
//  Created by Riken Maharjan on 7/15/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit


protocol Click {
    
    func buttonClicked(myview:View2)
}

@IBDesignable
class MyView: UIView {
    
    
    var delegate: Click!
    
    static var  allmyViews = [View2]()
    
    
    
    
    var type: [Int] = [] {
        
        didSet{
            
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        
        print(sender?.view)
        
        if let view = sender?.view as? View2{
            
            
           
            
             delegate.buttonClicked(myview:view )
            
        }
//        delegate.buttonClicke(myview: (sender?.view)! )
    }
    
   

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
        myGrid.cellCount = 5
        
        
       
        
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
                
                 let myview = View2(frame: myframe)
                  myview.backgroundColor = .clear
                
                UIColor.blue.setFill()
                
                
                
                
                roundedRect2.fill()
                
                MyView.allmyViews.append(myview)
                
                self.addSubview(myview)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
//                tap.delegate = self // This is not required
                
                
                myview.addGestureRecognizer(tap)
                
                if type == [] || type[i] == 0{

                drawSquiggle(in: myframe, count: 3, withShade: 1)
                    
                }else if type[i] == 1{
                    
                    drawDiamond(in: myframe, count: 3, withShade: 1)
                }else{
                    
                    drawOval(in: myframe, count: 3, withShade: 1)
                }
                
                
                
                
        }
        
        
        }
        
        
        
       
        
        
        
        
    }
    
    
    
    
    func drawOval(in myframe: CGRect, count: Int,withShade shade:Int){
        // up, middle, down
        if count == 1{
            // midle
            
                    let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.midY-myframe.width/6, width: myframe.height/3, height: myframe.width/3))
                    UIColor.red.setStroke()
            
                    ovalPath.lineWidth = 3
            
                    let context = UIGraphicsGetCurrentContext()
                     context?.saveGState()
                     ovalPath.addClip()
            
                     // if line or not
            
                    if shade == 0{
                        // lines
                        let startPoint = CGPoint(x: 0, y: myframe.midY - 0.04 * myframe.height )
                        let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY - 0.04 * myframe.height)
                        
                        
                        drawLines(in: [startPoint,endpoint], count: 1)
                        
                        let startPoint2 = CGPoint(x: 0, y: myframe.midY + 0.04 * myframe.height )
                        let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY + 0.04 * myframe.height)
                        
                         drawLines(in: [startPoint2,endpoint2], count: 1)
                        
                        
                        
                        
                    }else if shade == 1 {
                        //fill
                        UIColor.red.setFill()
                        ovalPath.fill()
                    }
            
            
            
            
                    ovalPath.stroke()
                    context?.restoreGState()
            
            
            
            
            
            
        }else if count == 2{
            
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.minY+0.1 * myframe.width, width: myframe.height/3, height: myframe.width/3))
            
                        var context = UIGraphicsGetCurrentContext()
                        context?.saveGState()
                        ovalPath.addClip()
            
            
                        ovalPath.lineWidth = 3
            
            
                        UIColor.red.setStroke()
            
            
            
            
                            if shade == 1 {
                                //fill
                                UIColor.red.setFill()
                                
                                ovalPath.fill()
                            }
                            else if shade == 0 {
                                let startPoint = CGPoint(x: 0, y: myframe.minY+0.2 * myframe.width )
                                let endpoint = CGPoint(x: myframe.maxX, y: myframe.minY+0.2 * myframe.width)
                                
                                
                                drawLines(in: [startPoint,endpoint], count: 1)
                                
                                let startPoint2 = CGPoint(x: 0, y: myframe.minY + 0.3 * myframe.width )
                                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.minY + 0.3 * myframe.width)
                                
                                drawLines(in: [startPoint2,endpoint2], count: 1)
                                
                            }
            
            
                          ovalPath.stroke()
                         context?.restoreGState()
            
            
            
            let ovalPath2 = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.maxY-0.6 * myframe.width, width: myframe.height/3, height: myframe.width/3))
            
                        context = UIGraphicsGetCurrentContext()
                        context?.saveGState()
                        ovalPath2.addClip()
            
            
                        ovalPath2.lineWidth = 3
            
            
                        UIColor.red.setStroke()
            
                        if shade == 0{
                            // lines
                            let startPoint = CGPoint(x: 0, y: myframe.maxY-0.5 * myframe.width )
                            let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY-0.5 * myframe.width)
                            
                            
                            drawLines(in: [startPoint,endpoint], count: 1)
                            
                            let startPoint2 = CGPoint(x: 0, y: myframe.maxY-0.4 * myframe.width)
                            let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.maxY-0.4 * myframe.width)
                            
                            drawLines(in: [startPoint2,endpoint2], count: 1)
                            
                            
                            
                            
                        }else if shade == 1 {
                            //fill
                            UIColor.red.setFill()
                            ovalPath2.fill()
                            
                        }
            
            
                        ovalPath2.stroke()
            
                        context?.restoreGState()
            
            
            
            
            
        }else {
            
            
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.minY+0.1 * myframe.width, width: myframe.height/3, height: myframe.width/3))
            
            var context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            ovalPath.addClip()
            
            
            ovalPath.lineWidth = 3
            
            
            UIColor.red.setStroke()
            
            
            
            
            if shade == 1 {
                //fill
                UIColor.red.setFill()
                
                ovalPath.fill()
            }
            else if shade == 0 {
                let startPoint = CGPoint(x: 0, y: myframe.minY+0.2 * myframe.width )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.minY+0.2 * myframe.width)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.minY + 0.3 * myframe.width )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.minY + 0.3 * myframe.width)
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
            }
            
            
            ovalPath.stroke()
            context?.restoreGState()
            
            
            
            
            
            let ovalPathm = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.midY-myframe.width/6, width: myframe.height/3, height: myframe.width/3))
            UIColor.red.setStroke()
            
            ovalPathm.lineWidth = 3
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            ovalPathm.addClip()
            
            // if line or not
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.midY - 0.04 * myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY - 0.04 * myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.midY + 0.04 * myframe.height )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY + 0.04 * myframe.height)
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                ovalPathm.fill()
            }
            
            
            
            
            ovalPathm.stroke()
            context?.restoreGState()
            
            
            
            
            
            
            
            
            let ovalPath2 = UIBezierPath(ovalIn: CGRect(x: myframe.midX-myframe.height/6, y: myframe.maxY-0.4 * myframe.width, width: myframe.height/3, height: myframe.width/3))
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            ovalPath2.addClip()
            
            
            ovalPath2.lineWidth = 3
            
            
            UIColor.red.setStroke()
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.maxY-0.3 * myframe.width )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY-0.3 * myframe.width)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.maxY-0.2 * myframe.width)
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.maxY-0.2 * myframe.width)
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                ovalPath2.fill()
                
            }
            
            
            ovalPath2.stroke()
            
            context?.restoreGState()
            
            
            
        }
        
        
        
        
        
        
    }
    
   
    
    func drawDiamond(in myframe:CGRect,count:Int,withShade shade:Int){
        
        
        // up, middle, down
        if count == 1{
            
            
            
            // middle
            
            
            let diamond = UIBezierPath()
            
                            diamond.move(to: CGPoint(x: myframe.midX, y: myframe.midY-0.2*myframe.height))
                            diamond.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.midY))
                            diamond.addLine(to: CGPoint(x: myframe.midX, y: myframe.midY+0.2*myframe.height))
                            diamond.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y: myframe.midY))
            
                            diamond.close()
            
                            let context = UIGraphicsGetCurrentContext()
                            context?.saveGState()
                            diamond.addClip()
            
            
                            diamond.lineWidth = 3
            
                            UIColor.red.setStroke()
            
            
            
                            if shade == 0{
                                // lines
                                let startPoint = CGPoint(x: 0, y: myframe.midY - 0.04 * myframe.height )
                                let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY - 0.04 * myframe.height)
                                
                                
                                drawLines(in: [startPoint,endpoint], count: 1)
                                
                                let startPoint2 = CGPoint(x: 0, y: myframe.midY + 0.04 * myframe.height )
                                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY + 0.04 * myframe.height)
                                
                                drawLines(in: [startPoint2,endpoint2], count: 1)
                                
                                
                                
                            }else if shade == 1 {
                                //fill
                                UIColor.red.setFill()
                                diamond.fill()
                                
                            }
            
            
                            diamond.stroke()
                             context?.restoreGState()
            //
        }else if count == 2{
            
           
            let diamond = UIBezierPath()
            
            diamond.move(to: CGPoint(x: myframe.midX, y: myframe.minY+0.2*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.minY+0.3*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX, y: myframe.minY+0.4*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y:myframe.minY+0.3*myframe.height))
            
            diamond.close()
            
            var context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            diamond.addClip()
            
            
            diamond.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.minY+0.28*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.minY+0.28*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.minY+0.32*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.minY+0.32*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                diamond.fill()
                
            }
            
            
            diamond.stroke()
            context?.restoreGState()
            
            
            
            
            let diamond2 = UIBezierPath()
            
            diamond2.move(to: CGPoint(x: myframe.midX, y: myframe.maxY-0.2*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.maxY-0.3*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX, y: myframe.maxY-0.4*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y:myframe.maxY-0.3*myframe.height))
            
            diamond2.close()
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            diamond2.addClip()
            
            
            diamond2.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.maxY-0.28*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY-0.28*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.maxY-0.32*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.maxY-0.32*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                diamond2.fill()
                
            }
            
            
            diamond2.stroke()
            context?.restoreGState()
            
            
            
            
            
            
            
            
            
            
        }else {
            
           
            let diamond = UIBezierPath()
            
            diamond.move(to: CGPoint(x: myframe.midX, y: myframe.minY+0.1*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.minY+0.2*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX, y: myframe.minY+0.3*myframe.height))
            diamond.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y:myframe.minY+0.2*myframe.height))
            
            diamond.close()
            
            var context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            diamond.addClip()
            
            
            diamond.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.minY+0.18*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.minY+0.18*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.minY+0.22*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.minY+0.22*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                diamond.fill()
                
            }
            
            
            diamond.stroke()
            context?.restoreGState()
            
            
            
            //current
            
            let diamondm = UIBezierPath()
            
            diamondm.move(to: CGPoint(x: myframe.midX, y: myframe.midY-0.1*myframe.height))
            diamondm.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.midY))
            diamondm.addLine(to: CGPoint(x: myframe.midX, y: myframe.midY+0.1*myframe.height))
            diamondm.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y: myframe.midY))
//
//
            diamondm.close()
//
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            diamondm.addClip()
            
            
            diamondm.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.midY-0.02*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY-0.02*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.midY+0.02*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY+0.02*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                diamondm.fill()
                
            }
            
            
            diamondm.stroke()
            context?.restoreGState()
            
            
            
            
            
            
            let diamond2 = UIBezierPath()
            
            diamond2.move(to: CGPoint(x: myframe.midX, y: myframe.maxY-0.1*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX+0.3 * myframe.width, y: myframe.maxY-0.2*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX, y: myframe.maxY-0.3*myframe.height))
            diamond2.addLine(to: CGPoint(x: myframe.midX-0.3 * myframe.width, y:myframe.maxY-0.2*myframe.height))
            
            diamond2.close()
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            diamond2.addClip()
            
            
            diamond2.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.maxY-0.18*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY-0.18*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.maxY-0.22*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.maxY-0.22*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                diamond2.fill()
                
            }
            
            
            diamond2.stroke()
            context?.restoreGState()
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    func drawSquiggle(in myframe:CGRect,count:Int,withShade shade:Int){
        
        
      
        if count == 1{
            // middle
            
            let weirdarch = UIBezierPath()
            weirdarch.move(to: CGPoint(x: myframe.midX+0.2*myframe.width, y: myframe.midY+myframe.width/6))
            weirdarch.addQuadCurve(to: CGPoint(x: myframe.midX-0.2*myframe.width, y: myframe.midY+myframe.width/6), controlPoint: CGPoint(x: myframe.midX, y: myframe.minY))
            weirdarch.close()
            
            
            
          let context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarch.addClip()
            
            weirdarch.lineWidth = 2
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.midY - 0.05 * myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY - 0.05 * myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.midY+0.05*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY+0.05*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarch.fill()
                
            }
            
            
            
            
            weirdarch.stroke()
             context?.restoreGState()
            
            
            
            
        }else if count == 2{
            
            let weirdarch = UIBezierPath()
            weirdarch.move(to: CGPoint(x: myframe.midX+0.1*myframe.width, y: myframe.minY+0.35*myframe.height))
            weirdarch.addQuadCurve(to: CGPoint(x: myframe.midX-0.1*myframe.width, y: myframe.minY+0.35*myframe.height), controlPoint: CGPoint(x: myframe.midX, y: myframe.minY))
            weirdarch.close()
            
            
            
            var context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarch.addClip()
            
            weirdarch.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y:  myframe.minY+0.3*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y:  myframe.minY+0.3*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.minY+0.25*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y:  myframe.minY+0.25*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarch.fill()
                
            }
            
            
            
            
            weirdarch.stroke()
            context?.restoreGState()
            
            
            
            
            let weirdarch2 = UIBezierPath()
            weirdarch2.move(to: CGPoint(x: myframe.midX+0.1*myframe.width, y: myframe.maxY - 0.1 * myframe.height))
            weirdarch2.addQuadCurve(to: CGPoint(x: myframe.midX-0.1*myframe.width, y: myframe.maxY - 0.1 * myframe.height), controlPoint: CGPoint(x: myframe.midX, y: myframe.midY))
            weirdarch2.close()
            
            
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarch2.addClip()
            
            weirdarch2.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.maxY - 0.20 * myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY - 0.20 * myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.maxY - 0.15*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y:myframe.maxY - 0.15 * myframe.height  )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarch2.fill()
                
            }
            
            
            
            
            weirdarch2.stroke()
            context?.restoreGState()
            
            
            
            
        }else{
            
            let weirdarch = UIBezierPath()
            weirdarch.move(to: CGPoint(x: myframe.midX+0.1*myframe.width, y: myframe.minY+0.35*myframe.height))
            weirdarch.addQuadCurve(to: CGPoint(x: myframe.midX-0.1*myframe.width, y: myframe.minY+0.35*myframe.height), controlPoint: CGPoint(x: myframe.midX, y: myframe.minY))
            weirdarch.close()
            
            
            
            var context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarch.addClip()
            
            weirdarch.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y:  myframe.minY+0.3*myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y:  myframe.minY+0.3*myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.minY+0.25*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y:  myframe.minY+0.25*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarch.fill()
                
            }
            
            
            
            
            weirdarch.stroke()
            context?.restoreGState()
            
            
            
            
            let weirdarchm = UIBezierPath()
            weirdarchm.move(to: CGPoint(x: myframe.midX+0.1*myframe.width, y: myframe.midY+0.09*myframe.height))
            weirdarchm.addQuadCurve(to: CGPoint(x: myframe.midX-0.1*myframe.width, y: myframe.midY+0.09*myframe.height), controlPoint: CGPoint(x: myframe.midX, y: myframe.midY-0.27*myframe.height))
            weirdarchm.close()
            
            
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarchm.addClip()
            
            weirdarchm.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.midY - 0.01 * myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.midY - 0.01 * myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.midY+0.05*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y: myframe.midY+0.05*myframe.height )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarchm.fill()
                
            }
            
            
            
            
            weirdarchm.stroke()
            context?.restoreGState()
            
            
            
            
            
            let weirdarch2 = UIBezierPath()
            weirdarch2.move(to: CGPoint(x: myframe.midX+0.1*myframe.width, y: myframe.maxY - 0.1 * myframe.height))
            weirdarch2.addQuadCurve(to: CGPoint(x: myframe.midX-0.1*myframe.width, y: myframe.maxY - 0.1 * myframe.height), controlPoint: CGPoint(x: myframe.midX, y: myframe.midY))
            weirdarch2.close()
            
            
            
            context = UIGraphicsGetCurrentContext()
            context?.saveGState()
            weirdarch2.addClip()
            
            weirdarch2.lineWidth = 3
            
            UIColor.red.setStroke()
            
            
            
            if shade == 0{
                // lines
                let startPoint = CGPoint(x: 0, y: myframe.maxY - 0.20 * myframe.height )
                let endpoint = CGPoint(x: myframe.maxX, y: myframe.maxY - 0.20 * myframe.height)
                
                
                drawLines(in: [startPoint,endpoint], count: 1)
                
                let startPoint2 = CGPoint(x: 0, y: myframe.maxY - 0.15*myframe.height  )
                let endpoint2 = CGPoint(x: myframe.maxX, y:myframe.maxY - 0.15 * myframe.height  )
                
                drawLines(in: [startPoint2,endpoint2], count: 1)
                
                
                
            }else if shade == 1 {
                //fill
                UIColor.red.setFill()
                weirdarch2.fill()
                
            }
            
            
            
            
            weirdarch2.stroke()
            context?.restoreGState()
            
            
            
        }
        
        
        
        
    }
    
    
    
    func drawLines(in points:[CGPoint],count:Int){
        // up, middle, down
        
        
        
//         first line
                        let stripes = UIBezierPath()
                        stripes.move(to: CGPoint(x: points[0].x, y: points[0].y))
                        stripes.addLine(to: CGPoint(x: points[1].x, y: points[1].y))
                        stripes.lineWidth = 3
        
        
                         UIColor.red.setStroke()
        
                        stripes.close()
        
        
        
        
                        stripes.stroke()
        
        //                //second line
        //
        //                let stripes2 = UIBezierPath()
        //                stripes2.move(to: CGPoint(x: x, y: y+16))
        //                stripes2.addLine(to: CGPoint(x: x+width-2, y: y+16))
        //
        //                stripes2.lineWidth = 2
        //
        //                UIColor.red.setStroke()
        
        
    }
    
    

}


class View2:UIView{
    
    var id:Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        self.id = identifierMaker.id + 1
        
        identifierMaker.id += 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


struct identifierMaker{
    static var id = -1
    
}







