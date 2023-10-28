import Foundation

struct ImageCollectionData {
    let image: String
    var isLiked: Bool
    
    init(image: String, isLiked: Bool) {
        self.image = image
        self.isLiked = isLiked
    }
}

var imageCollectionList: [ImageCollectionData] = [.init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: false),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: true),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: true),
                                                  .init(image: "image6", isLiked: true),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: false),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: true),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: false),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: false),
                                                  .init(image: "image8", isLiked: false),
                                                  .init(image: "image1", isLiked: true),
                                                  .init(image: "image2", isLiked: false),
                                                  .init(image: "image3", isLiked: false),
                                                  .init(image: "image4", isLiked: true),
                                                  .init(image: "image5", isLiked: false),
                                                  .init(image: "image6", isLiked: false),
                                                  .init(image: "image7", isLiked: true),
                                                  .init(image: "image8", isLiked: true)]
