module Admin::Controllers::Children
  class Show
    include Admin::Action

    expose :child

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      @child = ChildRepository.find params[:id]
      redirect_to routes.children_path(error: "404") if @child.nil?
    end
  end
end
