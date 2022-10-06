import UIKit
import Foundation

enum Menu: String, CaseIterable { //from docs.swift.org
    case BillCheeseBurger
    case BillBurger
    case LargeFries
    case SmallFries
    case DoubleBillCheeseBurger
    case DeluxeBillBurger
    case JalapenoBillBurger
    case DeluxeDoubleBillBurger
    case CaliforniaBillBurger
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
var foodWitPrices: Dictionary<String, Double> =  [Menu.BillCheeseBurger.rawValue:Prices.smallOrder.rawValue, Menu.BillBurger.rawValue:Prices.middlePrice.rawValue, Menu.LargeFries.rawValue:Prices.middlePrice.rawValue, Menu.SmallFries.rawValue:Prices.cheapest.rawValue, Menu.DoubleBillCheeseBurger.rawValue:Prices.entreStandard.rawValue, Menu.DeluxeBillBurger.rawValue:Prices.entredeluxe.rawValue, Menu.JalapenoBillBurger.rawValue:Prices.entreStandard.rawValue, Menu.DeluxeDoubleBillBurger.rawValue:Prices.entredeluxe.rawValue, Menu.CaliforniaBillBurger.rawValue:Prices.entreStandard.rawValue, Menu.LargeSoda.rawValue:Prices.middlePrice.rawValue, Menu.MediumSoda.rawValue:Prices.lesscheap.rawValue]

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
print("Welcome To Bills Burgeria, Heres The Menu:")
print(foodWitPrices) //prints menu with prices attached

var order1 = OrderFood(customerOrder: ["BillCheeseBurger","SmallFries","JalapenoBillBurger","CaliforniaBillBurger"])
print("Order 1 Costs $\(order1.makeOrder())")

var order2 = OrderFood()
print("Order 2 Costs $\(order2.makeOrder())")

var order3 = OrderFood(customerOrder: ["JalapenoBillBurger", "LargeSoda", "LargeFries","ChocolateShake","BillBurger"])
print("Order 3 Costs $\(order3.makeOrder())")

var order4 = OrderFood(customerOrder: ["JalapenoBillBurger", "LargeFries", "DeluxeBillBurger"])
print("Order 4 Costs $\(order4.makeOrder())")


