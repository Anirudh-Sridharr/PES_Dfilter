# PES_Dfilter
### Brief: 
A digital filter takes in an input signal and allows only a select set of frequencies to pass through.
a butterworth filter for example takes in an input and allows only components having low frequency to go through, we here design an FIR lowpass filter.
Fir stands for finite impulse response. 

### Setup and simulation:
 we use gedit to write our code, use iverilog to simulate and gtkwave to see waveforms 

The below command opens the editor
 ```
gedit filename.v 
```

This command helps us simulate the design
```
iverilog design.v testbench.v
```

Then finally after generating the vcd dumpfile we use the .vcd file to open gtkwave

```
gtkwave dumpfile.vcd
```
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/aa3c65b9-5719-40d1-b4d2-234702d5f7db)

![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/a665c5ea-6595-47f6-b58e-6a40fd93df5b)


### Synthesis and netlist generation:

We use yosys to synthesize our design we launch yosys with the command 
```
yosys
```

call the necessary liberty files and standard cells using 
```
read_liberty -lib ~/Desktop/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd_tt_025C_1v80.lib
```

Then we read the design file to be synthesized using 
```
read_verilog design.v 
```

To synthesize, we use
```
abc -liberty ~/Desktop/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd_tt_025C_1v80.lib
```

To generate netlist we use
```
write_verilog -noattr netlist.v 
```

finally to see the synthesized design - i.e. our verilog code in terms of the present standard cells, use
```
show
```
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/ded6e208-871b-4656-9d6c-ce34c9326476)

and finally, the synthesized circuit, 
![image](https://github.com/Anirudh-Sridharr/PES_Dfilter/assets/140473803/2e557b99-be4e-45fa-992b-7d09ce9d9c34)


