//
//  TeachersVC.swift
//  TeachBay
//
//  Created by Kasey Baughan on 8/30/16.
//  Copyright © 2016 Kasey Baughan. All rights reserved.
//

import UIKit

private let myStoryboardId = "TeachersVC"

class TeachersVC: UIViewController {
    
    //MARK: - Required inits for Xibs
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    class func create() -> TeachersVC? {
        let storyboard = UIStoryboard(name: myStoryboardId, bundle: nil)
        guard let vc = storyboard.instantiateViewControllerWithIdentifier(myStoryboardId) as? TeachersVC else {
            print("couldnt init \(myStoryboardId)")
            return nil
        }
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var teacher = Teacher(name: "Thompson", numberOfSeats: 3, baseBid: 50)
        let baughan = Bidder(name: "Baughan")
        let hiatt = Bidder(name: "Hiatt")
        let yow = Bidder(name: "Yow")
        let crowther = Bidder(name: "Crowther")
        
        teacher.printBidList()
        
        teacher = baughan.placeBidFor(teacher, bid: 200)
        teacher = yow.placeBidFor(teacher, bid: 120)
        teacher = hiatt.placeBidFor(teacher, bid: 100)
        teacher = hiatt.placeBidFor(teacher, bid: 80)
        teacher = hiatt.placeBidFor(teacher, bid: 110)
        teacher = yow.placeBidFor(teacher, bid: 250)
        teacher = hiatt.placeBidFor(teacher, bid: 150)
        teacher = hiatt.placeBidFor(teacher, bid: 720)
        teacher = crowther.placeBidFor(teacher, bid: 720)
        teacher = baughan.placeBidFor(teacher, bid: 275)
    }

}
