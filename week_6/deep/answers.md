# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

-Advantages: Even distribution across boats. Simple implementation.
-Disadvantages: Inefficient for time-range queries; must query all boats.

## Partitioning by Hour

-Advantages: Faster targeted queries. Predictable storage by time.
-Disadvantages: Uneven data distribution if most observations occur during specific hours.

## Partitioning by Hash Value

-Advantages: Even data distribution. Specific queries are efficient using hash values.
-Disadvantages: Time-range queries are inefficient; requires querying all boats. More complex to implement.
