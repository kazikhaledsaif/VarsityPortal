class ProfileController < ApplicationController
  def index
    @semester= Semester.find_by current: true
  end
end
