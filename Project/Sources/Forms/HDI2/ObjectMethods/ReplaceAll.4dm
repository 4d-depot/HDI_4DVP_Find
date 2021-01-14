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
Form:C1466.findResults.range:=VP Find($range; Form:C1466.searchValue; New object:C1471("all"; True:C214; "target"; $target; "flags"; $flags; "order"; $order); Form:C1466.replaceValue)

// displaying of the search results
If (Form:C1466.findResults.isEmpty())
	ALERT:C41("No result found")
Else 
	$style:=New object:C1471
	$style.backColor:="yellow"
	
	VP SET CELL STYLE(Form:C1466.findResults.range; $style)
	VP SHOW CELL(Form:C1466.findResults.firstRange(); vk position center:K89:15; vk position center:K89:15)
	VP SET ACTIVE CELL(Form:C1466.findResults.firstRange())
	VP FLUSH COMMANDS("ViewProArea")
	
	ALERT:C41(String:C10(Form:C1466.findResults.length())+" results replaced")
End if 