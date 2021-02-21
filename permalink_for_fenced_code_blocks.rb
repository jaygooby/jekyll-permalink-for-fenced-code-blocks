# Gets all your fenced code blocks and adds a unique ID to them so you can link to
# them and copy with clipboardjs.com etc
#
# If you don't want a <button> element to which you can hook ClipboardJS,
# start jekyll with a NO_COPY_BUTTON env variable like this:
#
# NO_COPY_BUTTON=1 jekyll -w

require "nokogiri"

module CodePermalinksGenerator

  Jekyll::Hooks.register :documents, :post_render do |page|

    num_ids = 0

    doc = Nokogiri::HTML(page.output)
    doc.css(".highlight code").each do |code_tag|
      num_ids += 1
      code_tag.set_attribute("id", "code-#{num_ids}")
      code_tag.before "<button class='copy-code' aria-label='Copy to your clipboard' data-clipboard-target='#code-#{num_ids}'>📋 copy to clipboard</button>" unless ENV["NO_COPY_BUTTON"]
    end
    page.output = doc.to_html
  end

end
