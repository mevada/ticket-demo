ActiveAdmin.register Ticket do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :status, :category_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :status, :category_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   
    # menu label: "My Ticket"
      menu priority: 1
     
      #menu if: proc{ current_user.can_edit_posts? }
      #menu parent: ["ticket-demo","Admin"]
      
      #scope_to :t1
      #scope_to 
      #scope_to :public , ->{where(status: 'public')}

      


end
