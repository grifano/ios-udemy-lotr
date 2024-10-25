//
//  ExchangeRateComp.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftCurrency: Currency
    @State var rightCurrency: Currency
    @State var text: String
    
    var body: some View {
        HStack {
            Image(leftCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
        .font(.system(size: 16))
    }
}

#Preview {
    ExchangeRate(leftCurrency: .goldPiece, rightCurrency: .goldPenny, text: "1 Gold Piece = 4 Gold Pennies")
}
