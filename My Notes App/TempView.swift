//
//  TempView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

struct TempView: View {
    let screenSize: CGFloat = UIScreen.main.bounds.size.height
    @State private var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitatio dfghf  dfgdfg  dgdf  dgfdg  dfgdfg  dg   fgh f fgh fg fhfgh n"
    @State private var sampleText2 = "Lorem ipsum"
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                TextEditor(text: $sampleText)
//                    .frame(minHeight: 00, idealHeight: nil, maxHeight: 400, alignment: .leading)
//                    .lineLimit(10)
                    .border(.blue, width: 2)
                    .font(.largeTitle)
                    .padding()
//                    .frame(minHeight: 500) //this
//                }.frame(minHeight: proxy.size.height)
                }.frame(minHeight: proxy.size.height)
                TextEditor(text: $sampleText2)
                .font(.title)
                .border(.blue, width: 2)
            }
        }

    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
