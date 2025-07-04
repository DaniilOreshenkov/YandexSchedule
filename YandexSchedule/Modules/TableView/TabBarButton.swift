import SwiftUI

struct TabBarButton: View {
    let icon: ImageResource
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(icon)
                    .renderingMode(.template)
                    .foregroundColor(isSelected ? .blackDynamic : .grayYP)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, 26)
    }
}

