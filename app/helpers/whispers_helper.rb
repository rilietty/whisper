module WhispersHelper
    def choose_new_or_edit
      if action_name == 'new' || action_name == 'confirm'
        confirm_whispers_path
      elsif action_name == 'edit'
        whispers_path
      end
    end
end
