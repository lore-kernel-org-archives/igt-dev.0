Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C703C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 15:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D8010E1B8;
	Wed, 17 Jul 2024 15:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCs6HDI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9EB10E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228425; x=1752764425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6zbJh/PluRzm5BhIGHna+NrLdDeTZFY9hOxK4PO4cNk=;
 b=bCs6HDI/Z2DkTH5oYedqyBwlZsWAc8MBdG75OQG5TVnhorFsYz0mUMmO
 ht8/taWwh7rqUd2zhKwSsXJm9H/FKEu7qWy4nd1NGaONgWZXc1VzKFxMc
 OeBtOYEVRmdx6w0pGh6jXn3SWz+mbUmXAtm6Udk4EtgDddxMYVQ61bgJT
 ztdU71fyqvwhwzhhuiV7r2bJBYmjkOs2ETBVn5FnOr2EunRL6cR7/3nkx
 3fGH3mMd1Y9lhiT5RuT2pVcI1q1Je+w2PBH1KvnrBoF2V52mDn+XFS18H
 Ko1anBkn1WjZiItW6cZgTZgZcCqV01vqzhDVoXXOMjtK81G4dVMCTS1GG g==;
X-CSE-ConnectionGUID: dLlSjCpWQJGhoTEAqmcTKw==
X-CSE-MsgGUID: QITvTra8S2GTawhENWaQlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36177337"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="36177337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 08:00:25 -0700
X-CSE-ConnectionGUID: nWircE3KS0mA+Kw/xw92RA==
X-CSE-MsgGUID: lu2xPaxbQ2S58EPCRf8x0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54934312"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 08:00:22 -0700
Date: Wed, 17 Jul 2024 17:00:19 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 4/5] tests/kms_plane_scaling: Improvise the plane
 scaling BW issues
Message-ID: <20240717150019.4riepx5dg4icaimi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 kunal1.joshi@intel.com
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-5-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240715154628.583682-5-ramanaidu.naladala@intel.com>
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
On 2024-07-15 at 21:16:27 +0530, Naladala Ramanaidu wrote:

imho subject should be improved, old:

[PATCH i-g-t 4/5] tests/kms_plane_scaling: Improvise the plane scaling BW issues

What about:
[PATCH i-g-t 4/5] tests/kms_plane_scaling: Find display mode fitting in BW for rotations

or find some other good subject.

> Anticipating bandwidth issues, we expect many tests to fail. To

Give some examples here, different from patch 3.

> address these failures, we will switch to the next lowest display
> modes. Higher display modes will be identified as insufficient for
> downscaling operations on plane scaling. As a solution, we
> will implement a fix: when bandwidth is inadequate for current
> modes, the system will automatically attempt the next lower
> display mode.

Please do not copy-paste descriptions from other patch, write here
what part of code (or what subtests) you changed and why.

> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_plane_scaling.c | 82 +++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 1702ec8c8..020d72953 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -582,54 +582,52 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>  	int w, h;
>  	int width, height;
>  
> -	mode = igt_output_get_mode(output);
> -
> -	if (is_clip_clamp == true) {
> -		width = mode->hdisplay + 100;
> -		height = mode->vdisplay + 100;
> -	} else {
> -		width = get_width(mode, sf_plane1);
> -		height = get_height(mode, sf_plane1);
> -	}
> -
> -	if (is_upscale) {
> -		w = width;
> -		h = height;
> -	} else {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if (is_upscale) {
> +			w = get_width(mode, sf_plane1);
> +			h = get_height(mode, sf_plane1);
> +		} else {
> +			if (is_clip_clamp == true) {
> +				width = mode->hdisplay + 100;
> +				height = mode->vdisplay + 100;
> +			} else {
> +				width = get_width(mode, sf_plane1);
> +				height = get_height(mode, sf_plane1);
> +			}
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		}
> +		/*
> +		 * guarantee even value width/height to avoid fractional
> +		 * uv component in chroma subsampling for yuv 4:2:0 formats
> +		 */
> +		w = ALIGN(w, 2);
> +		h = ALIGN(h, 2);
> +		igt_create_fb(display->drm_fd, w, h, pixel_format,
> +				modifier, &d->fb[0]);
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +		igt_fb_set_size(&d->fb[0], plane, w, h);
> +		igt_plane_set_position(plane, 0, 0);
> +
> +		if (is_upscale)
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +		else
> +			igt_plane_set_size(plane, width, height);
> +
> +		if (rot != IGT_ROTATION_0)
> +			igt_plane_set_rotation(plane, rot);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		if (commit_ret == 0)
> +			break;
>  	}
>  
> -	/*
> -	 * guarantee even value width/height to avoid fractional
> -	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> -	w = ALIGN(w, 2);
> -	h = ALIGN(h, 2);
> -
> -	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> -
> -	igt_plane_set_fb(plane, &d->fb[0]);
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, w, h);
> -	igt_plane_set_position(plane, 0, 0);
> -
> -	if (is_upscale)
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	else
> -		igt_plane_set_size(plane, width, height);
> -
> -	if (rot != IGT_ROTATION_0)
> -		igt_plane_set_rotation(plane, rot);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -
>  	igt_plane_set_fb(plane, NULL);
>  	igt_plane_set_position(plane, 0, 0);
>  	cleanup_fbs(d);
> -
>  	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling factor with fb size %dx%d\n",
> -		      w, h);
> +			"Unsupported scaling factor with fb size %dx%d\n", w, h);

Looks unrelated, do not mix code style cleanups with real changes.

Regards,
Kamil

>  	igt_assert_eq(commit_ret, 0);
>  }
>  
> -- 
> 2.43.0
> 
