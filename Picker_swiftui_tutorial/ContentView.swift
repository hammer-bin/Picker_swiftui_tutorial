//
//  ContentView.swift
//  Picker_swiftui_tutorial
//
//  Created by minkyuLee on 2022/07/28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    
    var body: some View {
        Picker("피커", selection: $selectionValue, content: {
            Text("수박").tag(0)
            Text("바나나").tag(1)
            Text("딸기").tag(2)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
