This project is incomplete - do not use
=======================================

Usage
=====

###Clock in:
```
timesheet in
```

###Clock out:
```
timesheet out
```

### Advanced syntax

#### Specify a previous / future time
Requires 24 hour time in the format of: "YYYY-MM-DDD HH:MM:SS +/-{timezone offset in hours}.
For example, clock in at 3:22:31 pm on February 18th, 2014, in PST:
```
timesheet in --time "2014-02-18 15:22:31 -0800"
```

### View timesheet
Open `~/.timesheet/timesheet`
