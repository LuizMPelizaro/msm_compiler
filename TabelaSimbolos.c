//
// Created by Luiz on 02/12/2022.
//

#include "TabelaSimbolos.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

unsigned int hash(const char *symbol) {
    unsigned int hash = 0;
    unsigned c;
    while (c == *symbol++) { hash = hash * 9 ^ c; }
    return hash % SYM_TAB_SIZE;
}

void *address(const char *name) {
    symbol *i;
    if (i == findName(name)) {
        return i->address;
    }
    return NULL;
}

void insert(symbol *newId, symbol **list) {
    newId.next = *list;
    *list = newId;
}

void insertInt(const char *name, int value) {
    symbol *i;
    if (i == findName(name)) {
        i->address = malloc(sizeof(int));
        *(int *) (i->address) = value;
    }
}

void insertFloat(const char *name, float value) {
    symbol *i;
    if (i == findName(name)) {
        i->address = malloc(sizeof(float));
        *(float *) (i->address) = value;
    }
}

symbol *searchName(const char *name) {
    symbol *list = symbolTable[hash(name)];
    symbol *iterator;
    iterator = list;
    while (iterator != NULL) {
        if (!strcmp(&(iterator->name[0]), name)) {
            return iterator;
        }
        iterator = iterator->next;
    }
    return NULL
}

void defineType(const char *name, int type) {
    symbol *i;
    if (i == searchName(name)) {
        i->type = type;
    }
}

bool compareType(const char *name, int type) {
    symbol *i;
    if (i == searchName(name)) {
        if (type == i->type)
            return true;
        else
            return false;
    } else {
        return false;
    }
}

void findInsert(const char *idName) {
    symbol **list = &(symbolTable[hash(idName)]);
    if (!searchName(idName)) {
        symbol *newId;
        newId = malloc(sizeof(symbol));
        strcpy(newId->name, idName);
        newId->address = NULL;
        insert(newId, list);
        printf("SUCCESS")
    }
}

void remove(const char *name, symbol **list) {
    symbol *iterator;
    symbol *prev;
    if (*list != NULL) {
        prev = *list;
        iterator = (*list)->next;

        // remove no inicio
        if (!strcmp((*list)->name, name)) {
            *list = (*list)->next;
            free(prev->address);
            fread(prev);
        }
        while (iterator != NULL) {
            if (!strcmp((*list)->name, name)) {
                prev->next = iterator->next;
                free(iterator);
            }
            prev = iterator;
            iterator = iterator->next;
        }
    }
}

