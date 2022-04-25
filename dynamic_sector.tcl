#Simulation parameters setup
set val(chan) Channel/WirelessChannel ;# channel type
set val(prop) Propagation/TwoRayGround ;# radio-propagation model
set val(netif) Phy/WirelessPhy ;# network interface type
set val(mac) Mac/802_11 ;# MAC type
set val(ifq) Queue/DropTail/PriQueue ;# interface queue type
set val(ll) LL ;# link layer type
set val(ant) Antenna/OmniAntenna ;# antenna model
set val(ifqlen) 50 ;# max packet in ifq
set val(nn) 10 ;# number of mobilenodes
set val(rp) AODV ;# routing protocol
set val(x) 1000 ;# X dimension of topography
set val(y) 1000 ;# Y dimension of topography
set val(stop) 50.0 ;# time of simulation end


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

#Create 10 nodes

set n0 [$ns node]
$n0 set X_ 100
$n0 set Y_ 100
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20

set n1 [$ns node]
$n1 set X_ 150
$n1 set Y_ 100
$n1 set Z_ 0.0
$ns initial_node_pos $n1 30

set n2 [$ns node]
$n2 set X_ 200
$n2 set Y_ 100
$n2 set Z_ 0.0
$ns initial_node_pos $n2 40

set n3 [$ns node]
$n3 set X_ 250
$n3 set Y_ 100
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20

set n4 [$ns node]
$n4 set X_ 300
$n4 set Y_ 100
$n4 set Z_ 0.0
$ns initial_node_pos $n4 30

set n5 [$ns node]
$n5 set X_ 120
$n5 set Y_ 200
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20

set n6 [$ns node]
$n6 set X_ 200
$n6 set Y_ 200
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20

set n7 [$ns node]
$n7 set X_ 300
$n7 set Y_ 200
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20

set n8 [$ns node]
$n8 set X_ 200
$n8 set Y_ 300
$n8 set Z_ 0.0
$ns initial_node_pos $n8 30

set n9 [$ns node]
$n9 set X_ 300
$n9 set Y_ 300
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20




$ns at 0.15 "$n0 setdest 200.0 600.0 100.0"
$ns at 0.15 "$n1 setdest 400.0 400.0 100.0"
$ns at 0.15 "$n2 setdest 600.0 500.0 100.0"
$ns at 0.15 "$n3 setdest 300.0 400.0 100.0"
$ns at 0.15 "$n4 setdest 400.0 500.0 100.0"
$ns at 0.15 "$n5 setdest 200.0 400.0 100.0"
$ns at 0.15 "$n6 setdest 300.0 500.0 100.0"
$ns at 0.15 "$n7 setdest 200.0 500.0 100.0"
$ns at 0.15 "$n8 setdest 400.0 600.0 100.0"
$ns at 0.15 "$n9 setdest 300.0 600.0 100.0"

#===================================
# Agents Definition
#===================================
set udp0 [new Agent/UDP]
set udp1 [new Agent/UDP]
set udp3 [new Agent/UDP]
set udp4 [new Agent/UDP]
set udp5 [new Agent/UDP]
set udp6 [new Agent/UDP]
set udp7 [new Agent/UDP]
set udp8 [new Agent/UDP]
set udp9 [new Agent/UDP]

set null2 [new Agent/Null]
set null1 [new Agent/Null]
set null4 [new Agent/Null]
set null8 [new Agent/Null]
set null3 [new Agent/Null]
set null9 [new Agent/Null]
set null6 [new Agent/Null]

$ns attach-agent $n0 $udp0
$ns attach-agent $n1 $udp1
$ns attach-agent $n3 $udp3
$ns attach-agent $n4 $udp4
$ns attach-agent $n5 $udp5
$ns attach-agent $n6 $udp6
$ns attach-agent $n7 $udp7
$ns attach-agent $n8 $udp8
$ns attach-agent $n9 $udp9

$ns attach-agent $n2 $null2
$ns attach-agent $n1 $null1
$ns attach-agent $n4 $null4
$ns attach-agent $n8 $null8
$ns attach-agent $n3 $null3
$ns attach-agent $n9 $null9
$ns attach-agent $n6 $null6


#===================================
# Traffic
#===================================
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 50
$cbr0 set interval_ 0.1

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 50
$cbr1 set interval_ 0.1

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


#===================================
# Connections
#===================================
$ns connect $udp8 $null2
$ns connect $udp4 $null2
$ns connect $udp1 $null2


$ns connect $udp3 $null1
$ns connect $udp6 $null4
$ns connect $udp9 $null8
$ns connect $udp5 $null3
$ns connect $udp0 $null9
$ns connect $udp7 $null6

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
$ns at 6.0 "$cbr0 start"
$ns at 7.5 "$cbr0 stop"
$ns at 8.0 "$cbr9 start"
$ns at 9.5 "$cbr9 stop"
$ns at 10.0 "$cbr8 start"
$ns at 11.5 "$cbr8 stop"
$ns at 12.0 "$cbr7 start"
$ns at 13.5 "$cbr7 stop"
$ns at 14.0 "$cbr6 start"
$ns at 15.5 "$cbr6 stop"
$ns at 16.0 "$cbr4 start"
$ns at 17.5 "$cbr4 stop"
$ns at 18.0 "$cbr5  start"
$ns at 19.5 "$cbr5 stop"
$ns at 20.0 "$cbr3 start"
$ns at 21.5 "$cbr3 stop"
$ns at 22.0 "$cbr1 start"
$ns at 23.5 "$cbr1 stop"
$ns at 24.5 "finish"



$ns run
