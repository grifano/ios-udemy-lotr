//
//  SelectCurrencyView.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var fromCurrency: Currency
    @State var toCurrency: Currency
    
    var body: some View {
        ZStack {
            // BG Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                // Description
                Text("Select the currency you want to convert from: ")
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                
                // Currencies Icons
                CurrenciesGrid(selectedCurrency: fromCurrency)
                
                // Description
                Text("Select the currency you would like to convert to: ")
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding(.top, 24)
                
                // Currencies Icons
                CurrenciesGrid(selectedCurrency: toCurrency)
                
                // Button dismiss
                Button("Done") {
                     dismiss()
                }
                .buttonStyle(.borderedProminent)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .tint(.brown.opacity(0.75))
                .padding(.top, 24)
                
                
            }
            .padding()
        }
        .background(.brown)
    }
}

#Preview {
    SelectCurrencyView(fromCurrency: .goldPenny, toCurrency: .silverPenny)
}
