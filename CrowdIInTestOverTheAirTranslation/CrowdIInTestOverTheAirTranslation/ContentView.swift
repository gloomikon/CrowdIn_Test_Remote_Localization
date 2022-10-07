//
//  ContentView.swift
//  CrowdIInTestOverTheAirTranslation
//
//  Created by Admin on 07.10.2022.
//

import SwiftUI
import CrowdinSDK

struct ContentView: View {
    var body: some View {
        VStack {
            Text("title".cw_localized)
                .padding()

            Text("subtitle".cw_localized)
                .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
