//
//  ImageLoader.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-22.
//

import UIKit

final class ImageLoader {

    private let loadedImages = NSCache<NSURL, UIImage>()
    private var runningRequests = NSCache<NSString, URLSessionDataTask>()

    func loadImage(_ url: URL, completion: @escaping (Swift.Result<UIImage, Error>) -> Void) -> UUID? {

        if let image = loadedImages.object(forKey: url as NSURL) {
            completion(.success(image))
            return nil
        }

        let uuid = UUID()

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            defer { self.runningRequests.removeObject(forKey: NSString(string: uuid.uuidString)) }

            if let data = data, let image = UIImage(data: data) {
                self.loadedImages.setObject(image, forKey: url as NSURL)
                completion(.success(image))
                return
            }
            guard let error = error else { return }
            completion(.failure(error))
        }

        task.resume()

        runningRequests.setObject(task, forKey: NSString(string: uuid.uuidString))
        return uuid
    }

    func cancelRequest(uuid: UUID) {
        runningRequests.object(forKey: NSString(string: uuid.uuidString))?.cancel()
        runningRequests.removeObject(forKey: NSString(string: uuid.uuidString))
    }
}
