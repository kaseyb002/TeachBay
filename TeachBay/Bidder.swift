//
//  Bidder.swift
//  TeachBay
//
//  Created by Kasey Baughan on 8/30/16.
//  Copyright © 2016 Kasey Baughan. All rights reserved.
//

import Foundation

struct Bidder {
    var name: String
}

extension Bidder {
    
    //just a wrapper so it feels more natural for parent.placeBidFor(teacher...)
    func placeBidFor(teacher: Teacher, bid: Int) -> Teacher {
        print("--" + name + " placed bid for \(bid)")
        var newTeach = teacher
        newTeach.takeBidFrom(self, bid: bid)
        newTeach.printBidList()
        return newTeach
    }
    
    func hasSeatInClass(forTeacher: Teacher) {
        
        
    }
    
}

extension Bidder: Equatable {}

func ==(lhs: Bidder, rhs: Bidder) -> Bool {
    return lhs.name == rhs.name
}
