require 'net/http'
require 'net/https'

module Uri
  TOKEN_URI = "https://open.feishu.cn/open-apis/auth/v3/tenant_access_token/internal"
  SEND_URI = "https://open.feishu.cn/open-apis/im/v1/messages?receive_id_type=user_id"
  APP_ID = "cli_a1cafb704d78100d"
  APP_SECRET = "9rAD98fnKlrHnGYFl7m27fZs5a06EY2l"
  HITOKOTO = "https://international.v1.hitokoto.cn"
  Time.zone = "Beijing"
end
