% Based on https://www.youtube.com/watch?v=5ms_idvN8Tg 

:- include(example('SimulationKit.pl')).

% Simple conveyor revisited:
if true at 1 then
	createContainer(tank1,100,Tank1) to T0, createContainer(tank2,100,Tank2) to T0, 
	createContainer(nowhere,0,Nothing) to T0, % hack for disconnected pump outputs
	createConveyor(simple,point(10,10),point(210,10),Conveyor) to T0, 
	createContainer(bottle,10,Bottle) to T0, 
	setConveyorSpeed(Conveyor,5) from T0 to T1,
	placeOnConveyor(Bottle,Conveyor,0) from T0 to T1, 
	setLocation(Tank1,point(50,50)) from T1 to T2, setLocation(Tank2,point(150,50)) from T1 to T2,
	createPump(tank1output,Tank1,Nothing,Tank1Out) from T1 to T2,
	createPump(tank2output,Tank2,Nothing,Tank2Out) from T1 to T2,
	createPump(bottleOutput,Bottle,Nothing,BottleOut) from T1 to T2,
	switchPumpOutputTo(Tank1Out,Bottle) from T2 to T3,
	setPumpFlow(Tank1Out,10) from T2 to T3,
	makeLocation(Conveyor,Bottle,Tank1) from T3 to T4, % a conveyor "method"
	pour(Tank1Out,30) from T4. % a pump "method"

/*
 from T1, 
	start(Conveyor) from T1 to T2, setConveyorSpeed(Conveyor,5) from T1 to T2
	
pour(From,To,Qty)  implies atarting/stopping the pump! and a given rate/flow
a pump method
start, check after a while, stop
is level sampling expensive?

makeLocation(bottle, tank2) 
a conveyor method...

 */
    
d(timeless, [[type:rectangle,from:[0,0],to:[600,350],strokeColor:green]]). % bounds for our display

maxTime(100). % minCycleTime(0).
/** <examples> 
?- go(Timeline).
*/
