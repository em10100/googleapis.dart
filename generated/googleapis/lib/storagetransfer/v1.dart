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

/// Storage Transfer API - v1
///
/// Transfers data from external data sources to a Google Cloud Storage bucket
/// or between Google Cloud Storage buckets.
///
/// For more information, see <https://cloud.google.com/storage-transfer/docs>
///
/// Create an instance of [StoragetransferApi] to access these resources:
///
/// - [GoogleServiceAccountsResource]
/// - [TransferJobsResource]
/// - [TransferOperationsResource]
library storagetransfer.v1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// Transfers data from external data sources to a Google Cloud Storage bucket
/// or between Google Cloud Storage buckets.
class StoragetransferApi {
  /// View and manage your data across Google Cloud Platform services
  static const cloudPlatformScope =
      'https://www.googleapis.com/auth/cloud-platform';

  final commons.ApiRequester _requester;

  GoogleServiceAccountsResource get googleServiceAccounts =>
      GoogleServiceAccountsResource(_requester);
  TransferJobsResource get transferJobs => TransferJobsResource(_requester);
  TransferOperationsResource get transferOperations =>
      TransferOperationsResource(_requester);

  StoragetransferApi(http.Client client,
      {core.String rootUrl = 'https://storagetransfer.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class GoogleServiceAccountsResource {
  final commons.ApiRequester _requester;

  GoogleServiceAccountsResource(commons.ApiRequester client)
      : _requester = client;

  /// Returns the Google service account that is used by Storage Transfer
  /// Service to access buckets in the project where transfers run or in other
  /// projects.
  ///
  /// Each Google service account is associated with one Google Cloud Platform
  /// Console project. Users should add this service account to the Google Cloud
  /// Storage bucket ACLs to grant access to Storage Transfer Service. This
  /// service account is created and owned by Storage Transfer Service and can
  /// only be used by Storage Transfer Service.
  ///
  /// Request parameters:
  ///
  /// [projectId] - Required. The ID of the Google Cloud Platform Console
  /// project that the Google service account is associated with.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleServiceAccount].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleServiceAccount> get(
    core.String projectId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/googleServiceAccounts/' +
        commons.Escaper.ecapeVariable('$projectId');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return GoogleServiceAccount.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class TransferJobsResource {
  final commons.ApiRequester _requester;

  TransferJobsResource(commons.ApiRequester client) : _requester = client;

  /// Creates a transfer job that runs periodically.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TransferJob].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TransferJob> create(
    TransferJob request, {
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
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/transferJobs';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return TransferJob.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Gets a transfer job.
  ///
  /// Request parameters:
  ///
  /// [jobName] - Required. " The job to get.
  /// Value must have pattern `^transferJobs/.*$`.
  ///
  /// [projectId] - Required. The ID of the Google Cloud Platform Console
  /// project that owns the job.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TransferJob].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TransferJob> get(
    core.String jobName,
    core.String projectId, {
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (jobName == null) {
      throw core.ArgumentError('Parameter jobName is required.');
    }
    if (projectId == null) {
      throw core.ArgumentError('Parameter projectId is required.');
    }
    _queryParams['projectId'] = [projectId];
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$jobName');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return TransferJob.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Lists transfer jobs.
  ///
  /// Request parameters:
  ///
  /// [filter] - Required. A list of query parameters specified as JSON text in
  /// the form of: `{"projectId":"my_project_id",
  /// "jobNames":["jobid1","jobid2",...],
  /// "jobStatuses":["status1","status2",...]}` Since `jobNames` and
  /// `jobStatuses` support multiple values, their values must be specified with
  /// array notation. `projectId` is required. `jobNames` and `jobStatuses` are
  /// optional. The valid values for `jobStatuses` are case-insensitive:
  /// ENABLED, DISABLED, and DELETED.
  ///
  /// [pageSize] - The list page size. The max allowed value is 256.
  ///
  /// [pageToken] - The list page token.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListTransferJobsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListTransferJobsResponse> list(
    core.String filter, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (filter == null) {
      throw core.ArgumentError('Parameter filter is required.');
    }
    _queryParams['filter'] = [filter];
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/transferJobs';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return ListTransferJobsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Updates a transfer job.
  ///
  /// Updating a job's transfer spec does not affect transfer operations that
  /// are running already. **Note:** The job's status field can be modified
  /// using this RPC (for example, to set a job's status to DELETED, DISABLED,
  /// or ENABLED).
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [jobName] - Required. The name of job to update.
  /// Value must have pattern `^transferJobs/.*$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [TransferJob].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<TransferJob> patch(
    UpdateTransferJobRequest request,
    core.String jobName, {
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
    if (jobName == null) {
      throw core.ArgumentError('Parameter jobName is required.');
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$jobName');

    final _response = await _requester.request(
      _url,
      'PATCH',
      body: _body,
      queryParams: _queryParams,
      uploadOptions: _uploadOptions,
      uploadMedia: _uploadMedia,
    );
    return TransferJob.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

class TransferOperationsResource {
  final commons.ApiRequester _requester;

  TransferOperationsResource(commons.ApiRequester client) : _requester = client;

  /// Cancels a transfer.
  ///
  /// Use the transferOperations.get method to check if the cancellation
  /// succeeded or if the operation completed despite the `cancel` request. When
  /// you cancel an operation, the currently running transfer is interrupted.
  /// For recurring transfer jobs, the next instance of the transfer job will
  /// still run. For example, if your job is configured to run every day at 1pm
  /// and you cancel Monday's operation at 1:05pm, Monday's transfer will stop.
  /// However, a transfer job will still be attempted on Tuesday. This applies
  /// only to currently running operations. If an operation is not currently
  /// running, `cancel` does nothing. *Caution:* Canceling a transfer job can
  /// leave your data in an unknown state. We recommend that you restore the
  /// state at both the destination and the source after the `cancel` request
  /// completes so that your data is in a consistent state. When you cancel a
  /// job, the next job computes a delta of files and may repair any
  /// inconsistent state. For instance, if you run a job every day, and today's
  /// job found 10 new files and transferred five files before you canceled the
  /// job, tomorrow's transfer operation will compute a new delta with the five
  /// files that were not copied today plus any new files discovered tomorrow.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource to be cancelled.
  /// Value must have pattern `^transferOperations/.*$`.
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
  async.Future<Empty> cancel(
    CancelOperationRequest request,
    core.String name, {
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
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

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

  /// Gets the latest state of a long-running operation.
  ///
  /// Clients can use this method to poll the operation result at intervals as
  /// recommended by the API service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern `^transferOperations/.*$`.
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

  /// Lists transfer operations.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The value `transferOperations`.
  /// Value must have pattern `^transferOperations$`.
  ///
  /// [filter] - Required. A list of query parameters specified as JSON text in
  /// the form of: `{"projectId":"my_project_id",
  /// "jobNames":["jobid1","jobid2",...],
  /// "operationNames":["opid1","opid2",...],
  /// "transferStatuses":["status1","status2",...]}` Since `jobNames`,
  /// `operationNames`, and `transferStatuses` support multiple values, they
  /// must be specified with array notation. `projectId` is required.
  /// `jobNames`, `operationNames`, and `transferStatuses` are optional. The
  /// valid values for `transferStatuses` are case-insensitive: IN_PROGRESS,
  /// PAUSED, SUCCESS, FAILED, and ABORTED.
  ///
  /// [pageSize] - The list page size. The max allowed value is 256.
  ///
  /// [pageToken] - The list page token.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListOperationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListOperationsResponse> list(
    core.String name,
    core.String filter, {
    core.int pageSize,
    core.String pageToken,
    core.String $fields,
  }) async {
    core.String _url;
    final _queryParams = <core.String, core.List<core.String>>{};
    commons.Media _uploadMedia;
    commons.UploadOptions _uploadOptions;

    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    if (filter == null) {
      throw core.ArgumentError('Parameter filter is required.');
    }
    _queryParams['filter'] = [filter];
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
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
    return ListOperationsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }

  /// Pauses a transfer operation.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the transfer operation.
  /// Value must have pattern `^transferOperations/.*$`.
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
  async.Future<Empty> pause(
    PauseTransferOperationRequest request,
    core.String name, {
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
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':pause';

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

  /// Resumes a transfer operation that is paused.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The name of the transfer operation.
  /// Value must have pattern `^transferOperations/.*$`.
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
  async.Future<Empty> resume(
    ResumeTransferOperationRequest request,
    core.String name, {
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
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name') + ':resume';

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

/// AWS access key (see
/// [AWS Security Credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html)).
///
/// For information on our data retention policy for user credentials, see
/// \[User credentials\](data-retention#user-credentials).
class AwsAccessKey {
  /// AWS access key ID.
  ///
  /// Required.
  core.String accessKeyId;

  /// AWS secret access key.
  ///
  /// This field is not returned in RPC responses.
  ///
  /// Required.
  core.String secretAccessKey;

  AwsAccessKey();

  AwsAccessKey.fromJson(core.Map _json) {
    if (_json.containsKey('accessKeyId')) {
      accessKeyId = _json['accessKeyId'] as core.String;
    }
    if (_json.containsKey('secretAccessKey')) {
      secretAccessKey = _json['secretAccessKey'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (accessKeyId != null) {
      _json['accessKeyId'] = accessKeyId;
    }
    if (secretAccessKey != null) {
      _json['secretAccessKey'] = secretAccessKey;
    }
    return _json;
  }
}

/// An AwsS3Data resource can be a data source, but not a data sink.
///
/// In an AwsS3Data resource, an object's name is the S3 object's key name.
class AwsS3Data {
  /// Input only.
  ///
  /// AWS access key used to sign the API requests to the AWS S3 bucket.
  /// Permissions on the bucket must be granted to the access ID of the AWS
  /// access key. For information on our data retention policy for user
  /// credentials, see \[User credentials\](data-retention#user-credentials).
  ///
  /// Required.
  AwsAccessKey awsAccessKey;

  /// S3 Bucket name (see
  /// [Creating a bucket](https://docs.aws.amazon.com/AmazonS3/latest/dev/create-bucket-get-location-example.html)).
  ///
  /// Required.
  core.String bucketName;

  /// Root path to transfer objects.
  ///
  /// Must be an empty string or full path name that ends with a '/'. This field
  /// is treated as an object prefix. As such, it should generally not begin
  /// with a '/'.
  core.String path;

  AwsS3Data();

  AwsS3Data.fromJson(core.Map _json) {
    if (_json.containsKey('awsAccessKey')) {
      awsAccessKey = AwsAccessKey.fromJson(
          _json['awsAccessKey'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('bucketName')) {
      bucketName = _json['bucketName'] as core.String;
    }
    if (_json.containsKey('path')) {
      path = _json['path'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (awsAccessKey != null) {
      _json['awsAccessKey'] = awsAccessKey.toJson();
    }
    if (bucketName != null) {
      _json['bucketName'] = bucketName;
    }
    if (path != null) {
      _json['path'] = path;
    }
    return _json;
  }
}

/// An AzureBlobStorageData resource can be a data source, but not a data sink.
///
/// An AzureBlobStorageData resource represents one Azure container. The storage
/// account determines the
/// [Azure endpoint](https://docs.microsoft.com/en-us/azure/storage/common/storage-create-storage-account#storage-account-endpoints).
/// In an AzureBlobStorageData resource, a blobs's name is the
/// [Azure Blob Storage blob's key name](https://docs.microsoft.com/en-us/rest/api/storageservices/naming-and-referencing-containers--blobs--and-metadata#blob-names).
class AzureBlobStorageData {
  /// Input only.
  ///
  /// Credentials used to authenticate API requests to Azure. For information on
  /// our data retention policy for user credentials, see \[User
  /// credentials\](data-retention#user-credentials).
  ///
  /// Required.
  AzureCredentials azureCredentials;

  /// The container to transfer from the Azure Storage account.
  ///
  /// Required.
  core.String container;

  /// Root path to transfer objects.
  ///
  /// Must be an empty string or full path name that ends with a '/'. This field
  /// is treated as an object prefix. As such, it should generally not begin
  /// with a '/'.
  core.String path;

  /// The name of the Azure Storage account.
  ///
  /// Required.
  core.String storageAccount;

  AzureBlobStorageData();

  AzureBlobStorageData.fromJson(core.Map _json) {
    if (_json.containsKey('azureCredentials')) {
      azureCredentials = AzureCredentials.fromJson(
          _json['azureCredentials'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('container')) {
      container = _json['container'] as core.String;
    }
    if (_json.containsKey('path')) {
      path = _json['path'] as core.String;
    }
    if (_json.containsKey('storageAccount')) {
      storageAccount = _json['storageAccount'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (azureCredentials != null) {
      _json['azureCredentials'] = azureCredentials.toJson();
    }
    if (container != null) {
      _json['container'] = container;
    }
    if (path != null) {
      _json['path'] = path;
    }
    if (storageAccount != null) {
      _json['storageAccount'] = storageAccount;
    }
    return _json;
  }
}

/// Azure credentials For information on our data retention policy for user
/// credentials, see \[User credentials\](data-retention#user-credentials).
class AzureCredentials {
  /// Azure shared access signature.
  ///
  /// (see \[Grant limited access to Azure Storage resources using shared access
  /// signatures
  /// (SAS)\](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview)).
  ///
  /// Required.
  core.String sasToken;

  AzureCredentials();

  AzureCredentials.fromJson(core.Map _json) {
    if (_json.containsKey('sasToken')) {
      sasToken = _json['sasToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (sasToken != null) {
      _json['sasToken'] = sasToken;
    }
    return _json;
  }
}

/// The request message for Operations.CancelOperation.
class CancelOperationRequest {
  CancelOperationRequest();

  CancelOperationRequest.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Represents a whole or partial calendar date, such as a birthday.
///
/// The time of day and time zone are either specified elsewhere or are
/// insignificant. The date is relative to the Gregorian Calendar. This can
/// represent one of the following: * A full date, with non-zero year, month,
/// and day values * A month and day value, with a zero year, such as an
/// anniversary * A year on its own, with zero month and day values * A year and
/// month value, with a zero day, such as a credit card expiration date Related
/// types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
class Date {
  /// Day of a month.
  ///
  /// Must be from 1 to 31 and valid for the year and month, or 0 to specify a
  /// year by itself or a year and month where the day isn't significant.
  core.int day;

  /// Month of a year.
  ///
  /// Must be from 1 to 12, or 0 to specify a year without a month and day.
  core.int month;

  /// Year of the date.
  ///
  /// Must be from 1 to 9999, or 0 to specify a date without a year.
  core.int year;

  Date();

  Date.fromJson(core.Map _json) {
    if (_json.containsKey('day')) {
      day = _json['day'] as core.int;
    }
    if (_json.containsKey('month')) {
      month = _json['month'] as core.int;
    }
    if (_json.containsKey('year')) {
      year = _json['year'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (day != null) {
      _json['day'] = day;
    }
    if (month != null) {
      _json['month'] = month;
    }
    if (year != null) {
      _json['year'] = year;
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

/// An entry describing an error that has occurred.
class ErrorLogEntry {
  /// A list of messages that carry the error details.
  core.List<core.String> errorDetails;

  /// A URL that refers to the target (a data source, a data sink, or an object)
  /// with which the error is associated.
  ///
  /// Required.
  core.String url;

  ErrorLogEntry();

  ErrorLogEntry.fromJson(core.Map _json) {
    if (_json.containsKey('errorDetails')) {
      errorDetails = (_json['errorDetails'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('url')) {
      url = _json['url'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (errorDetails != null) {
      _json['errorDetails'] = errorDetails;
    }
    if (url != null) {
      _json['url'] = url;
    }
    return _json;
  }
}

/// A summary of errors by error code, plus a count and sample error log
/// entries.
class ErrorSummary {
  /// Required.
  /// Possible string values are:
  /// - "OK" : Not an error; returned on success HTTP Mapping: 200 OK
  /// - "CANCELLED" : The operation was cancelled, typically by the caller. HTTP
  /// Mapping: 499 Client Closed Request
  /// - "UNKNOWN" : Unknown error. For example, this error may be returned when
  /// a `Status` value received from another address space belongs to an error
  /// space that is not known in this address space. Also errors raised by APIs
  /// that do not return enough error information may be converted to this
  /// error. HTTP Mapping: 500 Internal Server Error
  /// - "INVALID_ARGUMENT" : The client specified an invalid argument. Note that
  /// this differs from `FAILED_PRECONDITION`. `INVALID_ARGUMENT` indicates
  /// arguments that are problematic regardless of the state of the system
  /// (e.g., a malformed file name). HTTP Mapping: 400 Bad Request
  /// - "DEADLINE_EXCEEDED" : The deadline expired before the operation could
  /// complete. For operations that change the state of the system, this error
  /// may be returned even if the operation has completed successfully. For
  /// example, a successful response from a server could have been delayed long
  /// enough for the deadline to expire. HTTP Mapping: 504 Gateway Timeout
  /// - "NOT_FOUND" : Some requested entity (e.g., file or directory) was not
  /// found. Note to server developers: if a request is denied for an entire
  /// class of users, such as gradual feature rollout or undocumented allowlist,
  /// `NOT_FOUND` may be used. If a request is denied for some users within a
  /// class of users, such as user-based access control, `PERMISSION_DENIED`
  /// must be used. HTTP Mapping: 404 Not Found
  /// - "ALREADY_EXISTS" : The entity that a client attempted to create (e.g.,
  /// file or directory) already exists. HTTP Mapping: 409 Conflict
  /// - "PERMISSION_DENIED" : The caller does not have permission to execute the
  /// specified operation. `PERMISSION_DENIED` must not be used for rejections
  /// caused by exhausting some resource (use `RESOURCE_EXHAUSTED` instead for
  /// those errors). `PERMISSION_DENIED` must not be used if the caller can not
  /// be identified (use `UNAUTHENTICATED` instead for those errors). This error
  /// code does not imply the request is valid or the requested entity exists or
  /// satisfies other pre-conditions. HTTP Mapping: 403 Forbidden
  /// - "UNAUTHENTICATED" : The request does not have valid authentication
  /// credentials for the operation. HTTP Mapping: 401 Unauthorized
  /// - "RESOURCE_EXHAUSTED" : Some resource has been exhausted, perhaps a
  /// per-user quota, or perhaps the entire file system is out of space. HTTP
  /// Mapping: 429 Too Many Requests
  /// - "FAILED_PRECONDITION" : The operation was rejected because the system is
  /// not in a state required for the operation's execution. For example, the
  /// directory to be deleted is non-empty, an rmdir operation is applied to a
  /// non-directory, etc. Service implementors can use the following guidelines
  /// to decide between `FAILED_PRECONDITION`, `ABORTED`, and `UNAVAILABLE`: (a)
  /// Use `UNAVAILABLE` if the client can retry just the failing call. (b) Use
  /// `ABORTED` if the client should retry at a higher level (e.g., when a
  /// client-specified test-and-set fails, indicating the client should restart
  /// a read-modify-write sequence). (c) Use `FAILED_PRECONDITION` if the client
  /// should not retry until the system state has been explicitly fixed. E.g.,
  /// if an "rmdir" fails because the directory is non-empty,
  /// `FAILED_PRECONDITION` should be returned since the client should not retry
  /// unless the files are deleted from the directory. HTTP Mapping: 400 Bad
  /// Request
  /// - "ABORTED" : The operation was aborted, typically due to a concurrency
  /// issue such as a sequencer check failure or transaction abort. See the
  /// guidelines above for deciding between `FAILED_PRECONDITION`, `ABORTED`,
  /// and `UNAVAILABLE`. HTTP Mapping: 409 Conflict
  /// - "OUT_OF_RANGE" : The operation was attempted past the valid range. E.g.,
  /// seeking or reading past end-of-file. Unlike `INVALID_ARGUMENT`, this error
  /// indicates a problem that may be fixed if the system state changes. For
  /// example, a 32-bit file system will generate `INVALID_ARGUMENT` if asked to
  /// read at an offset that is not in the range \[0,2^32-1\], but it will
  /// generate `OUT_OF_RANGE` if asked to read from an offset past the current
  /// file size. There is a fair bit of overlap between `FAILED_PRECONDITION`
  /// and `OUT_OF_RANGE`. We recommend using `OUT_OF_RANGE` (the more specific
  /// error) when it applies so that callers who are iterating through a space
  /// can easily look for an `OUT_OF_RANGE` error to detect when they are done.
  /// HTTP Mapping: 400 Bad Request
  /// - "UNIMPLEMENTED" : The operation is not implemented or is not
  /// supported/enabled in this service. HTTP Mapping: 501 Not Implemented
  /// - "INTERNAL" : Internal errors. This means that some invariants expected
  /// by the underlying system have been broken. This error code is reserved for
  /// serious errors. HTTP Mapping: 500 Internal Server Error
  /// - "UNAVAILABLE" : The service is currently unavailable. This is most
  /// likely a transient condition, which can be corrected by retrying with a
  /// backoff. Note that it is not always safe to retry non-idempotent
  /// operations. See the guidelines above for deciding between
  /// `FAILED_PRECONDITION`, `ABORTED`, and `UNAVAILABLE`. HTTP Mapping: 503
  /// Service Unavailable
  /// - "DATA_LOSS" : Unrecoverable data loss or corruption. HTTP Mapping: 500
  /// Internal Server Error
  core.String errorCode;

  /// Count of this type of error.
  ///
  /// Required.
  core.String errorCount;

  /// Error samples.
  ///
  /// At most 5 error log entries will be recorded for a given error code for a
  /// single transfer operation.
  core.List<ErrorLogEntry> errorLogEntries;

  ErrorSummary();

  ErrorSummary.fromJson(core.Map _json) {
    if (_json.containsKey('errorCode')) {
      errorCode = _json['errorCode'] as core.String;
    }
    if (_json.containsKey('errorCount')) {
      errorCount = _json['errorCount'] as core.String;
    }
    if (_json.containsKey('errorLogEntries')) {
      errorLogEntries = (_json['errorLogEntries'] as core.List)
          .map<ErrorLogEntry>((value) => ErrorLogEntry.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (errorCode != null) {
      _json['errorCode'] = errorCode;
    }
    if (errorCount != null) {
      _json['errorCount'] = errorCount;
    }
    if (errorLogEntries != null) {
      _json['errorLogEntries'] =
          errorLogEntries.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// In a GcsData resource, an object's name is the Cloud Storage object's name
/// and its "last modification time" refers to the object's `updated` property
/// of Cloud Storage objects, which changes when the content or the metadata of
/// the object is updated.
class GcsData {
  /// Cloud Storage bucket name (see
  /// [Bucket Name Requirements](https://cloud.google.com/storage/docs/naming#requirements)).
  ///
  /// Required.
  core.String bucketName;

  /// Root path to transfer objects.
  ///
  /// Must be an empty string or full path name that ends with a '/'. This field
  /// is treated as an object prefix. As such, it should generally not begin
  /// with a '/'. (must meet Object Name
  /// Requirements\](https://cloud.google.com/storage/docs/naming#objectnames)).
  core.String path;

  GcsData();

  GcsData.fromJson(core.Map _json) {
    if (_json.containsKey('bucketName')) {
      bucketName = _json['bucketName'] as core.String;
    }
    if (_json.containsKey('path')) {
      path = _json['path'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (bucketName != null) {
      _json['bucketName'] = bucketName;
    }
    if (path != null) {
      _json['path'] = path;
    }
    return _json;
  }
}

/// Google service account
class GoogleServiceAccount {
  /// Email address of the service account.
  core.String accountEmail;

  GoogleServiceAccount();

  GoogleServiceAccount.fromJson(core.Map _json) {
    if (_json.containsKey('accountEmail')) {
      accountEmail = _json['accountEmail'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (accountEmail != null) {
      _json['accountEmail'] = accountEmail;
    }
    return _json;
  }
}

/// An HttpData resource specifies a list of objects on the web to be
/// transferred over HTTP.
///
/// The information of the objects to be transferred is contained in a file
/// referenced by a URL. The first line in the file must be `"TsvHttpData-1.0"`,
/// which specifies the format of the file. Subsequent lines specify the
/// information of the list of objects, one object per list entry. Each entry
/// has the following tab-delimited fields: * **HTTP URL** — The location of the
/// object. * **Length** — The size of the object in bytes. * **MD5** — The
/// base64-encoded MD5 hash of the object. For an example of a valid TSV file,
/// see
/// [Transferring data from URLs](https://cloud.google.com/storage-transfer/docs/create-url-list).
/// When transferring data based on a URL list, keep the following in mind: *
/// When an object located at `http(s)://hostname:port/` is transferred to a
/// data sink, the name of the object at the data sink is `/`. * If the
/// specified size of an object does not match the actual size of the object
/// fetched, the object will not be transferred. * If the specified MD5 does not
/// match the MD5 computed from the transferred bytes, the object transfer will
/// fail. * Ensure that each URL you specify is publicly accessible. For
/// example, in Cloud Storage you can
/// [share an object publicly](https://cloud.google.com/storage/docs/cloud-console#_sharingdata)
/// and get a link to it. * Storage Transfer Service obeys `robots.txt` rules
/// and requires the source HTTP server to support `Range` requests and to
/// return a `Content-Length` header in each response. * ObjectConditions have
/// no effect when filtering objects to transfer.
class HttpData {
  /// The URL that points to the file that stores the object list entries.
  ///
  /// This file must allow public access. Currently, only URLs with HTTP and
  /// HTTPS schemes are supported.
  ///
  /// Required.
  core.String listUrl;

  HttpData();

  HttpData.fromJson(core.Map _json) {
    if (_json.containsKey('listUrl')) {
      listUrl = _json['listUrl'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (listUrl != null) {
      _json['listUrl'] = listUrl;
    }
    return _json;
  }
}

/// The response message for Operations.ListOperations.
class ListOperationsResponse {
  /// The standard List next-page token.
  core.String nextPageToken;

  /// A list of operations that matches the specified filter in the request.
  core.List<Operation> operations;

  ListOperationsResponse();

  ListOperationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('operations')) {
      operations = (_json['operations'] as core.List)
          .map<Operation>((value) =>
              Operation.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (operations != null) {
      _json['operations'] = operations.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Response from ListTransferJobs.
class ListTransferJobsResponse {
  /// The list next page token.
  core.String nextPageToken;

  /// A list of transfer jobs.
  core.List<TransferJob> transferJobs;

  ListTransferJobsResponse();

  ListTransferJobsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
    if (_json.containsKey('transferJobs')) {
      transferJobs = (_json['transferJobs'] as core.List)
          .map<TransferJob>((value) => TransferJob.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    if (transferJobs != null) {
      _json['transferJobs'] =
          transferJobs.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// Specification to configure notifications published to Cloud Pub/Sub.
///
/// Notifications will be published to the customer-provided topic using the
/// following `PubsubMessage.attributes`: * `"eventType"`: one of the EventType
/// values * `"payloadFormat"`: one of the PayloadFormat values * `"projectId"`:
/// the project_id of the `TransferOperation` * `"transferJobName"`: the
/// transfer_job_name of the `TransferOperation` * `"transferOperationName"`:
/// the name of the `TransferOperation` The `PubsubMessage.data` will contain a
/// TransferOperation resource formatted according to the specified
/// `PayloadFormat`.
class NotificationConfig {
  /// Event types for which a notification is desired.
  ///
  /// If empty, send notifications for all event types.
  core.List<core.String> eventTypes;

  /// The desired format of the notification message payloads.
  ///
  /// Required.
  /// Possible string values are:
  /// - "PAYLOAD_FORMAT_UNSPECIFIED" : Illegal value, to avoid allowing a
  /// default.
  /// - "NONE" : No payload is included with the notification.
  /// - "JSON" : `TransferOperation` is
  /// [formatted as a JSON response](https://developers.google.com/protocol-buffers/docs/proto3#json),
  /// in application/json.
  core.String payloadFormat;

  /// The `Topic.name` of the Cloud Pub/Sub topic to which to publish
  /// notifications.
  ///
  /// Must be of the format: `projects/{project}/topics/{topic}`. Not matching
  /// this format will result in an INVALID_ARGUMENT error.
  ///
  /// Required.
  core.String pubsubTopic;

  NotificationConfig();

  NotificationConfig.fromJson(core.Map _json) {
    if (_json.containsKey('eventTypes')) {
      eventTypes = (_json['eventTypes'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('payloadFormat')) {
      payloadFormat = _json['payloadFormat'] as core.String;
    }
    if (_json.containsKey('pubsubTopic')) {
      pubsubTopic = _json['pubsubTopic'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (eventTypes != null) {
      _json['eventTypes'] = eventTypes;
    }
    if (payloadFormat != null) {
      _json['payloadFormat'] = payloadFormat;
    }
    if (pubsubTopic != null) {
      _json['pubsubTopic'] = pubsubTopic;
    }
    return _json;
  }
}

/// Conditions that determine which objects will be transferred.
///
/// Applies only to Cloud Data Sources such as S3, Azure, and Cloud Storage. The
/// "last modification time" refers to the time of the last change to the
/// object's content or metadata — specifically, this is the `updated` property
/// of Cloud Storage objects, the `LastModified` field of S3 objects, and the
/// `Last-Modified` header of Azure blobs.
class ObjectConditions {
  /// `exclude_prefixes` must follow the requirements described for
  /// include_prefixes.
  ///
  /// The max size of `exclude_prefixes` is 1000.
  core.List<core.String> excludePrefixes;

  /// If `include_prefixes` is specified, objects that satisfy the object
  /// conditions must have names that start with one of the `include_prefixes`
  /// and that do not start with any of the exclude_prefixes.
  ///
  /// If `include_prefixes` is not specified, all objects except those that have
  /// names starting with one of the `exclude_prefixes` must satisfy the object
  /// conditions. Requirements: * Each include-prefix and exclude-prefix can
  /// contain any sequence of Unicode characters, to a max length of 1024 bytes
  /// when UTF8-encoded, and must not contain Carriage Return or Line Feed
  /// characters. Wildcard matching and regular expression matching are not
  /// supported. * Each include-prefix and exclude-prefix must omit the leading
  /// slash. For example, to include the `requests.gz` object in a transfer from
  /// `s3://my-aws-bucket/logs/y=2015/requests.gz`, specify the include prefix
  /// as `logs/y=2015/requests.gz`. * None of the include-prefix or the
  /// exclude-prefix values can be empty, if specified. * Each include-prefix
  /// must include a distinct portion of the object namespace. No include-prefix
  /// may be a prefix of another include-prefix. * Each exclude-prefix must
  /// exclude a distinct portion of the object namespace. No exclude-prefix may
  /// be a prefix of another exclude-prefix. * If `include_prefixes` is
  /// specified, then each exclude-prefix must start with the value of a path
  /// explicitly included by `include_prefixes`. The max size of
  /// `include_prefixes` is 1000.
  core.List<core.String> includePrefixes;

  /// If specified, only objects with a "last modification time" before this
  /// timestamp and objects that don't have a "last modification time" will be
  /// transferred.
  core.String lastModifiedBefore;

  /// If specified, only objects with a "last modification time" on or after
  /// this timestamp and objects that don't have a "last modification time" are
  /// transferred.
  ///
  /// The `last_modified_since` and `last_modified_before` fields can be used
  /// together for chunked data processing. For example, consider a script that
  /// processes each day's worth of data at a time. For that you'd set each of
  /// the fields as follows: * `last_modified_since` to the start of the day *
  /// `last_modified_before` to the end of the day
  core.String lastModifiedSince;

  /// If specified, only objects with a "last modification time" on or after
  /// `NOW` - `max_time_elapsed_since_last_modification` and objects that don't
  /// have a "last modification time" are transferred.
  ///
  /// For each TransferOperation started by this TransferJob, `NOW` refers to
  /// the start_time of the `TransferOperation`.
  core.String maxTimeElapsedSinceLastModification;

  /// If specified, only objects with a "last modification time" before `NOW` -
  /// `min_time_elapsed_since_last_modification` and objects that don't have a
  /// "last modification time" are transferred.
  ///
  /// For each TransferOperation started by this TransferJob, `NOW` refers to
  /// the start_time of the `TransferOperation`.
  core.String minTimeElapsedSinceLastModification;

  ObjectConditions();

  ObjectConditions.fromJson(core.Map _json) {
    if (_json.containsKey('excludePrefixes')) {
      excludePrefixes = (_json['excludePrefixes'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('includePrefixes')) {
      includePrefixes = (_json['includePrefixes'] as core.List)
          .map<core.String>((value) => value as core.String)
          .toList();
    }
    if (_json.containsKey('lastModifiedBefore')) {
      lastModifiedBefore = _json['lastModifiedBefore'] as core.String;
    }
    if (_json.containsKey('lastModifiedSince')) {
      lastModifiedSince = _json['lastModifiedSince'] as core.String;
    }
    if (_json.containsKey('maxTimeElapsedSinceLastModification')) {
      maxTimeElapsedSinceLastModification =
          _json['maxTimeElapsedSinceLastModification'] as core.String;
    }
    if (_json.containsKey('minTimeElapsedSinceLastModification')) {
      minTimeElapsedSinceLastModification =
          _json['minTimeElapsedSinceLastModification'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (excludePrefixes != null) {
      _json['excludePrefixes'] = excludePrefixes;
    }
    if (includePrefixes != null) {
      _json['includePrefixes'] = includePrefixes;
    }
    if (lastModifiedBefore != null) {
      _json['lastModifiedBefore'] = lastModifiedBefore;
    }
    if (lastModifiedSince != null) {
      _json['lastModifiedSince'] = lastModifiedSince;
    }
    if (maxTimeElapsedSinceLastModification != null) {
      _json['maxTimeElapsedSinceLastModification'] =
          maxTimeElapsedSinceLastModification;
    }
    if (minTimeElapsedSinceLastModification != null) {
      _json['minTimeElapsedSinceLastModification'] =
          minTimeElapsedSinceLastModification;
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

  /// The error result of the operation in case of failure or cancellation.
  Status error;

  /// Represents the transfer operation object.
  ///
  /// To request a TransferOperation object, use transferOperations.get.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// The server-assigned name, which is only unique within the same service
  /// that originally returns it.
  ///
  /// If you use the default HTTP mapping, the `name` should have the format of
  /// `transferOperations/some/unique/name`.
  core.String name;

  /// The normal response of the operation in case of success.
  ///
  /// If the original method returns no data on success, such as `Delete`, the
  /// response is `google.protobuf.Empty`. If the original method is standard
  /// `Get`/`Create`/`Update`, the response should be the resource. For other
  /// methods, the response should have the type `XxxResponse`, where `Xxx` is
  /// the original method name. For example, if the original method name is
  /// `TakeSnapshot()`, the inferred response type is `TakeSnapshotResponse`.
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

/// Request passed to PauseTransferOperation.
class PauseTransferOperationRequest {
  PauseTransferOperationRequest();

  PauseTransferOperationRequest.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Request passed to ResumeTransferOperation.
class ResumeTransferOperationRequest {
  ResumeTransferOperationRequest();

  ResumeTransferOperationRequest.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Transfers can be scheduled to recur or to run just once.
class Schedule {
  /// The time in UTC that no further transfer operations are scheduled.
  ///
  /// Combined with schedule_end_date, `end_time_of_day` specifies the end date
  /// and time for starting new transfer operations. This field must be greater
  /// than or equal to the timestamp corresponding to the combintation of
  /// schedule_start_date and start_time_of_day, and is subject to the
  /// following: * If `end_time_of_day` is not set and `schedule_end_date` is
  /// set, then a default value of `23:59:59` is used for `end_time_of_day`. *
  /// If `end_time_of_day` is set and `schedule_end_date` is not set, then
  /// INVALID_ARGUMENT is returned.
  TimeOfDay endTimeOfDay;

  /// Interval between the start of each scheduled TransferOperation.
  ///
  /// If unspecified, the default value is 24 hours. This value may not be less
  /// than 1 hour.
  core.String repeatInterval;

  /// The last day a transfer runs.
  ///
  /// Date boundaries are determined relative to UTC time. A job will run once
  /// per 24 hours within the following guidelines: * If `schedule_end_date` and
  /// schedule_start_date are the same and in the future relative to UTC, the
  /// transfer is executed only one time. * If `schedule_end_date` is later than
  /// `schedule_start_date` and `schedule_end_date` is in the future relative to
  /// UTC, the job will run each day at start_time_of_day through
  /// `schedule_end_date`.
  Date scheduleEndDate;

  /// The start date of a transfer.
  ///
  /// Date boundaries are determined relative to UTC time. If
  /// `schedule_start_date` and start_time_of_day are in the past relative to
  /// the job's creation time, the transfer starts the day after you schedule
  /// the transfer request. **Note:** When starting jobs at or near midnight UTC
  /// it is possible that a job will start later than expected. For example, if
  /// you send an outbound request on June 1 one millisecond prior to midnight
  /// UTC and the Storage Transfer Service server receives the request on June
  /// 2, then it will create a TransferJob with `schedule_start_date` set to
  /// June 2 and a `start_time_of_day` set to midnight UTC. The first scheduled
  /// TransferOperation will take place on June 3 at midnight UTC.
  ///
  /// Required.
  Date scheduleStartDate;

  /// The time in UTC that a transfer job is scheduled to run.
  ///
  /// Transfers may start later than this time. If `start_time_of_day` is not
  /// specified: * One-time transfers run immediately. * Recurring transfers run
  /// immediately, and each day at midnight UTC, through schedule_end_date. If
  /// `start_time_of_day` is specified: * One-time transfers run at the
  /// specified time. * Recurring transfers run at the specified time each day,
  /// through `schedule_end_date`.
  TimeOfDay startTimeOfDay;

  Schedule();

  Schedule.fromJson(core.Map _json) {
    if (_json.containsKey('endTimeOfDay')) {
      endTimeOfDay = TimeOfDay.fromJson(
          _json['endTimeOfDay'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('repeatInterval')) {
      repeatInterval = _json['repeatInterval'] as core.String;
    }
    if (_json.containsKey('scheduleEndDate')) {
      scheduleEndDate = Date.fromJson(
          _json['scheduleEndDate'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('scheduleStartDate')) {
      scheduleStartDate = Date.fromJson(
          _json['scheduleStartDate'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('startTimeOfDay')) {
      startTimeOfDay = TimeOfDay.fromJson(
          _json['startTimeOfDay'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (endTimeOfDay != null) {
      _json['endTimeOfDay'] = endTimeOfDay.toJson();
    }
    if (repeatInterval != null) {
      _json['repeatInterval'] = repeatInterval;
    }
    if (scheduleEndDate != null) {
      _json['scheduleEndDate'] = scheduleEndDate.toJson();
    }
    if (scheduleStartDate != null) {
      _json['scheduleStartDate'] = scheduleStartDate.toJson();
    }
    if (startTimeOfDay != null) {
      _json['startTimeOfDay'] = startTimeOfDay.toJson();
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

/// Represents a time of day.
///
/// The date and time zone are either not significant or are specified
/// elsewhere. An API may choose to allow leap seconds. Related types are
/// google.type.Date and `google.protobuf.Timestamp`.
class TimeOfDay {
  /// Hours of day in 24 hour format.
  ///
  /// Should be from 0 to 23. An API may choose to allow the value "24:00:00"
  /// for scenarios like business closing time.
  core.int hours;

  /// Minutes of hour of day.
  ///
  /// Must be from 0 to 59.
  core.int minutes;

  /// Fractions of seconds in nanoseconds.
  ///
  /// Must be from 0 to 999,999,999.
  core.int nanos;

  /// Seconds of minutes of the time.
  ///
  /// Must normally be from 0 to 59. An API may allow the value 60 if it allows
  /// leap-seconds.
  core.int seconds;

  TimeOfDay();

  TimeOfDay.fromJson(core.Map _json) {
    if (_json.containsKey('hours')) {
      hours = _json['hours'] as core.int;
    }
    if (_json.containsKey('minutes')) {
      minutes = _json['minutes'] as core.int;
    }
    if (_json.containsKey('nanos')) {
      nanos = _json['nanos'] as core.int;
    }
    if (_json.containsKey('seconds')) {
      seconds = _json['seconds'] as core.int;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (hours != null) {
      _json['hours'] = hours;
    }
    if (minutes != null) {
      _json['minutes'] = minutes;
    }
    if (nanos != null) {
      _json['nanos'] = nanos;
    }
    if (seconds != null) {
      _json['seconds'] = seconds;
    }
    return _json;
  }
}

/// A collection of counters that report the progress of a transfer operation.
class TransferCounters {
  /// Bytes that are copied to the data sink.
  core.String bytesCopiedToSink;

  /// Bytes that are deleted from the data sink.
  core.String bytesDeletedFromSink;

  /// Bytes that are deleted from the data source.
  core.String bytesDeletedFromSource;

  /// Bytes that failed to be deleted from the data sink.
  core.String bytesFailedToDeleteFromSink;

  /// Bytes found in the data source that are scheduled to be transferred,
  /// excluding any that are filtered based on object conditions or skipped due
  /// to sync.
  core.String bytesFoundFromSource;

  /// Bytes found only in the data sink that are scheduled to be deleted.
  core.String bytesFoundOnlyFromSink;

  /// Bytes in the data source that failed to be transferred or that failed to
  /// be deleted after being transferred.
  core.String bytesFromSourceFailed;

  /// Bytes in the data source that are not transferred because they already
  /// exist in the data sink.
  core.String bytesFromSourceSkippedBySync;

  /// Objects that are copied to the data sink.
  core.String objectsCopiedToSink;

  /// Objects that are deleted from the data sink.
  core.String objectsDeletedFromSink;

  /// Objects that are deleted from the data source.
  core.String objectsDeletedFromSource;

  /// Objects that failed to be deleted from the data sink.
  core.String objectsFailedToDeleteFromSink;

  /// Objects found in the data source that are scheduled to be transferred,
  /// excluding any that are filtered based on object conditions or skipped due
  /// to sync.
  core.String objectsFoundFromSource;

  /// Objects found only in the data sink that are scheduled to be deleted.
  core.String objectsFoundOnlyFromSink;

  /// Objects in the data source that failed to be transferred or that failed to
  /// be deleted after being transferred.
  core.String objectsFromSourceFailed;

  /// Objects in the data source that are not transferred because they already
  /// exist in the data sink.
  core.String objectsFromSourceSkippedBySync;

  TransferCounters();

  TransferCounters.fromJson(core.Map _json) {
    if (_json.containsKey('bytesCopiedToSink')) {
      bytesCopiedToSink = _json['bytesCopiedToSink'] as core.String;
    }
    if (_json.containsKey('bytesDeletedFromSink')) {
      bytesDeletedFromSink = _json['bytesDeletedFromSink'] as core.String;
    }
    if (_json.containsKey('bytesDeletedFromSource')) {
      bytesDeletedFromSource = _json['bytesDeletedFromSource'] as core.String;
    }
    if (_json.containsKey('bytesFailedToDeleteFromSink')) {
      bytesFailedToDeleteFromSink =
          _json['bytesFailedToDeleteFromSink'] as core.String;
    }
    if (_json.containsKey('bytesFoundFromSource')) {
      bytesFoundFromSource = _json['bytesFoundFromSource'] as core.String;
    }
    if (_json.containsKey('bytesFoundOnlyFromSink')) {
      bytesFoundOnlyFromSink = _json['bytesFoundOnlyFromSink'] as core.String;
    }
    if (_json.containsKey('bytesFromSourceFailed')) {
      bytesFromSourceFailed = _json['bytesFromSourceFailed'] as core.String;
    }
    if (_json.containsKey('bytesFromSourceSkippedBySync')) {
      bytesFromSourceSkippedBySync =
          _json['bytesFromSourceSkippedBySync'] as core.String;
    }
    if (_json.containsKey('objectsCopiedToSink')) {
      objectsCopiedToSink = _json['objectsCopiedToSink'] as core.String;
    }
    if (_json.containsKey('objectsDeletedFromSink')) {
      objectsDeletedFromSink = _json['objectsDeletedFromSink'] as core.String;
    }
    if (_json.containsKey('objectsDeletedFromSource')) {
      objectsDeletedFromSource =
          _json['objectsDeletedFromSource'] as core.String;
    }
    if (_json.containsKey('objectsFailedToDeleteFromSink')) {
      objectsFailedToDeleteFromSink =
          _json['objectsFailedToDeleteFromSink'] as core.String;
    }
    if (_json.containsKey('objectsFoundFromSource')) {
      objectsFoundFromSource = _json['objectsFoundFromSource'] as core.String;
    }
    if (_json.containsKey('objectsFoundOnlyFromSink')) {
      objectsFoundOnlyFromSink =
          _json['objectsFoundOnlyFromSink'] as core.String;
    }
    if (_json.containsKey('objectsFromSourceFailed')) {
      objectsFromSourceFailed = _json['objectsFromSourceFailed'] as core.String;
    }
    if (_json.containsKey('objectsFromSourceSkippedBySync')) {
      objectsFromSourceSkippedBySync =
          _json['objectsFromSourceSkippedBySync'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (bytesCopiedToSink != null) {
      _json['bytesCopiedToSink'] = bytesCopiedToSink;
    }
    if (bytesDeletedFromSink != null) {
      _json['bytesDeletedFromSink'] = bytesDeletedFromSink;
    }
    if (bytesDeletedFromSource != null) {
      _json['bytesDeletedFromSource'] = bytesDeletedFromSource;
    }
    if (bytesFailedToDeleteFromSink != null) {
      _json['bytesFailedToDeleteFromSink'] = bytesFailedToDeleteFromSink;
    }
    if (bytesFoundFromSource != null) {
      _json['bytesFoundFromSource'] = bytesFoundFromSource;
    }
    if (bytesFoundOnlyFromSink != null) {
      _json['bytesFoundOnlyFromSink'] = bytesFoundOnlyFromSink;
    }
    if (bytesFromSourceFailed != null) {
      _json['bytesFromSourceFailed'] = bytesFromSourceFailed;
    }
    if (bytesFromSourceSkippedBySync != null) {
      _json['bytesFromSourceSkippedBySync'] = bytesFromSourceSkippedBySync;
    }
    if (objectsCopiedToSink != null) {
      _json['objectsCopiedToSink'] = objectsCopiedToSink;
    }
    if (objectsDeletedFromSink != null) {
      _json['objectsDeletedFromSink'] = objectsDeletedFromSink;
    }
    if (objectsDeletedFromSource != null) {
      _json['objectsDeletedFromSource'] = objectsDeletedFromSource;
    }
    if (objectsFailedToDeleteFromSink != null) {
      _json['objectsFailedToDeleteFromSink'] = objectsFailedToDeleteFromSink;
    }
    if (objectsFoundFromSource != null) {
      _json['objectsFoundFromSource'] = objectsFoundFromSource;
    }
    if (objectsFoundOnlyFromSink != null) {
      _json['objectsFoundOnlyFromSink'] = objectsFoundOnlyFromSink;
    }
    if (objectsFromSourceFailed != null) {
      _json['objectsFromSourceFailed'] = objectsFromSourceFailed;
    }
    if (objectsFromSourceSkippedBySync != null) {
      _json['objectsFromSourceSkippedBySync'] = objectsFromSourceSkippedBySync;
    }
    return _json;
  }
}

/// This resource represents the configuration of a transfer job that runs
/// periodically.
class TransferJob {
  /// The time that the transfer job was created.
  ///
  /// Output only.
  core.String creationTime;

  /// The time that the transfer job was deleted.
  ///
  /// Output only.
  core.String deletionTime;

  /// A description provided by the user for the job.
  ///
  /// Its max length is 1024 bytes when Unicode-encoded.
  core.String description;

  /// The time that the transfer job was last modified.
  ///
  /// Output only.
  core.String lastModificationTime;

  /// The name of the most recently started TransferOperation of this JobConfig.
  ///
  /// Present if and only if at least one TransferOperation has been created for
  /// this JobConfig.
  core.String latestOperationName;

  /// A unique name (within the transfer project) assigned when the job is
  /// created.
  ///
  /// If this field is empty in a CreateTransferJobRequest, Storage Transfer
  /// Service will assign a unique name. Otherwise, the specified name is used
  /// as the unique name for this job. If the specified name is in use by a job,
  /// the creation request fails with an ALREADY_EXISTS error. This name must
  /// start with `"transferJobs/"` prefix and end with a letter or a number, and
  /// should be no more than 128 characters. Example:
  /// `"transferJobs/[A-Za-z0-9-._~]*[A-Za-z0-9]$"` Invalid job names will fail
  /// with an INVALID_ARGUMENT error.
  core.String name;

  /// Notification configuration.
  NotificationConfig notificationConfig;

  /// The ID of the Google Cloud Platform Project that owns the job.
  core.String projectId;

  /// Schedule specification.
  Schedule schedule;

  /// Status of the job.
  ///
  /// This value MUST be specified for `CreateTransferJobRequests`. **Note:**
  /// The effect of the new job status takes place during a subsequent job run.
  /// For example, if you change the job status from ENABLED to DISABLED, and an
  /// operation spawned by the transfer is running, the status change would not
  /// affect the current operation.
  /// Possible string values are:
  /// - "STATUS_UNSPECIFIED" : Zero is an illegal value.
  /// - "ENABLED" : New transfers will be performed based on the schedule.
  /// - "DISABLED" : New transfers will not be scheduled.
  /// - "DELETED" : This is a soft delete state. After a transfer job is set to
  /// this state, the job and all the transfer executions are subject to garbage
  /// collection. Transfer jobs become eligible for garbage collection 30 days
  /// after their status is set to `DELETED`.
  core.String status;

  /// Transfer specification.
  TransferSpec transferSpec;

  TransferJob();

  TransferJob.fromJson(core.Map _json) {
    if (_json.containsKey('creationTime')) {
      creationTime = _json['creationTime'] as core.String;
    }
    if (_json.containsKey('deletionTime')) {
      deletionTime = _json['deletionTime'] as core.String;
    }
    if (_json.containsKey('description')) {
      description = _json['description'] as core.String;
    }
    if (_json.containsKey('lastModificationTime')) {
      lastModificationTime = _json['lastModificationTime'] as core.String;
    }
    if (_json.containsKey('latestOperationName')) {
      latestOperationName = _json['latestOperationName'] as core.String;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('notificationConfig')) {
      notificationConfig = NotificationConfig.fromJson(
          _json['notificationConfig'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
    if (_json.containsKey('schedule')) {
      schedule = Schedule.fromJson(
          _json['schedule'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
    if (_json.containsKey('transferSpec')) {
      transferSpec = TransferSpec.fromJson(
          _json['transferSpec'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (creationTime != null) {
      _json['creationTime'] = creationTime;
    }
    if (deletionTime != null) {
      _json['deletionTime'] = deletionTime;
    }
    if (description != null) {
      _json['description'] = description;
    }
    if (lastModificationTime != null) {
      _json['lastModificationTime'] = lastModificationTime;
    }
    if (latestOperationName != null) {
      _json['latestOperationName'] = latestOperationName;
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (notificationConfig != null) {
      _json['notificationConfig'] = notificationConfig.toJson();
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    if (schedule != null) {
      _json['schedule'] = schedule.toJson();
    }
    if (status != null) {
      _json['status'] = status;
    }
    if (transferSpec != null) {
      _json['transferSpec'] = transferSpec.toJson();
    }
    return _json;
  }
}

/// A description of the execution of a transfer.
class TransferOperation {
  /// Information about the progress of the transfer operation.
  TransferCounters counters;

  /// End time of this transfer execution.
  core.String endTime;

  /// Summarizes errors encountered with sample error log entries.
  core.List<ErrorSummary> errorBreakdowns;

  /// A globally unique ID assigned by the system.
  core.String name;

  /// Notification configuration.
  NotificationConfig notificationConfig;

  /// The ID of the Google Cloud Platform Project that owns the operation.
  core.String projectId;

  /// Start time of this transfer execution.
  core.String startTime;

  /// Status of the transfer operation.
  /// Possible string values are:
  /// - "STATUS_UNSPECIFIED" : Zero is an illegal value.
  /// - "IN_PROGRESS" : In progress.
  /// - "PAUSED" : Paused.
  /// - "SUCCESS" : Completed successfully.
  /// - "FAILED" : Terminated due to an unrecoverable failure.
  /// - "ABORTED" : Aborted by the user.
  /// - "QUEUED" : Temporarily delayed by the system. No user action is
  /// required.
  core.String status;

  /// The name of the transfer job that triggers this transfer operation.
  core.String transferJobName;

  /// Transfer specification.
  TransferSpec transferSpec;

  TransferOperation();

  TransferOperation.fromJson(core.Map _json) {
    if (_json.containsKey('counters')) {
      counters = TransferCounters.fromJson(
          _json['counters'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('endTime')) {
      endTime = _json['endTime'] as core.String;
    }
    if (_json.containsKey('errorBreakdowns')) {
      errorBreakdowns = (_json['errorBreakdowns'] as core.List)
          .map<ErrorSummary>((value) => ErrorSummary.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('notificationConfig')) {
      notificationConfig = NotificationConfig.fromJson(
          _json['notificationConfig'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
    if (_json.containsKey('startTime')) {
      startTime = _json['startTime'] as core.String;
    }
    if (_json.containsKey('status')) {
      status = _json['status'] as core.String;
    }
    if (_json.containsKey('transferJobName')) {
      transferJobName = _json['transferJobName'] as core.String;
    }
    if (_json.containsKey('transferSpec')) {
      transferSpec = TransferSpec.fromJson(
          _json['transferSpec'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (counters != null) {
      _json['counters'] = counters.toJson();
    }
    if (endTime != null) {
      _json['endTime'] = endTime;
    }
    if (errorBreakdowns != null) {
      _json['errorBreakdowns'] =
          errorBreakdowns.map((value) => value.toJson()).toList();
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (notificationConfig != null) {
      _json['notificationConfig'] = notificationConfig.toJson();
    }
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    if (startTime != null) {
      _json['startTime'] = startTime;
    }
    if (status != null) {
      _json['status'] = status;
    }
    if (transferJobName != null) {
      _json['transferJobName'] = transferJobName;
    }
    if (transferSpec != null) {
      _json['transferSpec'] = transferSpec.toJson();
    }
    return _json;
  }
}

/// TransferOptions define the actions to be performed on objects in a transfer.
class TransferOptions {
  /// Whether objects should be deleted from the source after they are
  /// transferred to the sink.
  ///
  /// **Note:** This option and delete_objects_unique_in_sink are mutually
  /// exclusive.
  core.bool deleteObjectsFromSourceAfterTransfer;

  /// Whether objects that exist only in the sink should be deleted.
  ///
  /// **Note:** This option and delete_objects_from_source_after_transfer are
  /// mutually exclusive.
  core.bool deleteObjectsUniqueInSink;

  /// When to overwrite objects that already exist in the sink.
  ///
  /// The default is that only objects that are different from the source are
  /// ovewritten. If true, all objects in the sink whose name matches an object
  /// in the source will be overwritten with the source object.
  core.bool overwriteObjectsAlreadyExistingInSink;

  TransferOptions();

  TransferOptions.fromJson(core.Map _json) {
    if (_json.containsKey('deleteObjectsFromSourceAfterTransfer')) {
      deleteObjectsFromSourceAfterTransfer =
          _json['deleteObjectsFromSourceAfterTransfer'] as core.bool;
    }
    if (_json.containsKey('deleteObjectsUniqueInSink')) {
      deleteObjectsUniqueInSink =
          _json['deleteObjectsUniqueInSink'] as core.bool;
    }
    if (_json.containsKey('overwriteObjectsAlreadyExistingInSink')) {
      overwriteObjectsAlreadyExistingInSink =
          _json['overwriteObjectsAlreadyExistingInSink'] as core.bool;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (deleteObjectsFromSourceAfterTransfer != null) {
      _json['deleteObjectsFromSourceAfterTransfer'] =
          deleteObjectsFromSourceAfterTransfer;
    }
    if (deleteObjectsUniqueInSink != null) {
      _json['deleteObjectsUniqueInSink'] = deleteObjectsUniqueInSink;
    }
    if (overwriteObjectsAlreadyExistingInSink != null) {
      _json['overwriteObjectsAlreadyExistingInSink'] =
          overwriteObjectsAlreadyExistingInSink;
    }
    return _json;
  }
}

/// Configuration for running a transfer.
class TransferSpec {
  /// An AWS S3 data source.
  AwsS3Data awsS3DataSource;

  /// An Azure Blob Storage data source.
  AzureBlobStorageData azureBlobStorageDataSource;

  /// A Cloud Storage data sink.
  GcsData gcsDataSink;

  /// A Cloud Storage data source.
  GcsData gcsDataSource;

  /// An HTTP URL data source.
  HttpData httpDataSource;

  /// Only objects that satisfy these object conditions are included in the set
  /// of data source and data sink objects.
  ///
  /// Object conditions based on objects' "last modification time" do not
  /// exclude objects in a data sink.
  ObjectConditions objectConditions;

  /// If the option delete_objects_unique_in_sink is `true` and time-based
  /// object conditions such as 'last modification time' are specified, the
  /// request fails with an INVALID_ARGUMENT error.
  TransferOptions transferOptions;

  TransferSpec();

  TransferSpec.fromJson(core.Map _json) {
    if (_json.containsKey('awsS3DataSource')) {
      awsS3DataSource = AwsS3Data.fromJson(
          _json['awsS3DataSource'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('azureBlobStorageDataSource')) {
      azureBlobStorageDataSource = AzureBlobStorageData.fromJson(
          _json['azureBlobStorageDataSource']
              as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('gcsDataSink')) {
      gcsDataSink = GcsData.fromJson(
          _json['gcsDataSink'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('gcsDataSource')) {
      gcsDataSource = GcsData.fromJson(
          _json['gcsDataSource'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('httpDataSource')) {
      httpDataSource = HttpData.fromJson(
          _json['httpDataSource'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('objectConditions')) {
      objectConditions = ObjectConditions.fromJson(
          _json['objectConditions'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('transferOptions')) {
      transferOptions = TransferOptions.fromJson(
          _json['transferOptions'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (awsS3DataSource != null) {
      _json['awsS3DataSource'] = awsS3DataSource.toJson();
    }
    if (azureBlobStorageDataSource != null) {
      _json['azureBlobStorageDataSource'] = azureBlobStorageDataSource.toJson();
    }
    if (gcsDataSink != null) {
      _json['gcsDataSink'] = gcsDataSink.toJson();
    }
    if (gcsDataSource != null) {
      _json['gcsDataSource'] = gcsDataSource.toJson();
    }
    if (httpDataSource != null) {
      _json['httpDataSource'] = httpDataSource.toJson();
    }
    if (objectConditions != null) {
      _json['objectConditions'] = objectConditions.toJson();
    }
    if (transferOptions != null) {
      _json['transferOptions'] = transferOptions.toJson();
    }
    return _json;
  }
}

/// Request passed to UpdateTransferJob.
class UpdateTransferJobRequest {
  /// The ID of the Google Cloud Platform Console project that owns the job.
  ///
  /// Required.
  core.String projectId;

  /// The job to update.
  ///
  /// `transferJob` is expected to specify only four fields: description,
  /// transfer_spec, notification_config, and status. An
  /// `UpdateTransferJobRequest` that specifies other fields will be rejected
  /// with the error INVALID_ARGUMENT. Updating a job satus to DELETED requires
  /// `storagetransfer.jobs.delete` permissions.
  ///
  /// Required.
  TransferJob transferJob;

  /// The field mask of the fields in `transferJob` that are to be updated in
  /// this request.
  ///
  /// Fields in `transferJob` that can be updated are: description,
  /// transfer_spec, notification_config, and status. To update the
  /// `transfer_spec` of the job, a complete transfer specification must be
  /// provided. An incomplete specification missing any required fields will be
  /// rejected with the error INVALID_ARGUMENT.
  core.String updateTransferJobFieldMask;

  UpdateTransferJobRequest();

  UpdateTransferJobRequest.fromJson(core.Map _json) {
    if (_json.containsKey('projectId')) {
      projectId = _json['projectId'] as core.String;
    }
    if (_json.containsKey('transferJob')) {
      transferJob = TransferJob.fromJson(
          _json['transferJob'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('updateTransferJobFieldMask')) {
      updateTransferJobFieldMask =
          _json['updateTransferJobFieldMask'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (projectId != null) {
      _json['projectId'] = projectId;
    }
    if (transferJob != null) {
      _json['transferJob'] = transferJob.toJson();
    }
    if (updateTransferJobFieldMask != null) {
      _json['updateTransferJobFieldMask'] = updateTransferJobFieldMask;
    }
    return _json;
  }
}
