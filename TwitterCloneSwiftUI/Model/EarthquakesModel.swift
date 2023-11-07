//
//  EarthquakesModel.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import Foundation

// MARK: - Welcome
public struct EarthquakesModel: Codable {
    let type: String
    let metadata: Metadata
    public let features: [Feature]
    let bbox: [Double]
}

// MARK: - Feature
public struct Feature: Codable, Identifiable {
    let type: FeatureType
    let properties: Properties?
    let geometry: Geometry?
    public let id: String
}

// MARK: - Geometry
public struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]?
}

public enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties
public struct Properties: Codable {
    let mag: Double
    let place: String
    let time, updated: Int
    let tz: JSONNull?
    let url, detail: String
    let felt: Int?
    let cdi, mmi: Double?
    let alert: String?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids, sources, types: String
    let nst: Int?
    let dmin: Double?
    let rms: Double
    let gap: Double?
    let magType: MagType
    let type: PropertiesType
    let title: String
}

public enum MagType: String, Codable {
    case mb = "mb"
    case mbLg = "mb_lg"
    case md = "md"
    case ml = "ml"
    case mwr = "mwr"
    case mww = "mww"
}

public enum Net: String, Codable {
    case ak = "ak"
    case av = "av"
    case ci = "ci"
    case hv = "hv"
    case mb = "mb"
    case nc = "nc"
    case nm = "nm"
    case nn = "nn"
    case ok = "ok"
    case pr = "pr"
    case se = "se"
    case us = "us"
    case uu = "uu"
    case uw = "uw"
}

public enum Status: String, Codable {
    case automatic = "automatic"
    case reviewed = "reviewed"
}

public enum PropertiesType: String, Codable {
    case earthquake = "earthquake"
    case iceQuake = "ice quake"
}

public enum FeatureType: String, Codable {
    case feature = "Feature"
}

// MARK: - Metadata
public struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


//public struct EarthquakesModel: Codable {
//
//  var type     : String?     = nil
//  var metadata : Metadata?   = Metadata()
//  var features : [Feature]? = []
//  var bbox     : [Double]?   = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case type     = "type"
//    case metadata = "metadata"
//    case features = "features"
//    case bbox     = "bbox"
//  
//  }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        type     = try values.decodeIfPresent(String.self     , forKey: .type     )
//        metadata = try values.decodeIfPresent(Metadata.self   , forKey: .metadata )
//        features = try values.decodeIfPresent([Feature].self , forKey: .features )
//        bbox     = try values.decodeIfPresent([Double].self   , forKey: .bbox     )
//  }
//
//  init() {
//
//  }
//
//}
//
//public struct Feature: Codable, Identifiable {
//
//  var type       : String?     = nil
//  var properties : Properties? = Properties()
//  var geometry   : Geometry?   = Geometry()
//  public var id         : String?     = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case type       = "type"
//    case properties = "properties"
//    case geometry   = "geometry"
//    case id         = "id"
//  
//  }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        type       = try values.decodeIfPresent(String.self     , forKey: .type       )
//        properties = try values.decodeIfPresent(Properties.self , forKey: .properties )
//        geometry   = try values.decodeIfPresent(Geometry.self   , forKey: .geometry   )
//        id         = try values.decodeIfPresent(String.self     , forKey: .id         )
// 
//  }
//
//  init() {
//  }
//}
//
//
//public struct Geometry: Codable {
//
//  var type        : String?   = nil
//  var coordinates : [Double]? = []
//
//  enum CodingKeys: String, CodingKey {
//
//    case type        = "type"
//    case coordinates = "coordinates"
//  
//  }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        type        = try values.decodeIfPresent(String.self   , forKey: .type        )
//        coordinates = try values.decodeIfPresent([Double].self , forKey: .coordinates )
// 
//  }
//
//  init() {
//
//  }
//
//}
//
//public struct Metadata: Codable {
//
//  var generated : Int?    = nil
//  var url       : String? = nil
//  var title     : String? = nil
//  var status    : Int?    = nil
//  var api       : String? = nil
//  var count     : Int?    = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case generated = "generated"
//    case url       = "url"
//    case title     = "title"
//    case status    = "status"
//    case api       = "api"
//    case count     = "count"
//  
//  }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        generated = try values.decodeIfPresent(Int.self    , forKey: .generated )
//        url       = try values.decodeIfPresent(String.self , forKey: .url       )
//        title     = try values.decodeIfPresent(String.self , forKey: .title     )
//        status    = try values.decodeIfPresent(Int.self    , forKey: .status    )
//        api       = try values.decodeIfPresent(String.self , forKey: .api       )
//        count     = try values.decodeIfPresent(Int.self    , forKey: .count     )
// 
//  }
//
//  init() {
//
//  }
//
//}
//
//public struct Properties: Codable {
//
//  var mag     : Double? = nil
//  var place   : String? = nil
//  var time    : Int?    = nil
//  var updated : Int?    = nil
//  var tz      : String? = nil
//  var url     : String? = nil
//  var detail  : String? = nil
//  var felt    : String? = nil
//  var cdi     : String? = nil
//  var mmi     : String? = nil
//  var alert   : String? = nil
//  var status  : String? = nil
//  var tsunami : Int?    = nil
//  var sig     : Int?    = nil
//  var net     : String? = nil
//  var code    : String? = nil
//  var ids     : String? = nil
//  var sources : String? = nil
//  var types   : String? = nil
//  var nst     : Int?    = nil
//  var dmin    : Int?    = nil
//  var rms     : Double? = nil
//  var gap     : Int?    = nil
//  var magType : String? = nil
//  var type    : String? = nil
//  var title   : String? = nil
//
//  enum CodingKeys: String, CodingKey {
//
//    case mag     = "mag"
//    case place   = "place"
//    case time    = "time"
//    case updated = "updated"
//    case tz      = "tz"
//    case url     = "url"
//    case detail  = "detail"
//    case felt    = "felt"
//    case cdi     = "cdi"
//    case mmi     = "mmi"
//    case alert   = "alert"
//    case status  = "status"
//    case tsunami = "tsunami"
//    case sig     = "sig"
//    case net     = "net"
//    case code    = "code"
//    case ids     = "ids"
//    case sources = "sources"
//    case types   = "types"
//    case nst     = "nst"
//    case dmin    = "dmin"
//    case rms     = "rms"
//    case gap     = "gap"
//    case magType = "magType"
//    case type    = "type"
//    case title   = "title"
//  
//  }
//
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        mag     = try values.decodeIfPresent(Double.self , forKey: .mag     )
//        place   = try values.decodeIfPresent(String.self , forKey: .place   )
//        time    = try values.decodeIfPresent(Int.self    , forKey: .time    )
//        updated = try values.decodeIfPresent(Int.self    , forKey: .updated )
//        tz      = try values.decodeIfPresent(String.self , forKey: .tz      )
//        url     = try values.decodeIfPresent(String.self , forKey: .url     )
//        detail  = try values.decodeIfPresent(String.self , forKey: .detail  )
//        felt    = try values.decodeIfPresent(String.self , forKey: .felt    )
//        cdi     = try values.decodeIfPresent(String.self , forKey: .cdi     )
//        mmi     = try values.decodeIfPresent(String.self , forKey: .mmi     )
//        alert   = try values.decodeIfPresent(String.self , forKey: .alert   )
//        status  = try values.decodeIfPresent(String.self , forKey: .status  )
//        tsunami = try values.decodeIfPresent(Int.self    , forKey: .tsunami )
//        sig     = try values.decodeIfPresent(Int.self    , forKey: .sig     )
//        net     = try values.decodeIfPresent(String.self , forKey: .net     )
//        code    = try values.decodeIfPresent(String.self , forKey: .code    )
//        ids     = try values.decodeIfPresent(String.self , forKey: .ids     )
//        sources = try values.decodeIfPresent(String.self , forKey: .sources )
//        types   = try values.decodeIfPresent(String.self , forKey: .types   )
//        nst     = try values.decodeIfPresent(Int.self    , forKey: .nst     )
//        dmin    = try values.decodeIfPresent(Int.self    , forKey: .dmin    )
//        rms     = try values.decodeIfPresent(Double.self , forKey: .rms     )
//        gap     = try values.decodeIfPresent(Int.self    , forKey: .gap     )
//        magType = try values.decodeIfPresent(String.self , forKey: .magType )
//        type    = try values.decodeIfPresent(String.self , forKey: .type    )
//        title   = try values.decodeIfPresent(String.self , forKey: .title   )
// 
//  }
//
//  init() {
//
//  }
//
//}
