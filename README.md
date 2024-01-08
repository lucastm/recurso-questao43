# Recurso de anulação da questão 43 da prova Tipo 1 - Branca para Analista Legislativo - Informática Legislativa da Câmara dos Deputados

Este repositório contém o código Java da questão 43 e um shell script que realiza testes em diversos ambientes JAVA estáveis.

O código atualmente possui problemas e não é adequado para uma questão de múltipla escolha com as opções fornecidas.

## Problemas Identificados

O código atual apresenta problemas relacionados à concorrência e sincronização entre threads, o que resulta em resultados não determinísticos. Os problemas podem levar a saídas inesperadas durante a execução do código, comprometendo a validade dos testes.

As respostas possíveis para a questão de múltipla escolha são:

(A) 11221100

(B) 11102122

(C) 22112211

(D) 21100112

(E) 10112221

Porém durante a execução do teste, obtemos resultados inconsistentes com as opções de escolha apresentadas.

Exemplo de resultado inconsistente obtido:

23241312

## Como Rodar o Teste Usando GitHub Actions

Para rodar o teste usando GitHub Actions, siga os passos abaixo:

    Acesse a aba "Actions" no repositório no GitHub.
    Encontre o workflow chamado "Run Test on JVMs" e clique nele.
    Na página do workflow, clique no botão "Run workflow" no canto superior direito.
    Aguarde a execução do workflow e monitore os logs para ver os resultados.

Constate nos logs a ocorrência de discrepâncias no resultado obtido da execução do código da questão.
