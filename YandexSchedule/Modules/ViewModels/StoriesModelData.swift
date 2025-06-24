import Foundation

final class StoriesModelData: ObservableObject {
    static var shared = StoriesModelData()
    
    private init () {}
    
    @Published var stories: [Story] = [
        Story(small: .preview1,
              title: """
                    Text, Text, Text, 
                    Text, Text, Text.
                    """,
              isViewed: false,
              story: [ContentStory(big: .big11,
                                   title: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big12,
                                   title: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big13,
                                   title: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """)]),
        Story(small: .preview2,
              title: """
                    Text, Text, Text, 
                    Text, Text, Text.
                    """,
              isViewed: false,
              story: [ContentStory(big: .big21,
                                   title:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big22,
                                   title: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big23,
                                   title:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """)]),
        Story(small: .preview3,
              title:  """
                      Text, Text, Text, 
                      Text, Text, Text.
                      """,
              isViewed: false,
              story: [ContentStory(big: .big31,
                                   title: """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big32,
                                   title:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """),
                      ContentStory(big: .big33,
                                   title:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """,
                                   description:  """
                                         Text, Text, Text, 
                                         Text, Text, Text.
                                         """)])
    ]
}
