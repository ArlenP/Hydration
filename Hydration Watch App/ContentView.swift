//
//  ContentView.swift
//  Hydration Watch App
//
//  Created by Arlen Peña on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.5
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    Circle()
                        .trim(from: 0.75, to: 1.0)
                        .stroke(Color(red: 163/255, green: 206/255, blue: 239/255), lineWidth: 20)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                    
                    Image("gotita")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                }
                .padding()
                Spacer()
                Button(action: {
                    withAnimation {
                        if progress < 0.25 {
                            progress += 0.05
                        }
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(red: 163/255, green: 206/255, blue: 239/255))
                                      
                }
                .padding()
                Text("Good Day!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        Text("Configurando notificación cada hora...")
    }
}
