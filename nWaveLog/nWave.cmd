wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi18/vlsi1812/Lab3/demux1to4.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/demux1to4_tb"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/demux1to4_tb/D} \
{/demux1to4_tb/Sel\[1:0\]} \
{/demux1to4_tb/Y0} \
{/demux1to4_tb/Y1} \
{/demux1to4_tb/Y2} \
{/demux1to4_tb/Y3} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/demux1to4_tb/D} \
{/demux1to4_tb/Sel\[1:0\]} \
{/demux1to4_tb/Y0} \
{/demux1to4_tb/Y1} \
{/demux1to4_tb/Y2} \
{/demux1to4_tb/Y3} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 1205.691151 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1285.135917 -snap {("G1" 2)}
wvZoom -win $_nWave1 789.774436 850.526316
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 1018.762290 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 1051.474841 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1986.119144 -snap {("G1" 4)}
wvExit
