merge (:danko{title:'danko'})
	-[:isa]-> (:class:Book{title:'Book'});

match (book:danko) merge
	(:author{title:"П.Е.Данко"}) -[:author]-> (book);
match (book:danko) merge
	(:author{title:"А.Г.Попов"}) -[:author]-> (book);
match (book:danko) merge
	(:author{title:"Т.Я.Кожевникова"}) -[:author]-> (book);
match (book:danko) merge
	(:author{title:"С.П.Данко"}) -[:author]-> (book);

merge (:class:Author{title:'Author'})
	-[:ako]-> (:class:Person{title:'Person'});
		
match (x)-[:author]->(),(a:Author)
	merge (x) -[:isa]-> (a); 

match (book:danko)
	merge (book)
		<-[:title]-
			(x:title{
				title:"Высшая математика в упражнениях и задачах"})
		-[:isa]-> (:class:Title{title:'Title'});

match (book:danko)
	merge (book)
		<-[:edition]- (:edition{title:7})
		-[:isa]-> (:class:Edition{title:'Edition'});

match (book:danko)
	merge (book)
		<-[:isbn]- (:isbn{title:'978-5-17-08348-3'})
		-[:isa]-> (:class:ISBN{title:'ISBN'});

match (x:isbn) where x.title='978-5-17-08348-3'
	merge (x)
		-[:publisher]-> (:publisher{title:'АСТ'})
		-[:isa]-> (:class:Publisher{title:'Publisher'});
		
match (book:danko),(pub:Publisher),(sss:ISBN)
	merge (book)
		<-[:isbn]- (nnn:isbn{title:'978-5-94666-735-7'})
		-[:isa]-> (sss)
	merge (nnn)
		-[:publisher]-> (:publisher{title:'Мир и Образование'})
		-[:isa]-> (pub)
	merge (nnn)
		-[:year]-> (:year{title:2014})
		-[:isa]-> (:class:Year{title:'Year'});
