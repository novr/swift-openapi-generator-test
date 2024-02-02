//
//  GreetingClient.swift
//  swift-openapi-generator-test
//
//  Created by 古宮 伸久 on 2024/02/02.
//

import OpenAPIURLSession

struct GreetingClient {

    func getGreeting(name: String?) async throws -> String {
        let client = Client(
            serverURL: try Servers.server2(),
            transport: URLSessionTransport()
        )
        let response = try await client.getGreeting(query: .init(name: name))
        return try response.ok.body.json.message
    }
}
