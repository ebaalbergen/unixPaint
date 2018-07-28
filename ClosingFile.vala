using Gtk;

class ClosingFile
{
    Window window;

    public signal void saveFile();

    public ClosingFile(ref Window transient)
    {
        try
        {
            var builder = new Builder ();
            builder.add_from_file("userInterfaces/closeDialog.ui");
            builder.connect_signals(this);
            window = builder.get_object ("window") as Dialog;
            window.set_transient_for(transient);
            window.show_all();
        }
        catch
        {
            print("Error while opening window.");
        }
    }

    [CCode (instance_pos = -1)]
    public void response(Gtk.Dialog source, int response_id)
    {
        switch(response_id)
        {
            case -8:
                saveFile();
                break;
            case -4:
            case -9:
                Gtk.main_quit();
                break;
        }
    }

    public void run()
    {
        window.show();
    }
}
