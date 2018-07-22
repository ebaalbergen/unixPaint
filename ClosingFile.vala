using Gtk;

class ClosingFile
{
    Window window;

    public ClosingFile(string[] args)
    {
        try
        {
            var builder = new Builder ();
            builder.add_from_file("userInterfaces/closeDialog.ui");
            builder.connect_signals(this);
            window = builder.get_object ("window") as Dialog;
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
            case -9:
                Gtk.main_quit();
                break;
            case -8:
                // TODO: Make the application actually save the image. 
                print("Save");
                break;
            case -4:
                break;
        }
    }

    public void run()
    {
        window.show();
    }
}
