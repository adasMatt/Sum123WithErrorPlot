//
//  Tests_macOS.swift
//  Tests macOS
//
//  Created by Matthew Adas on 2/22/21.
//

import XCTest

class Tests_macOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testS1() throws {
        //test S1 gives correct answer with N = 2 terms (meaning 2N = 4)
        let plotDataModel = PlotDataClass(fromLine: true)
                
        let s1Calculator = summationClass()
        
        //my littlen is littlen or big N? Oops?
        s1Calculator.sum1(littlen: 2) = plotDataModel
        
        //x = pi/2
        //let piOverTwo = Double.pi / 2.0
        //the error after 12th term equals 1.0000000000000002
        //let sin90 = sinCalculator.calculate_sin_x(x: piOverTwo)
        
        //XCTAssertEqual(sin90, 1.0, accuracy: 1.0E-10)
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
