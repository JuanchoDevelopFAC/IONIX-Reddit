//
//  PostElement.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import SwiftUI

struct PostElement: View {
    
    let post: Post
    
    var body: some View {
        ZStack(alignment: .top) {
            Card()
            
            VStack(alignment: .leading) {
                PostImage(imageURL: post.url)
                PostInfo(title: post.title, score: post.score, numComments: post.numComments)
            }
            .frame(width: 340)
        }
    }
}

struct Card: View {
    var body: some View {
        Rectangle()
            .frame(width: 340, height: 360)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}

struct PostImage: View {
    
    let imageURL: String
    let imageHeight: CGFloat = 220
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(height: imageHeight)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 10.0,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 10.0),
                        style: .continuous
                    ))
                    .clipped()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .frame(height: imageHeight)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 10.0,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 10.0),
                        style: .continuous
                    ))
                    .clipped()
            } else {
                ProgressView()
                    .frame(width: 340, height: imageHeight)
            }
        }
    }
}

struct PostInfo: View {
    let title: String
    let score: Int
    let numComments: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.title3)
            
            HStack(alignment: .bottom , spacing: 30) {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color(colorName: .grayLightColor))
                    Text("\(score)")
                        .foregroundStyle(Color(colorName: .grayLightColor))
                }
                HStack {
                    Image(systemName: "ellipsis.message.fill")
                        .foregroundStyle(Color(colorName: .grayLightColor))
                    Text("\(numComments)")
                        .foregroundStyle(Color(colorName: .grayLightColor))
                }
            }
        }
        .padding(EdgeInsets(
            top: 10,
            leading: 15,
            bottom: 0,
            trailing: 15))
    }
}

#Preview {
    let post = Post(
        title: "If you haven\'t been in a firewatch tower for a month you do not know fear.",
        score: 6294,
        author: "Morse243",
        numComments: 362,
        url: "https://i.redd.it/ltd6wmrdrsyb1.jpg",
        id: "17pdvuq")
    
    return PostElement(post: post)
}
