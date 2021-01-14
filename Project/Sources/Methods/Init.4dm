//%attributes = {}

OBJECT SET ENABLED:C1123(*; "Next_Button"; False:C215)

OBJECT SET VISIBLE:C603(*; "ViewProArea"; False:C215)

Form:C1466.trace:=False:C215

Form:C1466.findResults:=cs:C1710.RangeReader.new()
Form:C1466.searchConditions:=cs:C1710.SearchConditions.new()

ARRAY TEXT:C222(SearchOrder; 0)
COLLECTION TO ARRAY:C1562(Form:C1466.searchConditions.ordersList; SearchOrder)
SearchOrder:=1