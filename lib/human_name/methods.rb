class HumanName
  class Methods < Module
    def initialize(first_name_method = :first_name, last_name_method = :last_name)
      @__first_name_method  = first_name_method
      @__last_name_method   = last_name_method
    end

    def included(base)
      fname = @__first_name_method
      lname = @__last_name_method
      base.class_eval do
        define_method :human_name do
          first_name  = send fname
          last_name   = send lname
          HumanName.new(first_name, last_name)
        end

        extend Forwardable
        def_delegators :human_name, :full_name, :name_initials
      end
    end
  end
end
