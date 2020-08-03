//
//  HTMLStringView.swift
//  regames
//
//  Created by Egi Wibowo on 21/07/20.
//  Copyright © 2020 Egi Wibowo. All rights reserved.
//

import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

struct HTMLStringView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLStringView(htmlContent: "<h1>This is HTML String</h1>")
    }
}
