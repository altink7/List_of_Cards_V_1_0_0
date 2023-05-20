//
//  ItemViewModel.swift
//  03_kelmendi
//
//  Created by Altin Kelmendi on 20.05.23.
//

import Foundation
import SwiftUI

class ItemViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var isLoading = false
    @Published var errorMessage = ""

    func fetchData() {
        cards = []
        isLoading = true
        errorMessage = ""

        let url = URL(string: "https://api.magicthegathering.io/v1/cards?page=2")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = error?.localizedDescription ?? "Unknown error"
                    self.isLoading = false
                }
                return
            }

            self.parse(jsonData: data)
        }.resume()
    }

    private func parse(jsonData: Data) {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response<Card>.self, from: jsonData)
            
            DispatchQueue.main.async {
                if response.cards.isEmpty {
                    self.fetchData()
                } else {
                    self.cards = response.cards.sorted { ($0.name ?? "") < ($1.name ?? "") }
                }
                self.isLoading = false
            }

        } catch let error {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
            print("Error decoding JSON: \(error)")
            print(String(data: jsonData, encoding: .utf8) ?? "No data received")
        }
    }
}

