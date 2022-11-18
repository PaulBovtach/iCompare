//
//  ContentView.swift
//  iCompare
//
//  Created by Павло on 19.09.2022.
//

import SwiftUI

struct CustomColor{
    static let myColor = Color("mycolour")
}

struct ContentView: View {
    @StateObject var device = Devices()

var body: some View {
    NavigationView {
        CompareView().environmentObject(device)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Devices())
    }
}


