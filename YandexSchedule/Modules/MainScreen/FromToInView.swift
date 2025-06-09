import SwiftUI

struct FromToInView: View {
    @StateObject private var viewModel = TravelViewModel()
    @StateObject private var modelData = StoriesModelData.shared
    @Binding var isTabBarHidden: Bool
    
    @State private var selectedStory: Story = Story(small: .preview1, title: "", isViewed: false, story: [])
    
    @State private var selectedItem: Int = 0
    @State private var isStoriesShown: Bool = false
    
    private var isStoryViewed: Binding<Bool> {
        Binding<Bool> (
            get: {
                let storyIndex = modelData.stories.firstIndex(where: { selectedStory == $0 })
                return modelData.stories[storyIndex ?? 0].isViewed
            },
            set: {
                let storyIndex = modelData.stories.firstIndex(where: { selectedStory == $0 })
                modelData.stories[storyIndex ?? 0].isViewed = $0
            }
        )
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.fixed(140))], alignment: .top, spacing: 20) {
                        ForEach(modelData.stories) { imageItem in
                            Button {
                                self.selectedStory = imageItem
                                self.selectedItem = modelData.stories.firstIndex(where: { selectedStory == $0 }) ?? 0
                                isStoriesShown = true
                                isTabBarHidden = true
                            } label: {
                                PreviewCellView(titlePreView: imageItem.title, storyPreview: imageItem.small, isViewed: imageItem.isViewed)
                            }
                        }
                    }
                    .padding(.vertical, 24)
                    .frame(height: 188)
                }
                .padding(.leading, 16)
                
                HStack(spacing: 16) {
                    VStack(spacing: 0) {
                        Button {
                            isTabBarHidden = true
                            viewModel.isOrigin = true
                            viewModel.navigationPath.append(1)
                        } label: {
                            CitySelectionView(
                                city: viewModel.originCity,
                                placeholder: "Откуда",
                                viewModel: viewModel
                            )
                        }
                        
                        Button {
                            isTabBarHidden = true
                            viewModel.isOrigin = false
                            viewModel.navigationPath.append(1)
                        } label: {
                            CitySelectionView(
                                city: viewModel.destinationCity,
                                placeholder: "Куда",
                                viewModel: viewModel
                            )
                        }
                    }
                    .background(.whiteYP)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .navigationDestination(for: Int.self) { tag in
                        switch tag {
                        case 1:
                            CitiesListView(viewModel: viewModel)
                        case 2:
                            StationsListView(
                                viewModel: viewModel)
                        case 3:
                            ScheduleListView(
                                viewModel: viewModel,
                                isTabBarHidden: $isTabBarHidden,
                                from: viewModel.originCity,
                                to: viewModel.destinationCity
                            )
                        case 4:
                            CarrierInfoView()
                        case 5:
                            FilterView()
                        default:
                            Text("Неизвестный экран")
                        }
                    }
                    
                    swapCitiesButton
                }
                .padding()
                .background(Color.blueYP)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            
            if viewModel.isSearchButtonVisible {
                Button(action: {
                    viewModel.navigationPath.append(3)
                    isTabBarHidden = true
                }) {
                    Text("Найти")
                        .font(.system(size: 17, weight: .bold))
                        .background(Color.blueYP)
                        .foregroundColor(Color.whiteYP)
                        .frame(width: 150, height: 60)
                }
                .background(Color.blueYP)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()
            
        }
        .fullScreenCover(isPresented: $isStoriesShown, onDismiss: { isTabBarHidden = false }) {
            ContentStoryView(stories: modelData.stories, indexStory: selectedItem, isPresented: $isStoriesShown, isViewed: isStoryViewed)
        }
        .onChange(of: viewModel.navigationPath) { oldValue, newValue in
            if newValue.count == 0 {
                isTabBarHidden = false
            }
        }
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: ErrorModel
}

private extension FromToInView {
    var swapCitiesButton: some View {
        Button(action: {
            viewModel.swapCities()
        }, label: {
            ZStack {
                Circle()
                    .foregroundColor(Color.whiteYP)
                Image(systemName: "arrow.2.squarepath")
                    .foregroundStyle(.blueYP)
            }
        })
        .frame(width: 36, height: 36)
    }
}

#Preview {
    FromToInView(isTabBarHidden: .constant(true))
}
