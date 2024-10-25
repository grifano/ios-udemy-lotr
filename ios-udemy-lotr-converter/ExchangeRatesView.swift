//
//  ExchangeRatesView.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct ExchangeRatesView: View {
    
    @Environment(\.dismiss) var dismiss // need to rewatch the lessons to better understand how it works
    
    var body: some View {
        ZStack {
            // BG Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // Title
                Text("Exchange Rates")
                    .font(.largeTitle).tracking(2)
                    .padding(.bottom, 8)
                
                // Description Text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.system(size: 22))
                
                // Exchange Rates
                ExchangeRate(leftCurrency: .goldPiece, rightCurrency: .goldPenny, text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftCurrency: .goldPenny, rightCurrency: .silverPiece, text: "1 Gold Penny = 4 Silver Pieces")
                ExchangeRate(leftCurrency: .silverPiece, rightCurrency: .silverPenny, text: "1 Silver Piece = 4 Silver Pennies")
                ExchangeRate(leftCurrency: .silverPenny, rightCurrency: .copperPenny, text: "1 Silver Penny = 100 Copper Pennies")
                
                // Button dismiss
                Button("Done") {
                     dismiss()
                }
                .buttonStyle(.borderedProminent)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .tint(.brown.opacity(0.75))
                .padding(.top, 8)
            }
            .padding()
        }
        .foregroundStyle(.black)
        .background(.brown)
    }
}

#Preview {
    ExchangeRatesView()
}
