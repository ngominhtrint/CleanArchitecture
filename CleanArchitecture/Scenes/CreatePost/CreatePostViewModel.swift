//
//  CreatePostViewModel.swift
//  CleanArchitecture
//
//  Created by TriNgo on 1/8/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

final class CreatePostViewModel: ViewModelType {
    private let createPostUseCase: PostsUseCase
    private let navigator: CreatePostNavigator
    
    init(createPostUseCase: PostsUseCase, navigator: CreatePostNavigator) {
        self.createPostUseCase = createPostUseCase
        self.navigator = navigator
    }
    
    func transform(input: CreatePostViewModel.Input) -> CreatePostViewModel.Output {
        let titleAndDetails = Driver.combineLatest(input.title, input.details)
        let activityIndicator = ActivityIndicator()
        
        let canSave = Driver.combineLatest(titleAndDetails, activityIndicator.asDriver()) {
            return !$0.0.isEmpty && !$0.1.isEmpty && !$1
        }
        
        let save = input.saveTrigger.withLatestFrom(titleAndDetails)
            .map { (title, content) in
                return Post.init(body: content, title: title)
            }
            .flatMapLatest { [unowned self] in
                return self.createPostUseCase.save(post: $0)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
        }
        
        let dismiss = Driver.of(save, input.cancelTrigger)
            .merge()
            .do(onNext: navigator.toPosts)
        
        return Output.init(dismiss: dismiss, saveEnabled: canSave)
    }
}

extension CreatePostViewModel {
    struct Input {
        let cancelTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
        let title: Driver<String>
        let details: Driver<String>
    }
    
    struct Output {
        let dismiss: Driver<Void>
        let saveEnabled: Driver<Bool>
    }
}
