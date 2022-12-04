//
// Created by Luiz on 02/12/2022.
//

#include "stdbool.h"

#define SYM_TAB_SIZE 999


struct symbol {
    int type;
    char name[16];
    void *address;
    struct symbol *next;
};
typedef struct symbol symbol;

#ifndef MSM_COMPILER_TABELASIMBOLOS_H
symbol *symbolTable[SYM_TAB_SIZE];
#define MSM_COMPILER_TABELASIMBOLOS_H
extern symbol *symbolTable[SYM_TAB_SIZE];
#endif //MSM_COMPILER_TABELASIMBOLOS_H

//Endereça o simbolo
void *address(const char *);

//Insere um float na lista.
void insertFloat(const char *, float);

// Insere um Inteiro na lista.
void insertInt(const char *name, int value)

//Compara o tipo
bool compareType(const char *, int);

//Define o tipo da variavel
void defineType(const char *, int);

//Remove um nó na lista que tenha o nome correspondente.
void remove(const char *name, symbol **list);

// busca por um nome na lista se não for encontrado , insere um nó com o nome no inicio da lista.
void findInsert(const char *name);

// retorna um ponteiro para o nó que contem o nome buscado.
symbol *searchName(const char *name);

//Retorna um indice para a tabela de sibolos.
unsigned int hash(const char *)