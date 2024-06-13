#SCRIPT STARTS

if [ $# -ne 1 ]
then
	echo "Please, 1 class at a time"
	echo "USAGE: $0 NAME_OF_THE_CLASS"
	exit 1
fi

CLASS_NAME="${1}"

UPPER=$(echo "${CLASS_NAME}" | tr a-z A-Z)

#MAKING THE .HPP

printf \
"#ifndef ${UPPER}_HPP\n\
# define ${UPPER}_HPP\n\
\n\
class ${CLASS_NAME}\n\
{\n\
public:\n\
\t${CLASS_NAME}();\n\
\t${CLASS_NAME}(const ${CLASS_NAME} &other);\n\
\t${CLASS_NAME} &operator=(const ${CLASS_NAME} &other);\n\
\t~${CLASS_NAME}();\n\
};\n\
\n\
# ifndef COLOR_DEF\n\
#  define COLOR_DEF\n\
#  define NC \"\033[0m\"\n\
#  define GREEN \"\033[38;5;40m\"\n\
#  define YELOW \"\033[38;5;220m\"\n\
#  define RED \"\033[38;5;124m\"\n\
#  define BLUE \"\033[38;5;32m\"\n\
#  define ORAN \"\033[38;5;202m\"\n\
#  define PURP \"\033[38;5;91m\"\n\
# endif\n\
\n\
#endif\n" > "${CLASS_NAME}".hpp

#MAKING THE .CPP

printf \
"\
#include \"${CLASS_NAME}.hpp\"\n\
\n\
#include <iostream>\n\
\n\
${CLASS_NAME}::${CLASS_NAME}(void)\n\
{\n\
	std::cout << GREEN \"${CLASS_NAME} default constructor called\" NC << std::endl;\n\
}\n\
\n\
${CLASS_NAME}::${CLASS_NAME}(const ${CLASS_NAME} &other)\n\
{\n\
	std::cout << YELOW \"${CLASS_NAME} copy constructor called\" NC << std::endl;\n\
	*this = other;\n\
}\n\
\n\
${CLASS_NAME} &${CLASS_NAME}::operator=(const ${CLASS_NAME} &other)\n\
{\n\
	std::cout << YELOW \"${CLASS_NAME} copy assignment operator called\" NC << std::endl;\n\
	return (*this);\n\
}\n\
\n\
${CLASS_NAME}::~${CLASS_NAME}()\n\
{\n\
	std::cout << RED \"${CLASS_NAME} destrucutor called\" NC << std::endl;\n\
}\n" > "${CLASS_NAME}".cpp 

#SCRIPT ENDS
