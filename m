Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477CDCAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 05:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F3F10E2F8;
	Tue, 16 Sep 2025 05:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZQN5k+z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245710E2F8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 05:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758000661; x=1789536661;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9jZCsRF0PekKr/lSfmuozAPH9kfpmIGCNFn0UCfZGLU=;
 b=ZZQN5k+zSFP6ja8BJ5W8wwKp2VAVzWaDFHMDbujC7OZ6ccgboYmEo1DK
 uFxhinVs9xbopsadhltmvie0coEPkaq3CJv7/rVyLpxq7xbe2rynPdgsD
 N21EL6zsBT4hIHwhtghDS5cou+aS1Rw26VkGsO/iOGUQKTtiT6qPkGXL1
 GH74Z8hXn3MuumPL2i6r7c0niaabFcS/dHK1h3nx/Vl1H6z1uFEteaFi+
 d1rjmGZ3A3GrA1lzON6e0ahZj3SRCbyGKtyDosWNE1W1uEcbWP29SX0Yo
 cg2gzoqFAxzoLR0jg2lBjkY+YEfj9cYNIAsKiWSbT8A24QowXPfIyOpZC g==;
X-CSE-ConnectionGUID: YgN6DaNUTgKU62xCxWoY7Q==
X-CSE-MsgGUID: PhuqtHNLTt26xwiMPFS+Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59316123"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="59316123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 22:31:00 -0700
X-CSE-ConnectionGUID: OmXjhCkeTG61CEUy64letw==
X-CSE-MsgGUID: pt2+3vH/R9+fFtdJlRdnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="174919074"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.118.22])
 ([10.66.118.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 22:30:57 -0700
Message-ID: <861c05d2-3d9c-4dcb-90e5-f0a2aa9eaa49@intel.com>
Date: Tue, 16 Sep 2025 11:00:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v13,2/2] tests/kms_prime: Enable basic-modeset for xe
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, bhanuprakash.modem@gmail.com,
 anshuman.gupta@intel.com, matthew.auld@intel.com, kamil.konieczny@intel.com
References: <20250902051318.1163571-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250902051318.1163571-2-santhosh.reddy.guddati@intel.com>
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

On 02-09-2025 10:43, Santhosh Reddy Guddati wrote:
> Remove unused setup_hybrid_display , add support for basic-modeset
> subtest for xe driver.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
LGTM
Reviewed-by : Kunal1.joshi@intel.com
> ---
>   tests/kms_prime.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index d10fe776d..978b532b2 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -454,6 +454,9 @@ static void test_basic_modeset(int drm_fd)
>   	enum pipe pipe;
>   	drmModeModeInfo *mode;
>   	struct igt_fb fb;
> +	uint32_t bo;
> +	int ret;
> +	uint32_t offsets[4] = { 0 };
>   
>   	igt_device_set_master(drm_fd);
>   	igt_display_require(&display, drm_fd);
> @@ -462,6 +465,38 @@ static void test_basic_modeset(int drm_fd)
>   	mode = igt_output_get_mode(output);
>   	igt_assert(mode);
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
>   	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>   			      DRM_FORMAT_MOD_LINEAR, &fb);
>   
