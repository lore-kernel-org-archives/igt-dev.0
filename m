Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFA0E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 19:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A310EE81;
	Thu, 12 Dec 2024 19:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMiHKhBT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E4F10EE81
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 19:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734031507; x=1765567507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DlXSr72OjfkbuVr2XlpRtlhQFP/kOQDuJUolxfo5HxI=;
 b=iMiHKhBTsl8mo37Ex4ZzmoXeZeI6TriyuRJzchSq/3H4RhzmBefPWGIx
 s9quHjhTPnKB7afTCwbC5VknCh9PCSlGOMu3D7rvPeKjshfASFijES2Ur
 CfEWaFkuA9KBLVzLEhTJqZN+EvfbLKn+oozBJUCFbnlZ4FYoQitgJJInN
 JRSCW4RJhJGrx9oR1fxpu55w9tufvCygcPK4Dl2+7IXYWn/VQEcu8nRry
 Toa5a8EznCwHdtwmC5cr1JtXDsIi1mBykDgbZSlkgQOCpVL29UYLTbRE7
 U2+amDHQVflOTWwTq3oXa69xL1NEkPFrA6OWnVg19FayVcpOaRxYbVf7M Q==;
X-CSE-ConnectionGUID: gUjC3AdYSr2rvX20F70thQ==
X-CSE-MsgGUID: SMusIUOsS3GsBK4Lxx3weg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="37313506"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="37313506"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:25:07 -0800
X-CSE-ConnectionGUID: 6OSv3xtuTpC2/deBCZZLYQ==
X-CSE-MsgGUID: 3kVckIh8TzqFWopynxh0iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96758002"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:25:06 -0800
Date: Thu, 12 Dec 2024 20:25:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <20241212192503.in7dodmb2mqpl3cb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 kernel-dev@igalia.com
References: <20241211031820.115844-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211031820.115844-1-andrealmeid@igalia.com>
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

Hi André,
On 2024-12-11 at 00:18:20 -0300, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 42 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 

To make it compile on GitLab please add description of test to
a comments section, something like:

 * SUBTEST: async-flip-suspend-resume
 * Description: Verify the async flip functionality with suspend and resume cycle

add here:

 *
 * SUBTEST: overlay-atomic
 * Description: Verify overlay planes with async flips in atomic API
 */

Regards,
Kamil

> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6e00be3de..10a416cfb 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -109,12 +109,14 @@ typedef struct {
>  	uint32_t crtc_id;
>  	uint32_t refresh_rate;
>  	struct igt_fb bufs[NUM_FBS];
> +	struct igt_fb bufs_overlay[NUM_FBS];
>  	igt_display_t display;
>  	igt_output_t *output;
>  	unsigned long flip_timestamp_us;
>  	double flip_interval;
>  	uint64_t modifier;
>  	igt_plane_t *plane;
> +	igt_plane_t *overlay_plane;
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t ref_crc;
>  	int flip_count;
> @@ -126,6 +128,7 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	bool overlay_path;
>  } data_t;
>  
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -226,6 +229,8 @@ static void test_init(data_t *data)
>  	igt_output_set_pipe(data->output, data->pipe);
>  
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>  }
>  
>  static void test_init_fbs(data_t *data)
> @@ -246,16 +251,27 @@ static void test_init_fbs(data_t *data)
>  		prev_modifier = data->modifier;
>  
>  		if (data->bufs[0].fb_id) {
> -			for (i = 0; i < NUM_FBS; i++)
> +			for (i = 0; i < NUM_FBS; i++) {
>  				igt_remove_fb(data->drm_fd, &data->bufs[i]);
> +				if (data->overlay_path)
> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
> +			}
>  		}
>  
> -		for (i = 0; i < NUM_FBS; i++)
> +		for (i = 0; i < NUM_FBS; i++) {
>  			make_fb(data, &data->bufs[i], width, height, i);
> +			if (data->overlay_path)
> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
> +		}
>  	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
>  	igt_plane_set_size(data->plane, width, height);
> +
> +	if (data->overlay_path) {
> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
> +		igt_plane_set_size(data->overlay_plane, width, height);
> +	}
>  }
>  
>  static bool async_flip_needs_extra_frame(data_t *data)
> @@ -283,12 +299,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>  static int perform_flip(data_t *data, int frame, int flags)
>  {
>  	int ret;
> +	igt_plane_t *plane;
> +	struct igt_fb *bufs;
> +
> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>  
>  	if (!data->atomic_path) {
>  		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>  	} else {
> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>  		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>  	}
>  
> @@ -758,6 +779,7 @@ igt_main
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>  			data.alternate_sync_async = false;
>  			data.atomic_path = false;
> +			data.overlay_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -769,6 +791,7 @@ igt_main
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>  			data.alternate_sync_async = false;
>  			data.atomic_path = true;
> +			data.overlay_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -779,6 +802,7 @@ igt_main
>  		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>  			data.alternate_sync_async = true;
>  			data.atomic_path = false;
> +			data.overlay_path = false;
>  			run_test(&data, test_async_flip);
>  		}
>  
> @@ -786,7 +810,17 @@ igt_main
>  		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>  			data.alternate_sync_async = true;
>  			data.atomic_path = true;
> +			data.overlay_path = false;
> +			run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Verify overlay planes with async flips in atomic API");
> +		igt_subtest_with_dynamic("overlay-atomic") {
> +			igt_require(is_amdgpu_device(data.drm_fd));
> +			data.atomic_path = true;
> +			data.overlay_path = true;
>  			run_test(&data, test_async_flip);
> +			data.overlay_path = false;
>  		}
>  
>  		igt_describe("Verify that the async flip timestamp does not "
> -- 
> 2.47.1
> 
