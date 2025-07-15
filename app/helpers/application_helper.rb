module ApplicationHelper
  def admin_tool(class_name = "", element = "div", **options, &block)
    return unless authenticated?

    content = capture(&block)

    content_tag(element,
                content,
                class: "#{"p-2" unless element == "span"} border-2 border-dashed border-orange-500 bg-orange-500/10 w-fit h-fit #{class_name}",
                **options)
  end
end
