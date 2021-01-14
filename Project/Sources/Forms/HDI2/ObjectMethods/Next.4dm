If (Not:C34(Form:C1466.findResults.isEmpty()))
	$style:=New object:C1471
	$style.backColor:=Null:C1517
	VP SET CELL STYLE(Form:C1466.findResults.range; $style)
End if 

If (Form:C1466.trace)
	TRACE:C157
End if 

// Calculate the range where the search is performed at
If (Bool:C1537(Form:C1466.inSelection))
	$range:=VP Get selection("ViewProArea")
Else 
	$range:=VP All("ViewProArea")
End if 

// Calculation of the condition of search 
$target:=Form:C1466.searchConditions.target()
$flags:=Form:C1466.searchConditions.flags()
$order:=Form:C1466.searchConditions.order(SearchOrder)
// Adds start cell for the search
$afterColumn:=Form:C1466.findResults.column()
$afterRow:=Form:C1466.findResults.row()
Form:C1466.findResults.range:=VP Find($range; Form:C1466.searchValue; New object:C1471("target"; $target; "flags"; $flags; "order"; $order; "afterColumn"; $afterColumn; "afterRow"; $afterRow))

// displaying of the search results
If (Form:C1466.findResults.isEmpty())
	ALERT:C41("No result found")
Else 
	$style:=New object:C1471
	$style.backColor:="yellow"
	
	VP SET CELL STYLE(Form:C1466.findResults.range; $style)
	VP SHOW CELL(Form:C1466.findResults.firstRange(); vk position center:K89:15; vk position center:K89:15)
	If (Bool:C1537(Form:C1466.inSelection))
		VP SET SELECTION($range)
	Else 
		VP SET ACTIVE CELL(Form:C1466.findResults.firstRange())
	End if 
End if 

