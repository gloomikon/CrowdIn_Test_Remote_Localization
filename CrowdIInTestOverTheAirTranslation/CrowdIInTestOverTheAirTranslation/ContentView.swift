//
//  ContentView.swift
//  CrowdIInTestOverTheAirTranslation
//
//  Created by Admin on 07.10.2022.
//

import SwiftUI
import CrowdinSDK
import UIKit

class ViewConroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("title", comment: "")
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)

        titleLabel.frame = .init(x: 100, y: 100, width: 300, height: 300)

    }
}

struct ViewControllerStruct: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewConroller {
        .init()
    }

    func updateUIViewController(_ uiViewController: ViewConroller, context: Context) {
    }
}

struct ContentView: View {

    var body: some View {
        ViewControllerStruct()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
