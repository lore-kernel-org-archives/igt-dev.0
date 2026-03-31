Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27730109B461
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 13:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C106410E19F;
	Tue, 31 Mar 2026 13:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYUz1L0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777AE10E264
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774962384; x=1806498384;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Xd3eM7SwQHGMLJyvPBEKZLYOU/aIYIhFT6lO3aj3EL8=;
 b=TYUz1L0LuS70y43PGyCv3xMK4+TRST95JfVQOHLbjqhiNSyTdUFdUfXv
 4HQEl0hFCJc08PxsNVrMF5HFKiVHLU7acGBjZUu6dC66yBHP10A2qjOiy
 Rhaj7wo4TZJIvk3M6WynVy0O8+0DbXC8KFS7OEt7LWFYbXrx/XlkOUqYt
 rhGr4isDZqB+panwPLgAKfJN4RdwP8GMWzuWmW4Bdm47ayS73LvhC5fZG
 6tKF4/vxPnYj58Z/4KpPd0kfEcVtvlIeFgNA/0vL4JecJQIzMh7liIyyb
 wMCtWxVc4U6fpR0AUxU9zakKdWcqD7T3fOgTLtydODcnJnI0kOd0cEcAz w==;
X-CSE-ConnectionGUID: ABbUrSJYTFOQfrordiFTWA==
X-CSE-MsgGUID: 1SNT5SIWQ/CdDieXu+zB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75868869"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75868869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:06:23 -0700
X-CSE-ConnectionGUID: iljJnKI6T36tUjnM9gzusg==
X-CSE-MsgGUID: xm5pVEFISnOJPSovOIzwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="223482722"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:06:22 -0700
Date: Tue, 31 Mar 2026 16:06:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
Message-ID: <acvGy0C97UmDxLg2@intel.com>
References: <20260331104100.614718-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331104100.614718-1-jeevan.b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Mar 31, 2026 at 04:11:00PM +0530, Jeevan B wrote:
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

Starting to test all kinds of random thing here does not seem
maintainable.

I think the one sensible option is to make the test skip rather
than fail if it couldn't find a common mode between the connectors
and the modeset subsequently failed.

As for the external vs. internal connector situation, the test should
probably try to find a mode on the external connector(s) that has the
same refresh rate as one of the modes on the internal connector, and
has the same resolution (or less) than the internal panel. That way
we can use pfit to upscale content on the internal panel instead of
attempting to force the external connectors to use the internal
panel's native mode.

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
>  		}
>  	}
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
