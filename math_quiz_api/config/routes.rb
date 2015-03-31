Rails.application.routes.draw do
  resources :user_logins

  resources :quiz_sessions

  resources :schools

  resources :problems

  resources :quizzes

  resources :classrooms do
    resources :students
  end

  resources :teachers do
    resources :students
  end

  resources :students
end
