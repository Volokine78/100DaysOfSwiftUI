//
//  MainView.swift
//  Fun Tables
//
//  Created by Tolga PIRTURK on 14.01.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("FUN TABLES")
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink("Start", destination: SettingsView())
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
