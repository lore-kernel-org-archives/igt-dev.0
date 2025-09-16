Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945D6CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 12:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D60810E64B;
	Tue, 16 Sep 2025 12:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSaRBnnu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3410E64B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758024182; x=1789560182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vvFgOY1NdCc2MW8toSq0dMdq1CEBtH/AM36yGp34giM=;
 b=OSaRBnnuaxW7BdbnFIDfwv4H7oOsT2eXPYkaR8u/r8HrUggOEp3+eCxT
 riSwU/OgtD7dQzhHt7BD6QoKpKm+YUgWhz/2rVYjRxaOOt2E1yY9RGA8l
 c4GUokgqcP7onqZ+MScvW6bvwiv9H72x4YZgMTDjI6G1Hd2Rllu+9hULq
 vZ7mAbVkImPQmj7gSHZ/T9hV5teupdMavIrCVBsQtd2nWfPU0ReP1W5h+
 QdQh1+11h+k/mMFW0b4WdMr+Z7vsRXqXFFP6GefjQ53K6U2GCqnsXEAJm
 6dEVuCwrcaBLygUo6i0FNrSMpSNyXF3hEAs5Sz9hcztbXAkc+OnML6CKs Q==;
X-CSE-ConnectionGUID: B44PzujZTRyiQUAO6iJBXg==
X-CSE-MsgGUID: nWn7N6z+SjGN9RQMGIWBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70550093"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="70550093"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 05:03:02 -0700
X-CSE-ConnectionGUID: k8Ta0+BPSr2BaJxYnbqEFg==
X-CSE-MsgGUID: uTGPVh3zR0mLIE+nNL+ljA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174530295"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:02:59 -0700
Date: Tue, 16 Sep 2025 14:02:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 bhanuprakash.modem@gmail.com, anshuman.gupta@intel.com,
 matthew.auld@intel.com, kamil.konieczny@intel.com, kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t v13 2/2] tests/kms_prime: Enable basic-modeset for xe
Message-ID: <20250916120256.7uk73uh7pupdpzwn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 bhanuprakash.modem@gmail.com, anshuman.gupta@intel.com,
 matthew.auld@intel.com, kamil.konieczny@intel.com,
 kunal1.joshi@intel.com
References: <20250902051318.1163571-1-santhosh.reddy.guddati@intel.com>
 <20250902051318.1163571-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902051318.1163571-2-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-09-02 at 10:43:18 +0530, Santhosh Reddy Guddati wrote:
> Remove unused setup_hybrid_display , add support for basic-modeset

In a commit I do not see any removals? Is this description correct?

Regards,
Kamil

> subtest for xe driver.
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index d10fe776d..978b532b2 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -454,6 +454,9 @@ static void test_basic_modeset(int drm_fd)
>  	enum pipe pipe;
>  	drmModeModeInfo *mode;
>  	struct igt_fb fb;
> +	uint32_t bo;
> +	int ret;
> +	uint32_t offsets[4] = { 0 };
>  
>  	igt_device_set_master(drm_fd);
>  	igt_display_require(&display, drm_fd);
> @@ -462,6 +465,38 @@ static void test_basic_modeset(int drm_fd)
>  	mode = igt_output_get_mode(output);
>  	igt_assert(mode);
>  
> +	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
> +		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
> +
> +		igt_info("Doing modeset on discrete\n");
> +
> +		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
> +
> +		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0), 0);
> +		igt_require(bo);
> +
> +		ret = __kms_addfb(drm_fd, bo,
> +				  mode->hdisplay, mode->vdisplay,
> +				  DRM_FORMAT_XRGB8888,
> +				  DRM_FORMAT_MOD_LINEAR,
> +				  strides, offsets, 1,
> +				  DRM_MODE_FB_MODIFIERS, &fb.fb_id);
> +		igt_assert_eq(ret, 0);
> +
> +		set_fb(&fb, &display, output);
> +		gem_close(drm_fd, bo);
> +
> +		cairo_surface_destroy(fb.cairo_surface);
> +		do_or_die(drmModeRmFB(drm_fd, fb.fb_id));
> +
> +		igt_display_fini(&display);
> +		igt_info("Modeset on discrete done\n");
> +		return;
> +	}
> +
>  	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>  			      DRM_FORMAT_MOD_LINEAR, &fb);
>  
> -- 
> 2.34.1
> 
