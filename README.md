
Unioeste - Cascavel - Colegiado do curso de Bacharelado em Ciência da Computação

## Linguagens de Montagem

2ª Série

**Ementa**: Estudo de linguagem de montagem e desenvolvimento de software básico. Estudo de conjuntos de instruções e modos de
endereçamento. Implementação de construções de alto nível em linguagem de máquina.


Este repositório conterá todas as aulas da disciplina:
- Apresentações em .pdf; 
- Arquivos de código-fonte exemplos e, se possível, exercícios resolvidos; 
- e outros arquivos relevante para a disciplina. 

Outras informaçõe relevantes serão adicionadas em um futuro próximo.

### Ferramentas necessárias:

**TL;DR**: no terminal Linux faça:
  `sudo apt update` (pressione enter e insira sua senha de super usuário)
  `sudo apt install nasm binutils build-essential` (pressione enter)

- Sistema Operacional Linux 
    - A disciplina utiliza o **Sistema Operacional Linux** x86_64 com sabor Debian ou seus derivados (**Mint**, Ubuntu, MX, Deepin, etc). 
    - **TL;DR**: Usaremos as Chamadas de Sistema Operacional (S.O.) Linux! 
    - Porém, não é restrito o uso de outro S.O. Linux compatível não listado anteriormente. Porque Linux? A disciplina usa Chamadas de S.O. para apresentar texto no terminal, ler do teclado, abrir/fechar arquivos, entre outras, e essas Chamadas de S.O. estão implementadas no Kernel do S.O. Desta forma, cada S.O. pode implementar as Chamadas de maneiras diferentes e utilizar parâmetros não compatíveis com os que aprenderemos nesta disciplina.

- Montador `NASM`
    - Principal ferramenta da disciplina, pois é com ela que montaremos nossos códigos-fontes para serem ligados e depois executados.
    - Para instalar, abra o terminal Linux e digite: 
    `sudo apt install nasm`  

- Ligador `ld`
    - Após termos um código montado, é necessário ligá-lo com bibliotecas de carregamento e bibliotecas externas, quando necessário. Após a ligação completada é que é gerado efetivamente o arquivo executável. 
    - ld faz parte da biblioteca `binutils` e já deve estar instalada. Caso contrário, instale, via terminal, esta biblioteca: 
    `sudo apt install binutils` 

- Compilador `gcc`
    - A partir da Etapa 02 - Aula 11, usaremos bibliotecas C para nos ajudar com algumas tarefas mais complexas, por isso, passaremos a ligar nossos códigos-fontes com o GCC
    - `gcc`, normalmente, já vem instalado em algumas distribuições Linux, porém, caso na sua esteja ausente, no terminal faça:
    `sudo apt install build-essential`

### Principais Referências:
- to-do
