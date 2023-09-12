//
//  ReportView.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 11/09/2023.
//

import SwiftUI
import CoreLocation

struct ReportView: View {
    let locationManager = CLLocationManager()  // location manager object
    @ObservedObject var vm = ReportViewModel() // new vm object
    
    @State var currentAge: Int = 0
    @State var currentNumberOfPeople: Int = 0
    @State var currentLogger: String = "Type here"
    @State var currentGender: Gender = .female
    @State var currentAssistance: Assistance = .intoxicatedPerson
    @State var currentObservation: Observation = .theft
    @State var currentCharacteristics: String = ""
    @State var currentDescriptionEvent : String = ""
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female, other
        var id: Self { self }
    }

    enum Assistance: String, CaseIterable, Identifiable {
        case intoxicatedPerson = "Intoxicated person"
        case injuredPerson = "Injured person"
        case theft
        case directions
        case escortService
        case other
        var id: Self { self }
    }
    
    enum Observation: String, CaseIterable, Identifiable {
        case theft
        case possiblePirateTaxi = "Possible pirate taxi"
        case physicalViolence = "Physical violence"
        case arguing
        case intoxication
        case accumulation
        case vandalism
        case ok = "All OK/other"
        var id: Self { self }
    }

    var body: some View {
        ScrollView {
            HeaderView(title: "New report", description: "Type in details about the event")
            
            Group {
                            
                VStack {
                    Text("Gender")
                        .font(.system(size: 22))
                    Text("Select gender of person")
                        .font(.system(size: 16))
                    Picker("Gender", selection: $currentGender){
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                        Text("Other").tag(Gender.other) // relevant?
                    }
                    .padding()
                    .pickerStyle(.segmented)
                    .fixedSize()
                }
                
                Divider()
                    .padding(.top, 30)
                
                VStack {
                    // age of person
                   NumberInputView(title: "Age of person",  value: $currentAge)
                   
                    // number of people involved
                   NumberInputView(title: "Number of people",  value: $currentNumberOfPeople)
                }
                .padding()
            }
            
            Group {
                // menu picker: assistance
                Divider()
                    .padding()
                
                VStack {
                    // type of assistance
                    Text("Assistance")
                        .bold()
                        .offset(y: 40)
                    
                    Form {
                        Picker("Select type ", selection: $currentAssistance) {
                            ForEach(Assistance.allCases, id: \.rawValue) { item in
                                Text(item.rawValue.capitalized).tag(item)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .pickerStyle(.menu)
                    }
                    .frame(height: 130)
                    .scrollContentBackground(.hidden) // remove form default color
                    
                    // type of observation
                    Text("Observation")
                        .bold()
                        .offset(y: 40)
                    Form {
                        Picker("Select type ", selection: $currentObservation) {
                            ForEach(Observation.allCases, id: \.rawValue) { item in
                                Text(item.rawValue.capitalized).tag(item)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(8)
                        .pickerStyle(.menu)
                    }
                    .frame(height: 130)
                    .scrollContentBackground(.hidden) // remove form default color
                }
            }
            
            // description of characteristics
            TextEditorView(title: "Characteristics", description: "Describe person with a few words ", textInput: $currentCharacteristics)
            
            // description of event
            TextEditorView(title: "Description of event", description: "Describe the event with a few words", textInput: $currentDescriptionEvent)
            
            // textfield input
            HStack {
                Text("Name of logger")
                    .font(.system(size: 21))
                TextField("" , text: $currentLogger)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(8)
                    .padding()
                    
            }
            .frame(width: 300, height: 15)
            .padding()
            
            Divider()
                .padding()
   
            Button("Send report", action: {
                vm.sendToDatabase(Report(logger: currentLogger, age: currentAge, gender: currentGender.rawValue, assistance: currentAssistance.rawValue, charactheristics: currentCharacteristics, description: currentDescriptionEvent, numberOfPeople: currentNumberOfPeople, observation: currentObservation.rawValue))
            })
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .offset(y: -70)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
