//
//  SecondView.swift
//  UikitAnimation
//
//  Created by Raidan on 12/07/2024.
//

import Foundation
import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Dimsiss")
            }
            .frame(alignment: .center)
            .background(Color(.red))
            
        }}
}
