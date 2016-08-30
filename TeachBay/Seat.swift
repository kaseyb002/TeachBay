//
//  Seat.swift
//  TeachBay
//
//  Created by Kasey Baughan on 8/30/16.
//  Copyright © 2016 Kasey Baughan. All rights reserved.
//

import Foundation

struct Seat {
    var increment = 1
    var currentBid: Int
    var placedBid: Int
    var bidder: Bidder?
}

extension Seat {
    
    init(currentBid: Int, increment: Int = 1) {
        self.currentBid = currentBid
        self.placedBid = currentBid
        self.increment = increment
    }
    
    init(bid: Int, byBidder: Bidder, placedBid: Int, increment: Int) {
        self.currentBid = bid
        self.bidder = byBidder
        self.placedBid = placedBid
        self.increment = increment
    }
    
}


extension Seat {
    
    mutating func placeBid(bid: Int, byBidder: Bidder) -> Bool {//bool is for successful bid
        //make sure bid is high enough
        guard bid > currentBid else {return false}
        //so let's up the bid
        currentBid = currentBid + increment
        //and if this bid is higher than placed bid, then replace it
        if currentBid > placedBid {
            bidder = byBidder
            placedBid = bid
            return true//succuessful bid
        }
        //otherwise, ignore it and tell the caller it was an unsuccessful big
        return false
    }
    
    mutating func updatePlacedBid(updatedBid: Int) {
        guard updatedBid > placedBid else {return}//allow decrease? dont think so
        placedBid = updatedBid
    }
    
}