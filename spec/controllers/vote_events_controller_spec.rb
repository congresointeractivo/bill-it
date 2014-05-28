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

describe VoteEventsController do

  # This should return the minimal set of attributes required to create a valid
  # VoteEvent. As you add validations to VoteEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "startDate" => "2014-05-28 17:07:28" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VoteEventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vote_events as @vote_events" do
      vote_event = VoteEvent.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vote_events).should eq([vote_event])
    end
  end

  describe "GET show" do
    it "assigns the requested vote_event as @vote_event" do
      vote_event = VoteEvent.create! valid_attributes
      get :show, {:id => vote_event.to_param}, valid_session
      assigns(:vote_event).should eq(vote_event)
    end
  end

  describe "GET new" do
    it "assigns a new vote_event as @vote_event" do
      get :new, {}, valid_session
      assigns(:vote_event).should be_a_new(VoteEvent)
    end
  end

  describe "GET edit" do
    it "assigns the requested vote_event as @vote_event" do
      vote_event = VoteEvent.create! valid_attributes
      get :edit, {:id => vote_event.to_param}, valid_session
      assigns(:vote_event).should eq(vote_event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VoteEvent" do
        expect {
          post :create, {:vote_event => valid_attributes}, valid_session
        }.to change(VoteEvent, :count).by(1)
      end

      it "assigns a newly created vote_event as @vote_event" do
        post :create, {:vote_event => valid_attributes}, valid_session
        assigns(:vote_event).should be_a(VoteEvent)
        assigns(:vote_event).should be_persisted
      end

      it "redirects to the created vote_event" do
        post :create, {:vote_event => valid_attributes}, valid_session
        response.should redirect_to(VoteEvent.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vote_event as @vote_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        VoteEvent.any_instance.stub(:save).and_return(false)
        post :create, {:vote_event => { "startDate" => "invalid value" }}, valid_session
        assigns(:vote_event).should be_a_new(VoteEvent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VoteEvent.any_instance.stub(:save).and_return(false)
        post :create, {:vote_event => { "startDate" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vote_event" do
        vote_event = VoteEvent.create! valid_attributes
        # Assuming there are no other vote_events in the database, this
        # specifies that the VoteEvent created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VoteEvent.any_instance.should_receive(:update_attributes).with({ "startDate" => "2014-05-28 17:07:28" })
        put :update, {:id => vote_event.to_param, :vote_event => { "startDate" => "2014-05-28 17:07:28" }}, valid_session
      end

      it "assigns the requested vote_event as @vote_event" do
        vote_event = VoteEvent.create! valid_attributes
        put :update, {:id => vote_event.to_param, :vote_event => valid_attributes}, valid_session
        assigns(:vote_event).should eq(vote_event)
      end

      it "redirects to the vote_event" do
        vote_event = VoteEvent.create! valid_attributes
        put :update, {:id => vote_event.to_param, :vote_event => valid_attributes}, valid_session
        response.should redirect_to(vote_event)
      end
    end

    describe "with invalid params" do
      it "assigns the vote_event as @vote_event" do
        vote_event = VoteEvent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VoteEvent.any_instance.stub(:save).and_return(false)
        put :update, {:id => vote_event.to_param, :vote_event => { "startDate" => "invalid value" }}, valid_session
        assigns(:vote_event).should eq(vote_event)
      end

      it "re-renders the 'edit' template" do
        vote_event = VoteEvent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VoteEvent.any_instance.stub(:save).and_return(false)
        put :update, {:id => vote_event.to_param, :vote_event => { "startDate" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vote_event" do
      vote_event = VoteEvent.create! valid_attributes
      expect {
        delete :destroy, {:id => vote_event.to_param}, valid_session
      }.to change(VoteEvent, :count).by(-1)
    end

    it "redirects to the vote_events list" do
      vote_event = VoteEvent.create! valid_attributes
      delete :destroy, {:id => vote_event.to_param}, valid_session
      response.should redirect_to(vote_events_url)
    end
  end

end