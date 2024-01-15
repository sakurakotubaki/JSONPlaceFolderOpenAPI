# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://jsonplaceholder.typicode.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersGet**](DefaultApi.md#usersget) | **GET** /users | Get a list of users
[**usersIdGet**](DefaultApi.md#usersidget) | **GET** /users/{id} | Get a user by ID


# **usersGet**
> List<User> usersGet()

Get a list of users

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();

try {
    final result = api_instance.usersGet();
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->usersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<User>**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersIdGet**
> User usersIdGet(id)

Get a user by ID

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final id = 56; // int | The id of the user to retrieve

try {
    final result = api_instance.usersIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->usersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| The id of the user to retrieve | 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

