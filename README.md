
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

### FAQ
  > *Mas eu nunca utilizei terminal Linux!*
  _Aluno de computação que nunca utilizou terminal Linux._  
  
  Possível solução: [Curso gratuito introdutório de terminal Linux criado por Diego Mariano.](https://www.udemy.com/course/terminal-de-comandos-linux/) 

  > *Eu nem tenho Linux!*  
  _Aluno de computação que não usa/tem Linux ou compatíveis._  
  
  Possíveis soluções:
  1. Bare-Metal Dual-Boot Windows + Linux (modo hardcore): [Como fazer dual-boot com Ubuntu e Windows 10 em seu notebook](https://blog.matheus.io/pt/tech/como-fazer-dual-boot-ubuntu-windows-10/) de Matheus Pratta.  
  2. Virtualização Linux Visitante + Windows Hospedeiro (modo mamão com açucar): [Como instalar o Ubuntu Linux no Windows 10 com o VirtualBox](https://fiodevida.com/como-instalar-o-ubuntu-linux-no-windows-10-com-o-virtualbox/)   
  3. WSL2 do Windows 10 (modo mamão com açucar, porém com pitada de sal): to-do: não encontrei um bom tutorial para esta solução.  
  
### Principais Referências:
- to-do
