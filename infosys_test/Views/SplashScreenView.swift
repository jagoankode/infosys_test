//
//  SplashScreenView.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image("Brand")
                .resizable()
                .frame(width: 264, height: 191)
                .accessibilityIdentifier("splash_screen_image")
            Text("PT. Infosys Solusi Terpadu")
                .font(Font.title3.bold())
                .foregroundColor(Color.black)
                .accessibilityIdentifier("splash_screen_company_name")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color("Primary"))
    }
}

#Preview {
    SplashScreenView()
}
