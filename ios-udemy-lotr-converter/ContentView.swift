//
//  ContentView.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 25/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSelectCurrency = false
    @State var showRatesInfo = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .goldPiece
    @State var rightCurrency: Currency = .copperPenny
    
    var body: some View {
        ZStack {
            // BG Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                // Logo
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Title
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Converter
                HStack {
                    // Left Currency Input
                    VStack {
                        HStack {
                            // Currency Icon
                            Image(.goldpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            // Currency Name
                            Text("Gold Penny")
                                .font(.headline)
                        }
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.automatic)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    
                    // Equal icon
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .opacity(0.75)
                    
                    // Right Currency Input
                    VStack {
                        HStack {
                            // Currency Name
                            Text("Gold Penny")
                                .font(.headline)
                            // Currency Icon
                            Image(.goldpenny)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                        }
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.automatic)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(10)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(10)
                .foregroundStyle(.white)
                .onTapGesture {
                    showSelectCurrency.toggle()
                }
                
                // Pin buuton to the bottom using Spacer
                Spacer()
                
                // Info button
                HStack {
                    Spacer()
                    Button() {
                        showRatesInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $showRatesInfo) {
            ExchangeRatesView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrencyView(fromCurrency: leftCurrency, toCurrency: rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
