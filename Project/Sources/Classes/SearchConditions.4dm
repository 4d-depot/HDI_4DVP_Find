// Manages conditions of search
Class constructor
	
	This:C1470.matchCase:=False:C215
	This:C1470.exactMatch:=False:C215
	This:C1470.wildCard:=False:C215
	
	This:C1470.targetText:=True:C214
	This:C1470.targetFormulas:=True:C214
	This:C1470.targetTags:=False:C215
	
	This:C1470.ordersList:=New collection:C1472("Search by columns"; "Search by rows")
	
	// calculates the flag for the search
Function flags()->$flags : Integer
	$flags:=0
	If (Not:C34(This:C1470.matchCase))
		$flags:=$flags+vk find flag ignore case:K89:108
	End if 
	If (This:C1470.exactMatch)
		$flags:=$flags+vk find flag exact match:K89:109
	End if 
	If (This:C1470.wildCard)
		$flags:=$flags+vk find flag use wild cards:K89:110
	End if 
	
	// calculates the target for the search
Function target()->$target : Integer
	$target:=0
	If (This:C1470.targetText)
		$target:=$target+vk find target text:K89:113
	End if 
	If (This:C1470.targetFormulas)
		$target:=$target+vk find target formula:K89:115
	End if 
	If (This:C1470.targetTags)
		$target:=$target+vk find target tag:K89:114
	End if 
	
	// calculates the order for the search
Function order($num : Integer)->$order : Integer
	If ($num=1)
		$order:=vk find order by columns:K89:112
	Else 
		$order:=vk find order by rows:K89:111
	End if 