# OTRv4 Proverif models

A [Proverif] model of the [handshakes][DAKES] in the [OTRv4] protocol.

## Results

The models themselves have been extensively documented through the Proverif
comments, which should provide more information on how to interpret the below
summarized results.

| File                                                                 | Property                                    | Result             |
| -------------------------------------------------------------------- | ------------------------------------------- | ------------------ |
| [`otrv4_nobrace.pv`](./otrv4_nobrace.pv)                             | Correctness                                 | proved             |
|                                                                      | Secrecy (Alice, interactive)                | proved             |
|                                                                      | Secrecy (Bob, interactive)                  | proved             |
|                                                                      | Secrecy (Alice, non-interactive)            | cannot be proved   |
|                                                                      | Secrecy (Bob, non-interactive)              | proved             |
|                                                                      | Authentication                              | unproved (timeout) |
| [`otrv4_brace.pv`](./otrv4_brace.pv)                                 | Correctness                                 | cannot be proved   |
|                                                                      | Secrecy (Alice, interactive)                | proved             |
|                                                                      | Secrecy (Bob, interactive)                  | proved             |
|                                                                      | Secrecy (Alice, non-interactive)            | cannot be proved   |
|                                                                      | Secrecy (Bob, non-interactive)              | proved             |
| [`otrv4_idake_deniable.pv`](./otrv4_idake_deniable.pv)               | Offline deniability (interactive)           | proved             |
| [`otrv4_nidake_deniable.pv`](./otrv4_nidake_deniable.pv)             | Offline deniability (non-interactive)       | unproved (timeout) |
| [`otrv4_alice_idake_deniable.pv`](./otrv4_alice_idake_deniable.pv)   | Online deniability (Alice, interactive)     | proved             |
| [`otrv4_bob_idake_deniable.pv`](./otrv4_bob_idake_deniable.pv)       | Online deniability (Bob, interactive)       | proved             |
| [`otrv4_alice_nidake_deniable.pv`](./otrv4_alice_nidake_deniable.pv) | Online deniability (Alice, non-interactive) | unproved (timeout) |

All secrecy queries include forward secrecy in case long-term key material is
leaked. Signed pre-keys are considered long-term for this purpose. Secrecy of of
the brace-key mechanism considers forward secrecy in case elliptic curve
cryptography is completely broken.

## Usage

Verification of the models should be as easy as installing [Proverif] and
running `make`.  This may take a very long time, so the results are included in
this repository as well.

## To do

- [ ] Cleanup of the models
- [ ] Interpret "cannot be proved" results
- [ ] Correct initialization of the Double Ratchet (sharing extra keys)

## Acknowledgement

This work benefitted from the use of the CrySP RIPPLE Facility at the University of Waterloo.

## References

- [Off-the-Record version 4][OTRv4]
- [Nik Unger and Ian Goldberg - Improved Strongly Deniable Authenticated Key Exchanges for Secure Messaging (Proceedings on Privacy Enhancing Technologies; 2018)][DAKES]
- [Proverif 2.00][Proverif]

[OTRv4]: https://github.com/otrv4/otrv4
[DAKES]: https://www.petsymposium.org/2018/files/papers/issue1/paper12-2018-1-source.pdf
[Proverif]: http://prosecco.gforge.inria.fr/personal/bblanche/proverif/
