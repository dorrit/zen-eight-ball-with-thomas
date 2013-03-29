class InNotesController < ApplicationController
  def create
    in_note = InNote.new(params)
    in_note.respond
    # render :json => in_note, :status => :created
    # respond to mailgun?
  end
end