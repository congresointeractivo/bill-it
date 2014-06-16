require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VotesController, pending: "not clear what methods it should have" do

  # This should return the minimal set of attributes required to create a valid
  # Vote. As you add validations to Vote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "voter_id" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VotesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all votes as @votes" do
      vote = Vote.create! valid_attributes
      get :index, {}, valid_session
      assigns(:votes).should eq([vote])
    end
  end

  describe "GET show" do
    it "assigns the requested vote as @vote" do
      vote = Vote.create! valid_attributes
      get :show, {:id => vote.to_param}, valid_session
      assigns(:vote).should eq(vote)
    end
  end

  describe "GET new" do
    it "assigns a new vote as @vote" do
      get :new, {}, valid_session
      assigns(:vote).should be_a_new(Vote)
    end
  end

  describe "GET edit" do
    it "assigns the requested vote as @vote" do
      vote = Vote.create! valid_attributes
      get :edit, {:id => vote.to_param}, valid_session
      assigns(:vote).should eq(vote)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Vote" do
        expect {
          post :create, {:vote => valid_attributes}, valid_session
        }.to change(Vote, :count).by(1)
      end

      it "assigns a newly created vote as @vote" do
        post :create, {:vote => valid_attributes}, valid_session
        assigns(:vote).should be_a(Vote)
        assigns(:vote).should be_persisted
      end

      it "redirects to the created vote" do
        post :create, {:vote => valid_attributes}, valid_session
        response.should redirect_to(Vote.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vote as @vote" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => { "voter_id" => "invalid value" }}, valid_session
        assigns(:vote).should be_a_new(Vote)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        post :create, {:vote => { "voter_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vote" do
        vote = Vote.create! valid_attributes
        # Assuming there are no other votes in the database, this
        # specifies that the Vote created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Vote.any_instance.should_receive(:update_attributes).with({ "voter_id" => "" })
        put :update, {:id => vote.to_param, :vote => { "voter_id" => "" }}, valid_session
      end

      it "assigns the requested vote as @vote" do
        vote = Vote.create! valid_attributes
        put :update, {:id => vote.to_param, :vote => valid_attributes}, valid_session
        assigns(:vote).should eq(vote)
      end

      it "redirects to the vote" do
        vote = Vote.create! valid_attributes
        put :update, {:id => vote.to_param, :vote => valid_attributes}, valid_session
        response.should redirect_to(vote)
      end
    end

    describe "with invalid params" do
      it "assigns the vote as @vote" do
        vote = Vote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        put :update, {:id => vote.to_param, :vote => { "voter_id" => "invalid value" }}, valid_session
        assigns(:vote).should eq(vote)
      end

      it "re-renders the 'edit' template" do
        vote = Vote.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Vote.any_instance.stub(:save).and_return(false)
        put :update, {:id => vote.to_param, :vote => { "voter_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vote" do
      vote = Vote.create! valid_attributes
      expect {
        delete :destroy, {:id => vote.to_param}, valid_session
      }.to change(Vote, :count).by(-1)
    end

    it "redirects to the votes list" do
      vote = Vote.create! valid_attributes
      delete :destroy, {:id => vote.to_param}, valid_session
      response.should redirect_to(votes_url)
    end
  end

end
