//
//  ErrorView.swift
//  regames
//
//  Created by Egi Wibowo on 21/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Image("error")
            .resizable()
            .frame(width: 130, height: 130, alignment: .center)
          Text("Something went wrong!")
            .font(.callout)
            .foregroundColor(.gray)
            .padding(.top, 20)
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
