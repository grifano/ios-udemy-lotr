//
//  CurrenciesGrid.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct CurrenciesGrid: View {
    
    @State var selectedCurrency: Currency
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                ForEach(Currency.allCases) { currency in
                    if selectedCurrency == currency {
                        CurrencyIcon(currency: currency)
                            .shadow(color: .black.opacity(0.6), radius: 25)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3).opacity(0.5))
                    } else {
                        CurrencyIcon(currency: currency)
                            .onTapGesture {
                                selectedCurrency = currency
                            }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CurrenciesGrid(selectedCurrency: .goldPenny)
}
