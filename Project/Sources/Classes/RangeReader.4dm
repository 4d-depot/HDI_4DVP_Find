// Analyses the information includes in a range
Class constructor($range : Object)
	
	If ($range=Null:C1517)
		This:C1470.range:=New object:C1471  // Original range
	Else 
		This:C1470.range:=$range  // Original range
	End if 
	
	// Number of the 'current' range 
	This:C1470._rangeNumber:=0
	
	// Returns the number of ranges present in the original range
Function length()->$length : Integer
	$length:=This:C1470.range.ranges.length
	
	// Verify if the original range contains at least one range
Function isEmpty()->$isEmpty : Boolean
	$isEmpty:=(This:C1470.length()=0)
	
	// Returns the row number of the current range
Function row()->$row : Integer
	If (This:C1470.isEmpty())
		$row:=0
	Else 
		$row:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].row)
	End if 
	
	// Returns the column number of the current range
Function column()->$column : Integer
	If (This:C1470.isEmpty())
		$column:=0
	Else 
		$column:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].column)
	End if 
	
	// Returns the sheet number of the current range
Function sheet()->$sheet : Integer
	If (This:C1470.isEmpty())
		$sheet:=-1
	Else 
		$sheet:=Num:C11(This:C1470.range.ranges[This:C1470._rangeNumber].sheet)
	End if 
	
	// Returns the first range
Function firstRange()->$range : Object
	If (This:C1470.length()>1)
		$range:=This:C1470._splitRange(0)
	Else 
		$range:=This:C1470.range
	End if 
	
	// Exports a range according the position of a specific range in the original one
Function _splitRange($pos : Integer)->$newRange : Object
	$newRange:=New object:C1471("area"; This:C1470.range.area; "ranges"; New collection:C1472())
	$newRange.ranges.push(This:C1470.range.ranges[$pos])