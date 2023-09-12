//
//  textEditorView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 13/08/2023.
//

import SwiftUI

struct TextEditorView: View {
    let title: String
    let description: String
    @Binding var textInput: String
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.system(size: 22))
            Text(description)
                .font(.system(size: 18))
                .foregroundColor(Color.black.opacity(0.5))
            TextEditor(text: $textInput)
                .foregroundColor(.black) // Text color
                .frame(width: 300, height: 200)
                .scrollContentBackground(.hidden) // <- Hide it
                .background(Color.black.opacity(0.05))
                .cornerRadius(7)
        }
        .padding()
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(title: "title", description: "description", textInput: .constant("Type here..."))
    }
}
