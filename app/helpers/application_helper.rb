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
    elsif params[:controller] == "static_page"
      t("tab_bar.about_us")
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

  def check_panel id
    case id
    when 1
      "danger"
    when 2
      "success"
    when 3
      "info"
    when 4
      "warning"
    when 5
      "primary"
    end
  end

  def check_icon id
    case id
    when 1
      "newspaper-o"
    when 2
      "computer"
    when 3
      "mobile"
    when 4
      "book"
    when 5
      "pie-chart"
    end
  end

  def check_title_sidebar id
    case id
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
  end

  def meta_share_fb
    params_controller = params[:controller]
    params_action = params[:action]
    @obj = []
    if params_controller == "articles"
      if params_action == "show"
        title = @article.title
        description = @article.description
        #image = request.protocol + request.host_with_port + @article.image_url
        url = request.original_url
      else
        url = request.original_url
      end
    elsif params_controller == "lists"
      if params_action == "show"
        title = @list.title
        description = @list.description
        image = request.protocol + request.host_with_port + @list.image_url
        url = request.original_url
      end
    elsif params_controller == "categories"
      if params_action == "show"
        title = @category.title
        description = @category.description
        image = request.protocol + request.host_with_port + @category.image_url
        url = request.original_url
      end
    else
      url = request.original_url
    end
    @obj << {title: title,
             description: sanitize(description, tags: []),
             image: image,
             url: url
            }
  end
end
