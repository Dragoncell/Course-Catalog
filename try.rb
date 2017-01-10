
require 'JSON'

class Try
@t = JSON.parse([{"independent_study":true,"name":"Senior Essay","subjects":[{"segment":"1","id":"1161-1900"}],"code":"ENVS 97A","credits":null,"description":"Usually offered every year.\nStaff","requirements":[]}])

printf @t

end
