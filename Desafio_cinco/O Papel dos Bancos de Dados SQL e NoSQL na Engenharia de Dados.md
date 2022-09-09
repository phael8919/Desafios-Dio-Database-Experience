# O PAPEL DOS BANCOS DE DADOS RELACIONAIS E NÃO RELACIONAIS PARA UM ENGENHEIRO DE DADOS

Antes de falar sobre o papel do engenheiro de dados (e também no que diferencia sua atuação de um cientista de dados), cabe primeiro definir o que são bancos de dados relacionais (SQL) e bancos de dados não relacionais (NoSQL).

Bancos de dados relacionais são um esquema de relacionamento entre tabelas (entidades) que, dentro delas, há a junção de colunas (atributos) e linhas que comportam dados variados, como do tipo inteiro, decimal, caracteres, datas e etc.

As entidades são conectadas por chaves primárias e estrangeiras, que são colunas que possuem valor único e que não se repetem. 

Os Schemas, tabelas e dados são inseridos, manipulados, atualizados ou excluídos pelas linguagem SQL (Structury Query Language – Linguagem de consulta estrutura), dentro dos SGBD’s (Sistema de Gestão de Bancos de Dados), que não é um acrônimo sinônimo de bancos de dados. O SGBD é um software que gerencia as bases de dados além de retirar da aplicação a responsabilidade de gerenciar, manipular e organizar os dados.

Já bancos de dados não relacionais (NoSQL – No Only SQL) é diferente do modelo relacional (Esquema com tabelas e colunas), mas que possui uma capacidade maior de processamento e armazenamento de dados, sendo muito utilizado para Big Data. Ou seja, SGBD’s NoSQL possui uma performance superior aos SGBD’s relacionais.

Todavia os bancos de dados não relacionais não vieram para substituir os bancos de dados relacionais, mas sim para complementá-los ou para ser utilizado em situações específicas.

Geralmente há quatro tipos de bancos de dados não relacionais:
- •	Grafos: armazenamento de dados por nós, arestas e propriedades (como uma árvore);
- •	Documentos: armazenam diversos tipos de documentos, sendo o mais comum aqueles com o formato JSON (Java Script Object Notation);
- •	Chave-valor: os dados são salvos por um modelo similar a um dicionário, na qual a chave representa o índice e os valores representam os dados;
- •	Coluna-família de colunas: o mais similar ao modelo relacional, esse modelo utiliza tabelas, linhas e colunas que os nomes e colunas podem variar de linha para linha.

Após a diferenciação do que são bancos de dados relacionais e bancos de dados não relacionas feitas acima, cabe também estabelecer o que faz um engenheiro de dados e um cientista de dados.

De uma forma simples e sucinta o engenheiro de dados é o responsável por preparar e organizar os dados coletados por uma organização. Já o cientista de dados é responsável por analisar esses dados transformando-os em informações que possam ser utilizadas para a tomada de decisões, geralmente por gestores.

Ou seja, um engenheiro de dados tem a importante função de manter a integridade dos dados coletados, permitindo que eles sejam acessados e analisados pelo cientista de dados, que os transformam em insights valiosíssimos para a tomada de decisões.

Portanto, cabe ao engenheiro de dados decidir qual(is) bancos de dados utilizar e avaliar o uso conjunto ou não de bancos de dados relacionais e bancos de dados não relacionais.

