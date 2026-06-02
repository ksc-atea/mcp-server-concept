using System.ComponentModel;
using ModelContextProtocol.Server;
using Nationalize.Services;

namespace Nationalize;

[McpServerToolType]
public class NationalizeTool
{
    private readonly NationalizeService _service;

    public NationalizeTool(NationalizeService service)
    {
        _service = service;
    }

    [McpServerTool, Description("Predict a person's nationality from their first name using Nationalize.io.")]
    public async Task<string> PredictNationality(
        [Description("The first name to analyze for nationality prediction.")] string name)
    {
        if (string.IsNullOrWhiteSpace(name))
        {
            throw new ArgumentException("Name must not be empty.", nameof(name));
        }

        return await _service.PredictNationalityAsync(name);
    }
}
