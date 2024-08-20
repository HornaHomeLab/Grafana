CREATE OR REPLACE FUNCTION invoke_request(url_path varchar, method varchar)
RETURNS json
AS $$
    import requests
    import json

    if method.lower() not in ["put","post"]:
        raise Exception("Invalid method")

    if method.lower() == "post":
        response = requests.post(url=url_path)
    elif method.lower() == "put":
        response = requests.put(url=url_path)
    
    if response.status_code in range(200,300):
        return json.dumps(
            {
                "status":"success",
                "called_url": url_path
            }
        )
    else:
        return json.dumps(
            {
				"status":"failure",
                "called_url": url_path,
                "message": response.json()
            }
        )
        

$$ LANGUAGE plpython3u;