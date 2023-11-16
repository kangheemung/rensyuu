class Api::V1::UsersController <  ApplicationController
    skip_before_action :jwt_authenticate, only: [:create,:show]
    def create
        user=User.new(user_params)
        p"=============new======"
        p params
        p"==================="
        p "user variable"
        
        if user.save
            p"=============new======"
            p params
            p"==================="
            p "user variable"
           token=encode(user.id)
           render json: {status: 201, data: {name: user.name, email: user.email, token: token}}
        else   
           render json:{status: 400, error: "user can't save"}
        end   
    end
    def show 
        
        user = User.find_by(id: params[:id])

        posts =user.posts
        render json:{data:{ name: user.name,email: user.email,posts: posts}}
    end
    private
    def user_params
        params.require(:user).permit(:name,:email,:password, :password_confirmation)
    end
end
