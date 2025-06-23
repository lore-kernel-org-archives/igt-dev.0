Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E086C7EE30
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 09:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4238410E1C3;
	Mon, 23 Jun 2025 09:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd6AY+D5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EB910E1C3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750672507; x=1782208507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KV1jSTVDY+QyE5kQfyzKQqfcxXOXK0hWmPXCWPivUIE=;
 b=gd6AY+D5tKdQbhGOObjPYu//pYnmqFM8bfbNFEYMt3T/2V748w7ErGOe
 dFGJGROn8PE5TfdShE0fTcUItLDZUNu7ZPA+QR/XgNDOiuB6s/0coImSh
 r8ycj+7rmojcujedshFW6jhe79ID6sy+/VM0PswuTGmsTu70VNWMjXGfs
 y8AevL9geruF1mqDn7ZGllwF65jjUjQKJ80M34a0eJWn7CaeH6xn54VXO
 vRd5hglA96MHeoFzfpbiUI5Xf22Y5e/dDTTC07t0t5n3cTm+SnufnvF3Y
 8IdMkMBpOViAhFTPHdPk8OXOHwct9JPD86xdqsBRCJPVFg2qN96rskRvI g==;
X-CSE-ConnectionGUID: kEC+osWASKmffKOevKVabg==
X-CSE-MsgGUID: UkVyVIIqQ02cPN8jTqvS0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63477542"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="63477542"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:55:06 -0700
X-CSE-ConnectionGUID: 7PZRS1mLTR2eCG4hT/NXog==
X-CSE-MsgGUID: X23fYd8PSAe7t+VD7d1lFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="155561650"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:55:05 -0700
Date: Mon, 23 Jun 2025 11:55:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, harry.wentland@amd.com,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH] tests/kms_writeback: Fix kms_writeback for VKMS
Message-ID: <20250623095502.5jeyyxkpfczucd2n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20250618230105.1721658-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618230105.1721658-1-alex.hung@amd.com>
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

Hi Alex,
On 2025-06-18 at 17:01:05 -0600, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> VKMS doesn't like us to add buffers with unknown fourcc
> type. Other drivers might behave similarly. Make sure
> we avoid creating 10bpc buffers if they are not supported.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  tests/kms_writeback.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index d075cc5b6..20c3a32c2 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -112,6 +112,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  	height = override_mode.vdisplay;
>  
>  	for (i = 0; i < sizeof(fourcc) / sizeof(uint32_t); i++) {
> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +		if (!igt_plane_has_format_mod(plane, fourcc[i], DRM_FORMAT_MOD_LINEAR))
> +			continue;
>  
>  		ret = igt_create_fb(display->drm_fd, width, height,
>  				    fourcc[i], modifier, &input_fb);
> @@ -121,7 +125,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  				    fourcc[i], modifier, &output_fb);
>  		igt_assert_lte(0, ret);
>  
> -		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  		igt_plane_set_fb(plane, &input_fb);
>  		igt_output_set_writeback_fb(output, &output_fb);
>  
> @@ -571,12 +574,14 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
>  				      &input_fb);
>  		igt_assert(fb_id >= 0);
>  
> -		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> -				      mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &input_fb_10bit);
> -		igt_assert(fb_id >= 0);
> +		if (igt_plane_has_format_mod(plane, DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR)) {

First change looks good but I am not sure about this one,
Karthik or Swati could you help here?

Adding to cc:
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> +			fb_id = igt_create_fb(display.drm_fd, mode.hdisplay,
> +					      mode.vdisplay,
> +					      DRM_FORMAT_XRGB2101010,
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &input_fb_10bit);
> +			igt_assert(fb_id >= 0);
> +		}
>  
>  		igt_plane_set_fb(plane, &input_fb);
>  
> -- 
> 2.43.0
> 
