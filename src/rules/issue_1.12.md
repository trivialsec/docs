### Description

Forward Anonymity, frequently and mistakenly described as Perfect Forward Secrecy (PFS), is where the TLS connection applies technical mechanisms intentionally that will not expose any unique client identifier that might be used by a server (TLS termination endpoint) for the purposes of user profiling and tracking.

This is not the same as applying 'secrecy' or privacy to the contents of your TLS connection, the mechanism is designed only for identity protection a.k.a Anonymity - which is an entirely distinct concept from secrecy.

If the TLS connection does not use a cipher that offer the 'anonymity' characteristic, the client identity can be tracked for any purpose the server (or Attacker in-the-middle) might choose, with no possibility of the client protecting themselves.
