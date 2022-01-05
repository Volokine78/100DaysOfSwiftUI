//
//  MainView.swift
//  UnitConverter
//
//  Created by Tolga PIRTURK on 5.01.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        NavigationLink(destination: LengthConversionView()) {
                            Text("Length")
                        }
                        NavigationLink(destination: TemperatureConversionView()) {
                            Text("Temperature")
                        }
                        NavigationLink(destination: TimeConversionView()) {
                            Text("Time")
                        }
                        NavigationLink(destination: VolumeConversionView()) {
                            Text("Volume")
                        }
                    } header: {
                        Text("Choose Unit Type to Convert")
                            .font(.headline)
                    }
                    .textCase(.none)
                }
                .navigationTitle("Unit Converter")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
