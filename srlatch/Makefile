GHDL = ghdl
VIEWER = gtkwave
SRCS = $(wildcard src/*.vhd)
TBS  = $(wildcard tb/*.vhd)
WAVE = wave.vcd
TOP ?= $(shell basename $(firstword $(TBS)) .vhd)
all: analyze elaborate run view

analyze:
	@echo "Analyzing files:"
	$(GHDL) -a $(SRCS) $(TBS)

elaborate:
	@echo "Elaborating $(TOP):"
	$(GHDL) -e $(TOP)

run:
	@echo "Running simulation:"
	$(GHDL) -r $(TOP) --vcd=$(WAVE) --stop-time=100ns

view:
	@echo "Opening GTKWave:"
	$(VIEWER) $(WAVE) &

clean:
	@echo "Cleaning up..."
	$(GHDL) --remove
	rm -f *.vcd *.o *.cf $(TOP)

.PHONY: all analyze elaborate run view clean
