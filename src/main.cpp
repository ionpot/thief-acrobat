#include <wx/wx.h>
#include <wx/xrc/xmlres.h>

class App : public wxApp
{
public:
	virtual bool OnInit();
};

wxIMPLEMENT_APP(App);

bool App::OnInit()
{
	auto xml = wxXmlResource::Get();
	xml->InitAllHandlers();
	xml->Load("resource.xrc");

	wxDialog dlg;
	if (xml->LoadDialog(&dlg, NULL, "SimpleDialog"))
		dlg.ShowModal();

	return true;
}
