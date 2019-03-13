# For now, focussing on just one model is difficult enough
# all: otrv4_nodh_detsig.pv.out \
#      otrv4_dh_detsig.pv.out \
#      otrv4_nodh_rndsig.pv.out \
#      otrv4_dh_rndsig.pv.out \

all: otrv4_nodh_detsig.pv.out

%.pv.out: %.pv
	proverif $< | tee $@ | grep RES

.PRECIOUS: %.pv.out

otrv4_nodh_detsig.pv: otrv4.pv
	cpp -UDIFFIEHELLMAN -URANDRINGSIG -P $< >$@

otrv4_dh_detsig.pv: otrv4.pv
	cpp -DDIFFIEHELLMAN -URANDRINGSIG -P $< >$@

otrv4_nodh_rndsig.pv: otrv4.pv
	cpp -UDIFFIEHELLMAN -DRANDRINGSIG -P $< >$@

otrv4_dh_rndsig.pv: otrv4.pv
	cpp -DDIFFIEHELLMAN -DRANDRINGSIG -P $< >$@

clean:
	rm otrv4_nodh_detsig.pv.out \
     otrv4_dh_detsig.pv.out \
     otrv4_nodh_rndsig.pv.out \
     otrv4_dh_rndsig.pv.out \
	 otrv4_nodh_detsig.pv \
     otrv4_dh_detsig.pv \
     otrv4_nodh_rndsig.pv \
     otrv4_dh_rndsig.pv \
.PHONY: clean
