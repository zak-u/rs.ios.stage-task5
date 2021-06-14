import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var maxPrice = 0
        var profit = 0
        if prices.count > 0 {
            maxPrice =  prices.max()!
            var myStocks : [Int] = []
            var stockPrices = prices
            for price in prices {
                if price == maxPrice {
                    if !myStocks.isEmpty {
                        for stock in myStocks {
                            profit = profit + (maxPrice - stock)
                        }
                        myStocks = []
                    }
                    stockPrices.removeFirst()
                    if !stockPrices.isEmpty {
                        maxPrice = stockPrices.max()!
                    }
                }else if price < maxPrice {
                    myStocks.append(price)
                    stockPrices.removeFirst()
                }
            }
            return profit
        }else {
            return profit
        }
    }
}
