class Api::V1::TransactionsController < ApplicationController
  def create
    user = User.find(transaction_params[:user_id])
    transaction_service = TransactionService.new(user)
    transaction = transaction_service.add_transaction(
      amount: transaction_params[:amount],
      date: Time.current,
      is_foreign: transaction_params[:is_foreign]
    )

    render json: transaction, status: :created
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :amount, :is_foreign)
  end
end
