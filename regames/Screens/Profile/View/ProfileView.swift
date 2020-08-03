//
//  ProfileView.swift
//  regames
//
//  Created by Egi Wibowo on 19/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
            VStack {
                Image("photo-egi")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .top)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.7))

                Text("Egi Ari Wibowo")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                    .padding(.bottom, 30)

                HStack {
                    Image("github")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .top)
                    Text("egiwibowo13")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(.blue)

                    Spacer()

                }.padding(.horizontal, 25)


                 Spacer()
                
            }
            .navigationBarTitle("Profile", displayMode: .automatic)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
