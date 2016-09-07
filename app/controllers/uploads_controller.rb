class UploadsController < ApplicationController
  def index
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      render :plain => "Upload was successfully created: #{@upload.image}"
    else
      render :plain => "Fail to upload: #{@upload.errors}"
    end
  end

  def show
  end

  def post
    require 'net/http'
    params = {'text' => 'Insane'}
    uri = URI('http://localhost:3001/test_post_form')
    req = Net::HTTP.post_form(uri, params)
    puts req #show result
    render :plain => req.body
  end

  private
    # Upload callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:image)
    end
end
