//
//  ContentView.swift
//  ChartsSimple
//
//  Created by Christopher Gonzalez on 2024-07-28.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // MARK: Bar Mark
            Chart {
                ForEach(data) { item in
                    BarMark(x: .value("Day", item.day), y: .value("Value", item.value))
                }
            }
            .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            
        // MARK: line Mark
            Chart {
                ForEach(data) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2022"))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(.linearGradient(colors: [.red, .yellow], startPoint: .top, endPoint: .bottom))
                        .symbol(by: .value("Year", "2022"))
//                        .foregroundStyle(by: .value("Year", "2022"))
                }
                
                ForEach(data2) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2021"))
                        .interpolationMethod(.catmullRom)
                        .symbol(by: .value("Year", "2021"))
//                        .foregroundStyle(by: .value("Year", "2021"))
                }
            }
            .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
            .frame(maxWidth: .infinity)
            .frame(height: 300)
        }
        
    }
}

struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data = [
    Value(day: "Jun 1", value: 156),
    Value(day: "Jun 2", value: 265),
    Value(day: "Jun 3", value: 325),
    Value(day: "Jun 4", value: 465),
    Value(day: "Jun 5", value: 356),
    Value(day: "Jun 6", value: 623),
    Value(day: "Jun 7", value: 715),
]

let data2 = [
    Value(day: "Jun 1", value: 45),
    Value(day: "Jun 2", value: 156),
    Value(day: "Jun 3", value: 295),
    Value(day: "Jun 4", value: 359),
    Value(day: "Jun 5", value: 456),
    Value(day: "Jun 6", value: 500),
    Value(day: "Jun 7", value: 565),
]




#Preview {
    ContentView()
}
