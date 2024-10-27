//
//  CurrencyTip.swift
//  ios-udemy-lotr-converter
//
//  Created by Serhii Orlenko on 27/10/2024.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change Currency")
    }

    var message: Text? {
        Text("You can tap left or right currency to bring up the Select Currency Screen.")
    }
}
