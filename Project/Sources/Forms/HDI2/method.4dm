Case of 
		
	: (FORM Event:C1606.code=On Load:K2:1)
		
		InitInfo
		
		Init
		
		
	: (FORM Event:C1606.code=On Page Change:K2:54)
		Case of 
			: (FORM Get current page:C276=2)
				OBJECT SET VISIBLE:C603(*; "ViewProArea"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Trace"; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(*; "ViewProArea"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Trace"; False:C215)
		End case 
		
End case 

