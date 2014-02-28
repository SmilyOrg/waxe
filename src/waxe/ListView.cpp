#include "HaxeAPI.h"
#include <wx/listctrl.h>

value wx_list_view_create(value inParams) {
	CreationParams params(inParams);
	wxListView *window = new wxListView(
		params.parent,
		params.id,
		params.position,
		params.size,
		params.flags,
		wxDefaultValidator,
		params.text
	);
	return WXToValue(window);
}
DEFINE_PRIM(wx_list_view_create, 1)


//value wx_list_view_append_column(value inListView, value inHeading, value inFormat, value inWidth) { 
value wx_list_view_append_column(value inListView, value inHeading) { 
	wxListView *listview;
	if (ValueToWX(inListView, listview)) {
		listview->AppendColumn(Val2Str(inHeading));
	}
	return alloc_null();
} 
DEFINE_PRIM(wx_list_view_append_column, 2);


value wx_list_view_insert_item(value inListView, value inIndex, value inLabel) { 
	wxListView *listview;
	if (ValueToWX(inListView, listview)) {
		return WXToValue(listview->InsertItem(Val2Int(inIndex), Val2Str(inLabel)));
	}
	return alloc_null();
} 
DEFINE_PRIM(wx_list_view_insert_item, 3);
