/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   variadicFunctions.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rzamolo- <rzamolo-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/07 16:24:29 by rzamolo-          #+#    #+#             */
/*   Updated: 2022/10/10 13:42:01 by rzamolo-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>

/*	void va_start(va_list ap, last);
       La  macro  va_start()  inicializa ap para su uso posterior por va_arg() y va_end(), y debe
       ser llamada en primer lugar.

       The argument last is the name of the last argument before the variable argument list, that
       is, the last argument of which the calling function knows the type.

       Because the address of this argument may be used in the va_start() macro, it should not be
       declared as a register variable, or as a function or an array type.
*/
/*	type va_arg(va_list ap, type);
       The va_arg()  macro expands to an expression that has the  type  and  value  of  the  next
       argument  in the call.  The argument ap is the va_list ap initialized by va_start().  Each
       call to va_arg()  modifies ap so that the  next  call  returns  the  next  argument.   The
       argument type is a type name specified so that the type of a pointer to an object that has
       the specified type can be obtained simply by adding a * to type.

       El primer uso de la macro va_arg() despues de va_start() devuelve el argumento tras  last.
       Invocaciones sucesivas devolverán los valores del resto de los argumentos.

       Si no hay próximo argumento, o si type no es compatible con el tipo del próximo argumento,
       se producirán errores impredecibles.

       Si ap es pasado a una función que usa va_arg(ap,type), el valor de  ap  es  indefinido  al
       regresar dicha función.
*/
/*	void va_end(va_list ap);
       A  cada  invocación  de  va_start()  le corresponde una invocación de va_end() en la misma
       función. Después de la llamada a va_end(ap) la variable ap  es  indefinida.  Son  posibles
       varios  recorridos de la lista, cada uno comprendido entre va_start() y va_end(). va_end()
       puede ser una macro o una función.
*/
/*	void va_copy(va_list dest, va_list src);
       The va_copy()  macro copies the (previously initialized) variable  argument  list  src  to
       dest.  The behavior is as if va_start()  were applied to dest with the same last argument,
       followed by the same number of va_arg()  invocations that was used to  reach  the  current
       state of src.

       Una  implementación  obvia  haría  que  va_list  fuera  un  puntero al marco de pila de la
       función.  En tal caso (con mucho el más común) no hay ningún problema con  una  asignación
       del tipo

           va_list aq = ap;

       Desafortunadamente,  también hay sistemas que lo implementan como un array de punteros (de
       longitud 1), y por tanto es necesario

           va_list aq;
           *aq = *ap;

       Finally, on systems where arguments are passed in  registers,  it  may  be  necessary  for
       va_start()  to allocate memory, store the arguments there, and also an indication of which
       argument is next, so that va_arg()  can step through the list.  Now va_end()  can free the
       allocated  memory  again.   To  accommodate this situation, C99 adds a macro va_copy(), so
       that the above assignment can be replaced by

           va_list aq;
           va_copy(aq, ap);
           ...
           va_end(aq);

       A cada invocación de va_copy() le corresponde una  invocación  de  va_end()  en  la  misma
       función.   Algunos  sistemas que no proporcionan va_copy() tienen __va_copy() en su lugar,
       puesto que ese fue el nombre usado en la propuesta inicial.
*/


int simple_printf(const char *format, ...)
{
    va_list ap; /* hold information about the variadic argument list. */
    int printed = 0; /* count of printed characters */

    va_start(ap, format); /* start variadic argument processing */

    while (*format != '\0') /* read format string until string terminator */
    {
        int f = 0;

        if (*format == '%')
        {
            ++format;
            switch(*format)
            {
                case 'c' :
                    f = printf("%d", va_arg(ap, int)); /* print next variadic argument, note type promotion from char to int */
                    break;
                case 'd' :
                    f = printf("%d", va_arg(ap, int)); /* print next variadic argument */
                    break;

                case 'f' :
                    f = printf("%f", va_arg(ap, double)); /* print next variadic argument */
                    break;
				case 's' :
					f = printf("%s", va_arg(ap, char *));
					break;
                default :
                    f = -1; /* invalid format specifier */
                    break;
            }
        }
        else
        {
            f = printf("%c", *format); /* print any other characters */
        }

        if (f < 0) /* check for errors */
        {
            printed = f;
            break;
        }
        else
        {
            printed += f;
        }
        ++format; /* move on to next character in string */
    }

    va_end(ap); /* end variadic argument processing */

    return printed;
}

int main ()
{
    int x = 40;
    int y = 0;
	char str[50] = "This is a test";

    y = simple_printf("There are %d characters in this sentence", x);
    simple_printf("\n%d were printed\n", y);
	simple_printf("%s\n", str);
}

// https://www.gnu.org/software/libc/manual/html_node/Argument-Macros.html
// https://azrael.digipen.edu/~mmead/www/Courses/CS120/VariadicFunctions.html
// https://www.learn-c.org/
// https://www.programiz.com/c-programming
// https://www.w3schools.in/c-tutorial/