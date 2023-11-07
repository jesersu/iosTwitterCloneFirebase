//
//  DetailView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import SwiftUI
import Kingfisher
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

struct DetailView: View {
    @ObservedObject var viewModel: FeatureRowViewModel
    @Environment(\.dismiss) var dismiss
    init(feature: Feature) {
        self.viewModel = FeatureRowViewModel(feature: feature)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            userInfoDetails
            userMap
            Spacer()
        }
        .navigationBarHidden(true)
    }
}



extension DetailView {
   
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color.themeColor
                .ignoresSafeArea()
          
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .offset(x: 5, y: 5)
                }
                
                KFImage(URL(string:""))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    

    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.feature.properties?.title ?? "SIN TITULO")
                    .font(.title2).bold()
            }
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Lugar")
                        .font(.subheadline)
                        .padding(.vertical)
                }
              
                Text(viewModel.feature.properties?.place ?? "SIN NOMBBRE")
                    .foregroundColor(.black)
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Magnitud")
                        .font(.subheadline)
                        .padding(.vertical)
                }
              
                Text(String(viewModel.feature.properties?.mag ?? 0.0))
                    .foregroundColor(.black)
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Profundidad")
                        .font(.subheadline)
                        .padding(.vertical)
                }
              
                Text(String(viewModel.feature.properties?.sig ?? 0))
                    .foregroundColor(.black)
                
            }
            .font(.caption)
            .foregroundColor(.gray)

  
                
        }
        .padding(.horizontal)
    }
    
    var userMap: some View {
        //Mapa
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: viewModel.feature.geometry?.coordinates?[1] ?? 0.0, longitude:  viewModel.feature.geometry?.coordinates?[0] ?? 0.0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), showsUserLocation: true, annotationItems: [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: viewModel.feature.geometry?.coordinates?[1] ?? 0.0, longitude: viewModel.feature.geometry?.coordinates?[0] ?? 0.0), tint: .red))]){ marker in
            marker.location
        }.edgesIgnoringSafeArea(.all)
    }
}
