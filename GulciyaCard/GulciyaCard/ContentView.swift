//
//  ContentView.swift
//  GulciyaCard
//
//  Created by Gülçiya İltaş on 28.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.blue).edgesIgnoringSafeArea(.all).opacity(0.4)
            VStack{
                
               Image("gulciya")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 3)
                    )
                Text("Gülçiya İLTAŞ")
                    .font(.title)
                    .foregroundStyle(.black)
                    .bold()
                Text("İOS Developer")
                    .font(.system(.callout).pointSize(20))
                Divider()
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 48)
                    .foregroundStyle(.black).opacity(0.20)
                    .overlay( HStack {
                        Image(systemName:"phone")
                            .foregroundStyle(.red)
                        
                        Text("0 533 458 22 72 ")
                            .font(.system(.callout).pointSize(20))
                            .foregroundStyle(.black)
                        
                    })
                    .padding(.all)
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 48)
                    .foregroundStyle(.black).opacity(0.20)
                    .overlay( HStack {
                        Image(systemName:"location")
                            .foregroundStyle(.red)
                        
                        Text("Batman/Merkez")
                            .font(.system(.callout).pointSize(20))
                            .foregroundStyle(.black)
                    })
                    .padding(.all)
            }
           
        }
       
    }
}

#Preview {
    ContentView()
}
