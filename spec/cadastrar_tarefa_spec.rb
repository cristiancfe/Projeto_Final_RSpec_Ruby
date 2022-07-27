describe 'cadastrar tarefa',:cadastrar_tarefa do
  def login(field_email, field_password)
      @body = {
          session: {
            email: field_email,
            password: field_password
          }
      }.to_json 
      @login = Login.post('/sessions', body: @body) 
      puts @login.body  
  end
  context 'tarefas'do
    before { login('ji.mcdermott@frami.info', '123456') }

      it 'com sucesso' do
        @header = {
          'Content-Type': 'application/json',
          Accept: 'application/vnd.tasksmanager.v2',
          Authorization:  @login.parsed_response['data']['attributes']['auth-token']
         
        }

        @body = {
          task: {
            title:'Criar Tarefa',
            description: 'Descrição da tarefa criei tarefa ',
            deadLine: '2022-07-26 21:31:00',
            done: true
          }
        }.to_json

        @tarefas = Cadastrar.post('/tasks', body: @body, headers: @header)
        puts @tarefas.body
      end
  end
end