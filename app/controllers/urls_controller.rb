require "digest"
class UrlsController < ApplicationController
  def index
    urls=Weblink.all
    render json:urls,status:200
  end
  def create
    weblink = Weblink.new(site_params)
      shortlink =Digest::MD5.hexdigest(weblink.link.to_s)[0..7]
      i=0
      while !(Weblink.find_by_short_link(shortlink).nil?) do
      i+=1
      shortlink=(Digest::MD5.hexdigest(weblink.link.to_s+i)[0..7])
      end
      weblink.short_link=shortlink
      weblink.click_count=0
      if weblink.save
        render json: {short_link:weblink.short_link},status:201
      else
      render status:400
      end
  end

  def show
    weblink = Weblink.find_by_short_link(params[:short_link])
    puts weblink

    if (weblink.nil? )
      render status:404
    else
      weblink.click_count+=1
      if weblink.save
             render json: {link:weblink.link},status:200
      else
          render status:400
      end

    end


  end

  def stats
    weblink = Weblink.find_by_short_link(params[:short_link])
    if (weblink.nil?)
      render status:404
    else
      render json: {click_count:weblink.click_count},status:200
    end
  end


  private
  def site_params
    params.require(:urls).permit(:link)

  end
end
