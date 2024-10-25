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

    @FocusState var isLeftInputFocused
    @FocusState var isRightInputFocused

    @State var leftCurrency: Currency =
        Currency(rawValue: UserDefaults.standard.double(forKey: "leftCurrency"))
        ?? .goldPenny
    @State var rightCurrency: Currency =
        Currency(
            rawValue: UserDefaults.standard.double(forKey: "rightCurrency"))
        ?? .silverPenny

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
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            // Currency Name
                            Text(leftCurrency.name)
                                .font(.headline)
                        }
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.automatic)
                            .padding(12)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundStyle(.black)
                            .focused($isLeftInputFocused)
                            .padding(.top, 8)
                            .keyboardType(.decimalPad)
                    }

                    // Equal icon
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .opacity(0.75)

                    // Right Currency Input
                    VStack {
                        HStack {
                            // Currency Name
                            Text(rightCurrency.name)
                                .font(.headline)
                            // Currency Icon
                            Image(rightCurrency.image)
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
                            .foregroundStyle(.black)
                            .focused($isRightInputFocused)
                            .padding(.top, 8)
                            .keyboardType(.decimalPad)
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
                    Button {
                        showRatesInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isLeftInputFocused = false
                isRightInputFocused = false
            }
            .padding()
        }
        // Dismiss keybord

        // Right to left
        .onChange(of: rightAmount) {
            if isRightInputFocused {
                leftAmount = rightCurrency.convert(
                    rightAmount, to: leftCurrency)
            }
        }

        // Left to Right
        .onChange(of: leftAmount) {
            if isLeftInputFocused {
                rightAmount = leftCurrency.convert(
                    leftAmount, to: rightCurrency)
            }
        }
        .sheet(isPresented: $showRatesInfo) {
            ExchangeRatesView()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrencyView(
                fromCurrency: $leftCurrency, toCurrency: $rightCurrency)
        }
        .onChange(of: leftCurrency) {
            UserDefaults.standard.set(
                leftCurrency.rawValue, forKey: "leftCurrency")
        }
        .onChange(of: rightCurrency) {
            UserDefaults.standard.set(
                rightCurrency.rawValue, forKey: "rightCurrency")
        }
    }
}

#Preview {
    ContentView()
}
