//
//  ContentView.swift
//  AngelaCard
//
//  Created by Gülçiya İltaş on 28.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.gray).edgesIgnoringSafeArea(.all)
            VStack{
                
                Image("angela")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay (
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Angela Yu")
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
                Text("İOS Developer")
                    .font(.system(.callout).pointSize(20))
                    .foregroundStyle(.white)
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 48)
                    .foregroundStyle(.white)
                    .overlay( HStack {
                        Image(systemName: "phone")
                            .foregroundStyle(.green)
                        
                        Text("+44 123 789 456")
                            .font(.system(.callout).pointSize(26))
                            .foregroundStyle(.blue)
                    })
                    .padding(.all)
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 48)
                    .foregroundStyle(.white)
                    .overlay( HStack {
                        Image(systemName: "mail")
                            .foregroundStyle(.black)
                        
                        Text("angela@mail.com")
                            .font(.system(.callout).pointSize(26))
                    })
                    .padding(.all)
            }
        }
    }
    }
#Preview {
    ContentView()
}
