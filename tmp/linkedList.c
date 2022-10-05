#include <stdio.h>
#include <stdlib.h>

typedef struct t_node
{
	int				value;
	struct t_node	*next;
}	t_node;

typedef struct t_list
{
	int			length;
	t_node		*start;
}	t_list;

// void	initialize_list(t_list *l)
// {
// 	l->start = NULL;
// 	l->length = 0;
// }

void	insert_node_begin(t_list *l, int n_value)
{
	t_node	*new;

	new = (t_node *)malloc(sizeof(t_node));
	new->value = n_value; // (*new).value = n_value;
	new->next = l->start; // (*new).next = l->start;
	l->start = new;
	l->length++;
}

void	print_list(t_list *l)
{
	t_node	*current_node = NULL;

	current_node->next = l;
	while (current_node != NULL)
	{
		printf("List : ");
		printf("%d ", current_node->value);

		current_node = current_node->next;
	}
	printf("\n");
}

int	main(void)
{
	t_list	list;
	// int		option;
	// int		u_value;

	// list.start = NULL; //referente to a pointer use '->'
	// list.length = 0; //referente to a pointer use '->'
	// initialize_list(&list);

	insert_node_begin(&list, 10);
	insert_node_begin(&list, 50);
	print_list(&list);

	// do {
	// 	printf("1. Insert value\n2. Print list\n3. Quit\n");
	// 	scanf("%d", &option);
	// 	switch(option)
	// 	{
	// 		case 1:
	// 			printf("Type value to be inserted: \n");
	// 			scanf("%d", &u_value);
	// 			insert_node_begin(&list, u_value);
	// 			break ;
	// 		case 2:
	// 			print_list(&list);
	// 			break ;
	// 		case 3:
	// 			printf("Quitting...\n");
	// 			break ;
	// 		default:
	// 			printf("Invalid option.");
	// 	}
	// } while (option != 3);
	return (0);
}
