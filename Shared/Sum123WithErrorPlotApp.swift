//
//  Sum123WithErrorPlotApp.swift
//  Shared
//
//  Created by Matthew Adas on 2/22/21.
//

import SwiftUI

@main
struct Sum123WithErrorPlotApp: App {
    
    @StateObject var plotDataModel = PlotDataClass(fromLine: true)
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Plot")
                    }
                TextView()
                    .environmentObject(plotDataModel)
                    .tabItem {
                        Text("Text")
                    }
            }
        }
    }
}
