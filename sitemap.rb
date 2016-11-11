require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.phumit.com'
SitemapGenerator::Sitemap.create do
  add '/home', :changefreq => 'daily', :priority => 0.9
  add '/about_us', :changefreq => 'weekly'
  add '/category/1', :changefreq => 'weekly'
  add '/category/2', :changefreq => 'weekly'
  add '/category/3', :changefreq => 'weekly'
  add '/category/4', :changefreq => 'weekly'
  add '/category/5', :changefreq => 'weekly'
  add '/category/6', :changefreq => 'weekly'
  add '/category/7', :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
