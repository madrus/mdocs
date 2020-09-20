# 10 GraphQL Principles

(from [Principled GraphQL][1] by Matt DeBergalis, Co-Founder of Apollo on 21-02-2019)

At __Apollo__, we’ve been building industry-leading data graph technology since 2015 and now estimate that our software is used in over 90% of GraphQL implementations. Over the years, we’ve had thousands of conversations with developers using GraphQL and worked side-by-side with teams putting it into production at companies of all sizes.

To share what we’ve learned, my co-founder Geoff Schmidt and I published [Principled GraphQL][1] —- a list of 10 GraphQL Principles that distill the experiences of those teams into a set of best practices for creating, maintaining, and operating a data graph.

We encourage you to check them out and share them with anyone building a GraphQL layer.

### One Graph

Your company should have one unified graph, rather than each team creating their own graph.

### Federated Implementation

Though there is only one graph, the implementation of that graph should be federated across multiple teams.

### Track the Schema in a Registry

There should be a single source of truth that defines the makeup of the graph.

### Abstract, Demand-Oriented Schema

The schema should act as an abstraction layer that provides flexibility to consumers while hiding service implementation details.

### Use an Agile Approach to Schema Development

The schema should be built incrementally based on actual requirements, and rather than being versioned should evolve smoothly over time.

### Iteratively Improve Performance

Performance management should be a continuous, data-driven process, adapting smoothly to changing query loads and service implementations.

### Use Graph Metadata to Empower Developers

Developers should be equipped with rich awareness of the graph throughout the entire development process.

### Access and Demand Control

Grant access to the graph on a per-client basis, and manage not just what a client can access but how they can access it.

### Structured Logging

Capture structured logs of all graph operations and leverage them as the primary tool for understanding graph usage.

### Separate the GraphQL layer from the Service Layer

Adopt a layered architecture with data graph functionality broken into a separate tier rather than baked into every service.

You will find more detail on each principle [here][1].

Matt DeBergalis
Co-Founder, Apollo

[1]: https://principledgraphql.com/?mkt_tok=eyJpIjoiTUdFNE1HUXlZVGt5TnpoayIsInQiOiJ1cnh5WXdPSWVZdStFeWd3MG5QdFNPeG93VlRuclpIajc2Y0ZCbnIwQ1B6ek5MZzV5OTRac0tUWnpiZ2wzb2VRclB3WjRmdXdvSXJvN3hrUXNnbXhYMExneUdvYjBcLzFjeTBhcEZTUXRQUDJiM0s4aFo3Ulp5bTBDNmJiNFUza2QifQ%3D%3D
