# Connector RPC
> Wrapper around the ILP connector, exposing an RPC endpoint

Lots of plugins require RPC in order to function, but the ILP connector does
not expose an HTTP endpoint for it. The ILP kit manages RPC, but is a very
heavy dependency. Connector RPC is a short script that wraps the connector
and exposes an RPC endpoint, compatible with payment-channel based plugins.

A `start.sh` script is provided as an example of how to configure this
connector.
