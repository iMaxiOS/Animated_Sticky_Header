//
//  HeaderView.swift
//  Animated_Sticky_Header
//
//  Created by Maxim Granchenko on 10.01.2021.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var homeModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 40, height: 40)
                    .foregroundColor(.primary)
                
                Text("The best restaurant")
                    .font(.title)
                    .bold()
            }
            ZStack {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Asiatisch . Koreanisch . Japnisch")
                        .font(.caption)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.caption)
                        
                        Text("30 - 40 min")
                            .font(.caption)
                        
                        Text("4.6")
                            .font(.caption)
                        
                        Image(systemName: "star.fill")
                            .font(.caption)
                        
                        Text("$6.40 Free")
                            .font(.caption)
                            .padding(.horizontal, 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                })
            }
            .frame(height: 60)
                        
            if homeModel.offset > 250 {
                Divider()
            }
        }
        .padding(.horizontal)
        .frame(height: 100)
        .background(Color(.systemBackground))
    }
    
    func getSize() -> CGFloat {
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
