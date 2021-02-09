//
//  ContentView.swift
//  lessonNumber25
//
//  Created by vladimir gennadievich on 08.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State var  index = 1
    @State var show = true
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment:.leading,spacing:12){
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipShape(Circle())
                        .padding(.top,1)
                    
                    Text("привет,")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top,10)
                    
                    Text("Ян")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Button(action: {
                        self.index = 0
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing:25) {
                            Image("shop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                                .foregroundColor(self.index == 0 ? .purple:.black)
                                .padding(.leading,20)
                            
                            Text("Корзина")
                                .font(.title)
                                .foregroundColor(self.index == 0 ? .green:.black)
                            
                        }
                        .padding(.vertical,10)
                        .padding(.trailing,20)
                        .background(self.index == 0 ? Color.purple.opacity(0.6) : Color.clear)
                        .cornerRadius(10)
                        
                        
                    })
                    
                    
                    Button(action: {
                        self.index = 1
                        
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }, label: {
                        HStack(spacing:25) {
                            Image("card")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                                .foregroundColor(self.index == 1 ? .purple:.black)
                            
                            Text("Каталог")
                                .font(.title)
                                .foregroundColor(self.index == 1 ? .green:.black)
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color.purple.opacity(0.6) : Color.clear)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        self.index = 2
                        
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }, label: {
                        HStack(spacing:25) {
                            Image("card")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                                .foregroundColor(self.index == 2 ? .purple:.black)
                            
                            Text("Избранное")
                                .font(.title)
                                .foregroundColor(self.index == 2 ? .green:.black)
                        }
                        .multilineTextAlignment(.center)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color.purple.opacity(0.6) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Button(action: {
                        self.index = 3
                        
                        withAnimation{
                            self.show.toggle()
                        }
                        
                    }, label: {
                        HStack(spacing:25) {
                            Image("card")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30, alignment: .center)
                                .clipShape(Circle())
                                .foregroundColor(self.index == 3 ? .purple:.black)
                            
                            Text("Мой заказы")
                                .font(.title)
                                .foregroundColor(self.index == 3 ? .green:.black)
                        }
                        .multilineTextAlignment(.center)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color.purple.opacity(0.6) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        . padding()
                    
                    Button(action: {
                        print("goes away")
                    }, label: {
                        HStack {
                            Image("exit")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                            
                            Text("Выход")
                                .font(.title)
                                .foregroundColor(.black)
                            
                        }.padding(.vertical,10)
                        .padding(.horizontal)
                        
                    })
                    Spacer(minLength: 0)
                        .padding(.top,25)
                        .padding(.horizontal,20)
                }
                
                Spacer(minLength: 0)
                
            }.padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing:0) {
                HStack(spacing:15) {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        Image(systemName: self.show ? "xmark":"line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18:22, height: 18 )
                            .foregroundColor(Color.black.opacity(0.4))
                    })
                    Text(self.index == 0 ? "Каталог": self.index == 1 ? "Карзина":self.index == 2 ? "Избранное":"Мой заказы")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader { _ in
                    VStack {
                        if self.index == 0 {
                            Cart()
                        }   else if self.index == 1 {
                            Catolog()
                        } else if self.index == 2 {
                            Favorites()
                        } else {
                            Order()
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30:0)
            .scaleEffect(self.show ? 0.9:1)
            .offset(x: self.show ? UIScreen.main.bounds.width/2:0, y: self.show ? 15:0)
            .rotationEffect(.init(degrees: self.show ? -5:0))
        }
        .background(Color.purple).edgesIgnoringSafeArea(.all)
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct Catolog:View {
    var body: some View {
        VStack{
            Text("Каталог")
        }
    }
}
struct Cart:View {
    var body: some View {
        VStack{
            Text("Карзина")
        }
    }
}
struct Favorites:View {
    var body: some View {
        VStack{
            Text("Избранные")
        }
    }
}
struct Order:View {
    var body: some View {
        VStack{
            Text("Заказы")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
