//
//  FeedViewModel.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//
import Foundation

class FeedViewModel: ObservableObject {

    @Published var features = [Feature]()
    let serviceEartquakes = EarthquakesService()
    
    init(startDate: Date, endDate: Date) {
        fetchEarthquakes(startDate: startDate, endDate: endDate)
    }
    func fetchEarthquakes(startDate: Date, endDate: Date) {
        serviceEartquakes.fetchEarthquakes(startDate: startDate, endDate: endDate){ earthquakesModel in
            self.features = earthquakesModel.features ?? []
        }
        
    }

}
