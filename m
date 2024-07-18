Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF6C3DA60
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1E10E575;
	Thu, 18 Jul 2024 11:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKpWilf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFF210E137
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721302838; x=1752838838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dn1Eveuno38EqdDXuj2yvKCDBy585QnebhPnQEW2yZw=;
 b=FKpWilf3VzpvmjNoFMROUKqGuUbImqquvy/CnO4MtXtTzbbFYBSpQk4y
 oUxTyV+Fpl+8ejHoqb4pD5Ba1ZSICkVDx6UBscdlLih+rXpnwJT/0pv/L
 oF0nlKbguoG/FQIjmOw7XFEyY2AxHO3zYzTkcpqgVsnqdt6cBLvgEPu5c
 gnH0WCEEEILPz41INhSmQHl+XjcOo0r6KL08CpwQDhuxK9rEu0AAju2wo
 sbg5RpLUOx8aTUhDgcnKkmf82kLI9fTFN06caa2BdVJM+R7ZW/VybV4t1
 gYxtSvVO1+FDl2rs7GCROMr1pvWSNVi1tLtH9gvM4+QaTvro7JMtpTyjy w==;
X-CSE-ConnectionGUID: zDtPU8dpRk2rlHRk2uJSUQ==
X-CSE-MsgGUID: kq5PqGx9RGO2OS93Qht1xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30272871"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="30272871"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:40:38 -0700
X-CSE-ConnectionGUID: yueBlNZxRa2D0AaWj36S/g==
X-CSE-MsgGUID: jG0BtTZETFyAG2WyYQW7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="73962618"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:40:36 -0700
Date: Thu, 18 Jul 2024 13:40:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t v6 3/5] tests/kms_plane_scaling: Find display mode
 fitting in BW
Message-ID: <20240718114033.lzaro3ox62omva62@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
 <20240718111146.665240-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240718111146.665240-4-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2024-07-18 at 16:41:44 +0530, Naladala Ramanaidu wrote:
> Ensure compatibility with driver scaling restrictions by setting
> lower resolution for downscaling. Adjust test_planes_scaling_combo
> function to lower resolution when cdclk requirements exceed
> platform limits. Address issues caused by cdclk exceeding platform
> capabilities.

Now subject and description looks better,
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Example for failure:
> [drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz) exceeds max (652800 kHz)
> 
> v2: Fix some styling issues in the patch (Ankit)
> v3: Split single plane and multi plane scaling
>     functions arguments in separate patch (Ankit)
> v4: Split single plane and multi plane scaling
>     functions in separate patch (Ankit)
> v5: Add return value to function __test_planes_scaling_combo,
>     update test_planes_scaling_combo function, and add
>     igt_debug prints
> v6: Update commit subject/message and add return value on the
>     igt_skp and igt_debug print (Kamil)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 105 +++++++++++++++++++++-----------------
>  1 file changed, 57 insertions(+), 48 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 8a69aacfd..2c4490fd3 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -857,7 +857,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
>  	return pipe;
>  }
>  
> -static void
> +static int
>  __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  			    enum pipe pipe, igt_output_t *output,
>  			    igt_plane_t *p1, igt_plane_t *p2,
> @@ -899,9 +899,10 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  	igt_plane_set_fb(p1, NULL);
>  	igt_plane_set_fb(p2, NULL);
>  
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");
> -	igt_assert_eq(ret, 0);
> +	if (ret == -EINVAL || ret == -ERANGE)
> +		igt_debug("Scaling op not supported by driver with %s\n",
> +			 (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
> +	return ret;
>  }
>  
>  static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
> @@ -923,59 +924,67 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
>  	drmModeModeInfo *mode;
>  	int n_planes;
>  	int w1, h1, w2, h2;
> +	int ret;
>  
>  	cleanup_crtc(d);
>  
>  	igt_output_set_pipe(output, pipe);
> -	mode = igt_output_get_mode(output);
> -
> -	w1 = get_width(mode, sf_plane1);
> -	h1 = get_height(mode, sf_plane1);
> -	w2 = get_width(mode, sf_plane2);
> -	h2 = get_height(mode, sf_plane2);
> -
> -	n_planes = display->pipes[pipe].n_planes;
> -	igt_require(n_planes >= 2);
> -
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> -		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> -		break;
> -	default:
> -		igt_assert(0);
> -	}
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		igt_output_override_mode(output, mode);
> +		igt_debug("Trying mode %dx%d\n",
> +			  mode->hdisplay, mode->vdisplay);
> +		w1 = get_width(mode, sf_plane1);
> +		h1 = get_height(mode, sf_plane1);
> +		w2 = get_width(mode, sf_plane2);
> +		h2 = get_height(mode, sf_plane2);
> +
> +		n_planes = display->pipes[pipe].n_planes;
> +		igt_require(n_planes >= 2);
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
> +			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
>  
> -	for (int k = 0; k < n_planes - 1; k += 2) {
> -		igt_plane_t *p1, *p2;
> +		for (int k = 0; k < n_planes - 1; k += 2) {
> +			igt_plane_t *p1, *p2;
>  
> -		p1 = &display->pipes[pipe].planes[k];
> -		igt_require(p1);
> -		p2 = &display->pipes[pipe].planes[k+1];
> -		igt_require(p2);
> +			p1 = &display->pipes[pipe].planes[k];
> +			igt_require(p1);
> +			p2 = &display->pipes[pipe].planes[k+1];
> +			igt_require(p2);
>  
> -		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
> +			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
>  				continue;
> -
> -		__test_planes_scaling_combo(d, w1, h1, w2, h2,
> -					    pipe, output, p1, p2,
> -					    &d->fb[1], &d->fb[2],
> -					    test_type);
> +			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2,
> +							  pipe, output, p1, p2,
> +							  &d->fb[1], &d->fb[2],
> +							  test_type);
> +			if (ret != 0)
> +				break;
> +		}
> +		cleanup_fbs(d);
>  	}
> -
> -	cleanup_fbs(d);
> +	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Unsupported scaling operation "
> +		      "in driver with return value %s\n",
> +		      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
>  }
>  
>  static void
> -- 
> 2.43.0
> 
