//
//  HomeView.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeViewModel: HomeViewModel
    @State private var searchText: String = ""
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea(.all)
            
            VStack {
                if homeViewModel.showLoadingSpinner {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    NavigationStack {
                        List {
                            ForEach(homeViewModel.postList, id: \.id) { post in
                                PostElement(post: post)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                    }
                    .searchable(text: $searchText)
                    .ignoresSafeArea(.all)
                }
            }
        }
        .onAppear {
            homeViewModel.getPostList()
        }
        .alert(isPresented: $homeViewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(homeViewModel.textError),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    HomeFactory.create()
}
