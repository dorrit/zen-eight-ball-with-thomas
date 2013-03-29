class InNotesController < ApplicationController
  def create
    in_note = InNote.new(params[:in_note])
    in_note.respond
    render :json => in_note, :status => :created
  end
end