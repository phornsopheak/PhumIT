module ApplicationHelper
  def full_title page_title = ""
    base_title = t("headers.title")
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def check_title
    if params[:controller] == "categories"
      case params[:id].to_i
      when 1
        t("tab_bar.news")
      when 2
        t("tab_bar.computer")
      when 3
        t("tab_bar.mobile")
      when 4
        t("tab_bar.more_knowledge")
      when 5
        t("tab_bar.electronic_device")
      end
    else
      case params[:id].to_i
      when 1
        t("sub_tab_bar.computer.operation_system")
      when 2
        t("sub_tab_bar.computer.hardware")
      when 3
        t("sub_tab_bar.computer.software")
      when 4
        t("sub_tab_bar.computer.tip_computer")
      when 5
        t("sub_tab_bar.mobile.window_phone")
      when 6
        t("sub_tab_bar.mobile.android")
      when 7
        t("sub_tab_bar.mobile.ios")
      when 8
        t("sub_tab_bar.mobile.tip_mobile")
      end
    end
  end

  def check_title_article
    params[:q].nil? ? t("tab_bar.all_articles") : t("headers.search_result")
  end
end
