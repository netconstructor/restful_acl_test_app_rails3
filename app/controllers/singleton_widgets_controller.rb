class SingletonWidgetsController < InheritedResources::Base
  belongs_to :parent_widget, :singleton => true

end