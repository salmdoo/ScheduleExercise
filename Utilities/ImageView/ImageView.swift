//
//  ImageView.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/26/25.
//
import SwiftUI
import Kingfisher

struct ImageView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        KFImage(URL(string: url))
            .onFailureImage(KFCrossPlatformImage(systemName: "exclamationmark.triangle"))
            .placeholder {
                ProgressView()
                    .frame(width: width, height: height)
            }
            .fade(duration: 0.3)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}
