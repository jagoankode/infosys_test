//
//  ErrorView.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import SwiftUI

struct ErrorView: View {
    let title: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {

            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.yellow)
                .accessibilityIdentifier("error_view_image")

            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .accessibilityIdentifier("error_view_title")

            Button(action: retryAction) {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.clockwise")
                    Text("Muat Ulang")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .cornerRadius(12)
            }
            .padding(.horizontal, 40)
            .accessibilityIdentifier("error_view_retry_button")
        }
        .padding()
    }
}

#Preview {
    ErrorView(
        title: "Terjadi Kesalahan",
        retryAction: {
            print("Refetch")
        }
    )
}
