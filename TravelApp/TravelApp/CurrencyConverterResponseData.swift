//
//  CurrencyConverterResponseData.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 23/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import Foundation

struct CurrencyConverterResponseData: Codable {
    var status: Bool?
    var rates: Rates?
    var base: String?
    var date:String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case rates
        case base
        case date
    }
}

struct Rates: Codable {
    var CAD: Double?
    var HKD: Double?
    var ISK: Double?
    var PHP: Double?
    var DKK: Double?
    var HUF: Double?
    var CZK: Double?
    var AUD: Double?
    var RON: Double?
    var SEK: Double?
    var IDR: Double?
    var INR: Double?
    var BRL: Double?
    var RUB: Double?
    var HRK: Double?
    var JPY: Double?
    var THB: Double?
    var CHF: Double?
    var SGD: Double?
    var PLN: Double?
    var BGN: Double?
    var TRY: Double?
    var CNY: Double?
    var NOK: Double?
    var NZD: Double?
    var ZAR: Double?
    var USD: Double?
    var MXN: Double?
    var ILS: Double?
    var GBP: Double?
    var KRW: Double?
    var MYR: Double?
    
    enum CodingKeys: String, CodingKey {
        case CAD
        case HKD
        case ISK
        case PHP
        case DKK
        case HUF
        case CZK
        case AUD
        case RON
        case SEK
        case IDR
        case INR
        case BRL
        case RUB
        case HRK
        case JPY
        case THB
        case CHF
        case SGD
        case PLN
        case BGN
        case TRY
        case CNY
        case NOK
        case NZD
        case ZAR
        case USD
        case MXN
        case ILS
        case GBP
        case KRW
        case MYR
    }
    
    func getCurrencyExchange(currency: String) -> Double {
        switch currency {
            case "CAD":
                return CAD!
            
            case "HKD":
                return HKD!
                
            case "ISK":
                return ISK!
                
            case "PHP":
                return PHP!
                
            case "DKK":
                return DKK!
                
            case "HUF":
                return HUF!
            
            case "CZK":
                return CZK!
                
            case "AUD":
                return AUD!
                
            case "RON":
                return RON!
                
            case "SEK":
                return SEK!
                
            case "IDR":
                return IDR!
            
            case "INR":
                return INR!
                
            case "BRL":
                return BRL!
                
            case "RUB":
                return RUB!
                
            case "HRK":
                return HRK!
                
            case "JPY":
                return JPY!
                
            case "THB":
                return THB!
                
            case "CHF":
                return CHF!
                
            case "SGD":
                return SGD!
                
            case "PLN":
                return PLN!
                
            case "BGN":
                return BGN!
                
            case "TRY":
                return TRY!
                
            case "CNY":
                return CNY!
                
            case "NOK":
                return NOK!
                
            case "NZD":
                return NZD!
                
            case "ZAR":
                return ZAR!
                
            case "USD":
                return USD!
                
            case "MXN":
                return MXN!
                
            case "ILS":
                return ILS!
            
            case "GBP":
                return GBP!
                
            case "KRW":
                return KRW!
                
            case "MYR":
                return MYR!
            
            default:
                return 0.0
        }
    }
}
