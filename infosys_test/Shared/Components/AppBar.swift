//
//  AppBar.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

struct AppBar<Leading: View>: View {
    let title: String
    @ViewBuilder var leading: Leading

    init(
        title: String,
        @ViewBuilder leading: () -> Leading = { EmptyView() }
    ) {
        self.title = title
        self.leading = leading()
    }

    var body: some View {
        HStack {
            // If leading is EmptyView, keep placeholder width to center title
            if Leading.self == EmptyView.self { Spacer() }
            else {
                leading
                    .accessibilityIdentifier("appbar_leading")
            }
            
            Text(title)
                .font(.headline)
                .lineLimit(1)
                .frame(height: 44)
                .accessibilityIdentifier("appbar_title")
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color("Primary"))
        .foregroundColor(.white)
    }
}

#Preview {
    VStack(spacing: 16) {
        AppBar(title: "Beranda")

        AppBar(title: "Detail") {
            Button {
                print("go back")
            } label: {
                Image(systemName: "chevron.left")
                    .frame(width: 44, height: 44)
            }
        }
    }
    .padding()
}

