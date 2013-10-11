class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    p "I DID IT!!!"
    p "I DID IT!!!"

    p params
    p "!!!!!!!!!!!1"
    email = params[:user][:email]

    binding.pry
    p Mail::Address.new(email).domain


    p "I DID IT!!!"
    p "I DID IT!!!"
    p "I DID IT!!!"

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
end
