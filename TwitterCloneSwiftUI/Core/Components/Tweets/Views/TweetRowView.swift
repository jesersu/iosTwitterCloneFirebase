//
//  TweetRowView.swift
///  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: FeatureRowViewModel
    
    init(feature: Feature) {
        self.viewModel = FeatureRowViewModel(feature: feature)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = self.viewModel.feature {
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.properties?.title ?? "")
                                .font(.subheadline).bold()
                        }
                        
                        HStack(alignment: .top, spacing: 5){
                            Text("Magnitud: ")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                            Text(String(user.properties?.mag ?? 0.0))
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                        }
                        
                        HStack(alignment: .top, spacing: 5){
                            Text("Profundidad: ")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                            Text(String(user.properties?.rms ?? 0.0))
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                        }
                        
                        HStack(alignment: .top, spacing: 5){
                            Text("Lugar: ")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                            Text(user.properties?.place ?? "SIN NOMBRE")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                        }
                 
                    }
                }
            }
            
            //Bottom button action
      
            Divider()
        } 
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
