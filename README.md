# Class Creator Script

This script creates the .cpp and .hpp of a basic class in Orthodox Cannonical Class Form. It implements the default constructor and destructor, the copy constructor and the copy assignment operator. Example:

```
./create_class Test
```
This gives us 2 files:
Test.hpp
```
#ifndef TEST_HPP
# define TEST_HPP

class Test
{
public:
	Test();
	Test(const Test &other);
	Test &operator=(const Test &other);
	~Test();
};

# ifndef COLOR_DEF
#  define COLOR_DEF
#  define NC "\033[0m"
#  define GREEN "\033[38;5;40m"
#  define YELOW "\033[38;5;220m"
#  define RED "\033[38;5;124m"
#  define BLUE "\033[38;5;32m"
#  define ORAN "\033[38;5;202m"
#  define PURP "\033[38;5;91m"
# endif

#endif

```
Test.cpp
```
#include "Test.hpp"

#include <iostream>

Test::Test(void)
{
	std::cout << GREEN "Test default constructor called" NC << std::endl;
}

Test::Test(const Test &other)
{
	std::cout << YELOW "Test copy constructor called" NC << std::endl;
	*this = other;
}

Test &Test::operator=(const Test &other)
{
	std::cout << YELOW "Test copy assignment operator called" NC << std::endl;
	return (*this);
}

Test::~Test()
{
	std::cout << RED "Test destrucutor called" NC << std::endl;
}

```
