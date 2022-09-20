//
//  ContentView.swift
//  SliderQuiz
//
//  Created by Eugenie Tyan on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State var value: Double = 50
    @State var targetValue = Int.random(in: 0...100)
    var alpha: Double {
        1.0 - abs(Double(targetValue) - value) / 100
    }
    
    var body: some View {
        VStack (spacing: 25) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
                .font(.system(size: 15))
            HStack {
                Text("0")
                SliderUikit(value: $value, alpha: alpha)
                Text("100")
            }
            .padding(.horizontal)
            ButtonCheck(buttonName: "Проверь меня", targetValue: targetValue, currentValue: value)
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
