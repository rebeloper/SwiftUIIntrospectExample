//
//  ContentView.swift
//  SwiftUIIntrospectExample
//
//  Created by Alex Nagy on 04.02.2021.
//

import SwiftUI
import Introspect

struct ContentView: View {

    @State var email = ""
    @State var isOn = false
    @State var value = 0.2
    @State var today = Date()
    @State var selection = 1

    var body: some View {
        TabView {
            NavigationView {
                List {
                    Text("Hello")
                    Text("Introspect")
                    Toggle("More", isOn: $isOn)
                        .introspectSwitch { (toggle) in
//                            toggle.onTintColor = UIColor.red
                            
                            toggle.backgroundColor = UIColor.systemYellow
                            toggle.layer.cornerRadius = toggle.frame.height / 2
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    if isOn {
                        ScrollView(.horizontal) {
                            HStack {
                                Color.red.frame(width: 300)
                                Color.blue.frame(width: 300)
                                Color.green.frame(width: 300)
                            }.frame(height: 50)
                            .introspectScrollView { (scrollView) in
                                scrollView.bounces = false
                            }
                        }
                        TextField("Email", text: $email)
                            .introspectTextField { (textField) in
                                textField.layer.backgroundColor = UIColor.systemYellow.cgColor
                            }
                        Slider(value: $value)
                            .introspectSlider { (slider) in
                                slider.tintColor = UIColor.systemYellow
                            }
                        Stepper(value: $value, step: 0.1) { (changed) in
                            print("Value changed: \(value)")
                        } label: {
                            Text("Stepper")
                        }
                        .introspectStepper { (stepper) in
                            stepper.layer.backgroundColor = UIColor.systemYellow.cgColor
                            stepper.layer.cornerRadius = 7
                        }
                        DatePicker("Date", selection: $today)
                            .introspectDatePicker { (datePicker) in
                                datePicker.tintColor = UIColor.systemYellow
                            }
                        Picker(selection: $selection, label: Text("Picker"), content: {
                            Text("1").tag(1)
                            Text("2").tag(2)
                        }).pickerStyle(SegmentedPickerStyle())
                        .introspectSegmentedControl { (segmentedControl) in
                            segmentedControl.layer.backgroundColor = UIColor.systemYellow.cgColor
                        }
                    }
                }
                .introspectTableView(customize: { (tableView) in
                    tableView.separatorStyle = .none
                })
                .navigationBarTitle("Introspect")
                .navigationBarTitleDisplayMode(.inline)
            }
            .introspectNavigationController(customize: { (navigationController) in
                navigationController.navigationBar.barTintColor = UIColor.systemYellow
            })
            .tabItem {
                Image(systemName: "paperclip.badge.ellipsis")
            }
        }
        .introspectTabBarController { (tabBarController) in
            tabBarController.tabBar.barTintColor = UIColor.systemYellow
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
