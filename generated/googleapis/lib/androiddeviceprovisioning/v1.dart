// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: camel_case_types
// ignore_for_file: comment_references
// ignore_for_file: file_names
// ignore_for_file: library_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: unnecessary_brace_in_string_interps
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unnecessary_string_interpolations

/// Android Device Provisioning Partner API - v1
///
/// Automates Android zero-touch enrollment for device resellers, customers, and
/// EMMs.
///
/// For more information, see <https://developers.google.com/zero-touch/>
///
/// Create an instance of [AndroidProvisioningPartnerApi] to access these
/// resources:
///
/// - [CustomersResource]
///   - [CustomersConfigurationsResource]
///   - [CustomersDevicesResource]
///   - [CustomersDpcsResource]
/// - [OperationsResource]
/// - [PartnersResource]
///   - [PartnersCustomersResource]
///   - [PartnersDevicesResource]
///   - [PartnersVendorsResource]
///     - [PartnersVendorsCustomersResource]
library androiddeviceprovisioning.v1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// Automates Android zero-touch enrollment for device resellers, customers, and
/// EMMs.
class AndroidProvisioningPartnerApi {
  final commons.ApiRequester _requester;

  CustomersResource get customers => CustomersResource(_requester);
  OperationsResource get operations => OperationsResource(_requester);
  PartnersResource get partners => PartnersResource(_requester);

  AndroidProvisioningPartnerApi(http.Client client,
      {core.String rootUrl =
          'https://androiddeviceprovisioning.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class CustomersResource {
  final commons.ApiRequester _requester;

  CustomersConfigurationsResource get configurations =>
      CustomersConfigurationsResource(_requester);
  CustomersDevicesResource get devices => CustomersDevicesResource(_requester);
  CustomersDpcsResource get dpcs => CustomersDpcsResource(_requester);

  CustomersResource(commons.ApiRequester client) : _requester = client;

  /// Lists the user's customer accounts.
  ///
  /// Request parameters:
  ///
  /// [pageSize] - The maximum number of customers to show in a page of results.
  /// A number between 1 and 100 (inclusive).
  ///
  /// [pageToken] - A token specifying which result page to return.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListCustomersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListCustomersResponse> list({
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/customers';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return CustomerListCustomersResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class CustomersConfigurationsResource {
  final commons.ApiRequester _requester;

  CustomersConfigurationsResource(commons.ApiRequester client)
      : _requester = client;

  /// Creates a new configuration.
  ///
  /// Once created, a customer can apply the configuration to devices.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that manages the configuration. An API
  /// resource name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> create(
    Configuration request,
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/configurations';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Configuration.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Deletes an unused configuration.
  ///
  /// The API call fails if the customer has devices with the configuration
  /// applied.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The configuration to delete. An API resource name in
  /// the format `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. If
  /// the configuration is applied to any devices, the API call fails.
  /// Value must have pattern `^customers/\[^/\]+/configurations/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(
    core.String name, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'DELETE',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Empty.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Gets the details of a configuration.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The configuration to get. An API resource name in the
  /// format `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
  /// Value must have pattern `^customers/\[^/\]+/configurations/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> get(
    core.String name, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Configuration.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Lists a customer's configurations.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that manages the listed configurations.
  /// An API resource name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListConfigurationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListConfigurationsResponse> list(
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/configurations';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return CustomerListConfigurationsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Updates a configuration's field values.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Output only. The API resource name in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. Assigned by
  /// the server.
  /// Value must have pattern `^customers/\[^/\]+/configurations/\[^/\]+$`.
  ///
  /// [updateMask] - Required. The field mask applied to the target
  /// `Configuration` before updating the fields. To learn more about using
  /// field masks, read
  /// \[FieldMask\](/protocol-buffers/docs/reference/google.protobuf#fieldmask)
  /// in the Protocol Buffers documentation.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> patch(
    Configuration request,
    core.String name, {
    core.String updateMask,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if (updateMask != null) {
      _queryParams['updateMask'] = [updateMask];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'PATCH',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Configuration.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class CustomersDevicesResource {
  final commons.ApiRequester _requester;

  CustomersDevicesResource(commons.ApiRequester client) : _requester = client;

  /// Applies a Configuration to the device to register the device for
  /// zero-touch enrollment.
  ///
  /// After applying a configuration to a device, the device automatically
  /// provisions itself on first boot, or next factory reset.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device. An API resource
  /// name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> applyConfiguration(
    CustomerApplyConfigurationRequest request,
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:applyConfiguration';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Empty.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Gets the details of a device.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The device to get. An API resource name in the format
  /// `customers/[CUSTOMER_ID]/devices/[DEVICE_ID]`.
  /// Value must have pattern `^customers/\[^/\]+/devices/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Device].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Device> get(
    core.String name, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Device.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Lists a customer's devices.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the devices. An API resource
  /// name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [pageSize] - The maximum number of devices to show in a page of results.
  /// Must be between 1 and 100 inclusive.
  ///
  /// [pageToken] - A token specifying which result page to return.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListDevicesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListDevicesResponse> list(
    core.String parent, {
    core.String pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = [pageSize];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/devices';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return CustomerListDevicesResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Removes a configuration from device.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device in the format
  /// `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> removeConfiguration(
    CustomerRemoveConfigurationRequest request,
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:removeConfiguration';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Empty.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Unclaims a device from a customer and removes it from zero-touch
  /// enrollment.
  ///
  /// After removing a device, a customer must contact their reseller to
  /// register the device into zero-touch enrollment again.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device. An API resource
  /// name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> unclaim(
    CustomerUnclaimDeviceRequest request,
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:unclaim';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Empty.fromJson(_response as core.Map<core.String, core.dynamic>);
  }
}

class CustomersDpcsResource {
  final commons.ApiRequester _requester;

  CustomersDpcsResource(commons.ApiRequester client) : _requester = client;

  /// Lists the DPCs (device policy controllers) that support zero-touch
  /// enrollment.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that can use the DPCs in configurations.
  /// An API resource name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern `^customers/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListDpcsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListDpcsResponse> list(
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/dpcs';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return CustomerListDpcsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class OperationsResource {
  final commons.ApiRequester _requester;

  OperationsResource(commons.ApiRequester client) : _requester = client;

  /// Gets the latest state of a long-running operation.
  ///
  /// Clients can use this method to poll the operation result at intervals as
  /// recommended by the API service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern `^operations/.*$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> get(
    core.String name, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Operation.fromJson(_response as core.Map<core.String, core.dynamic>);
  }
}

class PartnersResource {
  final commons.ApiRequester _requester;

  PartnersCustomersResource get customers =>
      PartnersCustomersResource(_requester);
  PartnersDevicesResource get devices => PartnersDevicesResource(_requester);
  PartnersVendorsResource get vendors => PartnersVendorsResource(_requester);

  PartnersResource(commons.ApiRequester client) : _requester = client;
}

class PartnersCustomersResource {
  final commons.ApiRequester _requester;

  PartnersCustomersResource(commons.ApiRequester client) : _requester = client;

  /// Creates a customer for zero-touch enrollment.
  ///
  /// After the method returns successfully, admin and owner roles can manage
  /// devices and EMM configs by calling API methods or using their zero-touch
  /// enrollment portal. The customer receives an email that welcomes them to
  /// zero-touch enrollment and explains how to sign into the portal.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The parent resource ID in the format
  /// `partners/[PARTNER_ID]` that identifies the reseller.
  /// Value must have pattern `^partners/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Company].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Company> create(
    CreateCustomerRequest request,
    core.String parent, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/customers';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Company.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Lists the customers that are enrolled to the reseller identified by the
  /// `partnerId` argument.
  ///
  /// This list includes customers that the reseller created and customers that
  /// enrolled themselves using the portal.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [pageSize] - The maximum number of results to be returned. If not
  /// specified or 0, all the records are returned.
  ///
  /// [pageToken] - A token identifying a page of results returned by the
  /// server.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListCustomersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListCustomersResponse> list(
    core.String partnerId, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/customers';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return ListCustomersResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class PartnersDevicesResource {
  final commons.ApiRequester _requester;

  PartnersDevicesResource(commons.ApiRequester client) : _requester = client;

  /// Claims a device for a customer and adds it to zero-touch enrollment.
  ///
  /// If the device is already claimed by another customer, the call returns an
  /// error.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ClaimDeviceResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ClaimDeviceResponse> claim(
    ClaimDeviceRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:claim';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return ClaimDeviceResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Claims a batch of devices for a customer asynchronously.
  ///
  /// Adds the devices to zero-touch enrollment. To learn more, read
  /// \[Long‑running batch
  /// operations\](/zero-touch/guides/how-it-works#operations).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> claimAsync(
    ClaimDevicesRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:claimAsync';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Operation.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Finds devices by hardware identifiers, such as IMEI.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [FindDevicesByDeviceIdentifierResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<FindDevicesByDeviceIdentifierResponse> findByIdentifier(
    FindDevicesByDeviceIdentifierRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:findByIdentifier';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return FindDevicesByDeviceIdentifierResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Finds devices claimed for customers.
  ///
  /// The results only contain devices registered to the reseller that's
  /// identified by the `partnerId` argument. The customer's devices purchased
  /// from other resellers don't appear in the results.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [FindDevicesByOwnerResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<FindDevicesByOwnerResponse> findByOwner(
    FindDevicesByOwnerRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:findByOwner';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return FindDevicesByOwnerResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Gets a device.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The device API resource name in the format
  /// `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
  /// Value must have pattern `^partners/\[^/\]+/devices/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Device].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Device> get(
    core.String name, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Device.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Updates reseller metadata associated with the device.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [metadataOwnerId] - Required. The owner of the newly set metadata. Set
  /// this to the partner ID.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [deviceId] - Required. The ID of the device.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [DeviceMetadata].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<DeviceMetadata> metadata(
    UpdateDeviceMetadataRequest request,
    core.String metadataOwnerId,
    core.String deviceId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (metadataOwnerId == null) {
      throw core.ArgumentError('Parameter metadataOwnerId is required.');
    }
    if (deviceId == null) {
      throw core.ArgumentError('Parameter deviceId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$metadataOwnerId') +
        '/devices/' +
        commons.Escaper.ecapeVariableReserved('$deviceId') +
        '/metadata';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return DeviceMetadata.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Unclaims a device from a customer and removes it from zero-touch
  /// enrollment.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The ID of the reseller partner.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> unclaim(
    UnclaimDeviceRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:unclaim';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Empty.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Unclaims a batch of devices for a customer asynchronously.
  ///
  /// Removes the devices from zero-touch enrollment. To learn more, read
  /// \[Long‑running batch
  /// operations\](/zero-touch/guides/how-it-works#operations).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The reseller partner ID.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> unclaimAsync(
    UnclaimDevicesRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:unclaimAsync';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Operation.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Updates the reseller metadata attached to a batch of devices.
  ///
  /// This method updates devices asynchronously and returns an `Operation` that
  /// can be used to track progress. Read \[Long‑running batch
  /// operations\](/zero-touch/guides/how-it-works#operations).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Required. The reseller partner ID.
  /// Value must have pattern `^\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> updateMetadataAsync(
    UpdateDeviceMetadataInBatchRequest request,
    core.String partnerId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    core.String _body;
    if (request != null) {
      _body = convert.json.encode(request.toJson());
    }
    if (partnerId == null) {
      throw core.ArgumentError('Parameter partnerId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:updateMetadataAsync';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return Operation.fromJson(_response as core.Map<core.String, core.dynamic>);
  }
}

class PartnersVendorsResource {
  final commons.ApiRequester _requester;

  PartnersVendorsCustomersResource get customers =>
      PartnersVendorsCustomersResource(_requester);

  PartnersVendorsResource(commons.ApiRequester client) : _requester = client;

  /// Lists the vendors of the partner.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The resource name in the format
  /// `partners/[PARTNER_ID]`.
  /// Value must have pattern `^partners/\[^/\]+$`.
  ///
  /// [pageSize] - The maximum number of results to be returned.
  ///
  /// [pageToken] - A token identifying a page of results returned by the
  /// server.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListVendorsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListVendorsResponse> list(
    core.String parent, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/vendors';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return ListVendorsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class PartnersVendorsCustomersResource {
  final commons.ApiRequester _requester;

  PartnersVendorsCustomersResource(commons.ApiRequester client)
      : _requester = client;

  /// Lists the customers of the vendor.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The resource name in the format
  /// `partners/[PARTNER_ID]/vendors/[VENDOR_ID]`.
  /// Value must have pattern `^partners/\[^/\]+/vendors/\[^/\]+$`.
  ///
  /// [pageSize] - The maximum number of results to be returned.
  ///
  /// [pageToken] - A token identifying a page of results returned by the
  /// server.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListVendorCustomersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListVendorCustomersResponse> list(
    core.String parent, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/customers';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return ListVendorCustomersResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

/// Request message to claim a device on behalf of a customer.
class ClaimDeviceRequest {
  /// The ID of the customer for whom the device is being claimed.
  ///
  /// Required.
  core.String customerId;

  /// The device identifier of the device to claim.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The metadata to attach to the device.
  ///
  /// Optional.
  DeviceMetadata deviceMetadata;

  /// The section type of the device's provisioning record.
  ///
  /// Required.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  ClaimDeviceRequest();

  ClaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey('customerId')) {
      customerId = _json['customerId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('deviceMetadata')) {
      deviceMetadata = DeviceMetadata.fromJson(
          _json['deviceMetadata'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customerId != null) {
      _json['customerId'] = customerId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (deviceMetadata != null) {
      _json['deviceMetadata'] = deviceMetadata.toJson();
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    return _json;
  }
}

/// Response message containing device id of the claim.
class ClaimDeviceResponse {
  /// The device ID of the claimed device.
  core.String deviceId;

  /// The resource name of the device in the format
  /// `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
  core.String deviceName;

  ClaimDeviceResponse();

  ClaimDeviceResponse.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceName')) {
      deviceName = _json['deviceName'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceName != null) {
      _json['deviceName'] = deviceName;
    }
    return _json;
  }
}

/// Request to claim devices asynchronously in batch.
///
/// Claiming a device adds the device to zero-touch enrollment and shows the
/// device in the customer's view of the portal.
class ClaimDevicesRequest {
  /// A list of device claims.
  ///
  /// Required.
  core.List<PartnerClaim> claims;

  ClaimDevicesRequest();

  ClaimDevicesRequest.fromJson(core.Map _json) {
    if (_json.containsKey('claims')) {
      claims = (_json['claims'] as core.List)
          .map<PartnerClaim>((value) => PartnerClaim.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (claims != null) {
      _json['claims'] = claims.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// A reseller, vendor, or customer in the zero-touch reseller and customer
/// APIs.
class Company {
  /// Email address of customer's users in the admin role.
  ///
  /// Each email address must be associated with a Google Account.
  ///
  /// Optional.
  core.List<core.String> adminEmails;

  /// The ID of the company.
  ///
  /// Assigned by the server.
  ///
  /// Output only.
  core.String companyId;

  /// The name of the company.
  ///
  /// For example _XYZ Corp_. Displayed to the company's employees in the
  /// zero-touch enrollment portal.
  ///
  /// Required.
  core.String companyName;

  /// The API resource name of the company.
  ///
  /// The resource name is one of the following formats: *
  /// `partners/[PARTNER_ID]/customers/[CUSTOMER_ID]` *
  /// `partners/[PARTNER_ID]/vendors/[VENDOR_ID]` *
  /// `partners/[PARTNER_ID]/vendors/[VENDOR_ID]/customers/[CUSTOMER_ID]`
  /// Assigned by the server.
  ///
  /// Output only.
  core.String name;

  /// Input only.
  ///
  /// Email address of customer's users in the owner role. At least one
  /// `owner_email` is required. Each email address must be associated with a
  /// Google Account. Owners share the same access as admins but can also add,
  /// delete, and edit your organization's portal users.
  ///
  /// Required.
  core.List<core.String> ownerEmails;

  /// Whether any user from the company has accepted the latest Terms of Service
  /// (ToS).
  ///
  /// See TermsStatus.
  ///
  /// Output only.
  /// Possible string values are:
  /// - "TERMS_STATUS_UNSPECIFIED" : Default value. This value should never be
  /// set if the enum is present.
  /// - "TERMS_STATUS_NOT_ACCEPTED" : None of the company's users have accepted
  /// the ToS.
  /// - "TERMS_STATUS_ACCEPTED" : One (or more) of the company's users has
  /// accepted the ToS.
  /// - "TERMS_STATUS_STALE" : None of the company's users has accepted the
  /// current ToS but at least one user accepted a previous ToS.
  core.String termsStatus;

  Company();

  Company.fromJson(core.Map _json) {
    if (_json.containsKey('adminEmails')) {
      adminEmails = (_json['adminEmails'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('companyId')) {
      companyId = _json['companyId'] as core.String;
    }
    if (_json.containsKey('companyName')) {
      companyName = _json['companyName'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('ownerEmails')) {
      ownerEmails = (_json['ownerEmails'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('termsStatus')) {
      termsStatus = _json['termsStatus'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (adminEmails != null) {
      _json['adminEmails'] = adminEmails;
    }
    if (companyId != null) {
      _json['companyId'] = companyId;
    }
    if (companyName != null) {
      _json['companyName'] = companyName;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (ownerEmails != null) {
      _json['ownerEmails'] = ownerEmails;
    }
    if (termsStatus != null) {
      _json['termsStatus'] = termsStatus;
    }
    return _json;
  }
}

/// A configuration collects the provisioning options for Android devices.
///
/// Each configuration combines the following: * The EMM device policy
/// controller (DPC) installed on the devices. * EMM policies enforced on the
/// devices. * Metadata displayed on the device to help users during setup.
/// Customers can add as many configurations as they need. However, zero-touch
/// enrollment works best when a customer sets a default configuration that's
/// applied to any new devices the organization purchases.
class Configuration {
  /// The name of the organization.
  ///
  /// Zero-touch enrollment shows this organization name to device users during
  /// device provisioning.
  ///
  /// Required.
  core.String companyName;

  /// The ID of the configuration.
  ///
  /// Assigned by the server.
  ///
  /// Output only.
  core.String configurationId;

  /// A short name that describes the configuration's purpose.
  ///
  /// For example, _Sales team_ or _Temporary employees_. The zero-touch
  /// enrollment portal displays this name to IT admins.
  ///
  /// Required.
  core.String configurationName;

  /// The email address that device users can contact to get help.
  ///
  /// Zero-touch enrollment shows this email address to device users before
  /// device provisioning. The value is validated on input.
  ///
  /// Required.
  core.String contactEmail;

  /// The telephone number that device users can call, using another device, to
  /// get help.
  ///
  /// Zero-touch enrollment shows this number to device users before device
  /// provisioning. Accepts numerals, spaces, the plus sign, hyphens, and
  /// parentheses.
  ///
  /// Required.
  core.String contactPhone;

  /// A message, containing one or two sentences, to help device users get help
  /// or give them more details about what’s happening to their device.
  ///
  /// Zero-touch enrollment shows this message before the device is provisioned.
  core.String customMessage;

  /// The JSON-formatted EMM provisioning extras that are passed to the DPC.
  core.String dpcExtras;

  /// The resource name of the selected DPC (device policy controller) in the
  /// format `customers/[CUSTOMER_ID]/dpcs / * `.
  ///
  /// To list the supported DPCs, call `customers.dpcs.list`.
  ///
  /// Required.
  core.String dpcResourcePath;

  /// Whether this is the default configuration that zero-touch enrollment
  /// applies to any new devices the organization purchases in the future.
  ///
  /// Only one customer configuration can be the default. Setting this value to
  /// `true`, changes the previous default configuration's `isDefault` value to
  /// `false`.
  ///
  /// Required.
  core.bool isDefault;

  /// The API resource name in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
  ///
  /// Assigned by the server.
  ///
  /// Output only.
  core.String name;

  Configuration();

  Configuration.fromJson(core.Map _json) {
    if (_json.containsKey('companyName')) {
      companyName = _json['companyName'] as core.String;
    }
    if (_json.containsKey('configurationId')) {
      configurationId = _json['configurationId'] as core.String;
    }
    if (_json.containsKey('configurationName')) {
      configurationName = _json['configurationName'] as core.String;
    }
    if (_json.containsKey('contactEmail')) {
      contactEmail = _json['contactEmail'] as core.String;
    }
    if (_json.containsKey('contactPhone')) {
      contactPhone = _json['contactPhone'] as core.String;
    }
    if (_json.containsKey('customMessage')) {
      customMessage = _json['customMessage'] as core.String;
    }
    if (_json.containsKey('dpcExtras')) {
      dpcExtras = _json['dpcExtras'] as core.String;
    }
    if (_json.containsKey('dpcResourcePath')) {
      dpcResourcePath = _json['dpcResourcePath'] as core.String;
    }
    if (_json.containsKey('isDefault')) {
      isDefault = _json['isDefault'] as core.bool;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (companyName != null) {
      _json['companyName'] = companyName;
    }
    if (configurationId != null) {
      _json['configurationId'] = configurationId;
    }
    if (configurationName != null) {
      _json['configurationName'] = configurationName;
    }
    if (contactEmail != null) {
      _json['contactEmail'] = contactEmail;
    }
    if (contactPhone != null) {
      _json['contactPhone'] = contactPhone;
    }
    if (customMessage != null) {
      _json['customMessage'] = customMessage;
    }
    if (dpcExtras != null) {
      _json['dpcExtras'] = dpcExtras;
    }
    if (dpcResourcePath != null) {
      _json['dpcResourcePath'] = dpcResourcePath;
    }
    if (isDefault != null) {
      _json['isDefault'] = isDefault;
    }
    if (name != null) {
      _json['name'] = name;
    }
    return _json;
  }
}

/// Request message to create a customer.
class CreateCustomerRequest {
  /// The company data to populate the new customer.
  ///
  /// Must contain a value for `companyName` and at least one `owner_email`
  /// that's associated with a Google Account. The values for `companyId` and
  /// `name` must be empty.
  ///
  /// Required.
  Company customer;

  CreateCustomerRequest();

  CreateCustomerRequest.fromJson(core.Map _json) {
    if (_json.containsKey('customer')) {
      customer = Company.fromJson(
          _json['customer'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customer != null) {
      _json['customer'] = customer.toJson();
    }
    return _json;
  }
}

/// Request message for customer to assign a configuration to device.
class CustomerApplyConfigurationRequest {
  /// The configuration applied to the device in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
  ///
  /// Required.
  core.String configuration;

  /// The device the configuration is applied to.
  ///
  /// Required.
  DeviceReference device;

  CustomerApplyConfigurationRequest();

  CustomerApplyConfigurationRequest.fromJson(core.Map _json) {
    if (_json.containsKey('configuration')) {
      configuration = _json['configuration'] as core.String;
    }
    if (_json.containsKey('device')) {
      device = DeviceReference.fromJson(
          _json['device'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (configuration != null) {
      _json['configuration'] = configuration;
    }
    if (device != null) {
      _json['device'] = device.toJson();
    }
    return _json;
  }
}

/// Response message of customer's listing configuration.
class CustomerListConfigurationsResponse {
  /// The configurations.
  core.List<Configuration> configurations;

  CustomerListConfigurationsResponse();

  CustomerListConfigurationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('configurations')) {
      configurations = (_json['configurations'] as core.List)
          .map<Configuration>((value) => Configuration.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (configurations != null) {
      _json['configurations'] =
          configurations.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Response message for listing my customers.
class CustomerListCustomersResponse {
  /// The customer accounts the calling user is a member of.
  core.List<Company> customers;

  /// A token used to access the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  CustomerListCustomersResponse();

  CustomerListCustomersResponse.fromJson(core.Map _json) {
    if (_json.containsKey('customers')) {
      customers = (_json['customers'] as core.List)
          .map<Company>((value) =>
              Company.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customers != null) {
      _json['customers'] = customers.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

/// Response message of customer's liting devices.
class CustomerListDevicesResponse {
  /// The customer's devices.
  core.List<Device> devices;

  /// A token used to access the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  CustomerListDevicesResponse();

  CustomerListDevicesResponse.fromJson(core.Map _json) {
    if (_json.containsKey('devices')) {
      devices = (_json['devices'] as core.List)
          .map<Device>((value) =>
              Device.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (devices != null) {
      _json['devices'] = devices.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

/// Response message of customer's listing DPCs.
class CustomerListDpcsResponse {
  /// The list of DPCs available to the customer that support zero-touch
  /// enrollment.
  core.List<Dpc> dpcs;

  CustomerListDpcsResponse();

  CustomerListDpcsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('dpcs')) {
      dpcs = (_json['dpcs'] as core.List)
          .map<Dpc>((value) =>
              Dpc.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dpcs != null) {
      _json['dpcs'] = dpcs.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Request message for customer to remove the configuration from device.
class CustomerRemoveConfigurationRequest {
  /// The device to remove the configuration from.
  ///
  /// Required.
  DeviceReference device;

  CustomerRemoveConfigurationRequest();

  CustomerRemoveConfigurationRequest.fromJson(core.Map _json) {
    if (_json.containsKey('device')) {
      device = DeviceReference.fromJson(
          _json['device'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (device != null) {
      _json['device'] = device.toJson();
    }
    return _json;
  }
}

/// Request message for customer to unclaim a device.
class CustomerUnclaimDeviceRequest {
  /// The device to unclaim.
  ///
  /// Required.
  DeviceReference device;

  CustomerUnclaimDeviceRequest();

  CustomerUnclaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey('device')) {
      device = DeviceReference.fromJson(
          _json['device'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (device != null) {
      _json['device'] = device.toJson();
    }
    return _json;
  }
}

/// An Android device registered for zero-touch enrollment.
class Device {
  /// The provisioning claims for a device.
  ///
  /// Devices claimed for zero-touch enrollment have a claim with the type
  /// `SECTION_TYPE_ZERO_TOUCH`. Call `partners.devices.unclaim` or
  /// `partners.devices.unclaimAsync` to remove the device from zero-touch
  /// enrollment.
  ///
  /// Output only.
  core.List<DeviceClaim> claims;

  /// Not available to resellers.
  core.String configuration;

  /// The ID of the device.
  ///
  /// Assigned by the server.
  ///
  /// Output only.
  core.String deviceId;

  /// The hardware IDs that identify a manufactured device.
  ///
  /// To learn more, read
  /// [Identifiers](https://developers.google.com/zero-touch/guides/identifiers).
  DeviceIdentifier deviceIdentifier;

  /// The metadata attached to the device.
  ///
  /// Structured as key-value pairs. To learn more, read
  /// [Device metadata](https://developers.google.com/zero-touch/guides/metadata).
  DeviceMetadata deviceMetadata;

  /// The API resource name in the format
  /// `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
  ///
  /// Assigned by the server.
  ///
  /// Output only.
  core.String name;

  Device();

  Device.fromJson(core.Map _json) {
    if (_json.containsKey('claims')) {
      claims = (_json['claims'] as core.List)
          .map<DeviceClaim>((value) => DeviceClaim.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('configuration')) {
      configuration = _json['configuration'] as core.String;
    }
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('deviceMetadata')) {
      deviceMetadata = DeviceMetadata.fromJson(
          _json['deviceMetadata'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (claims != null) {
      _json['claims'] = claims.map((value) => value.toJson()).toList();
    }
    if (configuration != null) {
      _json['configuration'] = configuration;
    }
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (deviceMetadata != null) {
      _json['deviceMetadata'] = deviceMetadata.toJson();
    }
    if (name != null) {
      _json['name'] = name;
    }
    return _json;
  }
}

/// A record of a device claimed by a reseller for a customer.
///
/// Devices claimed for zero-touch enrollment have a claim with the type
/// `SECTION_TYPE_ZERO_TOUCH`. To learn more, read \[Claim devices for
/// customers\](/zero-touch/guides/how-it-works#claim).
class DeviceClaim {
  /// The ID of the Customer that purchased the device.
  core.String ownerCompanyId;

  /// The ID of the reseller that claimed the device.
  core.String resellerId;

  /// The type of claim made on the device.
  ///
  /// Output only.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  /// The timestamp when the device will exit ‘vacation mode’.
  ///
  /// This value is present iff the device is in 'vacation mode'.
  core.String vacationModeExpireTime;

  /// The timestamp when the device was put into ‘vacation mode’.
  ///
  /// This value is present iff the device is in 'vacation mode'.
  core.String vacationModeStartTime;

  DeviceClaim();

  DeviceClaim.fromJson(core.Map _json) {
    if (_json.containsKey('ownerCompanyId')) {
      ownerCompanyId = _json['ownerCompanyId'] as core.String;
    }
    if (_json.containsKey('resellerId')) {
      resellerId = _json['resellerId'] as core.String;
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
    if (_json.containsKey('vacationModeExpireTime')) {
      vacationModeExpireTime = _json['vacationModeExpireTime'] as core.String;
    }
    if (_json.containsKey('vacationModeStartTime')) {
      vacationModeStartTime = _json['vacationModeStartTime'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (ownerCompanyId != null) {
      _json['ownerCompanyId'] = ownerCompanyId;
    }
    if (resellerId != null) {
      _json['resellerId'] = resellerId;
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    if (vacationModeExpireTime != null) {
      _json['vacationModeExpireTime'] = vacationModeExpireTime;
    }
    if (vacationModeStartTime != null) {
      _json['vacationModeStartTime'] = vacationModeStartTime;
    }
    return _json;
  }
}

/// Encapsulates hardware and product IDs to identify a manufactured device.
///
/// To understand requirements on identifier sets, read
/// [Identifiers](https://developers.google.com/zero-touch/guides/identifiers).
class DeviceIdentifier {
  /// The device’s IMEI number.
  ///
  /// Validated on input.
  core.String imei;

  /// The device manufacturer’s name.
  ///
  /// Matches the device's built-in value returned from
  /// `android.os.Build.MANUFACTURER`. Allowed values are listed in
  /// \[manufacturers\](/zero-touch/resources/manufacturer-names#manufacturers-names).
  core.String manufacturer;

  /// The device’s MEID number.
  core.String meid;

  /// The device model's name.
  ///
  /// Matches the device's built-in value returned from
  /// `android.os.Build.MODEL`. Allowed values are listed in
  /// \[models\](/zero-touch/resources/manufacturer-names#model-names).
  core.String model;

  /// The manufacturer's serial number for the device.
  ///
  /// This value might not be unique across different device models.
  core.String serialNumber;

  DeviceIdentifier();

  DeviceIdentifier.fromJson(core.Map _json) {
    if (_json.containsKey('imei')) {
      imei = _json['imei'] as core.String;
    }
    if (_json.containsKey('manufacturer')) {
      manufacturer = _json['manufacturer'] as core.String;
    }
    if (_json.containsKey('meid')) {
      meid = _json['meid'] as core.String;
    }
    if (_json.containsKey('model')) {
      model = _json['model'] as core.String;
    }
    if (_json.containsKey('serialNumber')) {
      serialNumber = _json['serialNumber'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (imei != null) {
      _json['imei'] = imei;
    }
    if (manufacturer != null) {
      _json['manufacturer'] = manufacturer;
    }
    if (meid != null) {
      _json['meid'] = meid;
    }
    if (model != null) {
      _json['model'] = model;
    }
    if (serialNumber != null) {
      _json['serialNumber'] = serialNumber;
    }
    return _json;
  }
}

/// Metadata entries that can be attached to a `Device`.
///
/// To learn more, read
/// [Device metadata](https://developers.google.com/zero-touch/guides/metadata).
class DeviceMetadata {
  /// Metadata entries recorded as key-value pairs.
  core.Map<core.String, core.String> entries;

  DeviceMetadata();

  DeviceMetadata.fromJson(core.Map _json) {
    if (_json.containsKey('entries')) {
      entries =
          (_json['entries'] as core.Map).cast<core.String, core.String>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.String,
                ),
              );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (entries != null) {
      _json['entries'] = entries;
    }
    return _json;
  }
}

/// A `DeviceReference` is an API abstraction that lets you supply a _device_
/// argument to a method using one of the following identifier types: * A
/// numeric API resource ID.
///
/// * Real-world hardware IDs, such as IMEI number, belonging to the
/// manufactured device. Methods that operate on devices take a
/// `DeviceReference` as a parameter type because it's more flexible for the
/// caller. To learn more about device identifiers, read
/// [Identifiers](https://developers.google.com/zero-touch/guides/identifiers).
class DeviceReference {
  /// The ID of the device.
  core.String deviceId;

  /// The hardware IDs of the device.
  DeviceIdentifier deviceIdentifier;

  DeviceReference();

  DeviceReference.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    return _json;
  }
}

/// Tracks the status of a long-running operation to asynchronously update a
/// batch of reseller metadata attached to devices.
///
/// To learn more, read \[Long‑running batch
/// operations\](/zero-touch/guides/how-it-works#operations).
class DevicesLongRunningOperationMetadata {
  /// The number of metadata updates in the operation.
  ///
  /// This might be different from the number of updates in the request if the
  /// API can't parse some of the updates.
  core.int devicesCount;

  /// The processing status of the operation.
  /// Possible string values are:
  /// - "BATCH_PROCESS_STATUS_UNSPECIFIED" : Invalid code. Shouldn't be used.
  /// - "BATCH_PROCESS_PENDING" : Pending.
  /// - "BATCH_PROCESS_IN_PROGRESS" : In progress.
  /// - "BATCH_PROCESS_PROCESSED" : Processed. This doesn't mean all items were
  /// processed successfully, you should check the `response` field for the
  /// result of every item.
  core.String processingStatus;

  /// The processing progress of the operation.
  ///
  /// Measured as a number from 0 to 100. A value of 10O doesnt always mean the
  /// operation completed—check for the inclusion of a `done` field.
  core.int progress;

  DevicesLongRunningOperationMetadata();

  DevicesLongRunningOperationMetadata.fromJson(core.Map _json) {
    if (_json.containsKey('devicesCount')) {
      devicesCount = _json['devicesCount'] as core.int;
    }
    if (_json.containsKey('processingStatus')) {
      processingStatus = _json['processingStatus'] as core.String;
    }
    if (_json.containsKey('progress')) {
      progress = _json['progress'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (devicesCount != null) {
      _json['devicesCount'] = devicesCount;
    }
    if (processingStatus != null) {
      _json['processingStatus'] = processingStatus;
    }
    if (progress != null) {
      _json['progress'] = progress;
    }
    return _json;
  }
}

/// Tracks the status of a long-running operation to claim, unclaim, or attach
/// metadata to devices.
///
/// To learn more, read \[Long‑running batch
/// operations\](/zero-touch/guides/how-it-works#operations).
class DevicesLongRunningOperationResponse {
  /// The processing status for each device in the operation.
  ///
  /// One `PerDeviceStatus` per device. The list order matches the items in the
  /// original request.
  core.List<OperationPerDevice> perDeviceStatus;

  /// A summary of how many items in the operation the server processed
  /// successfully.
  ///
  /// Updated as the operation progresses.
  core.int successCount;

  DevicesLongRunningOperationResponse();

  DevicesLongRunningOperationResponse.fromJson(core.Map _json) {
    if (_json.containsKey('perDeviceStatus')) {
      perDeviceStatus = (_json['perDeviceStatus'] as core.List)
          .map<OperationPerDevice>((value) => OperationPerDevice.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('successCount')) {
      successCount = _json['successCount'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (perDeviceStatus != null) {
      _json['perDeviceStatus'] =
          perDeviceStatus.map((value) => value.toJson()).toList();
    }
    if (successCount != null) {
      _json['successCount'] = successCount;
    }
    return _json;
  }
}

/// An EMM's DPC
/// ([device policy controller](http://developer.android.com/work/dpc/build-dpc.html)).
///
/// Zero-touch enrollment installs a DPC (listed in the `Configuration`) on a
/// device to maintain the customer's mobile policies. All the DPCs listed by
/// the API support zero-touch enrollment and are available in Google Play.
class Dpc {
  /// The title of the DPC app in Google Play.
  ///
  /// For example, _Google Apps Device Policy_. Useful in an application's user
  /// interface.
  ///
  /// Output only.
  core.String dpcName;

  /// The API resource name in the format
  /// `customers/[CUSTOMER_ID]/dpcs/[DPC_ID]`.
  ///
  /// Assigned by the server. To maintain a reference to a DPC across customer
  /// accounts, persist and match the last path component (`DPC_ID`).
  ///
  /// Output only.
  core.String name;

  /// The DPC's Android application ID that looks like a Java package name.
  ///
  /// Zero-touch enrollment installs the DPC app onto a device using this
  /// identifier.
  ///
  /// Output only.
  core.String packageName;

  Dpc();

  Dpc.fromJson(core.Map _json) {
    if (_json.containsKey('dpcName')) {
      dpcName = _json['dpcName'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('packageName')) {
      packageName = _json['packageName'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (dpcName != null) {
      _json['dpcName'] = dpcName;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (packageName != null) {
      _json['packageName'] = packageName;
    }
    return _json;
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs.
///
/// A typical example is to use it as the request or the response type of an API
/// method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns
/// (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON
/// object `{}`.
class Empty {
  Empty();

  Empty.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Request to find devices.
class FindDevicesByDeviceIdentifierRequest {
  /// The device identifier to search for.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The maximum number of devices to show in a page of results.
  ///
  /// Must be between 1 and 100 inclusive.
  ///
  /// Required.
  core.String limit;

  /// A token specifying which result page to return.
  core.String pageToken;

  FindDevicesByDeviceIdentifierRequest();

  FindDevicesByDeviceIdentifierRequest.fromJson(core.Map _json) {
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('limit')) {
      limit = _json['limit'] as core.String;
    }
    if (_json.containsKey('pageToken')) {
      pageToken = _json['pageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (limit != null) {
      _json['limit'] = limit;
    }
    if (pageToken != null) {
      _json['pageToken'] = pageToken;
    }
    return _json;
  }
}

/// Response containing found devices.
class FindDevicesByDeviceIdentifierResponse {
  /// Found devices.
  core.List<Device> devices;

  /// A token used to access the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  /// The total count of items in the list irrespective of pagination.
  core.int totalSize;

  FindDevicesByDeviceIdentifierResponse();

  FindDevicesByDeviceIdentifierResponse.fromJson(core.Map _json) {
    if (_json.containsKey('devices')) {
      devices = (_json['devices'] as core.List)
          .map<Device>((value) =>
              Device.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('totalSize')) {
      totalSize = _json['totalSize'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (devices != null) {
      _json['devices'] = devices.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (totalSize != null) {
      _json['totalSize'] = totalSize;
    }
    return _json;
  }
}

/// Request to find devices by customers.
class FindDevicesByOwnerRequest {
  /// The list of customer IDs to search for.
  ///
  /// Required.
  core.List<core.String> customerId;

  /// The maximum number of devices to show in a page of results.
  ///
  /// Must be between 1 and 100 inclusive.
  ///
  /// Required.
  core.String limit;

  /// A token specifying which result page to return.
  core.String pageToken;

  /// The section type of the device's provisioning record.
  ///
  /// Required.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  FindDevicesByOwnerRequest();

  FindDevicesByOwnerRequest.fromJson(core.Map _json) {
    if (_json.containsKey('customerId')) {
      customerId = (_json['customerId'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('limit')) {
      limit = _json['limit'] as core.String;
    }
    if (_json.containsKey('pageToken')) {
      pageToken = _json['pageToken'] as core.String;
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customerId != null) {
      _json['customerId'] = customerId;
    }
    if (limit != null) {
      _json['limit'] = limit;
    }
    if (pageToken != null) {
      _json['pageToken'] = pageToken;
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    return _json;
  }
}

/// Response containing found devices.
class FindDevicesByOwnerResponse {
  /// The customer's devices.
  core.List<Device> devices;

  /// A token used to access the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  /// The total count of items in the list irrespective of pagination.
  core.int totalSize;

  FindDevicesByOwnerResponse();

  FindDevicesByOwnerResponse.fromJson(core.Map _json) {
    if (_json.containsKey('devices')) {
      devices = (_json['devices'] as core.List)
          .map<Device>((value) =>
              Device.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('totalSize')) {
      totalSize = _json['totalSize'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (devices != null) {
      _json['devices'] = devices.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (totalSize != null) {
      _json['totalSize'] = totalSize;
    }
    return _json;
  }
}

/// Response message of all customers related to this partner.
class ListCustomersResponse {
  /// List of customers related to this reseller partner.
  core.List<Company> customers;

  /// A token to retrieve the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  /// The total count of items in the list irrespective of pagination.
  core.int totalSize;

  ListCustomersResponse();

  ListCustomersResponse.fromJson(core.Map _json) {
    if (_json.containsKey('customers')) {
      customers = (_json['customers'] as core.List)
          .map<Company>((value) =>
              Company.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('totalSize')) {
      totalSize = _json['totalSize'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customers != null) {
      _json['customers'] = customers.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (totalSize != null) {
      _json['totalSize'] = totalSize;
    }
    return _json;
  }
}

/// Response message to list customers of the vendor.
class ListVendorCustomersResponse {
  /// List of customers of the vendor.
  core.List<Company> customers;

  /// A token to retrieve the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  /// The total count of items in the list irrespective of pagination.
  core.int totalSize;

  ListVendorCustomersResponse();

  ListVendorCustomersResponse.fromJson(core.Map _json) {
    if (_json.containsKey('customers')) {
      customers = (_json['customers'] as core.List)
          .map<Company>((value) =>
              Company.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('totalSize')) {
      totalSize = _json['totalSize'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customers != null) {
      _json['customers'] = customers.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (totalSize != null) {
      _json['totalSize'] = totalSize;
    }
    return _json;
  }
}

/// Response message to list vendors of the partner.
class ListVendorsResponse {
  /// A token to retrieve the next page of results.
  ///
  /// Omitted if no further results are available.
  core.String nextPageToken;

  /// The total count of items in the list irrespective of pagination.
  core.int totalSize;

  /// List of vendors of the reseller partner.
  ///
  /// Fields `name`, `companyId` and `companyName` are populated to the Company
  /// object.
  core.List<Company> vendors;

  ListVendorsResponse();

  ListVendorsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('totalSize')) {
      totalSize = _json['totalSize'] as core.int;
    }
    if (_json.containsKey('vendors')) {
      vendors = (_json['vendors'] as core.List)
          .map<Company>((value) =>
              Company.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (totalSize != null) {
      _json['totalSize'] = totalSize;
    }
    if (vendors != null) {
      _json['vendors'] = vendors.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// This resource represents a long-running operation that is the result of a
/// network API call.
class Operation {
  /// If the value is `false`, it means the operation is still in progress.
  ///
  /// If `true`, the operation is completed, and either `error` or `response` is
  /// available.
  core.bool done;

  /// This field will always be not set if the operation is created by
  /// `claimAsync`, `unclaimAsync`, or `updateMetadataAsync`.
  ///
  /// In this case, error information for each device is set in
  /// `response.perDeviceStatus.result.status`.
  Status error;

  /// This field will contain a `DevicesLongRunningOperationMetadata` object if
  /// the operation is created by `claimAsync`, `unclaimAsync`, or
  /// `updateMetadataAsync`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// The server-assigned name, which is only unique within the same service
  /// that originally returns it.
  ///
  /// If you use the default HTTP mapping, the `name` should be a resource name
  /// ending with `operations/{unique_id}`.
  core.String name;

  /// This field will contain a `DevicesLongRunningOperationResponse` object if
  /// the operation is created by `claimAsync`, `unclaimAsync`, or
  /// `updateMetadataAsync`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> response;

  Operation();

  Operation.fromJson(core.Map _json) {
    if (_json.containsKey('done')) {
      done = _json['done'] as core.bool;
    }
    if (_json.containsKey('error')) {
      error = Status.fromJson(
          _json['error'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('metadata')) {
      metadata =
          (_json['metadata'] as core.Map).cast<core.String, core.Object>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.Object,
                ),
              );
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('response')) {
      response =
          (_json['response'] as core.Map).cast<core.String, core.Object>().map(
                (key, item) => core.MapEntry(
                  key,
                  item as core.Object,
                ),
              );
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (done != null) {
      _json['done'] = done;
    }
    if (error != null) {
      _json['error'] = error.toJson();
    }
    if (metadata != null) {
      _json['metadata'] = metadata;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (response != null) {
      _json['response'] = response;
    }
    return _json;
  }
}

/// A task for each device in the operation.
///
/// Corresponds to each device change in the request.
class OperationPerDevice {
  /// A copy of the original device-claim request received by the server.
  PartnerClaim claim;

  /// The processing result for each device.
  PerDeviceStatusInBatch result;

  /// A copy of the original device-unclaim request received by the server.
  PartnerUnclaim unclaim;

  /// A copy of the original metadata-update request received by the server.
  UpdateMetadataArguments updateMetadata;

  OperationPerDevice();

  OperationPerDevice.fromJson(core.Map _json) {
    if (_json.containsKey('claim')) {
      claim = PartnerClaim.fromJson(
          _json['claim'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('result')) {
      result = PerDeviceStatusInBatch.fromJson(
          _json['result'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('unclaim')) {
      unclaim = PartnerUnclaim.fromJson(
          _json['unclaim'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('updateMetadata')) {
      updateMetadata = UpdateMetadataArguments.fromJson(
          _json['updateMetadata'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (claim != null) {
      _json['claim'] = claim.toJson();
    }
    if (result != null) {
      _json['result'] = result.toJson();
    }
    if (unclaim != null) {
      _json['unclaim'] = unclaim.toJson();
    }
    if (updateMetadata != null) {
      _json['updateMetadata'] = updateMetadata.toJson();
    }
    return _json;
  }
}

/// Identifies one claim request.
class PartnerClaim {
  /// The ID of the customer for whom the device is being claimed.
  ///
  /// Required.
  core.String customerId;

  /// Device identifier of the device.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The metadata to attach to the device at claim.
  ///
  /// Required.
  DeviceMetadata deviceMetadata;

  /// The section type of the device's provisioning record.
  ///
  /// Required.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  PartnerClaim();

  PartnerClaim.fromJson(core.Map _json) {
    if (_json.containsKey('customerId')) {
      customerId = _json['customerId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('deviceMetadata')) {
      deviceMetadata = DeviceMetadata.fromJson(
          _json['deviceMetadata'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (customerId != null) {
      _json['customerId'] = customerId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (deviceMetadata != null) {
      _json['deviceMetadata'] = deviceMetadata.toJson();
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    return _json;
  }
}

/// Identifies one unclaim request.
class PartnerUnclaim {
  /// Device ID of the device.
  ///
  /// Required.
  core.String deviceId;

  /// Device identifier of the device.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The section type of the device's provisioning record.
  ///
  /// Required.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  /// The duration of the vacation unlock starting from when the request is
  /// processed.
  ///
  /// (1 day is treated as 24 hours)
  ///
  /// Optional.
  core.int vacationModeDays;

  /// The expiration time of the vacation unlock.
  ///
  /// Optional.
  core.String vacationModeExpireTime;

  PartnerUnclaim();

  PartnerUnclaim.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
    if (_json.containsKey('vacationModeDays')) {
      vacationModeDays = _json['vacationModeDays'] as core.int;
    }
    if (_json.containsKey('vacationModeExpireTime')) {
      vacationModeExpireTime = _json['vacationModeExpireTime'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    if (vacationModeDays != null) {
      _json['vacationModeDays'] = vacationModeDays;
    }
    if (vacationModeExpireTime != null) {
      _json['vacationModeExpireTime'] = vacationModeExpireTime;
    }
    return _json;
  }
}

/// Captures the processing status for each device in the operation.
class PerDeviceStatusInBatch {
  /// If processing succeeds, the device ID of the device.
  core.String deviceId;

  /// If processing fails, the error type.
  core.String errorIdentifier;

  /// If processing fails, a developer message explaining what went wrong.
  core.String errorMessage;

  /// The result status of the device after processing.
  /// Possible string values are:
  /// - "SINGLE_DEVICE_STATUS_UNSPECIFIED" : Invalid code. Shouldn't be used.
  /// - "SINGLE_DEVICE_STATUS_UNKNOWN_ERROR" : Unknown error. We don't expect
  /// this error to occur here.
  /// - "SINGLE_DEVICE_STATUS_OTHER_ERROR" : Other error. We know/expect this
  /// error, but there's no defined error code for the error.
  /// - "SINGLE_DEVICE_STATUS_SUCCESS" : Success.
  /// - "SINGLE_DEVICE_STATUS_PERMISSION_DENIED" : Permission denied.
  /// - "SINGLE_DEVICE_STATUS_INVALID_DEVICE_IDENTIFIER" : Invalid device
  /// identifier.
  /// - "SINGLE_DEVICE_STATUS_INVALID_SECTION_TYPE" : Invalid section type.
  /// - "SINGLE_DEVICE_STATUS_SECTION_NOT_YOURS" : This section is claimed by
  /// another company.
  core.String status;

  PerDeviceStatusInBatch();

  PerDeviceStatusInBatch.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('errorIdentifier')) {
      errorIdentifier = _json['errorIdentifier'] as core.String;
    }
    if (_json.containsKey('errorMessage')) {
      errorMessage = _json['errorMessage'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (errorIdentifier != null) {
      _json['errorIdentifier'] = errorIdentifier;
    }
    if (errorMessage != null) {
      _json['errorMessage'] = errorMessage;
    }
    if (status != null) {
      _json['status'] = status;
    }
    return _json;
  }
}

/// The `Status` type defines a logical error model that is suitable for
/// different programming environments, including REST APIs and RPC APIs.
///
/// It is used by [gRPC](https://github.com/grpc). Each `Status` message
/// contains three pieces of data: error code, error message, and error details.
/// You can find out more about this error model and how to work with it in the
/// [API Design Guide](https://cloud.google.com/apis/design/errors).
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  core.int code;

  /// A list of messages that carry the error details.
  ///
  /// There is a common set of message types for APIs to use.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> details;

  /// A developer-facing error message, which should be in English.
  ///
  /// Any user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey('code')) {
      code = _json['code'] as core.int;
    }
    if (_json.containsKey('details')) {
      details = (_json['details'] as core.List)
          .map<core.Map<core.String, core.Object>>((value) =>
              (value as core.Map).cast<core.String, core.Object>().map(
                    (key, item) => core.MapEntry(
                      key,
                      item as core.Object,
                    ),
                  ))
          .toList();
    }
    if (_json.containsKey('message')) {
      message = _json['message'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (code != null) {
      _json['code'] = code;
    }
    if (details != null) {
      _json['details'] = details;
    }
    if (message != null) {
      _json['message'] = message;
    }
    return _json;
  }
}

/// Request message to unclaim a device.
class UnclaimDeviceRequest {
  /// The device ID returned by `ClaimDevice`.
  ///
  /// Required.
  core.String deviceId;

  /// The device identifier you used when you claimed this device.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The section type of the device's provisioning record.
  ///
  /// Required.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_SIM_LOCK" : SIM-lock section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  /// The duration of the vacation unlock starting from when the request is
  /// processed.
  ///
  /// (1 day is treated as 24 hours)
  core.int vacationModeDays;

  /// The expiration time of the vacation unlock.
  core.String vacationModeExpireTime;

  UnclaimDeviceRequest();

  UnclaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('sectionType')) {
      sectionType = _json['sectionType'] as core.String;
    }
    if (_json.containsKey('vacationModeDays')) {
      vacationModeDays = _json['vacationModeDays'] as core.int;
    }
    if (_json.containsKey('vacationModeExpireTime')) {
      vacationModeExpireTime = _json['vacationModeExpireTime'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (sectionType != null) {
      _json['sectionType'] = sectionType;
    }
    if (vacationModeDays != null) {
      _json['vacationModeDays'] = vacationModeDays;
    }
    if (vacationModeExpireTime != null) {
      _json['vacationModeExpireTime'] = vacationModeExpireTime;
    }
    return _json;
  }
}

/// Request to unclaim devices asynchronously in batch.
class UnclaimDevicesRequest {
  /// The list of devices to unclaim.
  ///
  /// Required.
  core.List<PartnerUnclaim> unclaims;

  UnclaimDevicesRequest();

  UnclaimDevicesRequest.fromJson(core.Map _json) {
    if (_json.containsKey('unclaims')) {
      unclaims = (_json['unclaims'] as core.List)
          .map<PartnerUnclaim>((value) => PartnerUnclaim.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (unclaims != null) {
      _json['unclaims'] = unclaims.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Request to update device metadata in batch.
class UpdateDeviceMetadataInBatchRequest {
  /// The list of metadata updates.
  ///
  /// Required.
  core.List<UpdateMetadataArguments> updates;

  UpdateDeviceMetadataInBatchRequest();

  UpdateDeviceMetadataInBatchRequest.fromJson(core.Map _json) {
    if (_json.containsKey('updates')) {
      updates = (_json['updates'] as core.List)
          .map<UpdateMetadataArguments>((value) =>
              UpdateMetadataArguments.fromJson(
                  value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (updates != null) {
      _json['updates'] = updates.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Request to set metadata for a device.
class UpdateDeviceMetadataRequest {
  /// The metadata to attach to the device.
  ///
  /// Required.
  DeviceMetadata deviceMetadata;

  UpdateDeviceMetadataRequest();

  UpdateDeviceMetadataRequest.fromJson(core.Map _json) {
    if (_json.containsKey('deviceMetadata')) {
      deviceMetadata = DeviceMetadata.fromJson(
          _json['deviceMetadata'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceMetadata != null) {
      _json['deviceMetadata'] = deviceMetadata.toJson();
    }
    return _json;
  }
}

/// Identifies metadata updates to one device.
class UpdateMetadataArguments {
  /// Device ID of the device.
  ///
  /// Required.
  core.String deviceId;

  /// Device identifier.
  ///
  /// Required.
  DeviceIdentifier deviceIdentifier;

  /// The metadata to update.
  ///
  /// Required.
  DeviceMetadata deviceMetadata;

  UpdateMetadataArguments();

  UpdateMetadataArguments.fromJson(core.Map _json) {
    if (_json.containsKey('deviceId')) {
      deviceId = _json['deviceId'] as core.String;
    }
    if (_json.containsKey('deviceIdentifier')) {
      deviceIdentifier = DeviceIdentifier.fromJson(
          _json['deviceIdentifier'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('deviceMetadata')) {
      deviceMetadata = DeviceMetadata.fromJson(
          _json['deviceMetadata'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deviceId != null) {
      _json['deviceId'] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json['deviceIdentifier'] = deviceIdentifier.toJson();
    }
    if (deviceMetadata != null) {
      _json['deviceMetadata'] = deviceMetadata.toJson();
    }
    return _json;
  }
}
