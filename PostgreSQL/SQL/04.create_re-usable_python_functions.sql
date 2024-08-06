CREATE OR REPLACE FUNCTION post_request(url_path varchar)
RETURNS json
AS $$
    import requests
    import json

    response = requests.post(url=url_path)
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