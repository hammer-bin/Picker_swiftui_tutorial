//
//  ContentView.swift
//  Picker_swiftui_tutorial
//
//  Created by minkyuLee on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    @State private var showComposer: Bool = false
    
    let myColorArray = ["레드", "그린", "블루"]
    
    func changeColor(index: Int) -> Color {
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.red
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack(alignment:.center) {
            
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(self.changeColor(index: selectionValue))
                
                Text("선택된 값: \(selectionValue)")
                Text("선택된 색깔: \(myColorArray[selectionValue])")
                
                Picker(selection: $selectionValue, label: Text("or"),
                       content: {
                    Text("레드").tag(0)
                    Text("그린").tag(1)
                    Text("블루").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                
                Picker(selection: $selectionValue, label: Text("aa"),
                       content: {
                    Text("레드").tag(0)
                    Text("그린").tag(1)
                    Text("블루").tag(2)
                })
                .pickerStyle(.wheel)
                .frame(width: 50, height: 100, alignment: .center)
                .clipped()
                .padding(5)
                .border(self.changeColor(index: selectionValue), width: 5)
                .shadow(color: self.changeColor(index: selectionValue), radius: 5, x: 3, y: 3)
                
                
            }.padding(.horizontal, 50)
                .navigationTitle("피커뷰")
                    .toolbar {
                        Button{
                            showComposer = true
                        } label : {
                            Image(systemName: "plus")
                        }
                    }
                    .sheet(isPresented: $showComposer) {
                        MyFilteredList()
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
