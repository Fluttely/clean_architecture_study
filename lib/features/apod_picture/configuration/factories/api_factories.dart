String apodApiKeyFactory() => 'Ieuiin5UvhSz44qMh9rboqVMfOkYbkNebhwEtxPF';

String apodApiUrlFactory(
        {required String apiKey, required String requestPath}) =>
    'https://api.nasa.gov/planetary/apod?api_key=$apiKey$requestPath';
