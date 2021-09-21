defmodule SocketTesterWeb.Schema do
  use Absinthe.Schema
  alias SocketTesterWeb.Schema.Middleware

  query do
    # Fields go here
    @desc "Test Query"
    field :query_test, :test_payload do
      resolve &SocketTesterWeb.Resolvers.Test.test_query/3
    end
  end


  ######
  ##
  ## Mutation

  #
  # Just triggers a subscription broadcast
  #
  mutation do
    @desc "Test Subscription"
    field :subscription_test, :test_payload do
      resolve &SocketTesterWeb.Resolvers.Test.mutation/3
    end
  end



  ######
  ##
  ## Subscriptions
  ##
  subscription do
    @desc "Test Subscription"
    field :subscription_test, :test_payload do
      config fn args, _res_and_context ->
        {:ok, topic: "test_topic"}
      end
    end
  end


  ######
  ##
  ## Objects
  ##

  object :test_payload do
    field :message, :string
  end

end


defmodule SocketTesterWeb.Resolvers.Test do

  def test_query(_, _params, _context) do
    {:ok, %{message: "ok"}}
  end

  def mutation(_, _params, _context) do

    Absinthe.Subscription.publish(
      SocketTesterWeb.Endpoint,
      %{message: "ok"},
      subscription_test: "test_topic"
    )

    {:ok, %{message: "ok"}}
  end
end
