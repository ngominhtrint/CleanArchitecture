//
//  AlbumsNetwork.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain
import RxSwift

public final class AlbumsNetwork {
    private let network: Network<Album>
    
    init(network: Network<Album>) {
        self.network = network
    }
    
    public func fetchAlbums() -> Observable<[Album]> {
        return network.getItems("albums")
    }
    
    public func fetchAlbum(albumId: String) -> Observable<Album> {
        return network.getItem("albums", itemId: albumId)
    }
}
