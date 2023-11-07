//
//  FeatureRowViewModel.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import Foundation

class FeatureRowViewModel: ObservableObject {
    @Published var feature: Feature
    private let serviceEartquakes = EarthquakesService()
    
    init(feature: Feature) {
        self.feature = feature
    }
}
