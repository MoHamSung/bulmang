//
//  ButtonView.swift
//  CloneCoding
//
//  Created by 하명관 on 2023/04/29.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color("ChulsseugButtonColor"))
            .cornerRadius(50)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ChulsseugMainView()
    }
}
