# Trabalho 2 Jogo dos animais

O projeto possui 2 arquivos para o funcionamento do programa. Nos arquivos de prolog, um deles tem a regra para o salvamento das informações e o outro é o banco que guarda as informações conforme vai inserindo mais animais
ao sistema.

# Funcionamento:
O algoritmo funciona de modo que cada instância do banco de conhecimento tenha 3 valores, sendo cada uma, uma pergunta. A primeira pergunta ou a mais a esquerda em animal(p1, p2, p3) é a pergunta atual e que será
feita ao usuário. Quando tem uma resposta positiva, o programa acessa a pergunta do meio, caso não, acessa a pergunta do lado direito. Ao acessar a nova pergunta, o programa faz uma nova query em animal com ela como
atual.

Dessa maneira, o programa cria uma árvore binária, sendo cada filho uma nova pergunta. Além disso, cada folha representa um animal diferente. A pergunta que leva o programa a adivinhar possui pelo menos 1 folha e pode 
ser alterado quando a resposta que o programa tentou adivinhar está errado.

Quando o programa erra o animal, a ultima instância de animal é modificado, de maneira que o animal acessado nele é removido e passado a nova pergunta, depois criado uma nova instância que possui a pergunta nova, animal
novo e o que foi retirado da anterior.

Exemplo:

Tem listras? Não
É um leão? Não
Qual animal? cachorro
Qual diferença? Ele late


animal("Tem listras", zebra, leao) -> animal("Tem listras", zebra, "Ele late") animal("Ele late", cachorro, leao)


O código executa até encontrar a folha e realizar a pergunta que realiza a tentativa de adivinhar o animal, e ao chegar no final, é realizado uma nova pergunta para que o jogo seja carregado e feito as perguntas 
novamente com os dados novos inseridos no arquivo.
