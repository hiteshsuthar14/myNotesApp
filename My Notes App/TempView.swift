//
//  TempView.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 04/07/22.
//

import SwiftUI

struct TempView: View {
    let columns = [GridItem(.adaptive(minimum: 33, maximum: 99))]
    var body: some View {
        Text("Hi")
       // LazyVStack(columns: columns)
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
