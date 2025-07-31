//
//  MakeMoney.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct MakeMoney: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("Money") var Money : Int = 0
    var body: some View {
        VStack{
            HStack{
                Spacer()
                if colorScheme == .light{
                    HStack{
                        Text("$\(Money)")
                            .font(.title)
                    }
                    .padding(.horizontal)
                    .background{
                        Capsule()
                            .foregroundColor(Color(.systemBackground))
                            .shadow(radius: 6)
                    }
                    .padding(.horizontal)
                }else{
                    HStack{
                        Text("$\(Money)")
                            .font(.title)
                    }
                    .padding(.horizontal)
                    .background{
                        Capsule()
                            .foregroundColor(Color(.secondarySystemBackground))
                            .shadow(color:.white.opacity(0.4),radius: 1)
                        
                    }
                    .padding(.horizontal)
                }
            }
            Spacer()
            
            Button(action: {
                Money += 5
            }, label: {
                Text("按按鈕賺錢")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 50)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    MakeMoney()
}
