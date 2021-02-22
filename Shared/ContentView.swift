//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Adas on 2/22/21.
//

import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var tempInput = ""
  
    

    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("just click plot button to see log10[(S1-S3)/S3] vs N (N = 1 to 50,000)")
                        .font(.callout)
                        .bold()
                }
                
                /*Toggle(isOn: $isChecked) {
                            Text("Display Error")
                        }
                .padding()    */
            }
            
            HStack{
                Button("plot log of error", action: {self.calculate()} )
                .padding()
            }
        }
    }
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        //var temp = 0.0
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
        calculator.plotSum1V3Error()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
