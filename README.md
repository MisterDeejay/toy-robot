# Toy Robot Simulator

## Table of contents:

* [Description](./README.md#description)
  * [Task](./README.md#task)
  * [Constraints](./README.md#constraints)
* [Setup](./README.md#setup)
* [Running the app](./README.md#running-the-app)
* [Running the tests](./README.md#running-the-tests)
* [Development notes](./README.md#development-notes)

## Description

* The application is a simulation of a toy robot moving
on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table,
but must be prevented from falling to destruction.
Any movement that would result in the robot falling
from the table must be prevented, however further
valid movement commands must still be allowed.

## Task

Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` will put the toy robot on the table in position X,Y
and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
* The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
* The first valid command to the robot is a `PLACE` command,
after that, any sequence of commands may be issued, in any order,
including another `PLACE` command.
The application should discard all commands in the sequence
until a valid `PLACE `command has been executed.
* `MOVE` will move the toy robot one unit forward
in the direction it is currently facing.
* `LEFT` and `RIGHT` will rotate the robot 90 degrees
in the specified direction
without changing the position of the robot.
* `REPORT` will announce the X,Y and F of the robot.
This can be in any form, but standard output is sufficient.

* A robot that is not on the table can choose
to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.
* Input can be from a file, or from standard input, as the developer chooses.
* Provide test data to exercise the application.
* It is not required to provide any graphical output
showing the movement of the toy robot.

Please provide your source code, and any test code/data you using in developing your solution.

Please send your submission to us via email as a zip file or as a link to the repository hosting your code. (If you choose to keep your repository private, contact us about adding us to your repository as collaborators.) Do not create a pull request against this repository.

Please engineer your solution to a standard you consider suitable for production.

## Constraints

The toy robot must not fall off the table during movement.
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```


```
# Example c
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
# Output: 3,3,NORTH
```

## Acknowledgement

The Toy Robot Challenge was originally formulated by [Jon Eaves](https://twitter.com/joneaves)

## Setup

1. Make sure you have Ruby 2.3 installed in your machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:MisterDeejay/toy-robot.git```

4. Change to the app directory:

    ```cd toy-robot```

5. Install dependencies:

    ```bundle install```

You should be good to go from here on out!

### Running the app:
```ruby main.rb```

### Running the tests:
```bundle exec rspec spec/```

### Development notes:

* Since the application is about a robot that receives and executes commands, it was implemented using the Command Behavioral Pattern seen in <sup>1</sup>. It also makes it very easy to add new commands, like a `UP/DOWN` commands, that would allow the robot to use its newly upgraded jetpack.

* The State Behavioral Pattern<sup>2</sup> was used to decouple the state from the robot and to allow for run-time changes in the robot's behavior. So for example, when the robot is facing North, it will move +1 in the y-direction and -1 when facing South. It also gives us the flexibility to add a new z-state position to easily track our robot now that he is able to use his jetpack.

* Consider using the Factory Design Pattern<sup>3</sup> to create Commands. This would remove that responsibility from the `CommandParser` class, and it would no longer have to anticipate which class of object to create based on the command received. This would leave it to only be responsibile for parsing the incoming commands and handing them off to the correct factory class to actually handle the command creation.

<sup>1, 2, 3</sup> [Design Patterns (Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides)](https://en.wikipedia.org/wiki/Design_Patterns)
