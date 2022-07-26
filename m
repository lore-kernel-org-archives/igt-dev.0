Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754472A315
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 05:47:07 +0000 (UTC)
Date: Tue, 26 Jul 2022 08:43:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rohith Iyer <quic_rohiiyer@quicinc.com>
Message-ID: <Yt9/Aw7MCZKx7PkP@platvala-desk.ger.corp.intel.com>
References: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
 <20220713222235.11655-2-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713222235.11655-2-quic_rohiiyer@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/3] lib/igt_kms: Add helper to parse
 mode string
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 03:22:33PM -0700, Rohith Iyer wrote:
> Add helper method to parse a mode string from command line


In this form the string doesn't have to be from command line at all
call sites.


>, and verify
> correct number of arguments. This standardizes parsing mode strings.
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
> ---
>  lib/igt_kms.c | 26 ++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d8867f09..6df6658a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5739,3 +5739,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  
>  	return true;
>  }
> +
> +/**
> + * igt_parse_mode_string:
> + * @mode_string: a pointer to the optarg

With the above said, the parameter is just the modeline string.

> + * @mode: a pointer to a drm mode structure
> + *
> + * Parse mode string from command line and populate mode
> + *
> + * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
> + * <vsync-end>,<vtotal>
> + *
> + * Returns: true if the correct number of arguments are entered, else false.
> + */
> +bool igt_parse_mode_string(char *mode_string, drmModeModeInfo *mode)

const char *mode_string


-- 
Petri Latvala


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
> index 4b67708d..8d946a25 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -972,5 +972,6 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>  		int (*comparator)(const void *, const void*));
>  
>  bool igt_check_bigjoiner_support(igt_display_t *display);
> +bool igt_parse_mode_string(char *mode_string, drmModeModeInfo *mode);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.31.0
> 
