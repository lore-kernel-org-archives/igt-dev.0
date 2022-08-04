Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4E9A1982
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 19:15:56 +0000 (UTC)
Message-ID: <39d8ed75-4ba2-0dbe-1ec1-9cb189e34667@quicinc.com>
Date: Thu, 4 Aug 2022 12:15:50 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rohith Iyer <quic_rohiiyer@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220730003506.10659-1-quic_rohiiyer@quicinc.com>
 <20220730003506.10659-2-quic_rohiiyer@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220730003506.10659-2-quic_rohiiyer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to parse
 mode string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 7/29/2022 5:35 PM, Rohith Iyer wrote:
> Add helper method to parse a mode string and verify
> correct number of arguments. This standardizes parsing mode strings.
> 
> Changes made in V4:
>   - Corrected documentation
>   - Changed *mode_string to a const char from char
> 
> Changes made in V5:
>   - Removed angle brackets in documentation which cause parse error in
>     builddoc
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>

Since petri's previous comments have been addressed and make builddoc 
works with these changes and CI is happy, this LGTM now,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   lib/igt_kms.c | 26 ++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 27 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 14064614..1ba3bd2a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5777,3 +5777,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   
>   	return true;
>   }
> +
> +/**
> + * igt_parse_mode_string:
> + * @mode_string: modeline string
> + * @mode: a pointer to a drm mode structure
> + *
> + * Parse mode string and populate mode
> + *
> + * Format: clock(MHz),hdisp,hsync-start,hsync-end,htotal,vdisp,vsync-start,
> + * vsync-end,vtotal
> + *
> + * Returns: true if the correct number of arguments are entered, else false.
> + */
> +bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
> +{
> +	float force_clock;
> +
> +	if (sscanf(mode_string, "%f,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu",
> +	   &force_clock, &mode->hdisplay, &mode->hsync_start, &mode->hsync_end, &mode->htotal,
> +	   &mode->vdisplay, &mode->vsync_start, &mode->vsync_end, &mode->vtotal) != 9)
> +		return false;
> +
> +	mode->clock = force_clock * 1000;
> +
> +	return true;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 5856a4b3..a2cf0937 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -974,5 +974,6 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
> +bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   
>   #endif /* __IGT_KMS_H__ */
