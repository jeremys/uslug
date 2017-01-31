#!/bin/bash

# The regexp to print at the end
REGEXP=""

# Where the range started.
RANGE_START=-1

# Last unicode character counted.
LAST=-1

# Updates the regexp. If RANGE_START equals LAST, then there is no range and LAST should
# be used by itself. However, if RANGE_START does not equal LAST, then the REGEXP should include
# a ranged value.
function update_regexp {
  if [[ $RANGE_START == $LAST ]]
  then REGEXP="$REGEXP|\\u$LAST"
  else REGEXP="$REGEXP|[\\u$RANGE_START-\\u$LAST]"
  fi
}

# Read each line as a hex value.
while read -r HEX
do
  # Initialize RANGE_START AND LAST
  if [[ $RANGE_START == -1 && $LAST == -1 ]]
  then
    RANGE_START=$HEX
    LAST=$HEX
    continue
  fi

  # Check if LAST is not sequential with HEX. If it's not sequential, then
  # the regexp needs to be updated with either a range or the last value.
  if [[ $((0x$LAST + 1)) != $((0x$HEX)) ]]
  then
    update_regexp
    RANGE_START=$HEX
  fi

  LAST=$HEX
done

# After EOF, check updating the regexp one more time.
update_regexp

# Get rid of the initial separator
REGEXP="${REGEXP:1}"

echo "/$REGEXP/"
