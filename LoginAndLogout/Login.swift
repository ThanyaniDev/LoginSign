//
//  Login.swift
//  LoginAndLogout
//
//  Created by Thanyani on 2020/09/03.
//  Copyright © 2020 Thanyani. All rights reserved.
//

import SwiftUI



struct LoginAndSignUP: View {
    
    @State var index = 0
    @State var loginIsDone = false
    @State var logot = false
    
    
    var body: some View {
        GeometryReader {_ in
            
            ZStack {
                
                Group {
                    if self.loginIsDone {
                        SignOut(logout: self.$logot )
                    }else{
                        Text("MCEBO")
                            .font(.largeTitle)
                            .padding()
                        ZStack{
                            SignUp(index: self.$index)
                                .zIndex(Double(self.index))
                            _Login(index: self.$index,loginIsDone: self.$loginIsDone )
                            _Login(index: self.$index,loginIsDone: self.$loginIsDone )
                        }
                        
                    }
                    
                    
                    
                    
                }
                
                //                HStack(spacing: 15){
                //                    Rectangle()
                //                        .fill(Color(UIColor(red: 0.243, green: 0.286, blue: 0.345, alpha: 1)))
                //                        .frame(height: 1)
                //
                //                    Text("OR")
                //
                //                    Rectangle()
                //                        .fill(Color(UIColor(red: 0.243, green: 0.286, blue: 0.345, alpha: 1)))
                //                        .frame(height: 1)
                //
                //                }
                //                .padding(.horizontal, 20)
                //                .padding(.top, 50)
                
                //                HStack(spacing: 25){
                //
                //                    Button(action: {
                //
                //                    }){
                //                        Image("apple")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 50, height: 50)
                //                            .clipShape(CShape())
                //                    }
                //                    Button(action: {
                //
                //                    }){
                //                        Image("gmail")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 50, height: 50)
                //                            .clipShape(CShape())
                //                    }
                //                    Button(action: {
                //
                //                    }){
                //                        Image("facebook")
                //                            .resizable()
                //                            .renderingMode(.original)
                //                            .frame(width: 50, height: 50)
                //                            .clipShape(CShape())
                //                    }
                //                }
                //                .padding(.top,30)
                
            }
            .padding(.vertical)
        }
        .background(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
        ))).edgesIgnoringSafeArea(.all)
    }
}


struct CShape : Shape
{
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to:CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape
{
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to:CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x:rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}


struct _Login: View {
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    @Binding var loginIsDone: Bool
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
            
            VStack {
                HStack {
                    
                    VStack {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill( self.index == 0 ?  Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                        
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
                            )))
                        TextField("Email  Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
                            )))
                        SecureField("Password", text: self.$password)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button (action: {
                        
                    }){
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top,30)
            }
            .padding()
            .padding(.bottom,65)
            .background(Color(UIColor(red: 0.243, green: 0.286, blue: 0.345, alpha: 1)))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal,25)
            
            Button(action:{
                self.loginIsDone.toggle()
            }){
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,40)
                    .background(Color(UIColor(red: 27/255, green: 163/255, blue: 156/255, alpha: 1
                    )))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUp: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Binding var index : Int
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                HStack {
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill( self.index == 1 ?  Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    
                    
                }
                .padding(.top,30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
                            )))
                        TextField("Email  Address", text: self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
                            )))
                        SecureField("Password", text: self.$password)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
                
                VStack {
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color(UIColor(red: 0.35, green: 0.725, blue: 0.69, alpha: 1
                            )))
                        SecureField("Confirm Password", text: self.$confirmPassword)
                        
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top,30)
            }
            .padding()
            .padding(.bottom,65)
            .background(Color(UIColor(red: 0.243, green: 0.286, blue: 0.345, alpha: 1)))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal,25)
            
            Button(action:{
                
            }){
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,40)
                    .background(Color(UIColor(red: 27/255, green: 163/255, blue: 156/255, alpha: 1
                    )))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
    
}

