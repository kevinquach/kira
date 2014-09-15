module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Kira").join(" - ")
      end
    end
  end

  GIT_BRANCH = "Branch: #{`git status | sed -n 1p`.split(" ").last}"
  GIT_REV = "Commit: #{`git rev-parse --short HEAD`.strip}"
  GIT_REV_DATE = `git log | sed -n 3p`
end
