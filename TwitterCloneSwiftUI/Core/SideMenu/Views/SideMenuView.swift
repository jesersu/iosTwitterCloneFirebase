//
//  SideMenuView.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            if let user = authViewModel.currentUser {
                VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: "https://yt3.ggpht.com/-VljuKoLGH0g/AAAAAAAAAAI/AAAAAAAAAAA/DFasfeSJysk/s900-c-k-no-mo-rj-c0xffffff/photo.jpg"))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.apellido)
                            .font(.headline)
                    }
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id:\.rawValue) { viewModel in
                    if viewModel == .logout {
                        Button {
                            print("logout")
                            authViewModel.logout()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }
                Spacer()
                }
            } else {
                EmptyView()
            }
        }
    }
}

 
