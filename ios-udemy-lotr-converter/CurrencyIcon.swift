//
//  CurrencyIcon.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct CurrencyIcon: View {
    
    let currency: Currency
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(currency.image)
                .resizable()
                .scaledToFit()
                .padding(6)
            Text(currency.name)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity)
                .padding(6)
                .background(.brown.opacity(0.75))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(width: 112, height: 112)
        .background(.brown.opacity(0.75))
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currency: .goldPenny)
}
