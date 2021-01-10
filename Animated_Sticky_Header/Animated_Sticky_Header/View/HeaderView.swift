//
//  HeaderView.swift
//  Animated_Sticky_Header
//
//  Created by Maxim Granchenko on 10.01.2021.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeData : HomeViewModel
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("The Restaurant Bakery")
                .font(.title)
                .fontWeight(.bold)
            
            ZStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Asiatisch . Koreanisch . Japnisch")
                        .font(.caption)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30-40 Min")
                            .font(.caption)
                        
                        Text("4.3")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        Text("$6.40 Fee")
                            .font(.caption)
                            .padding(.leading,10)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                })
            }
            .frame(height: 60)
            
            if homeData.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(scheme == .dark ? Color.black : Color.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
