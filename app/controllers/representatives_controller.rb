# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    index = params[:representative_id]
    @rep = Representative.find(index)
  end
end
