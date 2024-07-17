Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AE8C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDD010E142;
	Wed, 17 Jul 2024 14:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9NFcNdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2508A10E142
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228004; x=1752764004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0FA2xhq0hdhMpD3DyDc4iF3aTIopsWFvxvT4KpnEb9U=;
 b=X9NFcNdFNY+lWHz+jMy9HahL8xBk385NW6A2vVkVUtwzBtHdEKmDygZ+
 W0idJbfaYXXpe0i2xH04/yTNFrixwFvs/uVs+Rr2Kd/zu0+BAZNGmtDEe
 Oga+0D4+TlycESM2BlL7m68hHb5nhg1MIK8nQbFr6s06aHdycPlSbChtm
 JFxP5EjzuCpkGO2joqeOQa+nB5OtM7lAOGS9HTI4TbyXr8erac76tIWBf
 BoUzhpUPssVRM8SbmTvo1ChuXp2fOE7EYeUVaTtZVmtx4jA1pCmyXEKRB
 /9UxrJPuqvPjPeDFlLDvjgkkyMH9c37vPVtozEJe+V84G2P3zLdFLffJ1 A==;
X-CSE-ConnectionGUID: q50rrVW0RXi/gODNbHQ0dg==
X-CSE-MsgGUID: tmLCC6Z3SyypK+3g0Cv/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18354021"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18354021"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:53:24 -0700
X-CSE-ConnectionGUID: tqHuFik6TJq4+Xm+cZXp8Q==
X-CSE-MsgGUID: xbfgHZULQHal4sKe9IR9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87888387"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:53:22 -0700
Date: Wed, 17 Jul 2024 16:53:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 3/5] tests/kms_plane_scaling: Improvise the planes
 scaling BW issues
Message-ID: <20240717145319.lfexmyhwxs3u2nck@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-4-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240715154628.583682-4-ramanaidu.naladala@intel.com>
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
On 2024-07-15 at 21:16:26 +0530, Naladala Ramanaidu wrote:

imho subject should be improved, old:

[PATCH i-g-t 3/5] tests/kms_plane_scaling: Improvise the planes scaling BW issues

imho better woulld be:

[PATCH i-g-t 3/5] tests/kms_plane_scaling: Find combo display mode fitting in BW

> Anticipating bandwidth issues, we expect many tests to fail.

Please give some examples which could fail.

> To
> address these failures, we will switch to the next lowest display
> modes. Some higher display modes will be identified as insufficient
> for downscaling operations on multi-plane scaling. As a solution,
> we will implement a fix: when bandwidth is inadequate for current
> modes, the system will automatically attempt the next lower
> display mode.

Please write here that you changed combo mode.

Regards,
Kamil

> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 72 +++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 0048e6e51..1702ec8c8 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -865,43 +865,49 @@ __test_planes_scaling_combo(data_t *d, double sf_plane1,
>  	int ret;
>  	int w1, h1, w2, h2;
>  
> -	mode = igt_output_get_mode(output);
> -	w1 = get_width(mode, sf_plane1);
> -	h1 = get_height(mode, sf_plane1);
> -	w2 = get_width(mode, sf_plane2);
> -	h2 = get_height(mode, sf_plane2);
> -
> -	igt_plane_set_fb(p1, fb1);
> -	igt_plane_set_fb(p2, fb2);
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		w1 = get_width(mode, sf_plane1);
> +		h1 = get_height(mode, sf_plane1);
> +		w2 = get_width(mode, sf_plane2);
> +		h2 = get_height(mode, sf_plane2);
> +
> +		igt_plane_set_fb(p1, fb1);
> +		igt_plane_set_fb(p2, fb2);
> +
> +		switch (test_type) {
> +		case TEST_PLANES_UPSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> +			break;
> +		case TEST_PLANES_DOWNSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_UPSCALE_DOWNSCALE:
> +			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_size(p2, w2, h2);
> +			break;
> +		case TEST_PLANES_DOWNSCALE_UPSCALE:
> +			igt_plane_set_size(p1, w1, h1);
> +			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> +			break;
> +		default:
> +			igt_assert(0);
> +		}
>  
> -	switch (test_type) {
> -	case TEST_PLANES_UPSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
> -		break;
> -	case TEST_PLANES_DOWNSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_UPSCALE_DOWNSCALE:
> -		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> -		igt_plane_set_size(p2, w2, h2);
> -		break;
> -	case TEST_PLANES_DOWNSCALE_UPSCALE:
> -		igt_plane_set_size(p1, w1, h1);
> -		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
> -		break;
> -	default:
> -		igt_assert(0);
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL);
> +		if (ret == 0)
> +			break;
>  	}
> -
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
>  	igt_plane_set_fb(p1, NULL);
>  	igt_plane_set_fb(p2, NULL);
> -
> -	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
> -		      "Scaling op not supported by driver\n");
> +	igt_plane_set_position(p1, 0, 0);
> +	igt_plane_set_position(p2, 0, 0);
> +	cleanup_fbs(d);
> +	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
> +			"Unsupported scaling factor\n");
>  	igt_assert_eq(ret, 0);
>  }
>  
> -- 
> 2.43.0
> 
