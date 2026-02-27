Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D1BFD5306
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 07:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0579010E5E7;
	Fri, 27 Feb 2026 07:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVo3PtiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114510E5E9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772176167; x=1803712167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tNDHFK2+lWZ6lHK9T/DEagBCOl4g3K8Ie0EtpIoIN0c=;
 b=OVo3PtiSv1fJva/qV4jKnFAC6ZF+4z/eP6Kc0UCg63ibOTwYbSizBgPD
 cZ1ooPu21KRnyrup6/novCtvDXxWO+eF9wYIhAaz9wERN4JL1/nEvwaUE
 Y4wILeyCFycLt+L9H8fuf4La8j/sSrbKDhpZVuzIepC1m15hVdrLUa3R0
 1nCI+4F55l/7PSjIf24GMykxxJIh2sxvzg2Ajuo4sJmZpBh7ehwcBr8Z1
 ZF+Icb+nJQDzjfXEMSbfnUZ3Lult+EEHXv0fyh07u/UwantUhyS55dpsK
 JyyXCw0RwCV/srrh5UegvCddgZyP+LErjVBR3xomTe4M9qFl//6HU03S4 w==;
X-CSE-ConnectionGUID: DnCvGVUcTRqw6qN9x8fM4A==
X-CSE-MsgGUID: N2JUksMyT6yHZlw/0hRTxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73319728"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73319728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 23:09:27 -0800
X-CSE-ConnectionGUID: 5ErlYi86RMO2zLEVhBo/Cw==
X-CSE-MsgGUID: LWPbrS2mRaCPGIq4q7Od2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="247338353"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 23:09:25 -0800
Date: Fri, 27 Feb 2026 09:09:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pranay Samala <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_fb: Skip 90/270 rotation on
 Display Ver >= 13
Message-ID: <aaFDIopUYrpOWgXl@intel.com>
References: <20260227063333.2044616-1-pranay.samala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227063333.2044616-1-pranay.samala@intel.com>
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

On Fri, Feb 27, 2026 at 12:03:33PM +0530, Pranay Samala wrote:
> >From Display Ver 13, 90/270 hardware rotation no longer
> supported. Skip these tests on affected platforms. Also move
> plane capability checks to the outer loop to continue testing
> other planes.

That's two different things -> should be two patches

> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 66d7c5428..171b38602 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -172,6 +172,7 @@ typedef struct {
>  	int hw_stride;
>  	int max_hw_fb_width;
>  	double planeclearrgb[3];
> +	int disp_ver;
>  } data_t;
>  
>  static struct intel_buf *init_buf(data_t *data,
> @@ -422,12 +423,6 @@ static bool test_plane(data_t *data)
>  		{ w, h, },
>  	};
>  
> -	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
> -		return false;
> -
> -	if (!igt_plane_has_rotation(plane, data->rotation))
> -		return false;
> -
>  	if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
>  		igt_plane_set_rotation(plane, data->rotation);
>  	igt_plane_set_position(plane, 0, 0);
> @@ -570,6 +565,10 @@ static bool test_pipe(data_t *data)
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  
>  	for_each_plane_on_pipe(&data->display, data->crtc->pipe, data->plane) {
> +		if (!igt_plane_has_rotation(data->plane, data->rotation))
> +			continue;
> +		if (!igt_plane_has_format_mod(data->plane, data->format, data->modifier))
> +			continue;
>  		ret = test_plane(data);
>  		if (ret || run_in_simulation)

That whole run_in_simulation nonsense seems to be the reason why
you need to change something here. Just remove the nonsense and
this should work fine.

>  			break;
> @@ -688,6 +687,9 @@ static void test_scanout(data_t *data)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  
> +	if (igt_rotation_90_or_270(data->rotation))
> +		igt_require_f(data->disp_ver < 13, "90/270 rotation not supported by platform\n");

Please don't add yet more platform checks when the test already has
the hardware agnostic logic to skip everything when the thing isn't
supported.

> +
>  	igt_require(data->format == DRM_FORMAT_C8 ||
>  		    igt_fb_supported_format(data->format));
>  
> @@ -983,6 +985,7 @@ int igt_main()
>  		igt_require(is_intel_device(data.drm_fd));
>  
>  		data.devid = intel_get_drm_devid(data.drm_fd);
> +		data.disp_ver = intel_display_ver(data.devid);
>  
>  		kmstest_set_vt_graphics_mode();
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
