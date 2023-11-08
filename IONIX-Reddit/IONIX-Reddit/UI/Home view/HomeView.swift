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
        VStack {
            if homeViewModel.showLoadingSpinner {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                NavigationView {
                    List {
                        ForEach(homeViewModel.postList, id: \.id) { post in
                            PostElement(post: post)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                }
                .searchable(text: $searchText).onChange(of: searchText, { _, newValue in
                    homeViewModel.search(postName: newValue)
                })
                .ignoresSafeArea(.all)
            }
        }
        .onAppear {
            homeViewModel.getPostList()
        }
        .navigationBarBackButtonHidden()
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
