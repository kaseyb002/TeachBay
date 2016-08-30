//
//  Teacher.swift
//  TeachBay
//
//  Created by Kasey Baughan on 8/30/16.
//  Copyright © 2016 Kasey Baughan. All rights reserved.
//

import Foundation

struct Teacher {
    var name: String
    var seats: [Seat]
    var baseBid = 5
    var increment = 25
}

extension Teacher {
    
    init(name: String, numberOfSeats: Int, baseBid: Int) {
        self.name = name
        self.baseBid = baseBid
        var seats = [Seat]()
        for _ in 1...numberOfSeats {
            seats.append(Seat(currentBid: baseBid, increment: increment))
        }
        self.seats = seats
    }
    
    func newSeats(seats: [Seat]) -> Teacher {
        var new = self
        new.seats = seats
        return new
    }
    var minBid: Int {
        return (seats.map(){$0.currentBid}.minElement() ?? baseBid) + increment
    }
    var lowestBid: Int {
        return seats.map(){$0.currentBid}.minElement() ?? 0
    }
    var highestBid: Int {
        return seats.map(){$0.currentBid}.maxElement() ?? 0
    }
    var lowestPlacedBid: Int {
        return seats.map(){$0.placedBid}.minElement() ?? 0
    }
    var highestPlacedBid: Int {
        return seats.map(){$0.placedBid}.maxElement() ?? 0
    }
    
    var lowestBidSeatIndex: Int {
        var minIndex = 0
        for i in 0...seats.count - 1 {
            if seats[i].currentBid < seats[minIndex].currentBid {
                minIndex = i
            }
        }
        return minIndex
    }
    
    var lowestPlacedBidSeatIndex: Int {
        var minIndex = 0
        for i in 0...seats.count - 1 {
            if seats[i].placedBid < seats[minIndex].placedBid {
                minIndex = i
            }
        }
        return minIndex
    }
    
    mutating func takeBidFrom(bidder: Bidder, bid: Int) {
        guard minBid <= bid else {return}
        if let bidderIndex = bidderInClassIndex(bidder) {//bidder already has a successful bid here, just update bid then
            seats[bidderIndex].updatePlacedBid(bid)
            return
        }
        if seats[lowestBidSeatIndex].placeBid(bid, byBidder: bidder) {
            return
        }
        if bid >= minBid {takeBidFrom(bidder, bid: bid)}
    }
    
    func printBidList() {
        let sortedSeats = seats.sort() {$0.currentBid > $1.currentBid}
        
        print("******Seats******")
        var seatIndex = 1
        for seat in sortedSeats {
            print("\(seatIndex): \(seat.bidder?.name ?? "Open Seat") for $\(seat.currentBid), Placed Bid: $\(seat.placedBid)")
            seatIndex += 1
        }
        print("Current Lowest Bid: $\(lowestBid)")
        print()
    }
    
    //make this functional
    func bidderInClassIndex(bidder: Bidder) -> Int? {
        var index = 0
        for seat in seats {
            if let p = seat.bidder {
                if bidder == p {return index}
            }
            index += 1
        }
        return nil
    }
    
}