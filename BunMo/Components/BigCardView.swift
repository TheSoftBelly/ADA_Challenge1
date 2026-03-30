//
//  BigCardView.swift
//  BunMo
//
//  Created by Joon on 3/27/26.
//

import SwiftUI

struct BigCardView: View {

    let post: Post
    var body: some View {
        ZStack{
            if let imageName = post.image {
                Image(imageName)
                    .resizable()
                    .scaleEffect(2.5)
                    .blur(radius: 40)
                    .cornerRadius(14)
                    .containerRelativeFrame(.horizontal) { width, _ in width - 20 }
                    .frame(maxHeight:400)
                    .opacity(0.7)
            } else {
                // 기본 이미지나 컬러
                Rectangle()
                    .fill(post.contentType.color)
                    .scaleEffect(2.5)
                    .blur(radius: 40)
                    .cornerRadius(14)
                    .containerRelativeFrame(.horizontal) { width, _ in width - 20 }
                    .frame(maxHeight:400)
                    .opacity(0.7)
            }

            HStack{
                Spacer()
                VStack{
                    Spacer()
                    if let imageName = post.image {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .containerRelativeFrame(.horizontal) { width, _ in width - 30 }
                            .frame(height: 280)
                            .cornerRadius(14)
                            .shadow(radius:12)
                    } else {
                        // 기본 이미지나 컬러
                        Rectangle()
                            .fill(post.contentType.color)
                            .scaledToFill()
                            .containerRelativeFrame(.horizontal) { width, _ in width - 30 }
                            .frame(height: 280)
                            .cornerRadius(14)
                            .shadow(radius:12)
                    }
                }
                Spacer()
            }
            .padding(.bottom, 5)

            VStack{
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text(post.contentType.displayName)
                                .font(.title3)
                                .fontWeight(.medium)
                                .shadow(radius:6)
                                .bold()
                            Spacer()
                        }
                        Text(post.title)
                            .font(.title)
                            .bold()
                        Label("\(post.currentParticipants.count)명이 참석 중", systemImage: "person.2.fill")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .shadow(radius:6)
                            .bold()
                        Spacer()
                    }
                    .padding(.top)
                    Spacer()
                }
                .padding(.leading)
                .containerRelativeFrame(.horizontal) { width, _ in width - 20 }
                .frame(height:120)
                .shadow(radius:12)
                Spacer()
            }
        }
//
//            Image(cardImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 320, height: 360)
//            VStack{
//                ZStack{
//                    Rectangle()
//                        .fill(Color.white)
//                        .cornerRadius(20)
//                        .shadow(color: Color.black.opacity(0.3), radius: 10)
//                        .frame(width: 300, height: 80)
//                    Text(titleString)
//                        .font(.title2)
//                        .foregroundStyle(.black)
//                        .bold(true)
//                }
//                .padding()
//                Spacer()
//            }
        .frame(height: 400)
    }
}
