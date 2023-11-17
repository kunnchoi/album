//
//  APIServerAPIError.swift
//  Album
//
//  Created by Andrew Choi on 11/15/23.
//

import Foundation

enum ServerAPIError: Error {
    case urlError, requestError, decodingError, statusNotOK
}
