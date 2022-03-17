
## Depurando com GDB

Para abrir o arquivo executável que se deseja verificar, utilize o seguinte comando:

```sh
gdb nome.x
```

Com isso entramos na Interface de Linha de Comando (CLI) do gdb. Aqui podemos executar nosso programa, parando em pontos específicos com breakpoints, examinando valores de variáveis e de registradores.

### Comandos basicos

- `quit`: sair do gdb
- `run`: executa o programa
  - tambem pode executar com argumentos: `run arg1 arg2 argn`
- `break label`: adiciona breakpoint em `label`
- `continue`: continua execução até finalização ou até o próximo breakpoint
- `print /f expr`: exibe o valor de uma expressão `expr` no formato `f`
  - formatos:
    - `x`: hexadecimal
    - `d`: decimal (sinalizado)
    - `u`: decimal (não sinalizado)
    - `o`: octal
    - `t`: binário (por alguma razão)
    - `a`: endereço (absoluto e relativo)
    - `c`: character
    - `f`: ponto-flutuante
  - exemplos:
    - `print /d var`: exibe o valor de var em decimal
    - `print /x &var`: exibe o endereço de var em hexadecimal

### Algumas dicas

Os comandos do gdb podem ser abreviados para as primeiras letras do seus nomes (se a abreviação não for ambígua). O comando `print /d var` pode ser abreviado para `p /d var`.

#### Mais comandos

> Inspecionar memória com `x`.

- `x /Nu expr`: examinar memória no endereço de `expr`
  - `N`: quantidade de unidades para exibir
  - `u`: unidade de tamanho
    - `b`: byte
    - `h`: half word (2 bytes)
    - `w`: word (4 bytes)
    - `g`: giant word (8 bytes)

> Opção nuclear para inspecionar registradores

```
info registers
# ou
i r
```

> Exibir uma linha de texto (prometo que existe uso pra isso).

```
echo Algum texto\n
```

#### Usando argumentos no GDB

> Iniciar gdb de forma silenciosa

```sh
gdb -q nome.x
# -q, --quiet ou --silent
```

> Iniciando gdb passando argumentos para o executável

```sh
gdb --args exec.x arg1 arg2 argn
```

> Executar comandos do gdb de um arquivo (útil para testes frequentes).


```sh
gdb -x arquivo_com_comandos exec.x
```

Podemos montar um roteiro de commandos para o gdb executar com nosso programa, definir breakpoints, iniciar a execução, exibir informações da memória ou registradores e exibir mensagens na saida (com echo).

### Mais recursos

* man-pages: `man gdb`
* documentação: `info gdb`
