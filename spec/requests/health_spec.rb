require 'rails_helper'
# prueba de integración y esta es una prueba typo request se tarda mas que las pruebas unitarias pero son muy recomendadas
RSpec.describe "Healt endpoint", type: :request do
  # probamos haciendo un get
  describe "GET /health" do
    # que debe ocurrir
    before { get '/health'}
    # las pruebas con rspec inician con it donde retornamos un ok que seria un 200
    it "should return OK" do
      # se escribe la prueba
      payload = JSON.parse(response.body)
      # la respuesta no puede ser vacia
      expect(payload).not_to be_empty
      expect(payload['api']).to eq('OK')
    end

    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end