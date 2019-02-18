sub init()
  m.content_grid = m.top.FindNode("content_grid")
  m.header = m.top.FindNode("header")
  m.top.observeField("visible", "onVisibleChange")
end sub

sub onFeedChanged(obj)
  feed = obj.getData()
  m.header.text = feed.title
  postercontent = createObject("roSGNode","ContentNode")
  for each item in feed.results
    node = createObject("roSGNode","ContentNode")
    timespan = createObject("roTimespan")
    timespan.mark()
    
    node.streamformat = "hls"
    node.title = item.title
    node.url = "http://qthttp.appple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"
    node.description = item.overview
    node.release_date = item.release_date
    node.vote_average = item.original_language
    node.HDGRIDPOSTERURL = "http://image.tmdb.org/t/p/w500"+item.backdrop_path
    node.SHORTDESCRIPTIONLINE1 = item.title
    node.SHORTDESCRIPTIONLINE2 = item.release_date+":"+item.original_language

    time = timespan.totalMilliseconds()
    ? "Executed in "; time

    postercontent.appendChild(node)
  end for
  showpostergrid(postercontent)
end sub

sub showpostergrid(content)
  m.content_grid.content=content
  m.content_grid.visible=true
  m.content_grid.setFocus(true)
end sub

sub onVisibleChange()
  if m.top.visible = true then
    m.content_grid.setFocus(true)
  end if
end sub