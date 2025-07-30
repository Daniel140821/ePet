//
//  ContentView.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var timer: Timer?
    @State private var GoNextPage: Bool = false
    @AppStorage("UserSelectedPet") var UserSelectedPet: String?
    var body: some View {
        if GoNextPage{
            if UserSelectedPet == nil{
                ContentView()
            }else{
                if GoNextPage == true{
                    ContentView()
                }else{
                    
                }
            }
        }else{
            VStack {
                Image(systemName: "pawprint.fill")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .foregroundColor(.brown)
                
                Text("ePet")
                    .font(.largeTitle.bold())
                    .padding()
            }
            .padding()
            .onAppear{
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
                    withAnimation{
                        GoNextPage = true
                    }
                }
                RunLoop.current.add(timer!, forMode: .common)
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
