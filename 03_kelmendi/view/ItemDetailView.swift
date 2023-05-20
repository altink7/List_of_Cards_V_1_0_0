//
//  ItemDetailView.swift
//  03_kelmendi
//
//  Created by Altin Kelmendi on 20.05.23.
//

import SwiftUI

struct ItemDetailView: View {
    let card: Card

    var body: some View {
        VStack {
            Text("ID:")
                .font(.title)
                .foregroundColor(.gray)
            Text(card.multiverseid ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)

            Text("Title:")
                .font(.title)
                .foregroundColor(.gray)
            Text(card.name ?? "")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom)

            Text("Description:")
                .font(.title)
                .foregroundColor(.gray)
            Text(card.text ?? "")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.bottom)

            Text("Image URL:")
                .font(.title)
                .foregroundColor(.gray)
            Text(card.imageUrl ?? "")
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .padding()
        .navigationBarTitle(card.name ?? "", displayMode: .inline)
    }
}
