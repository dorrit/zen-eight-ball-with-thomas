class OutNotesController < ApplicationController
  def create
    out_note = OutNote.new(params)
    out_note.impart
    #some error checking would be great here
  end
end
