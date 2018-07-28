using Gtk;

class ClosingFile
{
    Window window;

    public signal void save_file_handler(bool saving);

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
        window.hide();
        save_file_handler(!(response_id == -9 || response_id == -4));
    }
}
