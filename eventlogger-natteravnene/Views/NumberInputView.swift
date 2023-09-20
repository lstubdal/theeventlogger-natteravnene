//
//  NumberInputView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 13/08/2023.
//  View for nubmer inputs

import SwiftUI

struct NumberInputView: View {
    let title: String
    @Binding var value: Int // @Binding to assign value from input 
    
    // format defualt 0 value to blanc
    var numberFormatter: NumberFormatter = {
        var currentNumber = NumberFormatter() //set type to integer
        currentNumber.zeroSymbol = "" // Hide number before assigned value
        return currentNumber
    }()
    
    
    var body: some View {
    HStack  {
            Text(title)
                .font(.system(size: 22))
            TextField("Type in", value: $value, formatter: numberFormatter)
                .background(Color.black.opacity(0.05))
                .cornerRadius(7)
                .keyboardType(UIKeyboardType.numberPad) // display number keyboard
                
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .frame(width: 100, height: 30)
        }
    }
}

struct NumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputView(title: "Title", value: .constant(0)) // constant for preview setup
    }
}
