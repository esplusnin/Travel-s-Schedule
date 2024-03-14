import CoreLocation
import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

final class NetworkService {
    
    // MARK: - Dependencies:
    private let client: Client

    // MARK: - Constants and Variables:
    private let apikey: String
        
    // MARK: - Lifecycle:
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
}

// MARK: - NearestStationsServiceProtocol:
extension NetworkService: NearestStationsServiceProtocol {
    
    // MARK: - Public Methods:
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(
            query: .init(
                apikey: apikey,
                lat: lat,
                lng: lng,
                distance: distance
            )
        )
        
        return try response.ok.body.json
    }
}

// MARK: - ScheduleBetweenStationsServiceProtocol:
extension NetworkService: ScheduleBetweenStationsServiceProtocol {
    
    // MARK: - Public Methods:
    func getScheduleBetweenStations(_ from: String, _ to: String) async throws -> ScheduleBetweenStations {
        let response = try await client.getScheduleBetweenStations(
            query: .init(
                apikey: apikey,
                from: from,
                to: to
            )
        )
        
        return try response.ok.body.json
    }
}

// MARK: - StationScheduleServiceProtocol:
extension NetworkService: StationScheduleServiceProtocol {
    
    // MARK: - Public Methods:
    func getScheduleOfStation(with code: String) async throws -> StationSchedule {
        let response = try await client.getStationSchedule(
            query: .init(
                apikey: apikey,
                station: code
            )
        )
        
        return try response.ok.body.json
    }
}

// MARK: - ThreadListServiceProtocol:
extension NetworkService: ThreadListServiceProtocol {
    
    // MARK: - Public Methods:
    func getListOfThread(with uid: String) async throws -> ThreadList {
        let response = try await client.getThreadList(
            query: .init(
                apikey: apikey,
                uid: uid
            )
        )
        
        return try response.ok.body.json
    }
}

// MARK: - NearestCityServiceProtocol:
extension NetworkService: NearestSettlementServiceProtocol {
    
    // MARK: - Public Methods:
    func getNearestSettlement(from location: CLLocationCoordinate2D, distance: Double) async throws -> NearestSettlement {
        let responce = try await client.getNearestSettlement(
            query: .init(
                apikey: apikey,
                lat: location.latitude,
                lng: location.longitude,
                distance: distance
            )
        )
        
        return try responce.ok.body.json
    }
}

// MARK: - CarrierInformationServiceProtocol:
extension NetworkService: CarrierInformationServiceProtocol {
    
    // MARK: - Public Methods:
    func getCarrierInformation(with code: String) async throws -> Any {
        let response = try await client.getCarrierInformation(
            query: .init(
                apikey: apikey,
                code: code
            )
        )

        return try response.ok.body.json
    }
}

// MARK: - StationsList:
extension NetworkService: StationsListServiceProtocol {
    
    // MARK: - Public Methods:
    func getStationsList(format: Operations.getAllStationList.Input.Query.formatPayload = .json) async throws -> HTTPBody {
        let response = try await client.getAllStationList(
            query: .init(
                apikey: apikey,
                format: format
            )
        )
    
        return try response.ok.body.html
    }
}

// MARK: - CopyrightServiceProtocol:
extension NetworkService: CopyrightServiceProtocol {
    
    // MARK: - Public Methods:
    func getCopyright() async throws -> Copyrights {
        let response = try await client.getYandexCopyrigth(
            query: .init(
                apikey: apikey
            )
        )
        
        return try response.ok.body.json
    }
}
