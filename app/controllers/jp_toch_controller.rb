require 'open-uri'

class ChineseToJapanes
  attr_accessor :chinese ,:japanese
  def initialize(c,j)
    @chinese = c
    @japanese = j
  end
end

class JpTochController < ApplicationController
	def MyIndex
    Mtest.all
  end

  def getList
 respond_to do |format|
      Rails.logger.warn "getList"
      #format.html
      format.js
    end
  end

  def GetData(data)
    url = "http://www.weblio.jp/content/"+URI::encode(data)
    uri = URI(url)
    response = open(uri, "r:utf-8").read.encode("utf-8", :invalid => :replace, :undef => :replace)


    if(!response.index('<li>訓読み：'))
      hiragana = ["查不到"]
      #flash[:warning] = "有一些查不到的東西!!"
    else
      #if(key)
      key = response[response.index('<li>訓読み：'),500]
      endPos = key[8..500].index('</li>')
      #if(!endPos)
      #	endPos = key[8..592].index('<a')
      #end
      if(endPos)
        hiragana = key[8..8+endPos-1]
      else
        hiragana = ["查不到"]
      end
      res = hiragana.split("、").map! do |i|
        key2 = i.index('class=')
        Rails.logger.warn "key2:"+key2.to_s
        if(key2)
          key2+=16
          i = i[key2..i.index('</a>')-1]
          #Rails.logger.warn "enter key2!!" + i
        else
          i = i
        end
      end
      isExitHen = response.index('［漢字］')
      if(isExitHen)
        hen = response[isExitHen-20,100]
        if(hen)
          hen = hen[hen.index('>')+1..hen.index('［漢字］')-1]
          res.push ("漢字:" + hen)
        end
      end
      #Rails.logger.warn "kk:"+hiragana
      res
    end
    #response.body
    #hresponse.body
  end

  def index
    Rails.logger.warn "Index in!"
    @map = Array.new
    if(params['chinese'])
      UserInput.new(:input=>params['chinese']).save
      params['chinese'].split("").each do |i|
      	historyData = MapTable.find_by_chinese(i)
      	if(historyData)
      		@map.push ChineseToJapanes.new i,historyData[:japanese].split(",")
      	else
      		hiragana = GetData(i)
      		MapTable.new(:chinese=>i, :japanese=>hiragana.join(",")).save
       		@map.push ChineseToJapanes.new i,hiragana
    	end
        #flash[:warning] = ""
      end
    end
    respond_to do |format|
      Rails.logger.warn "Response"
      format.html
      format.js
    end
  end
end
