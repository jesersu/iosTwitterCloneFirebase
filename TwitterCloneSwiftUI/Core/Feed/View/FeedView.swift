//
//  FeedView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//
import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel(startDate: Date.from(year: 2023, month: 10, day: 09), endDate: Date.now) // valor inicial
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                LazyVStack {
                    DatePicker("Inicio", selection: $startDate, displayedComponents: .date)
                    DatePicker("Fin", selection: $endDate, displayedComponents: .date)
                    ForEach(viewModel.features) { feature in
                        NavigationLink {
                           DetailView(feature: feature)
                        } label: {
                            TweetRowView(feature: feature)
                                .padding()
                        }
                        
                    }
                }
            }
        }
//        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: endDate){ value in
            viewModel.fetchEarthquakes(startDate: startDate, endDate: endDate)
        }
       
    }
}
