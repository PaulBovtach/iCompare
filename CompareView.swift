//
//  CompareView.swift
//  iCompare
//
//  Created by Павло on 12.11.2022.
//

import SwiftUI


class Devices: ObservableObject{
    @Published  var selectedDevice1 = iPhone.currentiPhone
    @Published  var selectedDevice2 = iPhone.sampleiPhone
}

struct CompareView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var device: Devices
    var iPhones: [iPhone] = iPhone.allIphones
    let columns = [
        GridItem(.adaptive(minimum: 200, maximum: 250)),
        GridItem(.adaptive(minimum: 200, maximum: 250))
    ]
    
    @State private var isDevice1ViewPresented = false
    @State private var isDevice2ViewPresented = false
    
    
    
    var body: some View {
        ZStack(alignment: .top){
            ScrollView{
                
                //Platform
                ZStack(alignment: .topLeading) {
                    CustomColor.myColor
                    Text("Platform")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Year")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.platform.year)
                                    .font(.headline)
                            }
                            Group{
                                Text("First OS")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text(device.selectedDevice1.platform.firstIOS)
                                    .font(.headline)
                            }
                            Group{
                                Text("Latest OS")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text(device.selectedDevice1.platform.latestIOS)
                                    .font(.headline)
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none" {
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Year")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.platform.year)
                                        .font(.headline)
                                }
                                Group{
                                    Text("First OS")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text(device.selectedDevice2.platform.firstIOS)
                                        .font(.headline)
                                }
                                Group{
                                    Text("Latest OS")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text(device.selectedDevice2.platform.latestIOS)
                                        .font(.headline)
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                    
                }
                
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .padding(.top, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Body
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Body")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Dimensions")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                
                                ForEach(0..<device.selectedDevice1.body.dimensions.count, id: \.self) { index in
                                    Text(device.selectedDevice1.body.dimensions[index])
                                        .font(.headline)
                                    
                                    
                                }
                                
                            }
                            Group{
                                Text("Weight")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.body.weight.count, id: \.self) { index in
                                    Text(device.selectedDevice1.body.weight[index])
                                        .font(.headline)
                                }
                                
                            }
                            Group{
                                Text("SIM")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.body.sim.count, id: \.self) { index in
                                    Text(device.selectedDevice1.body.sim[index])
                                        .font(.headline)
                                }
                                
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else {
                            VStack(alignment: .leading){
                                Group{
                                    Text("Dimensions")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.body.dimensions.count, id: \.self) { index in
                                        Text(device.selectedDevice2.body.dimensions[index])
                                            .font(.headline)
                                        
                                    }
                                    
                                }
                                Group{
                                    Text("Weight")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.body.weight.count, id: \.self) { index in
                                        Text(device.selectedDevice2.body.weight[index])
                                            .font(.headline)
                                    }
                                    
                                }
                                Group{
                                    Text("SIM")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.body.sim.count, id: \.self) { index in
                                        Text(device.selectedDevice2.body.sim[index])
                                            .font(.headline)
                                    }
                                    
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Display
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Display")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.display.type)
                                    .font(.headline)
                            }
                            Group{
                                Text("Size")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text("\(String(format: "%.1f", ceil(device.selectedDevice1.display.size*100)/100))\"")
                                    .font(.headline)
                                
                            }
                            Group{
                                Text("PPI")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text(String(device.selectedDevice1.display.ppi))
                                    .font(.headline)
                                
                            }
                            
                            Group{
                                Text("Scale")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text("\(String(device.selectedDevice1.display.scale))x")
                                    .font(.headline)
                                
                            }
                            
                            Group{
                                Text("Resolution")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                Text(String(device.selectedDevice1.display.resolution))
                                    .font(.headline)
                                
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.display.type)
                                        .font(.headline)
                                }
                                Group{
                                    Text("Size")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text("\(String(format: "%.1f", ceil(device.selectedDevice2.display.size*100)/100))\"")
                                        .font(.headline)
                                    
                                }
                                Group{
                                    Text("PPI")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text(String(device.selectedDevice2.display.ppi))
                                        .font(.headline)
                                    
                                }
                                
                                Group{
                                    Text("Scale")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text("\(String(device.selectedDevice2.display.scale))x")
                                        .font(.headline)
                                    
                                }
                                
                                Group{
                                    Text("Resolution")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    Text(String(device.selectedDevice2.display.resolution))
                                        .font(.headline)
                                    
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //RearCamera
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Rear Camera")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.rearCamera.type.count, id: \.self) { index in
                                    Text(device.selectedDevice1.rearCamera.type[index])
                                        .font(.headline)
                                }
                            }
                            Group{
                                Text("Video")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.rearCamera.video.count, id: \.self) { index in
                                    Text(device.selectedDevice1.rearCamera.video[index])
                                        .font(.headline)
                                }
                                
                            }
                            Group{
                                Text("Features")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.rearCamera.features.count, id: \.self) { index in
                                    Text(device.selectedDevice1.rearCamera.features[index])
                                        .font(.headline)
                                }
                                
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.rearCamera.type.count, id: \.self) { index in
                                        Text(device.selectedDevice2.rearCamera.type[index])
                                            .font(.headline)
                                    }
                                }
                                Group{
                                    Text("Video")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.rearCamera.video.count, id: \.self) { index in
                                        Text(device.selectedDevice2.rearCamera.video[index])
                                            .font(.headline)
                                    }
                                    
                                }
                                Group{
                                    Text("Features")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.rearCamera.features.count, id: \.self) { index in
                                        Text(device.selectedDevice2.rearCamera.features[index])
                                            .font(.headline)
                                    }
                                    
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Front Camera
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Front Camera")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.frontCamera.type.count, id: \.self) { index in
                                    Text(device.selectedDevice1.frontCamera.type[index])
                                        .font(.headline)
                                }
                            }
                            Group{
                                Text("Video")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.frontCamera.video.count, id: \.self) { index in
                                    Text(device.selectedDevice1.frontCamera.video[index])
                                        .font(.headline)
                                }
                                
                            }
                            Group{
                                Text("Features")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                    .padding(.top, 1)
                                ForEach(0..<device.selectedDevice1.frontCamera.features.count, id: \.self) { index in
                                    Text(device.selectedDevice1.frontCamera.features[index])
                                        .font(.headline)
                                }
                                
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.frontCamera.type.count, id: \.self) { index in
                                        Text(device.selectedDevice2.frontCamera.type[index])
                                            .font(.headline)
                                    }
                                }
                                Group{
                                    Text("Video")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.frontCamera.video.count, id: \.self) { index in
                                        Text(device.selectedDevice2.frontCamera.video[index])
                                            .font(.headline)
                                    }
                                    
                                }
                                Group{
                                    Text("Features")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                        .padding(.top, 1)
                                    ForEach(0..<device.selectedDevice2.frontCamera.features.count, id: \.self) { index in
                                        Text(device.selectedDevice2.frontCamera.features[index])
                                            .font(.headline)
                                    }
                                    
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Storage
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Storage")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Options")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.storage.count, id: \.self) { index in
                                    Text(device.selectedDevice1.storage[index])
                                        .font(.headline)
                                }
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Options")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.storage.count, id: \.self) { index in
                                        Text(device.selectedDevice2.storage[index])
                                            .font(.headline)
                                    }
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Battery
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Battery")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.battery.type)
                                    .font(.headline)
                            }
                            
                            Group{
                                Text("Capacity")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.battery.capacity)
                                    .font(.headline)
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.battery.type)
                                        .font(.headline)
                                }
                                
                                Group{
                                    Text("Capacity")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.battery.capacity)
                                        .font(.headline)
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Authentication
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Authentication")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.authentication.type)
                                    .font(.headline)
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.authentication.type)
                                        .font(.headline)
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Processor
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Processor")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Chipset")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.processor.chipset)
                                    .font(.headline)
                            }
                            Group{
                                Text("Architecture")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.processor.architecture)
                                    .font(.headline)
                            }
                            Group{
                                Text("Microarchitecture")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.processor.microarchitecture.count, id: \.self) { index in
                                    Text(device.selectedDevice1.processor.microarchitecture[index])
                                        .font(.headline)
                                }
                            }
                            Group{
                                Text("Cores")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text("\(String(device.selectedDevice1.processor.cores))")
                                    .font(.headline)
                            }
                            Group{
                                Text("Bit")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text("\(String(device.selectedDevice1.processor.bit))")
                                    .font(.headline)
                            }
                            Group{
                                Text("Clock")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text("\(String(device.selectedDevice1.processor.clock))")
                                    .font(.headline)
                            }
                            Group{
                                Text("Cache")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.processor.cache.count, id: \.self) { index in
                                    Text(device.selectedDevice1.processor.cache[index])
                                        .font(.headline)
                                }
                            }
                            Group{
                                Text("GPU")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text("\(String(device.selectedDevice1.processor.gpu))")
                                    .font(.headline)
                            }
                            
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Chipset")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.processor.chipset)
                                        .font(.headline)
                                }
                                Group{
                                    Text("Architecture")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.processor.architecture)
                                        .font(.headline)
                                }
                                Group{
                                    Text("Microarchitecture")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.processor.microarchitecture.count, id: \.self) { index in
                                        Text(device.selectedDevice2.processor.microarchitecture[index])
                                            .font(.headline)
                                    }
                                }
                                Group{
                                    Text("Cores")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text("\(String(device.selectedDevice2.processor.cores))")
                                        .font(.headline)
                                }
                                Group{
                                    Text("Bit")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text("\(String(device.selectedDevice2.processor.bit))")
                                        .font(.headline)
                                }
                                Group{
                                    Text("Clock")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text("\(String(device.selectedDevice2.processor.clock))")
                                        .font(.headline)
                                }
                                Group{
                                    Text("Cache")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.processor.cache.count, id: \.self) { index in
                                        Text(device.selectedDevice2.processor.cache[index])
                                            .font(.headline)
                                    }
                                }
                                Group{
                                    Text("GPU")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text("\(String(device.selectedDevice2.processor.gpu))")
                                        .font(.headline)
                                }
                                
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
                //Memory
                ZStack(alignment: .topLeading){
                    CustomColor.myColor
                    Text("Memory")
                        .font(.title)
                        .padding(.leading, 15)
                        .padding(.top, 5)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    LazyVGrid(columns: columns, alignment: .leading, spacing: 20){
                        //Device1
                        VStack(alignment: .leading){
                            Group{
                                Text("Size")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                ForEach(0..<device.selectedDevice1.memory.size.count, id: \.self) { index in
                                    Text(device.selectedDevice1.memory.size[index])
                                        .font(.headline)
                                }
                            }
                            Group{
                                Text("Type")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                                Text(device.selectedDevice1.memory.type)
                                    .font(.headline)
                            }
                        }
                        .padding(.leading, 15)
                        .padding(.top, 50)
                        .padding(.bottom, 15)
                        
                        //Device2
                        if device.selectedDevice2.model == "none"{
                            //
                        }else{
                            VStack(alignment: .leading){
                                Group{
                                    Text("Size")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    ForEach(0..<device.selectedDevice2.memory.size.count, id: \.self) { index in
                                        Text(device.selectedDevice2.memory.size[index])
                                            .font(.headline)
                                    }
                                }
                                Group{
                                    Text("Type")
                                        .foregroundColor(.gray)
                                        .font(.callout)
                                    Text(device.selectedDevice2.memory.type)
                                        .font(.headline)
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.leading, 6)
                .padding(.trailing, 6)
                .shadow(radius: 8, x: 8, y: 5)
                
            }
            .padding(.top, 55)
            
            HStack{
                
                
                if device.selectedDevice1.model == "iPhone SE (1st generation)"{
                    Button("iPhone SE"){
                        isDevice1ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                    
                }else if device.selectedDevice1.model == "iPhone SE (2nd generation)"{
                    Button("iPhone SE (2nd)"){
                        isDevice1ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }
                else if device.selectedDevice1.model == "iPhone SE (3rd generation)"{
                    Button("iPhone SE (3rd)"){
                        isDevice1ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }else{
                    Button(device.selectedDevice1.model){
                        isDevice1ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }
                
                
                Divider()
                    .padding(.top)
                    .padding(.bottom)
                
                if device.selectedDevice2.model == "none" {
                    Button("Select a model"){
                        isDevice2ViewPresented = true
                    }
                    .frame(width: 180)
                    .font(.caption)
                }
                
                else if device.selectedDevice2.model == "iPhone SE (1st generation)"{
                    Button("iPhone SE"){
                        isDevice2ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }else if device.selectedDevice2.model == "iPhone SE (2nd generation)"{
                    Button("iPhone SE (2nd)"){
                        isDevice2ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }
                else if device.selectedDevice2.model == "iPhone SE (3rd generation)"{
                    Button("iPhone SE (3rd)"){
                        isDevice2ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }else{
                    Button(device.selectedDevice2.model){
                        isDevice2ViewPresented = true
                    }
                    .frame(width: 180)
                    .fontWeight(.bold)
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .center
            )
            .frame(height: 47)
            .background(CustomColor.myColor)
            .cornerRadius(25)
            .shadow(radius: 8, x: 5, y: 5)
        }
        .padding(.trailing, 4)
        .padding(.leading, 4)
        
        .sheet(isPresented: $isDevice1ViewPresented, content: {
            Device1View().environmentObject(device)
        })
        .sheet(isPresented: $isDevice2ViewPresented, content: {
            Device2View().environmentObject(device)
        })
        
        
        
    }
    
}


struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView().environmentObject(Devices())
    }
}
