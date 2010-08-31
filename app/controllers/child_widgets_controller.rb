class ChildWidgetsController < InheritedResources::Base
  belongs_to :parent_widget
end