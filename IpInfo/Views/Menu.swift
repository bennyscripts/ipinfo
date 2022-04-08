import SwiftUI

struct MenuView: View {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var showData: Bool = false
    @State private var ipText: String = ""
    @State private var ip: IP?
    
    var body: some View {
        VStack {
            HStack {
                TextField("IP Address...", text: $ipText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Lookup", action: {
                    IPApi().getInfo(ipAddress: ipText) {response in
                        if let response = response {
                            self.showData = true
                            self.ip = response
                            self.ipText = response.ip
                        }
                    }
                })
            }
            
            Divider()
                .padding(.bottom, 0)
                .padding(.top, 10)
                .padding(.horizontal)
                .frame(width: 380.0)
            
            if showData {
                ScrollView {
                    Section {
                        Cell(leading: "Country", trailing: "\(self.ip!.country_name) (\(self.ip!.country))")
                        Cell(leading: "City", trailing: self.ip!.city)
                        Cell(leading: "Region", trailing: "\(self.ip!.region) (\(self.ip!.region_code))")
                        Cell(leading: "Postal", trailing: self.ip!.postal)
                        Cell(leading: "Latitude", trailing: String(self.ip!.latitude))
                        Cell(leading: "Longitude", trailing: String(self.ip!.longitude))
                    }.insetGroupedStyle(header: "Location")
                    
                    Section {
                        Cell(leading: "Organisation", trailing: self.ip!.org)
                        Cell(leading: "ASN", trailing: self.ip!.asn)
                        Cell(leading: "Timezone", trailing: self.ip!.timezone)
                    }.insetGroupedStyle(header: "Other")
                }
            } else {
                ScrollView {
                    Section {
                        Cell(leading: "Lookup an IP address to see information show up here...", trailing: "")
                    }.insetGroupedStyle(header: "IP Info")
                }
            }
            
            Divider()
                .padding(.bottom, 10)
                .padding(.top, 10)
                .padding(.horizontal)
                .frame(width: 380.0)
            
            HStack {
                if showData {
                    Button("Reset", action: {
                        self.showData = false
                        self.ipText = ""
                    })
                    
                    Button("Copy", action: {
                        let copyText = """
Location
--------
- Country: \(self.ip!.country)
- City: \(self.ip!.city)
- Region: \(self.ip!.region)
- Postal: \(self.ip!.postal)
- Latitude: \(self.ip!.latitude)
- Longitude: \(self.ip!.longitude)

Other
-----
- Organisation: \(self.ip!.org)
- ASN: \(self.ip!.asn)
- Timezone: \(self.ip!.timezone)
"""
                        
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(copyText, forType: .string)
                    })
                }
                
                Spacer()
                Button("Quit", action: appDelegate.quitApp)
            }
        }
        .padding()
        .frame(width: 380, height: 480, alignment: .top)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct Cell: View {
    var leading: String
    var trailing: String
    
    var body: some View {
        HStack {
            Text(leading)
            Spacer()
            Text(trailing).foregroundColor(.secondary)
        }
        .padding(.vertical, -5)
    }
}

extension View {
    func insetGroupedStyle(header: String) -> some View {
        return GroupBox(label: Text(header.uppercased()).font(.headline).padding(.top).padding(.bottom, 6)) {
            VStack() {
                self.padding(.vertical, 3)
            }.padding(.horizontal).padding(.vertical)
        }
    }
}
