# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Reasons to:
- The querying will not create a hotspot, because the data is evenly distributed.

Reasons not to:
- The data isn't easily traceable, because it doesn't follow a logical pattern.

## Partitioning by Hour

Reasons to:
- The data is traceable, because it follow the logical pattern based on observation time.

Reasons not to:
- The querying will create a hotspot,  because most of the data is concentrated in only one server.


## Partitioning by Hash Value

Reasons to:
- The data is traceable, because it follows a logical pattern: the hash values.
- The querying will not create a hotspot, because the data is evenly distributed between servers.

Reasons not to:
- The hash value can be wrongly calculated and the data stored in the wrong server.
