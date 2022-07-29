Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721510E498
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 10:04:17 +0000 (UTC)
Date: Fri, 29 Jul 2022 13:02:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rohith Iyer <quic_rohiiyer@quicinc.com>
Message-ID: <YuOwTp1m2YCCUS9u@platvala-desk.ger.corp.intel.com>
References: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
 <20220728232033.589-2-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728232033.589-2-quic_rohiiyer@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/3] lib/igt_kms: Add helper to parse
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

On Thu, Jul 28, 2022 at 04:20:31PM -0700, Rohith Iyer wrote:
> Add helper method to parse a mode string and verify
> correct number of arguments. This standardizes parsing mode strings.
> 
> Changes made in V4:
>  - Corrected documentation
>  - Changed *mode_string to a const char from char
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
> ---
>  lib/igt_kms.c | 26 ++++++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 14064614..c17c10ea 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5777,3 +5777,29 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  
>  	return true;
>  }
> +
> +/**
> + * igt_parse_mode_string:
> + * @mode_string: modeline string
> + * @mode: a pointer to a drm mode structure
> + *
> + * Parse mode string and populate mode
> + *
> + * Format: <clock(MHz)>,<hdisp>,<hsync-start>,<hsync-end>,<htotal>,<vdisp>,<vsync-start>,
> + * <vsync-end>,<vtotal>

Building docs breaks with this series, because of these <>s afaics. Make this just

* Format: clock(MHz),hdisp,hsync-start,hsync-end,htotal,vdisp,vsync-start,vsync-end,vtotal



-- 
Petri Latvala


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
>  bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>  		igt_output_t *output, int bpc);
>  bool igt_check_bigjoiner_support(igt_display_t *display);
> +bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.31.0
> 
