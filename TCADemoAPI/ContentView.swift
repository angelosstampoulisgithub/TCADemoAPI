//
//  ContentView.swift
//  TCADemoAPI
//
//  Created by Angelos Staboulis on 26/7/24.
//

import SwiftUI
import ComposableArchitecture
struct ContentView: View {
    @Bindable var store = Store(initialState: Feature.State(fetchData: .init(drawId: 0, visualDraw: 0, visualStartDate: "", visualEndDate: "", description: "", notes: "", matchXEvents: []))) {
         Feature()
    }
    @State var array:[Results]
    var body: some View {
        NavigationView{
            WithPerceptionTracking{
                VStack {
                    List(store.fetchData.matchXEvents,id:\.self){item in
                        HStack{
                            Text(item.teamHome)
                            Text(item.teamAway)
                            Text(item.score)
                        }.frame(width:600,height:60)
                    }.navigationTitle("ΑΠΟΤΕΛΕΣΜΑΤΑ ΠΡΟΠΟ")
                        .navigationBarTitleDisplayMode(.inline)
                    
                }
                .task {
                    store.send(.fetchResults)
                }.navigationTitle("ΑΠΟΤΕΛΕΣΜΑΤΑ ΠΡΟΠΟ")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    ContentView(array: [])
}
