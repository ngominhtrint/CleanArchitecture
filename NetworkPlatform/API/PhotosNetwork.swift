//
//  PhotosNetwork.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain
import RxSwift

public final class PhotosNetwork {
    private let network: Network<Photo>
    
    init(network: Network<Photo>) {
        self.network = network
    }
    
    public func fetchPhotos() -> Observable<[Photo]> {
        return network.getItems("photos")
    }
    
    public func fetchPhoto(photoId: String) -> Observable<Photo> {
        return network.getItem("photos", itemId: photoId)
    }
}

