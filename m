Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC9610E79D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 13:28:31 +0000 (UTC)
Message-ID: <55c298b4-d8f4-c951-7f25-8a4f63324ef1@intel.com>
Date: Fri, 3 Feb 2023 18:58:27 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230202072121.26153-1-swati2.sharma@intel.com>
 <20230202072121.26153-6-swati2.sharma@intel.com>
 <20230203123944.5ykzd7gofvn2p4kj@kamilkon-desk1>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230203123944.5ykzd7gofvn2p4kj@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/6] lib/dsc: Add helpers for VDSC
 output format debugfs entry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kamil,

Will address your review comments in next version.

On 03-Feb-23 6:09 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-02-02 at 12:51:20 +0530, Swati Sharma wrote:
>> Helper functions are added for VDSC output format debugfs entry.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   lib/igt_dsc.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_dsc.h |  5 +++++
>>   lib/igt_kms.h |  6 ++++++
>>   3 files changed, 60 insertions(+)
>>
>> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
>> index 64dd6b29a..1f6d33291 100644
>> --- a/lib/igt_dsc.c
>> +++ b/lib/igt_dsc.c
>> @@ -134,3 +134,52 @@ int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name)
>>   
>>   	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
>>   }
>> +
>> +/*
> --- ^
> Descriptions should start with two stars, so it should look like:
> 
> /**
>   * igt_is_dsc_output_format_supported_by_sink:
> 
>> + * igt_is_dsc_output_format_supported_by_sink:
>> + * @drmfd: A drm file descriptor
>> + * @connector_name: Name of the libdrm connector we're going to use
>> + * @output_format: Output format
>> + *
>> + * Returns: True if DSC output format is supported for the given connector,
>> + * false otherwise.
>> + */
>> +bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
>> +						enum dsc_output_format output_format)
>> +{
>> +	const char *check_str = "OUTPUTFORMATNOTFOUND";
>> +
>> +	switch(output_format) {
> --------------^
> Put space after "switch" and before opening "(":
> 	switch (output_format) {
> 
> Please use checkpatch script from Linux kernel sources, it can help
> you catch such errors.
> 
>> +	case DSC_FORMAT_RGB:
>> +		check_str = "RGB: yes";
>> +		break;
>> +	case DSC_FORMAT_YCBCR420:
>> +		check_str = "YCBCR420: yes";
>> +		break;
>> +	case DSC_FORMAT_YCBCR444:
>> +		check_str = "YCBCR444: yes";
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return check_dsc_debugfs(drmfd, connector_name, check_str);
>> +}
>> +
>> +/*
> --- ^
> Same here, two stars.
> 
> Regards,
> Kamil
> 
>> + * igt_force_dsc_output_format:
>> + * @drmfd: A drm file descriptor
>> + * @connector_name: Name of the libdrm connector we're going to use
>> + * @output_format: Output format
>> + *
>> + * Returns: 0 on success or negative error code, in case of failure.
>> + */
>> +int igt_force_dsc_output_format(int drmfd, char *connector_name,
>> +				enum dsc_output_format output_format)
>> +{
>> +	char buf[20] = {0};
>> +
>> +	sprintf(buf, "%d", output_format);
>> +
>> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_output_format", buf);
>> +}
>> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
>> index 291c2cdea..9608aad44 100644
>> --- a/lib/igt_dsc.h
>> +++ b/lib/igt_dsc.h
>> @@ -7,6 +7,7 @@
>>   #define IGT_DSC_H
>>   
>>   #include "igt_fb.h"
>> +#include "igt_kms.h"
>>   
>>   bool igt_is_dsc_supported(int drmfd, char *connector_name);
>>   bool igt_is_fec_supported(int drmfd, char *connector_name);
>> @@ -15,5 +16,9 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
>>   int igt_force_dsc_enable(int drmfd, char *connector_name);
>>   int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
>>   int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
>> +bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
>> +						enum dsc_output_format output_format);
>> +int igt_force_dsc_output_format(int drmfd, char *connector_name,
>> +				enum dsc_output_format output_format);
>>   
>>   #endif
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index be5482e08..9f5bef170 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -106,6 +106,12 @@ enum igt_custom_edid_type {
>>    */
>>   #define kmstest_port_name(port) ((port) + 'A')
>>   
>> +enum dsc_output_format {
>> +	DSC_FORMAT_RGB = 0,
>> +	DSC_FORMAT_YCBCR420,
>> +	DSC_FORMAT_YCBCR444
>> +};
>> +
>>   const char *kmstest_encoder_type_str(int type);
>>   const char *kmstest_connector_status_str(int status);
>>   const char *kmstest_connector_type_str(int type);
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
