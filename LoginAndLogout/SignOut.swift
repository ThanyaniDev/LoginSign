//
//  SignOut.swift
//  LoginAndLogout
//
//  Created by Thanyani on 2020/09/03.
//  Copyright © 2020 Thanyani. All rights reserved.
//

import SwiftUI



struct SignOut: View {
    @Binding var logout: Bool
    @State var logouts = false
    
    var body: some View {
        ZStack(){
            Text("UserPage LogOut")
                .font(.largeTitle)
            if self.logout {
                LoginAndSignUP()
            }
            Button(action:{
                self.logout.toggle()
                       }){
                           Text("SIGNOUT")
                               .foregroundColor(.white)
                               .fontWeight(.bold)
                               .padding(.vertical)
                               .padding(.horizontal,40)
                               .background(Color(UIColor(red: 27/255, green: 163/255, blue: 156/255, alpha: 1
                               )))
                               .clipShape(Capsule())
                               .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                       }.offset(y: 185)
        }
        
    }
}


