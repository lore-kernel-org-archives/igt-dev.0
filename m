Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24C410E50A
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 13:41:43 +0000 (UTC)
Message-ID: <32105015-e679-4329-7c73-180319e31588@intel.com>
Date: Tue, 5 Sep 2023 19:11:19 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230905083351.1249743-1-swati2.sharma@intel.com>
 <20230905083351.1249743-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230905083351.1249743-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v8 1/3] lib/dsc: add helpers for vdsc fractional bpp
 debugfs entry
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

Hi Swati,

On Tue-05-09-2023 02:03 pm, Swati Sharma wrote:
> Helper functions are added for getting/setting VDSC Fractional BPP
> debugfs entry.
> 
> v2: -improved func description (Ankit)
>      -increased buff size (Ankit)
>      -asserted bpp_prec (Ankit)
> v3: -return 0 on success instead of 1 (Jouni)
> v4: -rebase
> v5: -alignment fixes (Ankit)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   lib/igt_dsc.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_dsc.h |   6 +++
>   2 files changed, 109 insertions(+)
> 
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 76a420c10..61d619a4a 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -205,3 +205,106 @@ int igt_force_dsc_output_format(int drmfd, char *connector_name,
>   
>   	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_output_format", buf);
>   }
> +
> +/*

Please fix the documentation (second '*' is missing), otherwise scripts 
will treat it as simple multiline comment.

it should start with /**

- Bhanu

> + * igt_get_dsc_fractional_bpp_supported:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: DSC BPP precision supported by the sink.
> + * 	    Precision value of
> + * 		16 => 1/16
> + * 		8  => 1/8
> + * 		1  => fractional bpp not supported
> + */
> +int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
> +{
> +	char file_name[128] = {0};
> +	char buf[512];
> +	char *start_loc;
> +	int bpp_prec;
> +
> +	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
> +	igt_debugfs_read(drmfd, file_name, buf);
> +
> +	igt_assert(start_loc = strstr(buf, "DSC_Sink_BPP_Precision: "));
> +	igt_assert_eq(sscanf(start_loc, "DSC_Sink_BPP_Precision: %d", &bpp_prec), 1);
> +	igt_assert(bpp_prec > 0);
> +
> +	return bpp_prec;
> +}
> +
> +/*
> + * igt_is_dsc_fractional_bpp_supported_by_sink:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC fractional bpp is supported for the given connector,
> + * false otherwise.
> + */
> +bool igt_is_dsc_fractional_bpp_supported_by_sink(int drmfd, char *connector_name)
> +{
> +	int bpp_prec;
> +
> +	bpp_prec = igt_get_dsc_fractional_bpp_supported(drmfd, connector_name);
> +
> +	if (bpp_prec == 1)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool check_dsc_fractional_bpp_debugfs(int drmfd, char *connector_name,
> +					     const char *check_str)
> +{
> +	char file_name[128] = {0};
> +	char buf[512];
> +
> +	sprintf(file_name, "%s/i915_dsc_fractional_bpp", connector_name);
> +
> +	igt_debugfs_read(drmfd, file_name, buf);
> +
> +	return strstr(buf, check_str);
> +}
> +
> +/*
> + * igt_is_force_dsc_fractional_bpp_enabled:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: True if DSC Fractional BPP is force enabled (via debugfs) for the given connector,
> + * false otherwise.
> + */
> +bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name)
> +{
> +	return check_dsc_fractional_bpp_debugfs(drmfd, connector_name, "Force_DSC_Fractional_BPP_Enable: yes");
> +}
> +
> +/*
> + * igt_force_dsc_fractional_bpp_enable:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: 0 on success or negative error code, in case of failure.
> + */
> +int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name)
> +{
> +	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_fractional_bpp", "1");
> +}
> +
> +/*
> + * igt_get_dsc_fractional_bpp_debugfs_fd:
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Returns: fd of the DSC Fractional BPP debugfs for the given connector,
> + * else returns -1.
> + */
> +int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name)
> +{
> +	char file_name[128] = {0};
> +
> +	sprintf(file_name, "%s/i915_dsc_fractional_bpp", connector_name);
> +
> +	return openat(igt_debugfs_dir(drmfd), file_name, O_WRONLY);
> +}
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
> index b58743b5f..7ab0917ec 100644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt_fb.h"
>   #include "igt_kms.h"
> +#include "igt_core.h"
>   
>   bool igt_is_dsc_supported_by_source(int drmfd);
>   bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name);
> @@ -21,5 +22,10 @@ bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
>   						enum dsc_output_format output_format);
>   int igt_force_dsc_output_format(int drmfd, char *connector_name,
>   				enum dsc_output_format output_format);
> +bool igt_is_dsc_fractional_bpp_supported_by_sink(int drmfd, char *connector_name);
> +int igt_get_dsc_fractional_bpp_supported(int drmfd, char *connector_name);
> +bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
> +int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
> +int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
>   
>   #endif
