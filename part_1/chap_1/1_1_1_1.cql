merge (m:point{title:'M'})
	-[:isa]-> (:class:Point{title:'Point'});
match (m:point{title:'M'})
	merge (m)
		-[:on]-> (:axes{title:'Ox'})
		-[:isa]-> (:class:Axes{title:'Axes'});

match (m:point{title:'M'})
	merge (m)
		-[:has]-> (x:coordinate{title:'x'})
		-[:isa]-> (:class:Coordinate{title:'Coordinate'});

merge (:syntax{title:'M(x)'});
match (m:point{title:'M'}),(s:syntax{title:'M(x)'})
	merge (m) -[:write]-> (s);
match (x:coordinate{title:'x'}),(s:syntax{title:'M(x)'})
	merge (x) -[:write]-> (s);
