module KepplerContactUs
  # Policy for Message model
  class MessagePolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end

    def upload?
      false
    end

    def update?
      false
    end

    def reply?
      true
    end

    def share?
      true
    end

    def favorite?
      true
    end

    def reload?
      true
    end

    def print?
      true
    end

    def read? 
      true
    end 

    def unread?
      true
    end 

    def favorites?
      true
    end
  end
end
