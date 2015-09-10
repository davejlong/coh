module Admin::Controllers::Children
  class Index
    include Admin::Action

    expose :children

    def call(params)
      @children = ChildRepository.all
    end
  end
end
