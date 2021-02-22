//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Matthew Adas on 2/22/21.
//
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    
    func plotSum1V3Error() {
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = -3.0
        plotDataModel!.changingPlotParameters.yMin = -7.5
        plotDataModel!.changingPlotParameters.xMax = 51000.0
        plotDataModel!.changingPlotParameters.xMin = -2.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        // need summation class
        let sumLoop = summationClass()
        
        // plot error of S1 compared to assumed "correct" result S3
        //the book asks to plot to a million, but I'm only plotting to 50000 otherwise it takes a reeeeeally long time to calculate
        for N in 1 ..< 50000 {

            //create x values for plot here
            let x = Double(N)

            //calculate sums
            let firstSumResult = sumLoop.generalSummation(BigN: N*2, equationUsed: sumLoop.sum1)
            let thirdSumResult = sumLoop.generalSummation(BigN: N, equationUsed: sumLoop.sum3)

            let subtractionNumerator = firstSumResult - thirdSumResult
            
            
            //create y values for plot here
            // y values are log formula
            let y = Double(log10(abs(subtractionNumerator / thirdSumResult)))
            let dataPoint: plotDataType = [.X: x, .Y: Double(y)]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
    }

    
    
    
    
    
    func plotYEqualsX()
    {
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

            //create y values here

            let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
}



