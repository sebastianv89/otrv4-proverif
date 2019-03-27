# OTRv4 Proverif models

A [Proverif] model of the [handshakes][DAKES] in the [OTRv4] protocol.


## Results

The models themselves have been extensively documented through the Proverif
comments, which should provide more information on how to interpret the below
summarized results.

| File                                                                 | Property                                    | Result             |
| -------------------------------------------------------------------- | ------------------------------------------- | ------------------ |
| [`otrv4_nobrace.pv`](./otrv4_nobrace.pv)                             | Correctness                                 | proved (partially) |
|                                                                      | Secrecy (Alice, interactive)                | proved             |
|                                                                      | Secrecy (Bob, interactive)                  | proved             |
|                                                                      | Secrecy (Alice, non-interactive)            | proved             |
|                                                                      | Secrecy (Bob, non-interactive)              | proved             |
|                                                                      | Authentication                              | unproved (timeout) |
| [`otrv4_brace.pv`](./otrv4_brace.pv)                                 | Any                                         | unproved (timeout) |
| [`otrv4_idake_deniable.pv`](./otrv4_idake_deniable.pv)               | Offline deniability (interactive)           | needs model update |
| [`otrv4_nidake_deniable.pv`](./otrv4_nidake_deniable.pv)             | Offline deniability (non-interactive)       | needs model update |
| [`otrv4_alice_idake_deniable.pv`](./otrv4_alice_idake_deniable.pv)   | Online deniability (Alice, interactive)     | needs model update |
| [`otrv4_bob_idake_deniable.pv`](./otrv4_bob_idake_deniable.pv)       | Online deniability (Bob, interactive)       | needs model update |
| [`otrv4_alice_nidake_deniable.pv`](./otrv4_alice_nidake_deniable.pv) | Online deniability (Alice, non-interactive) | needs model update |

All secrecy queries include forward secrecy in case long-term key material is
leaked. Signed pre-keys are considered long-term for this purpose. Secrecy of of
the brace-key mechanism considers forward secrecy in case elliptic curve
cryptography is completely broken.


## Usage

Verification of the models should be as easy as installing [Proverif] and
running `make`.  This may take a very long time, so the results are included in
this repository as well.


## Naming

There's only three hard problems in computer science: naming things and
off-by-one errors. Here's a rough translation table that should help:

| Model        | [DAKES]          | [OTRv4]                |
| ------------ | ---------------- | ---------------------- |
| `init`       | Initiator (I)    | Bob                    |
| `resp`       | Responder (R)    | Alice                  |
| `dakez`      | DAKEZ            | Interactive DAKE       |
| `xzdh`       | XZDH             | Non-interactive DAKE   |
| `cp_i`       | "I"              | Bob's Client Profile   |
| `cp_r`       | "R"              | Alice's Client Profile |
| `(y, Y)`     | `(i, g^i)`       | `(y, Y)`               |
| `(x, X)`     | `(r, g^r)`       | `(x, X)`               |
| `(h_i, H_i)` | `(I, g^I)`       | `(?, H_b)`             |
| `(h_r, H_r)` | `(R, g^R)`       | `(?, H_a)`             |
| `(f_i, F_i)` | `(F_I, g^{F_I})` | `(?, F_b)`             |
| `(f_r, F_r)` | `(F_R, g^{F_R})` | `(?, F_a)`             |
| `(d, D)`     | `(Γ, g^Γ)`       | `(?, D)`               |
| `(a, A)`     |                  | `(a, A)`               |
| `(b, B)`     |                  | `(b, B)`               |
| `id_alice`   |                  | "alice@jabber.net"     |
| `id_bob`     |                  | "bob@jabber.net"       |

Adding a column for the [Double Ratchet] specification is left as an exercise
for the reader.


## To do

- [ ] Cleanup of the models
- [ ] Interpret "cannot be proved" results
- [x] Correct initialization of the Double Ratchet (~~sharing extra keys~~ from shared key)
- [x] Rename from names to roles


## Acknowledgement

This work benefitted from the use of the CrySP RIPPLE Facility at the University of Waterloo.


## References

- [Off-the-Record version 4][OTRv4]
- [Nik Unger and Ian Goldberg - Improved Strongly Deniable Authenticated Key Exchanges for Secure Messaging (Proceedings on Privacy Enhancing Technologies; 2018)][DAKES]
- [Proverif 2.00][Proverif]

[OTRv4]: https://github.com/otrv4/otrv4
[DAKES]: https://www.petsymposium.org/2018/files/papers/issue1/paper12-2018-1-source.pdf
[Proverif]: http://prosecco.gforge.inria.fr/personal/bblanche/proverif/
[Double Ratchet]: https://signal.org/docs/specifications/doubleratchet/
