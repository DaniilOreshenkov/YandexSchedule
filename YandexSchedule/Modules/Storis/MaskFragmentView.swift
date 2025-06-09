import SwiftUI

struct MaskFragmentView: View {
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 6)
            .fixedSize(horizontal: false, vertical: true)
            .frame(height: 6)
            .foregroundStyle(Color.whiteYP)
    }
}

#Preview {
    Color.blueYP
        .ignoresSafeArea(edges: .all)
        .overlay(
            MaskFragmentView()
                .padding()
        )
}
