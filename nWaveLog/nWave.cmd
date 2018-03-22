wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi18/vlsi1812/Lab3/demux1to7.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/demux1to7_tb"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/demux1to7_tb/D} \
{/demux1to7_tb/Sel\[2:0\]} \
{/demux1to7_tb/Y0} \
{/demux1to7_tb/Y1} \
{/demux1to7_tb/Y2} \
{/demux1to7_tb/Y3} \
{/demux1to7_tb/Y4} \
{/demux1to7_tb/Y5} \
{/demux1to7_tb/Y6} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/demux1to7_tb/D} \
{/demux1to7_tb/Sel\[2:0\]} \
{/demux1to7_tb/Y0} \
{/demux1to7_tb/Y1} \
{/demux1to7_tb/Y2} \
{/demux1to7_tb/Y3} \
{/demux1to7_tb/Y4} \
{/demux1to7_tb/Y5} \
{/demux1to7_tb/Y6} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 1177.651822 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 3317.987276 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5271.393869 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5439.629844 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5299.433198 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 5262.047426 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7093.950260 -snap {("G1" 1)}
wvExit
