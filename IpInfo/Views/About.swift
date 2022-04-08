import SwiftUI

struct AboutView: View {
    @Environment(\.openURL) var openURL
    @State private var appDelegate = AppDelegate()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("IP Info")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding([.horizontal, .top])
                    .font(.system(size: 18))
                
                Text("Version \(appDelegate.version)")
                    .padding([.horizontal])
                    .font(.system(size: 12))
                
                Text("A Mac os menu bar app to geo locate an IP address.")
                    .padding([.horizontal, .top])
                
                Text("Created by Ben Tettmar")
                    .padding([.horizontal])
                
                Divider()
                    .padding(.vertical, 10.0)
                    .padding(.horizontal)
                    .frame(width: 350.0)
                
                HStack {
                    Button(action: {openURL(URL(string: "https://github.com/bentettmar")!)}) {
                        Text("Github")
                    }
                }
                .padding([.leading, .bottom, .trailing])
            }
        }
        .frame(width: 350, height: 185, alignment: .topLeading)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
