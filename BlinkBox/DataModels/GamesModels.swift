//
//  GamesModels.swift
//  BlinkBox
//
//  Created by Tushar Zade on 25/11/23.
//

import Foundation


struct GamesResponse : Codable {
    let status : Int?
    let message : String?
    let data : [Games]?
    let is_home_enable : Bool?
    let app_center : [AppCenter]?
    let home : [Home]?
    let more_apps : [String]?
    let native_add : Native_add?
    let translator_ads_id : Translator_ads_id?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
        case is_home_enable = "is_home_enable"
        case app_center = "app_center"
        case home = "home"
        case more_apps = "more_apps"
        case native_add = "native_add"
        case translator_ads_id = "translator_ads_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([Games].self, forKey: .data)
        is_home_enable = try values.decodeIfPresent(Bool.self, forKey: .is_home_enable)
        app_center = try values.decodeIfPresent([AppCenter].self, forKey: .app_center)
        home = try values.decodeIfPresent([Home].self, forKey: .home)
        more_apps = try values.decodeIfPresent([String].self, forKey: .more_apps)
        native_add = try values.decodeIfPresent(Native_add.self, forKey: .native_add)
        translator_ads_id = try values.decodeIfPresent(Translator_ads_id.self, forKey: .translator_ads_id)
    }

}


struct Home : Codable {
    let id : Int?
    let position : Int?
    let name : String?
    let is_active : Int?
    let catgeory : String?
    let status : Int?
    let sub_category : [SubCategory]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case position = "position"
        case name = "name"
        case is_active = "is_active"
        case catgeory = "catgeory"
        case status = "status"
        case sub_category = "sub_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        is_active = try values.decodeIfPresent(Int.self, forKey: .is_active)
        catgeory = try values.decodeIfPresent(String.self, forKey: .catgeory)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        sub_category = try values.decodeIfPresent([SubCategory].self, forKey: .sub_category)
    }

}

struct Native_add : Codable {
    let id : Int?
    let position : Int?
    let image : String?
    let playstore_link : String?
    let package_name : String?
    let is_active : Int?
    let image_active : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case position = "position"
        case image = "image"
        case playstore_link = "playstore_link"
        case package_name = "package_name"
        case is_active = "is_active"
        case image_active = "image_active"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        playstore_link = try values.decodeIfPresent(String.self, forKey: .playstore_link)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        is_active = try values.decodeIfPresent(Int.self, forKey: .is_active)
        image_active = try values.decodeIfPresent(Int.self, forKey: .image_active)
    }

}


struct AppCenter : Codable {
    let id : Int?
    let position : Int?
    let name : String?
    let is_active : Int?
    let catgeory : String?
    let status : Int?
    let sub_category : [SubCategory]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case position = "position"
        case name = "name"
        case is_active = "is_active"
        case catgeory = "catgeory"
        case status = "status"
        case sub_category = "sub_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        is_active = try values.decodeIfPresent(Int.self, forKey: .is_active)
        catgeory = try values.decodeIfPresent(String.self, forKey: .catgeory)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        sub_category = try values.decodeIfPresent([SubCategory].self, forKey: .sub_category)
    }

}


struct Games : Codable {
    let id : Int?
    let app_id : Int?
    let position : Int?
    let name : String?
    let thumb_image : String?
    let app_link : String?
    let package_name : String?
    let full_thumb_image : String?
    let splash_active : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case app_id = "app_id"
        case position = "position"
        case name = "name"
        case thumb_image = "thumb_image"
        case app_link = "app_link"
        case package_name = "package_name"
        case full_thumb_image = "full_thumb_image"
        case splash_active = "splash_active"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        app_id = try values.decodeIfPresent(Int.self, forKey: .app_id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        thumb_image = try values.decodeIfPresent(String.self, forKey: .thumb_image)
        app_link = try values.decodeIfPresent(String.self, forKey: .app_link)
        package_name = try values.decodeIfPresent(String.self, forKey: .package_name)
        full_thumb_image = try values.decodeIfPresent(String.self, forKey: .full_thumb_image)
        splash_active = try values.decodeIfPresent(Int.self, forKey: .splash_active)
    }

}


struct Translator_ads_id : Codable {
    let banner : String?
    let interstitial : String?

    enum CodingKeys: String, CodingKey {
        case banner = "banner"
        case interstitial = "interstitial"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        banner = try values.decodeIfPresent(String.self, forKey: .banner)
        interstitial = try values.decodeIfPresent(String.self, forKey: .interstitial)
    }

}

struct SubCategory : Codable {
    let id : Int?
    let app_id : Int?
    let position : Int?
    let name : String?
    let icon : String?
    let star : String?
    let installed_range : String?
    let app_link : String?
    let banner : String?
    let is_active : Int?
    let image_active : Int?
    let banner_image : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case app_id = "app_id"
        case position = "position"
        case name = "name"
        case icon = "icon"
        case star = "star"
        case installed_range = "installed_range"
        case app_link = "app_link"
        case banner = "banner"
        case is_active = "is_active"
        case image_active = "image_active"
        case banner_image = "banner_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        app_id = try values.decodeIfPresent(Int.self, forKey: .app_id)
        position = try values.decodeIfPresent(Int.self, forKey: .position)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        star = try values.decodeIfPresent(String.self, forKey: .star)
        installed_range = try values.decodeIfPresent(String.self, forKey: .installed_range)
        app_link = try values.decodeIfPresent(String.self, forKey: .app_link)
        banner = try values.decodeIfPresent(String.self, forKey: .banner)
        is_active = try values.decodeIfPresent(Int.self, forKey: .is_active)
        image_active = try values.decodeIfPresent(Int.self, forKey: .image_active)
        banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
    }

}

