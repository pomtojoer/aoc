runtest:{[day;part]
	show 30#"#";
	show "Running test for day ", string[day], ", part ", string part;
	input: read0 `$"test/day",string[day],".txt";
	function: value ".day",string[day],".part", string part;
	output: function input;
	answert: 1_flip`part1`part2!("JJ";",")0:`answer.txt;
	answer: @[;`$"part",string part] answert day-1;
	show "Answer was ", $[answer~output;"right";"WRONG"];
	if[not answer~output;show "Output: ", string[output], ", Answer: ", string[answer];show ""];
	};


runtestoneday:{[day]
	@[runtest[day]; ;{show "Unable to run test. Error at: ", x}] each 1+til 2;
	};


runtestalldays:{[]
	days: ns where any flip key[`] in/:`${"day",string x} each ns:1+til 25;
	runtestoneday each days;
	};


system "l main.q";
args:.z.X;
if["--help" in args; show "usage:"; show cmd:#[4;" "],"q run.q"; show  cmd,:" <day>"; show cmd,:" <part>";exit 1];
if[2=count args; runtestalldays[]];
if[3=count args; runtestoneday "I"$args 2];
if[4=count args; runtest["I"$args 2] "I"$args 3];

exit 1;
