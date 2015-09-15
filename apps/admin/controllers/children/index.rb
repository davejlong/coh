module Admin::Controllers::Children
  class Index
    include Admin::Action

    expose :children
    expose :error

    def call(params)
      @children = ChildRepository.all
      @error = params.get "error"
    end
  end
end
