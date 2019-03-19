all: otrv4_brace.pv.out otrv4_nobrace.pv.out \
	otrv4_alice_idake_deniable.pv.out otrv4_bob_idake_deniable.pv.out \
	otrv4_idake_deniable.pv.out \
	otrv4_alice_nidake_deniable.pv.out \
	otrv4_nidake_deniable.pv.out

%.pv.out: %.pv
	proverif $< | tee $@ | grep RESULT

.PRECIOUS: %.pv.out

otrv4_nobrace.pv: otrv4.pv
	cpp -UBRACE -P $< >$@

otrv4_dh_detsig.pv: otrv4.pv
	cpp -DBRACE -P $< >$@

clean:
	rm otrv4_nobrace.pv otrv4_brace.pv
	rm *.pv.out
.PHONY: clean
