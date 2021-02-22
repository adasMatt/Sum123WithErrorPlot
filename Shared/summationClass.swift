//
//  summationClass.swift
//  SumS123
//
//  Created by Matthew Adas on 2/20/21.
//

import Foundation

// a completely general summation class, only thing needed is a function to go into generalSummation in place of equationHandler
class summationClass: ObservableObject {
    
    typealias equationHandler = (Int) -> Float   // for s1, s2, s3
    
    // A pretty sweet function to take any equation as it's argument and sums from n = 1 to n = N
    func generalSummation(BigN: Int, equationUsed: equationHandler) -> Float {

        var sumResult: Float = 0.0
        var n = 1
        
        while n<=(BigN) {
                    
            sumResult = sumResult + equationUsed(n)
            n += 1
        }

        return sumResult
    }
    
    
    // specific equations copy the class above this for use in other projects that do not use the equations listed below
    
    //  ******************  S^1  ********************
    /*
      __ 2N          n   n
     \         ( - 1)  -----
     /__               n + 1
      n = 1
    print("calculating for n=1 to 2N = \(2*N) in sum S^1 from Survey of Computational Physics: Sec 2.1.2 P2")
    */
    func sum1(littlen: Int) -> Float {
      
      let result1 = pow(-1.0, Float(littlen)) * Float(littlen) / (Float(littlen) + 1.0)

      return result1
    }

    //  ******************  S^2  ********************
    /*
        __ N     2n - 1       __ N        2n
     - \         ------   +  \         --------
       /__ n = 1   2n        /__ n = 1 2n  +  1
    print("calculating sum S^2")
    */

    func sum2(littlen: Int) -> Float {
      
        let result2 = -((2.0 * Float(littlen) - 1.0) / (2.0 * Float(littlen))) + ((2.0 * Float(littlen)) / (2.0 * Float(littlen) + 1.0))

      return result2

    }

    // *******************  S^3  *********************
    /*
        __ N          1
       \         ----------
       /__ n = 1 2n(2n + 1)
    In Latex: -\sum_{n=1}^{N} \frac{1}{2n(2n+1)}
    print("calculating sum S^3")
    */

    func sum3(littlen: Int) -> Float {
      
        let result3 = pow((2.0*Float(littlen))*(2.0*Float(littlen) + 1.0), -1.0)

      return result3
    }

    //should this be done in ContentView.swift?
    /*
    let mySumz = summationClass()
    // A tuple of each summation method
    func calculateEachSum(anotherNotherBigN: Int) -> (Float, Float, Float) {
        
        let sum1Result = mySumz.generalSummation(BigN: anotherNotherBigN*2, equationUsed: sum1)
        let sum2Result = mySumz.generalSummation(BigN: anotherNotherBigN, equationUsed: sum2)
        let sum3Result = mySumz.generalSummation(BigN: anotherNotherBigN, equationUsed: sum3)
        
        return (sum1Result, sum2Result, sum3Result)
    }
     */
}
