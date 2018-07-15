# Toy Robot Simulator

## Thoughts

* use Thor for handle options parsing? Ruby Optparse should be enough.
* using Rspec for tests. Maybe Minitest?
* lib/robot.rb for handling robot logic
* lib/table.rb for handling table logic
* robot as a start point and controller
* maybe lib/display.rb for handling display logic (thinking of making a nice UI to display table with characters.)
```
    *********************
    * ^ *   *   *   *   *
    *********************
    *   * > *   *   *   *
    *********************
    *   *   * < *   *   *
    *********************
    *   *   *   * v *   *
    *********************
```
* input should be either from command line or file input

## Further Thoughts
* build a web app for display.(Just one page with input and table, maybe sinatra app. Rails is too big for it.)
* Package it as gem to use in the web app?
