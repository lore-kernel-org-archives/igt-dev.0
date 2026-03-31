Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2881A1061B39
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 11:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19EA10EAAE;
	Tue, 31 Mar 2026 11:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEHfC+WA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FC510EAC5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774957380; x=1806493380;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/dqJZOyjYbEFgRL2VmQddqJ9fWUYMcYY47r+1iSavis=;
 b=FEHfC+WAk83HIW3Wggn9ExJj6A5INNIWIAWjjagvnQKwCocI+5d8Zpww
 /5YCdow6EmnUnkrSrZyDfWcZ0wvmuwzgppHq+Hehs71zDNz8X0NotDLi5
 YH50PPYleYvwtd5sZD/9kkhJ3dwvqAWr5EtYeDtgV2YGi1Mi7sOHMcnO1
 PHncI0n5Mm7it+bO/lic9PnByyJcRrfQcSVak5qRAen4MWamOXtjIlsIa
 P2X/81jl3Z0Wl9JTQR1vS+VbWeJwYW90s9nNocdWMLGHOLe3ZvijB4RCR
 izVy+IB9zHJGyEoK2cIGXTWUGTKcGq3SoNMrHNGuo5iVa0hOzznmfnL1f g==;
X-CSE-ConnectionGUID: mpbNQnq3S5izWqzJ/vZJXg==
X-CSE-MsgGUID: OXgf3nxYT4qXVU7+BRDJeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79566983"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="79566983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 04:43:00 -0700
X-CSE-ConnectionGUID: LqX7JlasQsys/PXZo5OISg==
X-CSE-MsgGUID: C/KAPwt8RSG4BPwDrESDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="230405627"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 04:42:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit
 for mode selection
In-Reply-To: <20260331104100.614718-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331104100.614718-1-jeevan.b@intel.com>
Date: Tue, 31 Mar 2026 14:42:55 +0300
Message-ID: <8a045c3a33f14331b5e0303fb21d994dd89c8e3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2026, Jeevan B <jeevan.b@intel.com> wrote:
> eDP modes with high clock rates were being forced on HDMI 2.0 displays,
> causing kernel to reject with EINVAL. Add clock validation to skip
> incompatible eDP modes and fall back to supported modes.
>
> v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
>     and ensure per-connector compatibility to avoid invalid modes.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 1f2849bc2..f1c1afe45 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -79,6 +79,9 @@
>  /* restricted pipe count */
>  #define CRTC_RESTRICT_CNT 2
>  
> +/* Clock limit for HDMI 2.0 */
> +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
> +
>  static int drm_fd;
>  static drmModeRes *drm_resources;
>  static int filter_test_id;
> @@ -165,6 +168,16 @@ static bool connector_supports_mode(drmModeConnector *connector,
>  	return false;
>  }
>  
> +static bool hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector,
> +						     drmModeModeInfo *mode)
> +{
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +		return false;
> +
> +	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
> +}
> +
>  static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
>  {
>  	int i;
> @@ -270,8 +283,35 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  				if (conn->modes[j].clock < mode->clock)
>  					mode = &conn->modes[j];
>  			}
> -			*mode_ret = *mode;
> -			return;
> +
> +			/* Check HDMI 2.0 clock + per-connector compatibility */
> +			{
> +				int k;
> +				bool compatible = true;
> +
> +				for (k = 0; k < crtc->connector_count; k++) {
> +					drmModeConnector *other_conn =
> +						crtc->cconfs[k].connector;
> +
> +					/* HDMI 2.0 clock constraint */
> +					if (hdmi_connector_mode_exceeds_hdmi20_limit(other_conn,
> +										     mode)) {
> +						compatible = false;
> +						break;
> +					}
> +
> +					/* Ensure connector supports the mode */
> +					if (!connector_supports_mode(other_conn, mode)) {
> +						compatible = false;
> +						break;
> +					}
> +				}
> +
> +				if (compatible) {
> +					*mode_ret = *mode;
> +					return;
> +				}
> +			}

Please abstract the whole thing into a function. Having those {} blocks
inline is messy.

BR,
Jani.

>  		}
>  	}

-- 
Jani Nikula, Intel
