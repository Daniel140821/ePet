//
//  ContentView.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    let player = SoundPlayer()
    @AppStorage("UserSelectedPet") var UserSelectedPet: String?
    
    @State var UserSelectedPetForAlert: String?
    
    var body: some View {
        if UserSelectedPet != nil{
            TabViewPage()
        }else{
            Text("選擇你想領養的寵物")
                .font(.largeTitle.bold())
                .padding()
            
            Spacer()
            
            HStack{
                if colorScheme == .light{
                    ZStack{
                        Circle()
                            .frame(width: 200)
                            .padding(.horizontal)
                            .foregroundColor(Color(.systemBackground))
                            .shadow(radius: 6)
                        
                        VStack{
                            Image("Cat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120,height: 120)
                                .padding(.top)
                                
                            
                            Text("豹豹")
                                .padding(10)
                            
                            
                        }
                    }
                    Spacer()
                }else{
                    ZStack{
                        Circle()
                            .frame(width: 200)
                            .padding(.horizontal)
                            .foregroundColor(Color(.secondarySystemBackground))
                            .shadow(color:.white.opacity(0.4),radius: 1)
                        
                        VStack{
                            Image("Cat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120,height: 120)
                                .padding(.top)
                                
                            
                            Text("豹豹")
                                .padding(10)
                            
                            
                        }
                    }
                    
                    Spacer()
                }
            }
            .onTapGesture{
                // 异步执行任务（常用）
                DispatchQueue.global().async {
                    let num = Int.random(in: 1...3)
                    
                    player.playSound(soundName: "cat\(num)", type: "mp3")
                    
                    print(num)
                    
                    // 回到主线程更新UI
                    DispatchQueue.main.async {
                        withAnimation{
                            UserSelectedPetForAlert = "Cat"
                        }
                    }
                }
            }
            .alert("是否領養", isPresented: .init(
                get: { UserSelectedPetForAlert == "Cat" },
                set: { _ in UserSelectedPetForAlert = "" }
            )) {
                Button("願意"){
                    print("can")
                    withAnimation{
                        UserSelectedPet = "Cat"
                    }
                }
                Button("不願意"){
                    print("can't")
                }
            } message: {
                Text("你是否願意永遠愛豹豹")
            }
            HStack{
                Spacer()
                
                if colorScheme == .light{
                    ZStack{
                        Circle()
                            .frame(width: 200)
                            .padding(.horizontal)
                            .foregroundColor(Color(.systemBackground))
                            .shadow(radius: 6)
                        
                        VStack{
                            Image("tutu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120,height: 120)
                            
                            Text("白白")
                                .padding(10)
                        }
                        
                    }
                    
                }else{
                    ZStack{
                        Circle()
                            .frame(width: 200)
                            .padding(.horizontal)
                            .foregroundColor(Color(.secondarySystemBackground))
                            .shadow(color:.white.opacity(0.4),radius: 1)
                        
                        
                        VStack{
                            Image("tutu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120,height: 120)
                            
                            Text("白白")
                                .padding(10)
                            
                            
                        }
                    }
                }
            }.onTapGesture{
                // 异步执行任务（常用）
                DispatchQueue.global().async {
                    player.playSound(soundName: "tutu1", type: "wav")
                    
                    // 回到主线程更新UI
                    DispatchQueue.main.async {
                        UserSelectedPetForAlert = "tutu"
                    }
                }
            }
            .alert("是否領養", isPresented: .init(
                get: { UserSelectedPetForAlert == "tutu" },
                set: { _ in UserSelectedPetForAlert = "" }
            )) {
                Button("願意"){
                    print("can")
                    withAnimation{
                        UserSelectedPet = "tutu"
                    }
                }
                Button("不願意"){
                    print("can't")
                }
            } message: {
                Text("你是否願意永遠愛白白")
            }

            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
