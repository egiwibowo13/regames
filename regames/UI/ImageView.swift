//
//  SwiftUIView.swift
//  regames
//
//  Created by Egi Wibowo on 21/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    let url: String?
    let width: CGFloat
    let height: CGFloat
     
    init(url: String?, width: CGFloat, height: CGFloat) {
         self.url = url
         self.width = width
         self.height = height
     }
     
     var body: some View {
        WebImage(url: url != nil ? URL(string: url!) : URL(string: "https://pbi.uad.ac.id/wp-content/uploads/2018/01/default-image.jpg"))
             .resizable()
             .frame(width: width, height: height)
     }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: nil, width: 100, height: 100)
    }
}
