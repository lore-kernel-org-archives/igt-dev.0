Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF38C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A15810E267;
	Wed, 19 Feb 2025 10:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="birwYrS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C4410E267
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739961427; x=1771497427;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7w9s8UP5ZKfRKTgn18lSvyleQn/a0u1Zfc3xPtQ7XNo=;
 b=birwYrS5AM78nxyFw6xVOsgU1VcA6ndAnsHJObPdrU56f8wvjwy67ncM
 q/2yGUHHGij86U2Zx9EJKGWizEy5Y1b8FcG7glAv/oDK6+4tz9TRLEYyG
 jlpqz6cqOIeHlUzXCRxFA26sz4lAk4J5eWSYEWYEzi6atwuwWKwCtP8Bt
 1Vj4sMOS9Gc8GxG7kStFrhHHl48MTYxQfaFKoP1AOsLTZ5cQTw224KP2B
 OpCudQ+IebRsQfxj3+EzmD2aLdd1ccszae1Hb5j08fx/OQabudy6lkuks
 OKTOBjoVn4qrfherJqZytNO9NBgdgBtKSthkMnytYGvwvtMOxpLLEs7m3 g==;
X-CSE-ConnectionGUID: u4ppszwfRGCrA6PgKtExdA==
X-CSE-MsgGUID: Lt+uXMqdReK6VING/1xl6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40948855"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40948855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:37:07 -0800
X-CSE-ConnectionGUID: h+WRTfisQE6pvKssbV68CA==
X-CSE-MsgGUID: Y1bPvBfJTwGLw+fc/Aw0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="114658082"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 02:37:05 -0800
Date: Wed, 19 Feb 2025 11:37:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com
References: <20241216202427.76168-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216202427.76168-1-andrealmeid@igalia.com>
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
On 2024-12-16 at 17:24:27 -0300, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 

Vitaly could you find someone from AMD who could help with
review and testing? Thanks!

Please add to Cc Vitaly from AMD:
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Also add Jeevan here:
Cc: Jeevan B <jeevan.b@intel.com>

Regards,
Kamil

> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add test description for GitLab compilation
> ---
>  tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 4a72be7b5..dd0907d50 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -89,6 +89,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and resume cycle
> + *
> + * SUBTEST: overlay-atomic
> + * Description: Verify overlay planes with async flips in atomic API
>   */
>  
>  #define CURSOR_POS 128
> @@ -109,12 +112,14 @@ typedef struct {
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
> @@ -126,6 +131,7 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	bool overlay_path;
>  } data_t;
>  
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>  	igt_output_set_pipe(data->output, data->pipe);
>  
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>  }
>  
>  static void test_init_fbs(data_t *data)
> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
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
> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
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
> @@ -772,6 +796,7 @@ igt_main
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>  			data.alternate_sync_async = false;
>  			data.atomic_path = false;
> +			data.overlay_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -783,6 +808,7 @@ igt_main
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>  			data.alternate_sync_async = false;
>  			data.atomic_path = true;
> +			data.overlay_path = false;
>  			if (is_intel_device(data.drm_fd))
>  				run_test_with_modifiers(&data, test_async_flip);
>  			else
> @@ -793,6 +819,7 @@ igt_main
>  		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>  			data.alternate_sync_async = true;
>  			data.atomic_path = false;
> +			data.overlay_path = false;
>  			run_test(&data, test_async_flip);
>  		}
>  
> @@ -800,7 +827,17 @@ igt_main
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
