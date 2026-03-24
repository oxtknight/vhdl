# --- SETTINGS ---
# GHDL compiler
GHDL = ghdl
# Waveform viewer
VIEWER = gtkwave

# --- AUTOMATIC FILE DETECTION ---
# Find all .vhd files in src and tb folders
SRCS = $(wildcard src/*.vhd)
TBS  = $(wildcard tb/*.vhd)
# The name of the waveform file
WAVE = wave.vcd

# --- TOP ENTITY DETECTION ---
# By default, we assume the Top Entity is the name of the first file in 'tb' 
# minus the .vhd extension. (e.g. srlatch_tb.vhd -> srlatch_tb)
# You can also run: make TOP=your_entity_name
TOP ?= $(shell basename $(firstword $(TBS)) .vhd)

# --- TARGETS ---
all: analyze elaborate run view

analyze:
	@echo "Analyzing files..."
	$(GHDL) -a $(SRCS) $(TBS)

elaborate:
	@echo "Elaborating $(TOP)..."
	$(GHDL) -e $(TOP)

run:
	@echo "Running simulation..."
	$(GHDL) -r $(TOP) --vcd=$(WAVE) --stop-time=100ns

view:
	@echo "Opening GTKWave..."
	$(VIEWER) $(WAVE) &

clean:
	@echo "Cleaning up..."
	$(GHDL) --remove
	rm -f *.vcd *.o *.cf $(TOP)

.PHONY: all analyze elaborate run view clean
