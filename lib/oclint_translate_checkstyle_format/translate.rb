require 'json'
require 'rexml/document'

module OclintTranslateCheckstyleFormat
  module Translate
    def parse(str)
      JSON.load(str)
    end

    def trans(json)
      doc = REXML::Document.new
      doc << REXML::XMLDecl.new('1.0', 'UTF-8')

      checkstyle = doc.add_element('checkstyle')
      if json.empty?
        OclintTranslateCheckstyleFormat::Translate.add_dummy(checkstyle)
        return doc
      end

      json['violation'].each do |result|
        file = checkstyle.add_element('file',
                                      'name' => result['path']
                                     )
        file.add_element('error',
                         'line' => result['startLine'],
                         'severity' => 'error',
                         'message' => OclintTranslateCheckstyleFormat::Translate.create_message(result)
                        )
      end

      doc
    end

    def self.add_dummy(checkstyle)
      checkstyle.add_element('file',
                             'name' => ''
                            )

      checkstyle
    end

    def self.create_message(result)
      "[#{result['category']}] #{result['rule']}\n#{result['message']}"
    end
  end
end
