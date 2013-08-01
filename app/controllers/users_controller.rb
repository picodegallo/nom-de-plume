class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @stories = @user.stories.uniq

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        Twilio::SMS.create :to => @user.phone_number, :from => ENV["TWILIO_NUMBER"],
                         :body => "Thanks for signing up. When it's your turn, text to continue the story! Other commands: 'PASS' to skip, 'WTF' to see commands, and 'THE END' to end current story"
        session[:user_id] = @user.id
        format.html { redirect_to '/stories', notice: 'User was successfully created.' }
        # format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id]) 
    @story = Story.last 
    if @story.next_user_id == @user.id
      next_user = (User.all - [@user] - [User.first]).sample
      @story.next_user_id = next_user.id
      @story.save
      WriteToSite.push_message(nil,nil,User.find(@story.next_user_id).name)
      Twilio::SMS.create :to => next_user.phone_number, :from => ENV["TWILIO_NUMBER"],
                     :body => @story.lines.last.content
    end
    @user.destroy if @user == current_user
    redirect_to logout_path
    
  end
end

