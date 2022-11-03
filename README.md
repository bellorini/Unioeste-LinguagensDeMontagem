
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
  `sudo apt install nasm binutils build-essential git-all` (pressione enter)  
  

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
  > *"Mas eu nunca utilizei terminal Linux! Como faz?"*  
  
  _Aluno de computação que nunca utilizou terminal Linux._  
  **Possível solução:** [Curso gratuito introdutório de terminal Linux criado por Diego Mariano.](https://www.udemy.com/course/terminal-de-comandos-linux/) 

  > *"Ah não, terei que instalar o Linux?"*  
  
  _Aluno de computação que não usa Linux ou compatíveis._  
  **Possíveis soluções:**
  1. Bare-Metal Dual-Boot Windows + Linux (modo hardcore): [Como fazer dual-boot com Ubuntu e Windows 10 em seu notebook](https://blog.matheus.io/pt/tech/como-fazer-dual-boot-ubuntu-windows-10/) de Matheus Pratta.  
  2. Virtualização Linux Visitante + Windows Hospedeiro (modo mamão com açucar): [Como instalar o Ubuntu Linux no Windows 10 com o VirtualBox](https://fiodevida.com/como-instalar-o-ubuntu-linux-no-windows-10-com-o-virtualbox/)   
  3. WSL2 do Windows 10 (modo mamão com açucar, porém com pitada de sal): [Install Kali Linux – WSL 2 KEX GUI hacking setup](https://www.youtube.com/watch?v=_cXmx2qwWts) (sugestão do Vinicius Muller).  
  
  > *"Ok, Linux compatível instalado, mas o que faço com esse tal de git?"*  

  _Aluno de computação que não conheçe o git._  
  **Possíveis soluções:**  
  1. Básico e feio: use o botão **CODE** (em verde) no canto superior direito e faça o Download da pasta. Problema: terá que realizar um novo Download e substituir os arquivos antigos toda vez que alguma alteração acontecer.  
  2. Intermediário e bonito: instale o git e clone o repositório:  
     - Instale o git, no terminal Linux digite:  
     `sudo apt install git-all`  
     - Em seu computador local, crie um diretório e clone o diretório deste repositório com o comando:   
     `git clone https://github.com/bellorini/Unioeste-LinguagensDeMontagem.git` 
     - Muito bem, agora, toda vez que uma aula iniciar, entre no diretório local em seu computador e atualize o repositório com o comando:   
     `git pull origin main`  
        - Parabéns, seu diretório será atualizado automagicamente toda vez que executar este comando.  
  
  > *"Que legal, esse tal de git parece bacana! Onde posso saber mais sobre ele?"*  
  
  _Aluno de computação querendo ter um diferencial no seu currículo._  
  **Possível solução:** [Documentação oficial do github](https://docs.github.com/pt/get-started).  
  
  
### Principais Referências: (em construção)  
Livros, documentos e outros materiais que tem forte contribuição com a produção deste material.  
- [NASM - The Netwide Assembler](https://www.nasm.us/doc/)  
- [Intel® 64 and IA-32 ArchitecturesSoftware Developer’s Manual - all volumes](https://software.intel.com/content/www/us/en/develop/download/intel-64-and-ia-32-architectures-sdm-combined-volumes-1-2a-2b-2c-2d-3a-3b-3c-3d-and-4.html)  

#### Referências Secundárias: (em construção)
Artigos, livros ou outros documentos que de alguma forma contribuíram com algum ponto específico deste material.
- [Bartlett, Jonathan. Programming from the Ground Up. Rev 1.0. 2003](http://savannah.nongnu.org/projects/pgubook).  
(_Sintaxe AT&T, registradores, memória, funções._)  
- Hyde, Randall - The Art of Assembly Language by Randall Hyde. 2nd Edition.  
(_Sintaxe AT&T, representação de dados, acesso à memória, aritmética legada._)  
- Duntemann, Jeff. Assembly Language Step-by-Step Programming with Linux. 3rd Edition.  
(_Endianness, Flags, CMP, Jcc._)  
- Streib, James T. . Guide to Assembly Language A Concise Introduction. 1st Edition. 2011.  
(_Registradores, movimentação de dados, aritmética legada, operações lógicas._)
- Cavanagh, Joseph. X86 Assembly Language and C Fundamentals. 2013.  
(_Sistema de numeração, modos de endereçamento, pilha, macros, ponto-flutuante (FPUx87, não mais utilizada neste ano, porém, mantido para os curiosos)._)

