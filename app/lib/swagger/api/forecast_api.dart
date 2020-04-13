part of swagger.api;



class ForecastApi {
  final ApiClient apiClient;

  ForecastApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Get the 5 day weather
  ///
  /// 
  Future<ForecastGetResponse> forecastGet(double lat, double lon, String appid, String units) async {
    Object postBody = null;

    // verify required params are set
    if(lat == null) {
     throw new ApiException(400, "Missing required param: lat");
    }
    if(lon == null) {
     throw new ApiException(400, "Missing required param: lon");
    }
    if(appid == null) {
     throw new ApiException(400, "Missing required param: appid");
    }
    if(units == null) {
     throw new ApiException(400, "Missing required param: units");
    }

    // create path and map variables
    String path = "/forecast".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
      queryParams.addAll(_convertParametersForCollectionFormat("", "lat", lat));
      queryParams.addAll(_convertParametersForCollectionFormat("", "lon", lon));
      queryParams.addAll(_convertParametersForCollectionFormat("", "appid", appid));
      queryParams.addAll(_convertParametersForCollectionFormat("", "units", units));
    
    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      
      if(hasFields)
        postBody = mp;
    }
    else {
          }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return 
          apiClient.deserialize(response.body, 'ForecastGetResponse') as ForecastGetResponse ;
    } else {
      return null;
    }
  }
}
