//
//  Device1View.swift
//  iCompare
//
//  Created by Павло on 15.11.2022.
//

import SwiftUI

struct Device1View: View {
    var iPhones: [iPhone] = iPhone.allIphones
    @EnvironmentObject var device: Devices
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            Form{
                Button{
                    dismiss()
                }label: {
                    Text("Cancel")
                        .bold()
                }

                ForEach(iPhones, id: \.self){phone in
                    if phone.model == "none"{}else{
                        Button(phone.model){
                            device.selectedDevice1 = phone
                            dismiss()
                        }
                    }
                    
                }
                
            }
            .navigationTitle("Select model")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct Device1View_Previews: PreviewProvider {
    static var previews: some View {
        Device1View().environmentObject(Devices())
    }
}
    
