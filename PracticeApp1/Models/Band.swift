//
//  Band.swift
//  PracticeApp1
//
//  Created by Vineal Viji Varghese on 01/03/21.
//

import Foundation

class BandArray : Decodable {
    var bandArr : [Band]
}

class Band : Decodable, Identifiable {
    var bandImage: [String]?
    var bandText: String?
    var imageHeight,imageWidth: Float?
}
