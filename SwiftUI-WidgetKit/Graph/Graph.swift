//
//  Graph.swift
//  Graph
//
//  Created by Kushal Shrestha on 8/6/20.
//

import WidgetKit
import SwiftUI


struct Model: TimelineEntry {
    var date: Date
    var widgetData: [JSONModel ]
}


struct JSONModel: Decodable, Hashable {
    var date: CGFloat
    var units: Int
}


struct Provider : TimelineProvider {
    func snapshot(with context: Context, completion: @escaping (Model) -> ()) {
        //initial snapshot
        
        let loadingData = Model(date: Date(), widgetData: Array(repeating: JSONModel(date: 0, units: 0), count: 6))
        completion(loadingData)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<Model>) -> ()) {
        // parsing json data and displaying
        
        getData{ (modelData) in
            let date = Date()
            let data = Model(date: date, widgetData: modelData)
            
            //reloading data
            let nextUpdate = Calendar.current.date(byAdding: .minute,value: 15, to: date)
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            completion(timeline)

        
        }
    }
    
    func placeholder(with: Context) -> Model {
        return Model(date: Date(), widgetData: Array(repeating: JSONModel(date: 0, units: 0), count: 6))
    }
}

// creating view for widget

struct WidgetView: View {
    var data: Model
    
    //pricing color
    var colors = [Color.red, Color.gray, Color.green, Color.yellow, Color.red , Color.blue, Color.pink]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HStack(spacing: 15){
                Text("Units Sold")
                    .font(.title)
                    .fontWeight(.bold)
                Text(Date(), style: .time)
                    .font(.caption2)
            }
                .padding()
            HStack(spacing: 15){
                ForEach(data.widgetData, id: \.self){ value in
                    if value.units == 0 && value.date == 0 {
                        // data is loading
                        
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray)
                    } else {
                        //data view
                        
                        VStack(spacing: 15){
                            Text("\(value.units)")
                                .fontWeight(.bold)
                            //graph
                            GeometryReader{ g in
                                VStack{
                                    
                                    Spacer(minLength: 0)
                                    RoundedRectangle(cornerRadius: 5)
                                        
                                        .fill(colors.randomElement()!)
                                       
                                    // calculating height
                                    
                                        .frame(height: getHeight(value: CGFloat(value.units), height: g.frame(in: .global).height))
                                }
                            }
                            
                            // date
                            Text(getData(value: value.date))
                                .font(.caption2)
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    func getHeight(value: CGFloat, height: CGFloat) -> CGFloat{
        let max = data.widgetData.max{(first, second) -> Bool in
            if first.units > second.units{
                return false
            } else {
                return true
            }
        }
        
        let percent = value / CGFloat(max!.units)
        return percent * height
    }
    
    func getData (value: CGFloat) -> String {
        let format = DateFormatter()
        format.dateFormat = "MMM dd"
        
        let date = Date(timeIntervalSince1970: Double(value)/1000.0)
        return format.string(from: date)
    }
}

// widget configration

@main
struct MainWidget: Widget {
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: "Graph", provider: Provider()){ data in
            WidgetView(data: data)
        }
        .description(Text("Daily Status"))
        .configurationDisplayName(Text("Daily Updates"))
        .supportedFamilies([.systemLarge])
    }
}


//attaching completion handlerto send back data

func getData(completion: @escaping([JSONModel]) -> ()){
    let url = "https://canvasjs.com/data/gallery/javascript/daily-sales-data.json"
    
    let session = URLSession(configuration: .default)
    session.dataTask(with: URL(string: url)!){(data,_,err) in
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        
        do {
            let jsonData = try JSONDecoder().decode([JSONModel].self, from: data!)
            completion(jsonData)
        }
        catch{
            print(error.localizedDescription)
        }
    }.resume()
}
