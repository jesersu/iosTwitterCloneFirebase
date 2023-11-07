//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jesus Chapi on 03/11/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = true
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView() 
            } else {
                mainInterfaceView
            }
        }
    }
}


extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(0.25)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Earthquakes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: "https://yt3.ggpht.com/-VljuKoLGH0g/AAAAAAAAAAI/AAAAAAAAAAA/DFasfeSJysk/s900-c-k-no-mo-rj-c0xffffff/photo.jpg"))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
    
}
