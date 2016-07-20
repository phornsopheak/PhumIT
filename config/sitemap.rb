# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.phumit.com"

SitemapGenerator::Sitemap.create do
  add '/home', :changefreq => 'daily', :priority => 0.9
  add '/contact_us', :changefreq => 'weekly'
end
