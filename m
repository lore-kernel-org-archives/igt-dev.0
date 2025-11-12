Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7EECCFA1A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 13:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276C10E0D5;
	Wed, 12 Nov 2025 13:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESyuAqfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077BF10E0D5
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953604; x=1794489604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xVQyNvxSNQRi5qd+B/gUCgvLZNCNwC7Eo680iwW+Nwo=;
 b=ESyuAqfPM6IH4CRyBa/HMkI4l5Ya9PyiPxd/0Wo5kVGV4xdtFLrv6I6i
 4xU9S1ekNZKJPKft3GnSkbM+KSuGqRxCGqjRJ3MYOvLWktI1eU57QekNQ
 NDjkdnW/292EoPsvXiNYoDzg9nIs2mLTcP6K3GUe1+Ihu73QZ9l+s5feU
 1g2sWLxQw1X+61+NCR3ntYR+fz6DFbXOIuJM4dfj33MKSJryS2FM8F8OV
 TvVYLlgPOw2llD7e7LpF/g2zXTV6/P7TnpxeJber5ad8KD9n8FgX2Ovdv
 ObteRBu3AGw/iK4xbZrHZwJ+zqfzpIR1aU8J53zo8UwmQoTJTf0CDFHRv Q==;
X-CSE-ConnectionGUID: lDFuHa3LQc68oHNpKi4tVw==
X-CSE-MsgGUID: r5V8Bd7eSu68t41+vifW+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64897693"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="64897693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:20:04 -0800
X-CSE-ConnectionGUID: wNNNX6SRQneDhaTiUBuIrg==
X-CSE-MsgGUID: 6wNMXrGkSo2SmhEdYZ299w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189388568"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:20:01 -0800
Message-ID: <6e5e06de-51ab-4049-803e-6e801e9114c4@intel.com>
Date: Wed, 12 Nov 2025 18:49:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v16,2/3] tests/kms_prime: Enable basic-modeset for xe
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com
References: <20251104085640.795121-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251104085640.795121-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hello Santhosh,

Please find review comments inline,

On 04-11-2025 14:26, Santhosh Reddy Guddati wrote:
> Add support for basic-modeset subtest for xe driver.
>
> V2: Update commit description to reflect the changes (Kamil)
> V3: Fix the modifier in igt_init_fb (Kunal)
> v4: Add DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to xe_bo_create
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_prime.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index d210f23a9..d644ee288 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -460,6 +460,9 @@ static void test_basic_modeset(int drm_fd)
>   	enum pipe pipe;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb;
> +	uint32_t bo;
> +	int ret;
> +	uint32_t offsets[4] = { 0 };
>   
>   	igt_device_set_master(drm_fd);
>   	igt_display_require(&display, drm_fd);
> @@ -468,6 +471,39 @@ static void test_basic_modeset(int drm_fd)
>   	mode = igt_output_get_mode(output);
>   	igt_assert(mode);
>   
> +	if (is_xe_device(drm_fd) && xe_has_vram(drm_fd)) {
> +		uint32_t strides[4] = { ALIGN(mode->hdisplay * 4, 64) };
> +
> +		igt_info("Doing modeset on discrete\n");
> +
> +		igt_init_fb(&fb, drm_fd, mode->hdisplay, mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
> +		igt_calc_fb_size(&fb);
> +
> +		bo =  xe_bo_create(drm_fd, 0, fb.size, vram_if_possible(drm_fd, 0),
> +				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
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
Use igt_remove_fb instead
> +
> +		igt_display_fini(&display);
Not regarding this patch but i don't see igt_display_reset in either crc 
or modeset test.
Please add a 4th patch if you see that's necessary to have clean state 
for subsequent dynamic subtests.

With above changes done.
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> +		igt_info("Modeset on discrete done\n");
> +		return;
> +	}
> +
>   	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
>   
