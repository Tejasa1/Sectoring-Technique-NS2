#Simulation parameters setup
set val(chan) Channel/WirelessChannel ;# channel type
set val(prop) Propagation/TwoRayGround ;# radio-propagation model
set val(netif) Phy/WirelessPhy ;# network interface type
set val(mac) Mac/802_11 ;# MAC type
set val(ifq) Queue/DropTail/PriQueue ;# interface queue type
set val(ll) LL ;# link layer type
set val(ant) Antenna/OmniAntenna ;# antenna model
set val(ifqlen) 50 ;# max packet in ifq
set val(nn) 30 ;# number of mobilenodes
set val(rp) AODV ;# routing protocol
set val(x) 1000 ;# X dimension of topography
set val(y) 1000 ;# Y dimension of topography
set val(stop) 25.0 ;# time of simulation end


#----------> Initialization

#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#--------> Mobile node parameter setup
$ns node-config -adhocRouting $val(rp) \
	-llType $val(ll) \
	-macType $val(mac) \
	-ifqType $val(ifq) \
	-ifqLen $val(ifqlen) \
	-antType $val(ant) \
	-propType $val(prop) \
	-phyType $val(netif) \
	-channel $chan \
	-topoInstance $topo \
	-agentTrace ON \
	-routerTrace ON \
	-macTrace ON \
	-movementTrace ON


#---------> Nodes Definition

#Create 30 nodes

#set n0 [$ns node]
#$n0 set X_ 150
#$n0 set Y_ 200
#$n0 set Z_ 0.0
#$ns initial_node_pos $n0 20

set n1 [$ns node]
$n1 set X_ 200
$n1 set Y_ 200
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20

set n2 [$ns node]
$n2 set X_ 250
$n2 set Y_ 200
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20

set n3 [$ns node]
$n3 set X_ 300
$n3 set Y_ 200
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20

set n4 [$ns node]
$n4 set X_ 350
$n4 set Y_ 200
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20

set n5 [$ns node]
$n5 set X_ 400
$n5 set Y_ 200
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20

set n6 [$ns node]
$n6 set X_ 450
$n6 set Y_ 200
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20

set n7 [$ns node]
$n7 set X_ 500
$n7 set Y_ 200
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20

set n8 [$ns node]
$n8 set X_ 550
$n8 set Y_ 200
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20

set n9 [$ns node]
$n9 set X_ 600
$n9 set Y_ 200
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20

set n10 [$ns node]
$n10 set X_ 150
$n10 set Y_ 400
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20

set n11 [$ns node]
$n11 set X_ 200
$n11 set Y_ 400
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20

set n12 [$ns node]
$n12 set X_ 250
$n12 set Y_ 400
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20

set n13 [$ns node]
$n13 set X_ 300
$n13 set Y_ 400
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20

set n14 [$ns node]
$n14 set X_ 350
$n14 set Y_ 400
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20

set n15 [$ns node]
$n15 set X_ 400
$n15 set Y_ 400
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20

set n16 [$ns node]
$n16 set X_ 450
$n16 set Y_ 400
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20

set n17 [$ns node]
$n17 set X_ 500
$n17 set Y_ 400
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20

set n18 [$ns node]
$n18 set X_ 550
$n18 set Y_ 400
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20

set n19 [$ns node]
$n19 set X_ 600
$n19 set Y_ 400
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20

set n20 [$ns node]
$n20 set X_ 150
$n20 set Y_ 600
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20

set n21 [$ns node]
$n21 set X_ 200
$n21 set Y_ 600
$n21 set Z_ 0.0
$ns initial_node_pos $n21 20

set n22 [$ns node]
$n22 set X_ 250
$n22 set Y_ 600
$n22 set Z_ 0.0
$ns initial_node_pos $n22 20

set n23 [$ns node]
$n23 set X_ 300
$n23 set Y_ 600
$n23 set Z_ 0.0
$ns initial_node_pos $n23 20

set n24 [$ns node]
$n24 set X_ 350
$n24 set Y_ 600
$n24 set Z_ 0.0
$ns initial_node_pos $n24 20

set n25 [$ns node]
$n25 set X_ 400
$n25 set Y_ 600
$n25 set Z_ 0.0
$ns initial_node_pos $n25 20

set n26 [$ns node]
$n26 set X_ 450
$n26 set Y_ 600
$n26 set Z_ 0.0
$ns initial_node_pos $n26 20

set n27 [$ns node]
$n27 set X_ 500
$n27 set Y_ 600
$n27 set Z_ 0.0
$ns initial_node_pos $n27 20

set n28 [$ns node]
$n28 set X_ 550
$n28 set Y_ 600
$n28 set Z_ 0.0
$ns initial_node_pos $n28 20

set n29 [$ns node]
$n29 set X_ 600
$n29 set Y_ 600
$n29 set Z_ 0.0
$ns initial_node_pos $n29 20

set n30 [$ns node]
$n30 set X_ 900
$n30 set Y_ 400
$n30 set Z_ 0.0
$ns initial_node_pos $n30 20



#===================================
# Agents Definition
#===================================
#set udp0 [new Agent/UDP]
set udp1 [new Agent/UDP]
set udp2 [new Agent/UDP]
set udp3 [new Agent/UDP]
set udp4 [new Agent/UDP]
set udp5 [new Agent/UDP]
set udp6 [new Agent/UDP]
set udp7 [new Agent/UDP]
set udp8 [new Agent/UDP]
set udp9 [new Agent/UDP]
set udp10 [new Agent/UDP]
set udp11 [new Agent/UDP]
set udp12 [new Agent/UDP]
set udp13 [new Agent/UDP]
set udp14 [new Agent/UDP]
set udp15 [new Agent/UDP]
set udp16 [new Agent/UDP]
set udp17 [new Agent/UDP]
set udp18 [new Agent/UDP]
set udp19 [new Agent/UDP]
set udp20 [new Agent/UDP]
set udp21 [new Agent/UDP]
set udp22 [new Agent/UDP]
set udp23 [new Agent/UDP]
set udp24 [new Agent/UDP]
set udp25 [new Agent/UDP]
set udp26 [new Agent/UDP]
set udp27 [new Agent/UDP]
set udp28 [new Agent/UDP]
set udp29 [new Agent/UDP]

#set null1 [new Agent/LossMonitor]
set null2 [new Agent/Null]
set null3 [new Agent/Null]
set null4 [new Agent/Null]
set null5 [new Agent/Null]
set null6 [new Agent/Null]
set null7 [new Agent/Null]
set null8 [new Agent/Null]
set null9 [new Agent/Null]
set null11 [new Agent/Null]
set null12 [new Agent/Null]
set null13 [new Agent/Null]
set null14 [new Agent/Null]
set null15 [new Agent/Null]
set null16 [new Agent/Null]
set null17 [new Agent/Null]
set null18 [new Agent/Null]
set null19 [new Agent/Null]
set null21 [new Agent/Null]
set null22 [new Agent/Null]
set null23 [new Agent/Null]
set null24 [new Agent/Null]
set null25 [new Agent/Null]
set null26 [new Agent/Null]
set null27 [new Agent/Null]
set null28 [new Agent/Null]
set null29 [new Agent/Null]
set null30 [new Agent/Null]

#$ns attach-agent $n0 $udp0
$ns attach-agent $n1 $udp1
$ns attach-agent $n2 $udp2
$ns attach-agent $n3 $udp3
$ns attach-agent $n4 $udp4
$ns attach-agent $n5 $udp5
$ns attach-agent $n6 $udp6
$ns attach-agent $n7 $udp7
$ns attach-agent $n8 $udp8
$ns attach-agent $n9 $udp9
$ns attach-agent $n10 $udp10
$ns attach-agent $n11 $udp11
$ns attach-agent $n12 $udp12
$ns attach-agent $n13 $udp13
$ns attach-agent $n14 $udp14
$ns attach-agent $n15 $udp15
$ns attach-agent $n16 $udp16
$ns attach-agent $n17 $udp17
$ns attach-agent $n18 $udp18
$ns attach-agent $n19 $udp19
$ns attach-agent $n20 $udp20
$ns attach-agent $n21 $udp21
$ns attach-agent $n22 $udp22
$ns attach-agent $n23 $udp23
$ns attach-agent $n24 $udp24
$ns attach-agent $n25 $udp25
$ns attach-agent $n26 $udp26
$ns attach-agent $n27 $udp27
$ns attach-agent $n28 $udp28
$ns attach-agent $n29 $udp29

#$ns attach-agent $n1 $null1
$ns attach-agent $n2 $null2
$ns attach-agent $n3 $null3
$ns attach-agent $n4 $null4
$ns attach-agent $n5 $null5
$ns attach-agent $n6 $null6
$ns attach-agent $n7 $null7
$ns attach-agent $n8 $null8
$ns attach-agent $n9 $null9
$ns attach-agent $n11 $null11
$ns attach-agent $n12 $null12
$ns attach-agent $n13 $null13
$ns attach-agent $n14 $null14
$ns attach-agent $n15 $null15
$ns attach-agent $n16 $null16
$ns attach-agent $n17 $null17
$ns attach-agent $n18 $null18
$ns attach-agent $n19 $null19
$ns attach-agent $n21 $null21
$ns attach-agent $n22 $null22
$ns attach-agent $n23 $null23
$ns attach-agent $n24 $null24
$ns attach-agent $n25 $null25
$ns attach-agent $n26 $null26
$ns attach-agent $n27 $null27
$ns attach-agent $n28 $null28
$ns attach-agent $n29 $null29
$ns attach-agent $n30 $null30


#===================================
# Traffic
#===================================
#set cbr0 [new Application/Traffic/CBR]
#$cbr0 attach-agent $udp0
#$cbr0 set packetSize_ 50
#$cbr0 set interval_ 0.1

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 50
$cbr1 set interval_ 0.1

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packetSize_ 50
$cbr2 set interval_ 0.1

set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packetSize_ 50
$cbr3 set interval_ 0.1

set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packetSize_ 50
$cbr4 set interval_ 0.1

set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$cbr5 set packetSize_ 50
$cbr5 set interval_ 0.1

set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packetSize_ 50
$cbr6 set interval_ 0.1

set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp7
$cbr7 set packetSize_ 50
$cbr7 set interval_ 0.1

set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp8
$cbr8 set packetSize_ 50
$cbr8 set interval_ 0.1

set cbr9 [new Application/Traffic/CBR]
$cbr9 attach-agent $udp9
$cbr9 set packetSize_ 50
$cbr9 set interval_ 0.1

set cbr10 [new Application/Traffic/CBR]
$cbr10 attach-agent $udp10
$cbr10 set packetSize_ 50
$cbr10 set interval_ 0.1

set cbr11 [new Application/Traffic/CBR]
$cbr11 attach-agent $udp11
$cbr11 set packetSize_ 50
$cbr11 set interval_ 0.1

set cbr12 [new Application/Traffic/CBR]
$cbr12 attach-agent $udp12
$cbr12 set packetSize_ 50
$cbr12 set interval_ 0.1

set cbr13 [new Application/Traffic/CBR]
$cbr13 attach-agent $udp13
$cbr13 set packetSize_ 50
$cbr13 set interval_ 0.1

set cbr14 [new Application/Traffic/CBR]
$cbr14 attach-agent $udp14
$cbr14 set packetSize_ 50
$cbr14 set interval_ 0.1

set cbr15 [new Application/Traffic/CBR]
$cbr15 attach-agent $udp15
$cbr15 set packetSize_ 50
$cbr15 set interval_ 0.1

set cbr16 [new Application/Traffic/CBR]
$cbr16 attach-agent $udp16
$cbr16 set packetSize_ 50
$cbr16 set interval_ 0.1

set cbr17 [new Application/Traffic/CBR]
$cbr17 attach-agent $udp17
$cbr17 set packetSize_ 50
$cbr17 set interval_ 0.1

set cbr18 [new Application/Traffic/CBR]
$cbr18 attach-agent $udp18
$cbr18 set packetSize_ 50
$cbr18 set interval_ 0.1

set cbr19 [new Application/Traffic/CBR]
$cbr19 attach-agent $udp19
$cbr19 set packetSize_ 50
$cbr19 set interval_ 0.1

set cbr20 [new Application/Traffic/CBR]
$cbr20 attach-agent $udp20
$cbr20 set packetSize_ 50
$cbr20 set interval_ 0.1

set cbr21 [new Application/Traffic/CBR]
$cbr21 attach-agent $udp21
$cbr21 set packetSize_ 50
$cbr21 set interval_ 0.1

set cbr22 [new Application/Traffic/CBR]
$cbr22 attach-agent $udp22
$cbr22 set packetSize_ 50
$cbr22 set interval_ 0.1

set cbr23 [new Application/Traffic/CBR]
$cbr23 attach-agent $udp23
$cbr23 set packetSize_ 50
$cbr23 set interval_ 0.1

set cbr24 [new Application/Traffic/CBR]
$cbr24 attach-agent $udp24
$cbr24 set packetSize_ 50
$cbr24 set interval_ 0.1

set cbr25 [new Application/Traffic/CBR]
$cbr25 attach-agent $udp25
$cbr25 set packetSize_ 50
$cbr25 set interval_ 0.1

set cbr26 [new Application/Traffic/CBR]
$cbr26 attach-agent $udp26
$cbr26 set packetSize_ 50
$cbr26 set interval_ 0.1

set cbr27 [new Application/Traffic/CBR]
$cbr27 attach-agent $udp27
$cbr27 set packetSize_ 50
$cbr27 set interval_ 0.1

set cbr28 [new Application/Traffic/CBR]
$cbr28 attach-agent $udp28
$cbr28 set packetSize_ 50
$cbr28 set interval_ 0.1

set cbr29 [new Application/Traffic/CBR]
$cbr29 attach-agent $udp29
$cbr29 set packetSize_ 50
$cbr29 set interval_ 0.1


#===================================
# Connections
#===================================
$ns connect $udp9 $null30
$ns connect $udp19 $null30
$ns connect $udp29 $null30


#$ns connect $udp0 $null1
$ns connect $udp1 $null2
$ns connect $udp2 $null3
$ns connect $udp3 $null4
$ns connect $udp4 $null5
$ns connect $udp5 $null6
$ns connect $udp6 $null7
$ns connect $udp7 $null8
$ns connect $udp8 $null9
$ns connect $udp10 $null11
$ns connect $udp11 $null12
$ns connect $udp12 $null13
$ns connect $udp13 $null14
$ns connect $udp14 $null15
$ns connect $udp15 $null16
$ns connect $udp16 $null17
$ns connect $udp17 $null18
$ns connect $udp18 $null19
$ns connect $udp20 $null21
$ns connect $udp21 $null22
$ns connect $udp22 $null23
$ns connect $udp23 $null24
$ns connect $udp24 $null25
$ns connect $udp25 $null26
$ns connect $udp26 $null27
$ns connect $udp27 $null28
$ns connect $udp28 $null29
#===================================
# Terminate
#===================================
#Define a 'finish' procedure
proc finish {} {
	global ns tracefile namfile
	$ns flush-trace
	close $tracefile
	close $namfile
	exec nam out.nam &
	exit 0
}


#===================================
# Main
#===================================
#$ns at 0.5 "$cbr0 start"
#$ns at 2.0 "$cbr0 stop"
$ns at 2.5 "$cbr1 start"
$ns at 4.0 "$cbr1 stop"
$ns at 4.5 "$cbr2 start"
$ns at 6.0 "$cbr2 stop"
$ns at 6.5 "$cbr3 start"
$ns at 8.0 "$cbr3 stop"
$ns at 8.5 "$cbr4 start"
$ns at 10.0 "$cbr4 stop"
$ns at 10.5 "$cbr5 start"
$ns at 12.0 "$cbr5 stop"
$ns at 12.5 "$cbr6  start"
$ns at 14.0 "$cbr6 stop"
$ns at 14.5 "$cbr7 start"
$ns at 16.0 "$cbr7 stop"
$ns at 16.5 "$cbr8 start"
$ns at 18.0 "$cbr8 stop"
$ns at 18.5 "$cbr9 start"
$ns at 20.0 "$cbr9 stop"
$ns at 0.5 "$cbr10 start"
$ns at 2.0 "$cbr10 stop"
$ns at 2.5 "$cbr11 start"
$ns at 4.0 "$cbr11 stop"
$ns at 4.5 "$cbr12 start"
$ns at 6.0 "$cbr12 stop"
$ns at 6.5 "$cbr13 start"
$ns at 8.0 "$cbr13 stop"
$ns at 8.5 "$cbr14 start"
$ns at 10.0 "$cbr14 stop"
$ns at 10.5 "$cbr15 start"
$ns at 12.0 "$cbr15 stop"
$ns at 12.5 "$cbr16  start"
$ns at 14.0 "$cbr16 stop"
$ns at 14.5 "$cbr17 start"
$ns at 16.0 "$cbr17 stop"
$ns at 16.5 "$cbr18 start"
$ns at 18.0 "$cbr18 stop"
$ns at 18.5 "$cbr19 start"
$ns at 20.0 "$cbr19 stop"
$ns at 0.5 "$cbr20 start"
$ns at 2.0 "$cbr20 stop"
$ns at 2.5 "$cbr21 start"
$ns at 4.0 "$cbr21 stop"
$ns at 4.5 "$cbr22 start"
$ns at 6.0 "$cbr22 stop"
$ns at 6.5 "$cbr23 start"
$ns at 8.0 "$cbr23 stop"
$ns at 8.5 "$cbr24 start"
$ns at 10.0 "$cbr24 stop"
$ns at 10.5 "$cbr25 start"
$ns at 12.0 "$cbr25 stop"
$ns at 12.5 "$cbr26  start"
$ns at 14.0 "$cbr26 stop"
$ns at 14.5 "$cbr27 start"
$ns at 16.0 "$cbr27 stop"
$ns at 16.5 "$cbr28 start"
$ns at 18.0 "$cbr28 stop"
$ns at 18.5 "$cbr29 start"
$ns at 20.0 "$cbr29 stop"
$ns at 19.0 "finish"



$ns run
