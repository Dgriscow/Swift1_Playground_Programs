import UIKit
import Foundation

enum Menu: String, CaseIterable { //from docs.swift.org
    case BobCheeseBurger
    case BobBurger
    case LargeFries
    case SmallFries
    case DoubleBobCheeseBurger
    case DeluxeBobBurger
    case JalapenoBobBurger
    case DeluxeDoubleBobBurger
    case CaliforniaBobBurger
    case LargeSoda
    case MediumSoda
}

enum Prices:Double{
    case cheapest = 0.99
    case lesscheap = 1.99
    case middlePrice = 3.99
    case smallOrder = 5.99
    case entreStandard = 7.99
    case entredeluxe = 9.99
    
}
var foodWitPrices: Dictionary<String, Double> =  [Menu.BobCheeseBurger.rawValue:Prices.smallOrder.rawValue, Menu.BobBurger.rawValue:Prices.middlePrice.rawValue, Menu.LargeFries.rawValue:Prices.middlePrice.rawValue, Menu.SmallFries.rawValue:Prices.cheapest.rawValue, Menu.DoubleBobCheeseBurger.rawValue:Prices.entreStandard.rawValue, Menu.DeluxeBobBurger.rawValue:Prices.entredeluxe.rawValue, Menu.JalapenoBobBurger.rawValue:Prices.entreStandard.rawValue, Menu.DeluxeDoubleBobBurger.rawValue:Prices.entredeluxe.rawValue, Menu.CaliforniaBobBurger.rawValue:Prices.entreStandard.rawValue, Menu.LargeSoda.rawValue:Prices.middlePrice.rawValue, Menu.MediumSoda.rawValue:Prices.lesscheap.rawValue]

struct OrderFood { //structs act as a simpler form of classes, they dont have inheritence, and also dont feature self refrencing, but it can be usefull.
    var customerOrder:[String]? = [] //an optinal array because in case the menu is empty it can be nil, and an array because it makes it more interactive and simplified to make different orders
    var priceTotal:Double? = 0 //an optinal because price can be none if there is no order
    
    
    mutating func makeOrder() -> Double{
        for request in customerOrder!{
            if Menu.allCases.contains(where: { $0.rawValue == request}) {
                priceTotal! += foodWitPrices[request] ?? 0
                    
            } else {
                print("\(request) is not Present")}
            
        }
        return priceTotal!
    }
}
//------------------------------------------------------------------------------------------------
print("Welcome To Bobs Burgeria, Heres The Menu:")
print(foodWitPrices) //prints menu with prices attached

var order1 = OrderFood(customerOrder: ["BobCheeseBurger","SmallFries","JalapenoBobBurger","CaliforniaBobBurger"])
print("Order 1 Costs $\(order1.makeOrder())")

var order2 = OrderFood()
print("Order 2 Costs $\(order2.makeOrder())")

var order3 = OrderFood(customerOrder: ["JalapenoBobBurger", "LargeSoda", "LargeFries","ChocolateShake","BobBurger"])
print("Order 3 Costs $\(order3.makeOrder())")

var order4 = OrderFood(customerOrder: ["SmallFries", "DeluxeBobBurger", "JalapenoBobBurger"])
print("order 4 costs $\(order4.makeOrder())")

