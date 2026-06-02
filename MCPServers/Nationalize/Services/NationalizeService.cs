using MCPServers.Shared;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Nationalize.Services;

public class NationalizeService : BaseHttpService
{
    private const string DefaultBaseUrl = "https://api.nationalize.io";
    private readonly string _baseUrl;

    public NationalizeService(
        IConfiguration configuration,
        HttpClient client,
        ILogger<NationalizeService> logger)
        : base(configuration, client, logger)
    {
        _baseUrl = configuration["NationalizeApi:BaseUrl"]?.Trim() ?? string.Empty;
        if (string.IsNullOrEmpty(_baseUrl))
        {
            _baseUrl = DefaultBaseUrl;
        }
    }

    public async Task<string> PredictNationalityAsync(string name)
    {
        if (string.IsNullOrWhiteSpace(name))
        {
            throw new ArgumentException("Name must not be empty.", nameof(name));
        }

        var url = $"{_baseUrl.TrimEnd('/')}/?name={Uri.EscapeDataString(name.Trim())}";
        return await GetAsync(url);
    }
}
