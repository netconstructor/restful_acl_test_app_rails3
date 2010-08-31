module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /obsolete page/
      "/parent_widgets/obsolete"
    when /the parent_widgets page/
      parent_widgets_path
    when /the new_parent_widget page/
      new_parent_widget_path
    when /the parent_widget page/
      parent_widget_path(:id => 1)
    when /the edit_parent_widget page/
      edit_parent_widget_path(:id => 1)
    when /the singleton_widget page/
      parent_widget_singleton_widget_path(:parent_widget_id => 1)
    when /the new_singleton_widget page/
      new_parent_widget_singleton_widget_path(:parent_widget_id => 1)
    when /the edit_singleton_widget page/
      edit_parent_widget_singleton_widget_path(:parent_widget_id => 1)
    when /the child_widgets page/
      parent_widget_child_widgets_path(:parent_widget_id => 1)
    when /the child_widget page/
      parent_widget_child_widget_path(:parent_widget_id => 1, :id => 1)
    when /the new_child_widget page/
      new_parent_widget_child_widget_path(:parent_widget_id => 1)
    when /the edit_child_widget page/
      edit_parent_widget_child_widget_path(:parent_widget_id => 1, :id => 1)
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
