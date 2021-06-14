import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
   
    
    func findMaxKilometres() -> Int {
        var drinksWeight = [Int]()
                var drinksValue = [Int]()
                var foodsWeight = [Int]()
                var foodsValue = [Int]()
                var maxKilometres = 0
                
                for (weight, value) in drinks {
                    drinksWeight.append(weight)
                    drinksValue.append(value)
                }
                for (weight, value) in foods {
                    foodsWeight.append(weight)
                    foodsValue.append(value)
                }
                
                let drinksArray = getArrays(maxWeight: maxWeight,
                                                         itemWeight: drinksWeight,
                                                         itemValue: drinksValue)
                let foodsArray = getArrays(maxWeight: maxWeight,
                                                         itemWeight: foodsWeight,
                                                         itemValue: foodsValue)
                
                for i in 0...maxWeight {
                    if min(drinksArray[i], foodsArray[maxWeight - i]) > maxKilometres {
                        maxKilometres = min(drinksArray[i], foodsArray[maxWeight - i])
                    }
                }

                return maxKilometres
            }
            
            func getArrays(maxWeight: Int, itemWeight: [Int], itemValue: [Int]) -> [Int] {
                let num = itemWeight.count
                var table = Array(repeating: Array(repeating: 0,count: maxWeight + 1), count: num + 1)
                for i in 0...num {
                    for j in 0...maxWeight {
                        if i == 0 || j == 0 {
                            table[i][j] = 0
                        } else if itemWeight[i - 1] <= j {
                            table[i][j] = max(itemValue[i - 1] + table[i - 1][j - itemWeight[i - 1]],
                                          table[i - 1][j])
                        } else {
                            table[i][j] = table[i - 1][j]
                        }
                    }
                }
                
                return table[num]
    }
}
