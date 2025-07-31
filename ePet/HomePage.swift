//
//  HomePage.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct HomePage: View {
    let player = SoundPlayer()

    @AppStorage("UserSelectedPet") var UserSelectedPet : String?
    //var UserSelectedPet : String? = "tutu"
    @AppStorage("Money") var Money : Int = 0
    
    @AppStorage("HaveChicken") var HaveChicken : Int = 0
    
    @State private var timer: Timer?
    
    @State var happy : Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                
                HStack{
                    Text("$\(Money)")
                        .font(.title)
                }
                .padding(.horizontal)
                .background{
                    Capsule()
                        .foregroundColor(.white)
                        .shadow(radius: 6)
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            HStack{
                ScrollView(.horizontal){
                    HStack{
                        ZStack{
                            if HaveChicken > 0{
                                VStack{
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Text("×\(HaveChicken)")
                                            .padding(.vertical)
                                            .padding(.horizontal,10)
                                    }
                                }
                                ForEach(0..<HaveChicken){_ in
                                    Image("ChickenNoBG")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                        .padding(.horizontal)
                                        .onTapGesture{
                                            HaveChicken = HaveChicken - 1
                                            
                                            player.playSound(soundName: "eat", type: "m4a")
                                            
                                            
                                            happy = true
                                            
                                            timer = Timer.scheduledTimer(withTimeInterval: 10,repeats: false) { [self] _ in
                                                withAnimation{
                                                    happy = false
                                                }
                                                timer?.invalidate()
                                            }
                                            RunLoop.current.add(timer!, forMode: .common)
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .clipShape(Capsule())
            .background{
                Capsule()
                    .foregroundColor(.white)
                    .shadow(radius: 6)

            }
            .padding(.horizontal)
            
            Image(UserSelectedPet ?? "Cat")
                .resizable()
                .scaledToFit()
                .padding()
                .onTapGesture {
                    timer?.invalidate()
                    
                    if UserSelectedPet == "Cat"{
                        let num = Int.random(in: 1...3)
                        
                        player.playSound(soundName: "cat\(num)", type: "mp3")
                        
                        print(num)
                        
                        withAnimation{
                            happy = true
                        }
                        
                        timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: false) { [self] _ in
                            withAnimation{
                                happy = false
                            }
                            timer?.invalidate()
                        }
                        RunLoop.current.add(timer!, forMode: .common)
                    }else{
                        player.playSound(soundName: "tutu1", type: "wav")
                        
                        withAnimation{
                            happy = true
                        }
                        
                        timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: false) { [self] _ in
                            withAnimation{
                                happy = false
                            }
                            timer?.invalidate()
                        }
                        RunLoop.current.add(timer!, forMode: .common)
                    }
                }
                .onAppear{
                    print(UserSelectedPet ?? "Cat")
                }
            
            HStack{
                Image(systemName: "face.smiling.inverse")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, happy ? .orange : .gray)
                    .colorScheme(.light)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background{
                Capsule()
                    .foregroundColor(.white)
                    .shadow(radius: 6)
            }
            .padding()
            
            Spacer()
        }.background{
            Color.white.ignoresSafeArea()
            UserSelectedPet == "tutu" ? Color.pink.opacity(0.4).ignoresSafeArea() : Color.blue.opacity(0.4).ignoresSafeArea()
        }
        .foregroundColor(.black)
        .animation(.easeInOut, value: HaveChicken)
    }
}

#Preview {
    HomePage()
}
