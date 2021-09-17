class SurveysController < ApplicationController
  def index
    @nhearts = Survey.where(gesture: "heart").count()
    @nlikes = Survey.where(gesture: "like").count()
    @nhappies = Survey.where(gesture: "smile").count()
    @nfrowns = Survey.where(gesture: "frown").count()
  end

  def thankyou
    @nhearts = Survey.where(gesture: "heart").count()
    @nlikes = Survey.where(gesture: "like").count()
    @nhappies = Survey.where(gesture: "smile").count()
    @nfrowns = Survey.where(gesture: "frown").count()
  end

  def create
    #Capturamos el parametro
    gesturex = params[:gesture]
    ###
    #Inicio registrar en base de datos
    ###
    #Creamos instancia
    obj = Survey.new
    #Asignamos el valor al campo de la tabla
    obj.gesture = gesturex

    #Esta linea almacena en la db
    obj.save
    ###
    #Fin Registrar en base de datos
    ###

    pusher = Pusher::Client.new(
      app_id: '1268275',
      key: '59b9304c77cd580eb83a',
      secret: '1b1bfb0bd0e8777e10a3',
      cluster: 'mt1',
      encrypted: true
    )

    noti = {}
    noti[gesturex] = Survey.where(gesture: gesturex).count

    
    pusher.trigger('my-channel', 'my-event', {
      message: noti
    })

    redirect_to  :surveys_thankyou    
  end
end

