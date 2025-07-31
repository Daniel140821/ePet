//
//  ShopView.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct ShopView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("Money") var Money : Int = 0
    @AppStorage("HaveChicken") var HaveChicken : Int = 0
    @State var notEnoughMoney : Bool = false
    
    var body: some View {
        ScrollView{
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
                
                
                VStack{
                    Image("Chicken")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding()
                    
                    Spacer()
                    
                    HStack{
                        Text("大肥雞")
                            .font(.largeTitle.bold())
                            .padding(.leading)
                        
                        Text("$200")
                            .font(.title.bold())
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            if Money >= 200{
                                Money = Money - 200
                                HaveChicken += 1
                            }else{
                                notEnoughMoney = true
                            }
                        } label: {
                            Label {
                                Text("購買")
                            } icon: {
                                Image(systemName: "cart")
                            }.frame(width: 70)
                            
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background{
                    if colorScheme == .light{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemBackground))
                            .shadow(radius: 6)
                    }else{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.secondarySystemBackground))
                            .shadow(color:.white.opacity(0.4),radius: 1)
                    }
                }
                .padding()
            }
        }.alert("提示", isPresented: $notEnoughMoney) {
            Button("OK"){}
        } message: {
            Text("你沒有足夠錢")
        }
    }
}

#Preview {
    ShopView()
}
