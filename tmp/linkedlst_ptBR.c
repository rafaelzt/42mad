#include <stdio.h>
#include <stdlib.h>

// typedef: redefine um tipo de dado (apelido)

// redefinindo uma struct para encurtar o commando na declara´cao
typedef struct No
{
	int			valor;
	struct No	*proximo;
} No; // Apelido

typedef struct Lista
{
	No	*inicio;
	int	tam;
} Lista; // Apelido


// Insercao no inicio da lista
// Qualquer alteracao deixara de existir, para evitar isso usamos ponteiro de 
// lista
void	inserir_inicio(Lista *l, int valor)
{
	No	*novo; // pela mesma razao do ponteiro de lista;

	novo = (No *)malloc(sizeof(No));
	novo->valor = valor; // (*novo).valor = valor;
	novo->proximo = l->inicio; // (*novo).proximo = NULL;
	l->inicio = novo;
	l->tam++;
}

// Insercao no final da lista
void	inserir_final(Lista *l, int valor)
{	
	No	*no;
	No *novo;

	novo = (No *)malloc(sizeof(No));
	novo->valor = valor;
	novo->proximo = NULL; // ultimo valor
	if (l->inicio == NULL)
	{
		l->inicio = novo;
	}
	else
	{
		no = l->inicio;
		while (no->proximo != NULL)
			no = no->proximo;
		no->proximo = novo;
	}
	l->tam++;
}

// Imprimir a lista
void	imprimir(Lista *l)
{
	No *inicio = l->inicio;
	printf("-------------------------------\nTamanho da lista: %d\n", l->tam);
	while (inicio != NULL)
	{
		printf("%d ", inicio->valor);
		inicio = inicio->proximo;
	}
	printf("\n");
}

int	main(void)
{
	Lista	l;
	int		opcao, valor;

	// => Criar uma funcao para inicializar a lista
	l.inicio = NULL;
	l.tam = 0;

	do {
		printf("1. Inserir no inicio\n2. Inserir no final\n3. Imprimir\n4. Sair\n");;
		scanf("%d", &opcao);
		switch (opcao)
		{
			case 1:
				printf("Digite o numero que deseja inserir: ");
				scanf("%d", &valor);
				inserir_inicio(&l, valor);
				break ;
			case 2:
				printf("Digite o numero que deseja inserir: ");
				scanf("%d", &valor);
				inserir_final(&l, valor);
				break ;
			case 3:
				imprimir(&l);
				break ;
			case 4:
				printf("Saindo...\n");
				break ;
			default:
				printf("Opcao invalida!\n");
		}
	} while (opcao != 4);
	return (0);
}