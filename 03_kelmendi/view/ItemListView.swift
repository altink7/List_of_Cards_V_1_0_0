//
//  ItemListView.swift
//  03_kelmendi
//
//  Created by Altin Kelmendi on 20.05.23.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var viewModel = ItemViewModel()

    var body: some View {
        VStack {
            if !viewModel.errorMessage.isEmpty {
                Text("The URL could not be opened, please try again later")
                    .foregroundColor(.red)
                    .padding()
            }

            HStack {
                Button(action: viewModel.fetchData) {
                    Text("Reload Items")
                        .foregroundColor(viewModel.isLoading ? .black : .blue)
                        .padding()
                }
                .disabled(viewModel.isLoading)
            }

            List(Array(Set(viewModel.cards)).sorted { $0.name ?? "" < $1.name ?? "" }) { card in
                NavigationLink(destination: ItemDetailView(card: card)) {
                    Text(card.name ?? "")
                }
            }
            .listStyle(PlainListStyle())


        }
        .padding()
        .navigationBarTitle("03_kelmendi", displayMode: .inline)
    }
}
