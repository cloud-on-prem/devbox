module Overcommit::Hook::PreCommit
  class AnsibleNoCurrentTags < Base
    def run
      errors = []

      applicable_files.each do |file|
        if File.read(file) =~ /\-\scurrent/
          errors << "#{file}: contains 'current' tags"
        end
      end

      return :fail, errors.join("\n") if errors.any?

      :pass
    end
  end
end
