### How to setup

```sh-session
$ bundle install
```

### How to run the app

```sh-session
$ ruby main.rb
```

### How to run specs

```sh-session
$ bundle exec rake test
```

---

# Challenge Description

## Requirements

* Please write a Ruby program that:

  * Assembles a collection of student records by parsing data from 3 different files
  * Displays the collection 3 times, sorted 3 different ways

* Besides a testing framework ([RSpec](https://github.com/rspec/rspec), [test-unit](https://github.com/test-unit/test-unit), or [minitest](https://github.com/seattlerb/minitest)), please only use Ruby and [its standard library](http://www.ruby-doc.org/stdlib/) (i.e. no other gems)

* Please use the latest stable version of Ruby MRI

* What we're looking for here is clear code and elegant object-oriented design. Please avoid imperative or functional coding style, or an overly clever solution.

## Criteria

The qualities we're looking for are:

  * **Clarity**: is the intent of the code obvious? Are things named appropriately?
  * **Maintainability:**: how flexible is the code?
  * **Testability**: is it easy to test the code? _Please demonstrate with unit tests._

## Input

Please copy the data files (in the `data` folder) and include them in your solution.

  * comma.txt
    * Delimiter: `,`
    * Order: `first_name`, `campus`, `date_of_birth`

  * dollar.txt
    * Delimiter: `$`
    * Order: `campus`, `date_of_birth`, `last_name`, `first_name`

  * pipe.txt
    * Delimiter: `|`
    * Order: `date_of_birth`, `first_name`, `campus`

## Output

Please display the collection in two different ways:

  1. Sorted by `campus` (ascending), then by `first_name` (ascending)
  2. Sorted by `date_of_birth` (ascending)

Below is the expected output when running the program:

```
Output 1:
Mckayla Atlanta 5/29/1986
Anika Hong Kong 5/5/1965
Timmothy London 10/2/1964
Rhiannon Los Angeles 10/4/1974
Matteo Melbourne 2/14/1962
Elliot New York City 4/3/1947
Filomena New York City 1/24/1980
Stacy New York City 1/22/1964
Rigoberto San Francisco 12/1/1962

Output 2:
Mckayla Atlanta 5/29/1986
Filomena New York City 1/24/1980
Rhiannon Los Angeles 10/4/1974
Anika Hong Kong 5/5/1965
Timmothy London 10/2/1964
Stacy New York City 1/22/1964
Rigoberto San Francisco 12/1/1962
Matteo Melbourne 2/14/1962
Elliot New York City 4/3/1947
```

[See a shortened version of this challenge](https://github.com/rafaelsales/code-challenges/tree/students-shortened-version/students)
