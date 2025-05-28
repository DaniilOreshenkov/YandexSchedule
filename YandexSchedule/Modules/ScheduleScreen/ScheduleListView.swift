import SwiftUI

struct ScheduleListView: View {
    @StateObject var viewModel: TravelViewModel
    @Binding var isTabBarHidden: Bool
    @State var goToFilterList: Bool = false
    @State var carriers = R.Mock.carriers
    
    let from: String
    let to: String
    
    var body: some View {
        VStack {
            Text(from + " -> " + to)
                .font(.system(size: 24, weight: .bold))
                .lineLimit(nil)
            
            ZStack(alignment: .bottom) {
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(carriers) { carrier in
                            Button {
                                viewModel.navigationPath.append(4)
                            } label: {
                                CarrierCellView(carrierInfo: carrier)
                            }

//                            NavigationLink(destination: CarrierInfoView()) {
//                                CarrierCellView(carrierInfo: carrier)
//                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, 100)
                }
                
                
                Button{
                    viewModel.navigationPath.append(5)
                    isTabBarHidden = true
                } label: {
                    Text("Уточнить время")
                        .foregroundColor(.whiteYP)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 343, height: 60)
                        .background(.blueYP)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding(.bottom, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .padding(.horizontal, 16)
    }
}

#Preview {
    ScheduleListView(viewModel: TravelViewModel(), isTabBarHidden: .constant(true), carriers: R.Mock.carriers, from: "1", to: "2")
}
