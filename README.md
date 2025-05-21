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

## Conclusion
On reflection it would have been interesting to make this work in a similar style to the game engine Godot where the responsability of each tick is inside every object or node. So in my case the Grid would have a tick method and the Robot would have a tick method.
To further go down that route each object could have children and can pass behaviours down to it's children. In my case again this would mean the Simulation would have a Grid child and the Grid would have a Robot child as the Robot always exists within the grid.
Ticks would then be performed top down from parent to child and each node would be responsible for it's behaviour and limitations.
This would move the logic of getting the users input into the Robot itself as it is the only object concerned about that procedure.
