# make signatures from library
# by laqieer
# 2019/2/8

LIBS := $(wildcard *.a) $(wildcard *.o)

.PHONY: all sig pat yar zig clean

sig : $(LIBS:.a=.sig) $(LIBS:.o=.sig)
pat : $(LIBS:.a=.pat) $(LIBS:.o=.pat)
yar : $(LIBS:.a=.yar) $(LIBS:.o=.yar)
zig : $(LIBS:.o=.zig)

libagbsyscall_2.pat: libagbsyscall_2.a
	pelf -M2 $<
	
libagbsyscall_3.pat: libagbsyscall_3.a
	pelf -M2 $<

%.pat: %.a
	pelf $<
	@sed -i 's/:0000@ \.gcc2_compiled\. //g' $@
	
%.pat: %.o
	pelf $<
	@sed -i 's/:0000@ \.gcc2_compiled\. //g' $@
	
%.sig: %.pat
	@sigmake $< $@ || sed -i '1,4d' $*.exc && sigmake $< $@
	
%.yar: %.a
#	python3 "$(RETDEC)\bin\retdec-signature-from-library-creator.py" -m 4 $< -o $@
	python3 "$(RETDEC)\bin\retdec-signature-from-library-creator.py" $< -o $@
	
%.yar: %.o
	retdec-bin2pat $< -o $*.yar.pat
#	retdec-pat2yara $*.yar.pat --min-pure 4 -o $@
	retdec-pat2yara $*.yar.pat -o $@
	rm -f $*.yar.pat

%.zig: %.o
	radare2 -a arm -b 16 -c 'ahb 16 @@ sym.*; af @@ sym.*; zg; zos $@' -q $<
	
clean:
	rm -f *.pat *.sig *.yar *.exc *.err *.zig
	