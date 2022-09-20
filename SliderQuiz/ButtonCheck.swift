//
//  ButtonCheck.swift
//  SliderQuiz
//
//  Created by Eugenie Tyan on 20.09.2022.
//

import SwiftUI

struct ButtonCheck: View {
    @State var isAlertPresented = false
    let buttonName: String
    let targetValue: Int
    let currentValue: Double
    
    var body: some View {
        Button(buttonName, action: buttonCheckPressed)
            .alert("Result", isPresented: $isAlertPresented, actions: {}) {
                Text("\(computeScore())")
            }
    }
    private func buttonCheckPressed() {
        isAlertPresented = true
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ButtonCheck_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCheck(buttonName: "", targetValue: 0, currentValue: 0)
    }
}
