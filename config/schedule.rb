every 2.hours do
  rake "rss:update"
end

every 1.day do
  rake "twitter:top"
  rake "twitter:new"
  rake "blast:blast"
end
