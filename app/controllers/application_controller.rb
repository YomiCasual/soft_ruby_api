class ApplicationController < ActionController::API

    def api_response(status: :ok, message:nil, data:nil)

        result = {
            status: status || :ok,
            data: data,
            message: message,
        }

        return render json:  result, status: status
    end
end
