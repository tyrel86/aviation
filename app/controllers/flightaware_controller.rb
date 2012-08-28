
class FlightawareController < ApplicationController
  def flightmap
    client = get_client

    result2 = client.request(:map_flight_ex) do
    soap.body = {
       :faFlightID => params[:tailnumber],
     # :faFlightID => "UAL815-1342319452-airline-0074",
      :show_data_blocks => true,
      :show_airports => true,
      :airports_expand_view => true
    }
    end
    @base64_image = result2.to_hash[:map_flight_ex_results][:map_flight_ex_result]
  end
  
  def flightinfo
    client = get_client

    result2 = client.request(:flight_info_ex) do
    soap.body = {
      :ident => params[:ident],
      :howMany => 20
    }
    end
    @flights = result2.to_hash[:flight_info_ex_results][:flight_info_ex_result][:flights]
  end

  private

  def get_client
    client = Savon::Client.new do
      wsdl.document = SOAP_URL
      http.auth.basic USERNAME, API_KEY
    end
    client
  end

end
