//
//  SliderUikit.swift
//  SliderQuiz
//
//  Created by Eugenie Tyan on 19.09.2022.
//

import SwiftUI

struct SliderUikit: UIViewRepresentable {
    @Binding var value: Double
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.alpha = alpha
        slider.thumbTintColor = .systemBlue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.alpha = alpha
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUikit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUikit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUikit(value: .constant(50), alpha: 1.0)
    }
}

