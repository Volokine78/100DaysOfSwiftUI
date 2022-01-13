//
//  ListVsForm.swift
//  WordScramble
//
//  Created by Tolga PIRTURK on 11.01.2022.
//

import SwiftUI

struct ListVsForm: View {
    var body: some View {
        VStack {
            Spacer()

            TextField("", text: .constant(""))
                .overlay(
                    Rectangle()
                        .stroke(.red)
                )
                .background(.blue)
            
            Spacer()
        }
    }
}

struct ListVsForm_Previews: PreviewProvider {
    static var previews: some View {
        ListVsForm()
    }
}
