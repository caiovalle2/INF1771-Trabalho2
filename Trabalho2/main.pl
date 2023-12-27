:- dynamic animal/3.

start :-
    consult("knowledge.pl"),
    ask("E um mamifero", "").

ask(Question, Question_old) :-
    animal(Question, Y, N),
    (\+Y =="" ->
    write(Question), write(' (s/n) '),
    read(Answer),
    answer(Answer, Question, Y, N)
    ;
    answer(Question, Question_old)
    ).
answer(Question, Question_old) :-
    write("E um/a "),
    write(Question),
    read(Answer),
    new_animal(Answer, Question, Question_old).
answer('s', Question_old, Question, _) :-
    !,
    ask(Question, Question_old).
answer('n', Question_old, _, Question) :-
    !,
    ask(Question, Question_old).

new_animal('n', Question, Question_old) :-
    write('Puxa! Eu não sei! qual animal pensou?'),
    read(Animal),
    write('Qual pergunta o torna diferente?'),
    read(Difference),
    animal(Question_old, X, Y),
    retract(animal(Question_old, _, _)),
    (X == Question ->
    assertz(animal(Question_old, Difference, Y)),
    assertz(animal(Difference, Animal,X))
    ;
    assertz(animal(Question_old, X, Difference)),
    assertz(animal(Difference, Animal, Y))
    ),
    assertz(animal(Animal, "", "")),
    tell('knowledge.pl'),
    listing(animal/3),
    told,
    writeln('Obrigado por me ensinar algo novo!').

new_animal('s', _, _) :-
    write("Adivinhei seu animal!").
