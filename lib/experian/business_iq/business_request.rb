module Experian
  module BusinessIq
    class BusinessRequest < Request

      def add_request_content(xml)
        xml.tag!('BusinessProfile') do
          add_subscriber(xml)

          add_business_applicant(xml)
          add_business_owner(xml)

          add_output_type(xml)
          add_vendor(xml)
        end
      end

      private

      def add_business_applicant(xml)
        xml.tag!('BusinessApplicant') do
          xml.tag!('BusinessName', @options[:business_name])
          xml.tag!('AlternateName', @options[:alternate_name] || @options[:business_name])
          xml.tag!('TaxId', @options[:tax_id]) if @options[:tax_id]
          xml.tag!('CurrentAddress') do
            xml.tag!('Street', @options[:street])
            xml.tag!('City', @options[:city])
            xml.tag!('State', @options[:state])
            xml.tag!('Zip', @options[:zip])
          end
          xml.tag!('AlternateAddress') do
            xml.tag!('Street', @options[:alt_street] || @options[:street])
            xml.tag!('City', @options[:alt_city] || @options[:city])
            xml.tag!('State', @options[:alt_state] || @options[:state])
            xml.tag!('Zip', @options[:alt_zip] || @options[:zip])
          end
        end
      end

      def add_business_owner(xml)
        xml.tag!('BusinessOwner') do
          xml.tag!('OwnerName') do
            xml.tag!('Surname', @options[:business_owner][:last_name])
            xml.tag!('First', @options[:business_owner][:first_name])
            xml.tag!('Middle', @options[:business_owner][:middle_name]) if @options[:business_owner][:middle_name]
            xml.tag!('Gen', @options[:business_owner][:generation_code]) if @options[:business_owner][:generation_code]
          end
          xml.tag!('SSN', @options[:business_owner][:ssn]) if @options[:business_owner][:ssn]
          xml.tag!('DOB', @options[:business_owner][:dob]) if @options[:business_owner][:dob]
          xml.tag!('CurrentAddress') do
            xml.tag!('Street', @options[:business_owner][:street])
            xml.tag!('City', @options[:business_owner][:city])
            xml.tag!('State', @options[:business_owner][:state])
            xml.tag!('Zip', @options[:business_owner][:zip])
          end
        end if @options[:business_owner]
      end

    end
  end
end
