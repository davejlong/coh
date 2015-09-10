module Admin::Controllers::Children
  class Show
    include Admin::Action

    expose :child

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      if params.valid?
        @child = ChildRepository.find params[:id]
        redirect_to routes.children_path(error: "Child not found.") if @child.nil?
      else
        redirect_to routes.children_path(error: "No child provided.")
      end
    end
  end
end
