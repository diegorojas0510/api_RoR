class HealthController < ApplicationController
  # método implementado para manejar nuestra petición
  def health
    # retornamos un json y le decimos a cual de nuestro payload estamos interesados en este caso el OK
    render json: {api: 'OK'}, status: :ok
    # las constantes en rails se pueden utilizar y este lo interpretara como un número en este casa el 200 y hay muchos más de acuerdo a lo que se necesite probar
  end
end