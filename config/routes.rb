Rails.application.routes.draw do
  resources :birds, only: [:index, :show, :create, :update]
   def update
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
  patch "/birds/:id/like", to: "birds#increment_likes"
end
