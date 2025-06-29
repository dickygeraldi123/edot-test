//
//  BasicTextField.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

struct BasicTextField: View {
    enum InputType {
        case normal
        case secure
    }

    enum ValidationMode {
        case none
        case phone
        case textOnly
    }

    @Binding var text: String
    let placeholder: String
    let inputType: InputType
    let validation: ValidationMode
    let keyboard: UIKeyboardType
    let textCase: TextCasing

    @State private var isSecureVisible: Bool = false

    enum TextCasing {
        case none
        case uppercase
        case lowercase
        case capitalized
    }

    var body: some View {
        HStack {
            Group {
                if inputType == .secure && !isSecureVisible {
                    SecureField(placeholder, text: $text)
                        .keyboardType(keyboard)
                        .font(Font.customFont(type: .medium, size: 12))
                        .onChange(of: text) { updateText($0) }
                } else {
                    TextField(placeholder, text: $text)
                        .keyboardType(keyboard)
                        .font(Font.customFont(type: .medium, size: 12))
                        .autocapitalization(.none)
                        .onChange(of: text) { updateText($0) }
                }
            }

            if inputType == .secure {
                Button(action: {
                    isSecureVisible.toggle()
                }) {
                    Image(systemName: isSecureVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }

    private func updateText(_ newText: String) {
        var filtered = newText

        switch validation {
        case .phone:
            // Remove non-digits and limit to 15 characters
            filtered = String(filtered.filter { $0.isNumber }.prefix(15))
        case .textOnly:
            // Keep letters and spaces only
            filtered = String(filtered.filter { $0.isLetter || $0.isWhitespace })
        case .none:
            break
        }

        switch textCase {
        case .uppercase:
            filtered = filtered.uppercased()
        case .lowercase:
            filtered = filtered.lowercased()
        case .capitalized:
            filtered = filtered.capitalized
        case .none:
            break
        }

        if filtered != text {
            text = filtered
        }
    }
}
