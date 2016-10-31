class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)

     find_by(email: email, password: password)
     # if @cuenta != nil
     #   if @cuenta.password == password
     #    @cuenta.name
     #   end  
     # else
     #    @cuenta = "nil"
     # end

      # @acceso = User.find_by(email: email).try(:authenticate, password)
      # @acceso

    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
  end
end
