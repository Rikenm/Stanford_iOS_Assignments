//: Playground - noun: a place where people can play

import UIKit

//Core OS - UNIX in the C
//Core Services layer - SQLITE, NEtWorking, Core Location, Threading, Preferences, Threading, Net Services
//MEdia -- loosely defining: PDF, AUDIO, Video
//cocoa touch - UI Layer, MAP-kit, web View

//Demo

//button inherits from control, view

//property observer : didSet, didChangeValue

// Array<Int> vs [Int]

//sender of a button is a UIbutton itself


//lecture 2
//MVC-
// model = what your application is . (Logic, flip card, knowledge of the game)

// controller : How your model is presented to the user(UI Logic)

//view : Miniions

//view to controller is generic as UI are generic. AKA view should not know what the contoller is doing

// kind of talking
// view --> action ---> flipcard in viewContoller

//view--->delegate---->view COntroller. for eg scroll view uses delegate to say I have scrolled to the end to the VC

//views--->datasource--->view controller.. view is asking for data with VC. also a Delegate

//Model to VC is notification patter AKA radio. If anything changes Model will signal and VC will listen and change the data

//multiple MVC's
//MVCs talk as if other VC are views for a particular VC.


//Struct gets free init to initiliae all it's variable

//Struct when copy is really deep copy. Also putting object inside is also makes real copy

//lazy makes var unitilizaes until someone graphs it.
//extension Array {
//    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
//    subscript (randomPick n: Int) -> [Element] {
//        var copy = self
//        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
//            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
//        }
//        return Array(copy.suffix(n))
//    }
//}
//
//let digits = Array(0...9)  // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//let pick3digits = digits[randomPick: 10]  // [8, 9, 0]

//key for the shortcut
//assistant editor is command option enter
// and to get only one assistant editor is command enter


//com=ammdn 0 left // command option 0 is right

//command shift y is debbuger

//open files directly command shift O

//control i to intent
//shift and backward lets you select multiple lines


// 0.5...15.25 not possible like 0...10 stride by 1

//for i in stride(from: 0.5, through:15.25, by:0.3){
//
//    print(i)
//}
//


//stored vs computed properties// eveytime it is excecuted

//computed property is used when you have to derive

//Access Control - internal : default<anyone can call>

//private, private(set) : set is private, get is public, fileprivate(only availabele inside the file), public,open


//assertion


//mutation keyword in struct when you mutate any properties as structs are immutable aka properties are not changed

//
//enum myError: Error{
//
//    case Network_ERROR
//    case IO_Error
//}
//
//
//func save() throws {
//
//    throw myError.Network_ERROR
//
//}
//
//
//do{
//    try save()
//
//}
//catch let error{
//
//    print(error)
//
//}


//let x = try? save() // makes x nill

// any . prepare segue has any type as it's parameter as any button, view can tigger it

// as? literally gives nill if not possible . super class and subclass lae


//protocol is a list , helps you have something similar without the base class ... claim....

//As? down casting

// NSobject --->
// NSNUmber
//Views are hierachials
// xcode builts hierachiachys

// init(frame) code, init(NSCoder) from storyboard... alternative is awakeFromNib from Nib/storyboard... initlization the view


//Drawing

// ovvveride func draw(_ rect:CGRECT)  // never calll this // you can draw outside this rect

// views bound gives you the drawing area whereas frame says where are you at

// call these

// setNeeds Display, setNeedsDisplay .. ios calls the draw, ou don't


//CALAyer

//font are also drawn

//let label = UILabel()
//label.font = UIFont.preferredFont(forTextStyle: .body)
//label.adjustsFontForContentSizeCategory = true
//size of the fonts are variable . auto layout must be used to fix the font
//let font = UIFont(name:"Roboto",size:contant or var)

// you can variable the size using metric
//let font = UIFont(name:"Roboto",size:contant or var)
// let metrics = UIFontMetrics(forTextStyle: .body)
//let fontToUse = metrics.scaledFont(for: font)


//


class Interceptor: 
























