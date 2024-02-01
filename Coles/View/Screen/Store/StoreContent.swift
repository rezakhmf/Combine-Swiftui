//
//  StoreContent.swift
//  Coles
//
//  Created by Reza Farahani on 30/1/2024.
//

import Foundation
import SwiftUI

struct StoreContent: View {
    
    var viewModel: SearchViewModel
    
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView {
            NavigationView {
                SearchView(viewModel: viewModel)
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
           
            
            Text("No Stores yet")
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Stores")
                }
               
        }
        
    }
}

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack {
            TextField("Search for a store", text: $viewModel.searchTerm)
                .padding()
            
            if let error = viewModel.error {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                
                List(viewModel.searchResult, id:\.uniqueId) { store in
                    NavigationLink(destination:  StoreDetailsView(store: store)) {
                        Text(store.name)
                    }
                }
            }
        }
    }
}

struct StoreDetailsView: View {
    
    var store: Store
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: store.coverImgUrl)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                @unknown default:
                    fatalError("Unhandled Asynch Image")
                }
            }
            
            Text("Delivery Fee: $\(store.deliveryFee)")
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(store.name)
    }
}

