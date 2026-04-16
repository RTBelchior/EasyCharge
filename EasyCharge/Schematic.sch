<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clock" />
        <signal name="Reset(1:0)">
        </signal>
        <signal name="counters(3:0)">
        </signal>
        <signal name="counters(7:4)">
        </signal>
        <signal name="switches(1)">
        </signal>
        <signal name="switches(2)">
        </signal>
        <signal name="counters(11:8)">
        </signal>
        <signal name="switches(3)">
        </signal>
        <signal name="counters(15:12)">
        </signal>
        <signal name="counters(15:0)" />
        <signal name="SEG(6:0)" />
        <signal name="AN(3:0)" />
        <signal name="clk_5sec" />
        <signal name="switches(0)">
        </signal>
        <signal name="LED0" />
        <signal name="LED1" />
        <signal name="LED2" />
        <signal name="LED3" />
        <signal name="SYNC" />
        <signal name="SPOT0" />
        <signal name="SPOT1" />
        <signal name="SPOT2" />
        <signal name="SPOT3" />
        <signal name="pModReset" />
        <signal name="buttonReset" />
        <signal name="Reset(0)" />
        <signal name="Reset(1)" />
        <signal name="switches(3:0)" />
        <port polarity="Input" name="clock" />
        <port polarity="Output" name="SEG(6:0)" />
        <port polarity="Output" name="AN(3:0)" />
        <port polarity="Output" name="LED0" />
        <port polarity="Output" name="LED1" />
        <port polarity="Output" name="LED2" />
        <port polarity="Output" name="LED3" />
        <port polarity="Output" name="SYNC" />
        <port polarity="Output" name="SPOT0" />
        <port polarity="Output" name="SPOT1" />
        <port polarity="Output" name="SPOT2" />
        <port polarity="Output" name="SPOT3" />
        <port polarity="Input" name="pModReset" />
        <port polarity="Input" name="buttonReset" />
        <port polarity="Input" name="switches(3:0)" />
        <blockdef name="clkDivider">
            <timestamp>2026-3-26T9:59:21</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="counter">
            <timestamp>2026-3-26T9:59:33</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="displaySeg">
            <timestamp>2026-3-26T9:59:42</timestamp>
            <rect width="320" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="counter" name="XLXI_2">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="switches(0)" name="enable" />
            <blockpin signalname="Reset(1:0)" name="reset(1:0)" />
            <blockpin signalname="counters(3:0)" name="counters(3:0)" />
        </block>
        <block symbolname="counter" name="XLXI_4">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="switches(1)" name="enable" />
            <blockpin signalname="Reset(1:0)" name="reset(1:0)" />
            <blockpin signalname="counters(7:4)" name="counters(3:0)" />
        </block>
        <block symbolname="counter" name="XLXI_5">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="switches(2)" name="enable" />
            <blockpin signalname="Reset(1:0)" name="reset(1:0)" />
            <blockpin signalname="counters(11:8)" name="counters(3:0)" />
        </block>
        <block symbolname="counter" name="XLXI_6">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="switches(3)" name="enable" />
            <blockpin signalname="Reset(1:0)" name="reset(1:0)" />
            <blockpin signalname="counters(15:12)" name="counters(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="switches(0)" name="I" />
            <blockpin signalname="LED0" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="switches(1)" name="I" />
            <blockpin signalname="LED1" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="switches(2)" name="I" />
            <blockpin signalname="LED2" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_10">
            <blockpin signalname="switches(3)" name="I" />
            <blockpin signalname="LED3" name="O" />
        </block>
        <block symbolname="clkDivider" name="XLXI_1">
            <blockpin signalname="clock" name="clk_50MHz" />
            <blockpin signalname="Reset(1:0)" name="reset(1:0)" />
            <blockpin signalname="clk_5sec" name="clk_5sec" />
        </block>
        <block symbolname="buf" name="XLXI_12">
            <blockpin signalname="clk_5sec" name="I" />
            <blockpin signalname="SYNC" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="switches(0)" name="I" />
            <blockpin signalname="SPOT0" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="switches(1)" name="I" />
            <blockpin signalname="SPOT1" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="switches(2)" name="I" />
            <blockpin signalname="SPOT2" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="switches(3)" name="I" />
            <blockpin signalname="SPOT3" name="O" />
        </block>
        <block symbolname="displaySeg" name="XLXI_3">
            <blockpin signalname="clock" name="clock" />
            <blockpin signalname="counters(15:0)" name="counters(15:0)" />
            <blockpin signalname="SEG(6:0)" name="segments(6:0)" />
            <blockpin signalname="AN(3:0)" name="anodes(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_17">
            <blockpin signalname="pModReset" name="I" />
            <blockpin signalname="Reset(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_18">
            <blockpin signalname="buttonReset" name="I" />
            <blockpin signalname="Reset(1)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="464" y="896" name="XLXI_2" orien="R0">
        </instance>
        <instance x="464" y="1232" name="XLXI_4" orien="R0">
        </instance>
        <instance x="464" y="1584" name="XLXI_5" orien="R0">
        </instance>
        <instance x="464" y="1904" name="XLXI_6" orien="R0">
        </instance>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="736" type="branch" />
            <wire x2="464" y1="736" y2="736" x1="432" />
        </branch>
        <branch name="switches(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="800" type="branch" />
            <wire x2="464" y1="800" y2="800" x1="432" />
        </branch>
        <branch name="Reset(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="864" type="branch" />
            <wire x2="464" y1="864" y2="864" x1="432" />
        </branch>
        <branch name="counters(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="880" y="736" type="branch" />
            <wire x2="880" y1="736" y2="736" x1="848" />
        </branch>
        <branch name="counters(7:4)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="880" y="1072" type="branch" />
            <wire x2="864" y1="1072" y2="1072" x1="848" />
            <wire x2="880" y1="1072" y2="1072" x1="864" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1072" type="branch" />
            <wire x2="448" y1="1072" y2="1072" x1="432" />
            <wire x2="464" y1="1072" y2="1072" x1="448" />
        </branch>
        <branch name="switches(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1136" type="branch" />
            <wire x2="448" y1="1136" y2="1136" x1="432" />
            <wire x2="464" y1="1136" y2="1136" x1="448" />
        </branch>
        <branch name="Reset(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1200" type="branch" />
            <wire x2="448" y1="1200" y2="1200" x1="432" />
            <wire x2="464" y1="1200" y2="1200" x1="448" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1424" type="branch" />
            <wire x2="464" y1="1424" y2="1424" x1="432" />
        </branch>
        <branch name="switches(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1488" type="branch" />
            <wire x2="464" y1="1488" y2="1488" x1="432" />
        </branch>
        <branch name="Reset(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1552" type="branch" />
            <wire x2="464" y1="1552" y2="1552" x1="432" />
        </branch>
        <branch name="counters(11:8)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="880" y="1424" type="branch" />
            <wire x2="880" y1="1424" y2="1424" x1="848" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1744" type="branch" />
            <wire x2="464" y1="1744" y2="1744" x1="432" />
        </branch>
        <branch name="switches(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="432" y="1808" type="branch" />
            <wire x2="464" y1="1808" y2="1808" x1="432" />
        </branch>
        <branch name="Reset(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="448" y="1872" type="branch" />
            <wire x2="464" y1="1872" y2="1872" x1="448" />
        </branch>
        <branch name="counters(15:12)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="880" y="1744" type="branch" />
            <wire x2="864" y1="1744" y2="1744" x1="848" />
            <wire x2="880" y1="1744" y2="1744" x1="864" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="320" type="branch" />
            <wire x2="1904" y1="320" y2="320" x1="1872" />
        </branch>
        <branch name="counters(15:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="384" type="branch" />
            <wire x2="1904" y1="384" y2="384" x1="1872" />
        </branch>
        <branch name="SEG(6:0)">
            <wire x2="2368" y1="320" y2="320" x1="2352" />
            <wire x2="2384" y1="320" y2="320" x1="2368" />
        </branch>
        <branch name="AN(3:0)">
            <wire x2="2368" y1="384" y2="384" x1="2352" />
            <wire x2="2384" y1="384" y2="384" x1="2368" />
        </branch>
        <instance x="1920" y="656" name="XLXI_7" orien="R0" />
        <instance x="1920" y="784" name="XLXI_8" orien="R0" />
        <instance x="1920" y="896" name="XLXI_9" orien="R0" />
        <instance x="1936" y="1008" name="XLXI_10" orien="R0" />
        <branch name="clk_5sec">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2368" y="1760" type="branch" />
            <wire x2="2352" y1="1760" y2="1760" x1="2336" />
            <wire x2="2368" y1="1760" y2="1760" x1="2352" />
        </branch>
        <branch name="Reset(1:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1824" type="branch" />
            <wire x2="1936" y1="1824" y2="1824" x1="1920" />
            <wire x2="1952" y1="1824" y2="1824" x1="1936" />
        </branch>
        <branch name="clock">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="1760" type="branch" />
            <wire x2="1936" y1="1760" y2="1760" x1="1920" />
            <wire x2="1952" y1="1760" y2="1760" x1="1936" />
        </branch>
        <instance x="1952" y="1856" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1936" y="1136" name="XLXI_12" orien="R0" />
        <instance x="1936" y="1248" name="XLXI_13" orien="R0" />
        <instance x="1936" y="1376" name="XLXI_14" orien="R0" />
        <instance x="1936" y="1488" name="XLXI_15" orien="R0" />
        <instance x="1936" y="1600" name="XLXI_16" orien="R0" />
        <branch name="clk_5sec">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1104" type="branch" />
            <wire x2="1936" y1="1104" y2="1104" x1="1904" />
        </branch>
        <branch name="switches(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1216" type="branch" />
            <wire x2="1936" y1="1216" y2="1216" x1="1904" />
        </branch>
        <branch name="switches(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1344" type="branch" />
            <wire x2="1936" y1="1344" y2="1344" x1="1904" />
        </branch>
        <branch name="switches(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1456" type="branch" />
            <wire x2="1936" y1="1456" y2="1456" x1="1904" />
        </branch>
        <branch name="switches(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="1568" type="branch" />
            <wire x2="1936" y1="1568" y2="1568" x1="1904" />
        </branch>
        <branch name="LED0">
            <wire x2="2176" y1="624" y2="624" x1="2144" />
        </branch>
        <branch name="LED1">
            <wire x2="2176" y1="752" y2="752" x1="2144" />
        </branch>
        <branch name="LED2">
            <wire x2="2160" y1="864" y2="864" x1="2144" />
            <wire x2="2176" y1="864" y2="864" x1="2160" />
        </branch>
        <branch name="LED3">
            <wire x2="2192" y1="976" y2="976" x1="2160" />
        </branch>
        <branch name="SYNC">
            <wire x2="2192" y1="1104" y2="1104" x1="2160" />
        </branch>
        <branch name="SPOT0">
            <wire x2="2192" y1="1216" y2="1216" x1="2160" />
        </branch>
        <branch name="SPOT1">
            <wire x2="2192" y1="1344" y2="1344" x1="2160" />
        </branch>
        <branch name="SPOT2">
            <wire x2="2176" y1="1456" y2="1456" x1="2160" />
            <wire x2="2192" y1="1456" y2="1456" x1="2176" />
        </branch>
        <branch name="SPOT3">
            <wire x2="2192" y1="1568" y2="1568" x1="2160" />
        </branch>
        <instance x="1904" y="416" name="XLXI_3" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2384" y="320" name="SEG(6:0)" orien="R0" />
        <iomarker fontsize="28" x="2384" y="384" name="AN(3:0)" orien="R0" />
        <iomarker fontsize="28" x="2176" y="624" name="LED0" orien="R0" />
        <iomarker fontsize="28" x="2176" y="752" name="LED1" orien="R0" />
        <iomarker fontsize="28" x="2192" y="976" name="LED3" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1104" name="SYNC" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1216" name="SPOT0" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1344" name="SPOT1" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1568" name="SPOT3" orien="R0" />
        <iomarker fontsize="28" x="2176" y="864" name="LED2" orien="R0" />
        <iomarker fontsize="28" x="2192" y="1456" name="SPOT2" orien="R0" />
        <instance x="608" y="368" name="XLXI_17" orien="R0" />
        <instance x="608" y="496" name="XLXI_18" orien="R0" />
        <branch name="pModReset">
            <wire x2="608" y1="336" y2="336" x1="576" />
        </branch>
        <branch name="buttonReset">
            <wire x2="608" y1="464" y2="464" x1="576" />
        </branch>
        <branch name="Reset(0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="864" y="336" type="branch" />
            <wire x2="848" y1="336" y2="336" x1="832" />
            <wire x2="864" y1="336" y2="336" x1="848" />
        </branch>
        <branch name="Reset(1)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="864" y="464" type="branch" />
            <wire x2="864" y1="464" y2="464" x1="832" />
        </branch>
        <iomarker fontsize="28" x="576" y="336" name="pModReset" orien="R180" />
        <iomarker fontsize="28" x="576" y="464" name="buttonReset" orien="R180" />
        <branch name="switches(3:0)">
            <wire x2="656" y1="208" y2="208" x1="592" />
        </branch>
        <iomarker fontsize="28" x="592" y="208" name="switches(3:0)" orien="R180" />
        <branch name="clock">
            <wire x2="960" y1="208" y2="208" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="208" name="clock" orien="R180" />
        <branch name="switches(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1904" y="976" type="branch" />
            <wire x2="1920" y1="976" y2="976" x1="1904" />
            <wire x2="1936" y1="976" y2="976" x1="1920" />
        </branch>
        <branch name="switches(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1888" y="864" type="branch" />
            <wire x2="1920" y1="864" y2="864" x1="1888" />
        </branch>
        <branch name="switches(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1888" y="752" type="branch" />
            <wire x2="1904" y1="752" y2="752" x1="1888" />
            <wire x2="1920" y1="752" y2="752" x1="1904" />
        </branch>
        <branch name="switches(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1888" y="624" type="branch" />
            <wire x2="1920" y1="624" y2="624" x1="1888" />
        </branch>
    </sheet>
</drawing>