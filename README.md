# Robot Simulator

This is a simple simulation of a robot moving on a square grid. The robot can be placed, rotated, moved, and asked to report its current position.

## Available Commands

### `PLACE X,Y,FACING`

Places the robot on the grid at position `(X, Y)` facing a direction (`NORTH`, `SOUTH`, `EAST`, `WEST`).

```bash
PLACE 0,0,NORTH
```

> Note: This must be the first command before any other actions are valid.

### `MOVE`

Moves the robot one unit forward in the direction it is currently facing.

```bash
MOVE
```

### `LEFT`

Rotates the robot 90 degrees to the left (counter-clockwise) without changing its position.

```bash
LEFT
```

### `RIGHT`

Rotates the robot 90 degrees to the right (clockwise) without changing its position.

```bash
RIGHT
```

### `REPORT`

Prints the current coordinates and direction of the robot to the console in the format:

```bash
X,Y,FACING
```

Example:

```
2,3,EAST
```

### `EXIT`

Exits the simulation.


## Invalid Commands

Any command not listed above will print:

```
Invalid command. Please try again.
```

If you don't enter a command for 30 seconds the simulation will timeout and exit.

## Running the Simulation

Ensure you have Ruby installed(created with ruby 3.4.4), then start the simulation script (`start.rb`) and enter commands interactively.

```bash
ruby start.rb
```

## Example Session

```bash
ruby start.rb
```

Enter each command individually
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
EXIT
```

**Output:**

```
3,3,NORTH
```
