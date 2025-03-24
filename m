Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27802C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 21:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BBD10E419;
	Mon, 24 Mar 2025 21:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TfXnVrGg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A61610E419
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2eMzCPRQtxOepYCueNvXAzixQTcoaVfLrnK/Ohp77A0=; b=TfXnVrGgB6ESA7e5PIHjxHnXFW
 Wp1D6eas/tjr935NDWleMkKPsd/d/1QCiMRjMu6sAdpyDvrwwg1Psjzn1VP08b82pmiS5go5AjJ2p
 RW4De6cSjlGzjsLvSSKFn/YCVCHqZpkTRD8eBvDMCV6z+wQlIva/qfBP67bmGtXjWPx73xzoqY3JJ
 eXyhb2qMAuBhjCJmw8qSKlg6EVa41m9Xufq5xegh6QTjoNTcZ1VpK5lr2M6Ay0CdzCXmT3/5UlMX5
 BPazjL9lXeFn7ojc4zQbWtfrqA+TdmwBfM/na5ghkV5S5jfuKDZ2VENxiDGQBNik5Ef7iCEgzx4no
 F6vetlIQ==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1twpPE-005tQU-TU; Mon, 24 Mar 2025 22:32:25 +0100
Date: Mon, 24 Mar 2025 18:32:16 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v3 2/2] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <e45fkrnm6reetu5jxjskmp2e7ieloaqi5lpajxn4bppozicamd@k5ehn4b2k6sl>
References: <20250320140030.557446-1-andrealmeid@igalia.com>
 <20250320140030.557446-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320140030.557446-3-andrealmeid@igalia.com>
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

On 03/20, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 55 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index d4af9b383..bca646664 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -105,12 +105,14 @@ typedef struct {
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
> +	igt_plane_t *plane_overlay;
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t ref_crc;
>  	int flip_count;
> @@ -122,6 +124,7 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	bool overlay_path;
>  } data_t;
>  
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -207,6 +210,18 @@ static void require_monotonic_timestamp(int fd)
>  		      "Monotonic timestamps not supported\n");
>  }
>  
> +static void require_overlay_flip_support(data_t *data)
> +{
> +	struct igt_fb *bufs = data->bufs_overlay;
> +	igt_plane_t *plane = data->plane_overlay;
> +	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
> +	igt_plane_set_fb(plane, &bufs[0]);
> +
> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
> +		      "Async flip for overlay planes not supported\n");
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -222,6 +237,8 @@ static void test_init(data_t *data)
>  	igt_output_set_pipe(data->output, data->pipe);
>  
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->plane_overlay = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>  }
>  
>  static void test_init_fbs(data_t *data)
> @@ -242,16 +259,27 @@ static void test_init_fbs(data_t *data)
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
> +		igt_plane_set_fb(data->plane_overlay, &data->bufs[0]);
> +		igt_plane_set_size(data->plane_overlay, width, height);
> +	}
>  }
>  
>  static bool async_flip_needs_extra_frame(data_t *data)
> @@ -279,12 +307,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>  static int perform_flip(data_t *data, int frame, int flags)
>  {
>  	int ret;
> +	igt_plane_t *plane;
> +	struct igt_fb *bufs;
> +
> +	plane = data->overlay_path ? data->plane_overlay : data->plane;
> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>  
>  	if (!data->atomic_path) {
>  		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>  	} else {
> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> +		igt_plane_set_fb(plane, &bufs[frame % NUM_FBS]);
>  		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>  	}
>  
> @@ -300,6 +333,9 @@ static void test_async_flip(data_t *data)
>  
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	if (data->overlay_path)
> +		require_overlay_flip_support(data);
> +
>  	gettimeofday(&start, NULL);
>  	frame = 1;
>  	do {
> @@ -711,6 +747,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
>  
>  	data->alternate_sync_async = false;
>  	data->atomic_path = false;
> +	data->overlay_path = false;
>  }
>  
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
> @@ -744,6 +781,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>  
>  	data->alternate_sync_async = false;
>  	data->atomic_path = false;
> +	data->overlay_path = false;
>  }
>  
>  static data_t data;
> @@ -766,6 +804,7 @@ igt_main
>  
>  		data.alternate_sync_async = false;
>  		data.atomic_path = false;
> +		data.overlay_path = false;

As commented in the previous patch, we can make it simpler and reduce
future issues by cleaning data in a single call.

>  	}
>  
>  	igt_describe("Verify the async flip functionality and the fps during async flips");
> @@ -804,6 +843,14 @@ igt_main
>  			run_test(&data, test_async_flip);
>  		}

Also, compilation fails on my side due to missing documentation. You've
added it in the previous version and removed in this one.

BR,

Melissa
>  
> +		igt_describe("Verify overlay planes with async flips in atomic API");
> +		igt_subtest_with_dynamic("overlay-atomic") {
> +			igt_require(is_amdgpu_device(data.drm_fd));
> +			data.atomic_path = true;
> +			data.overlay_path = true;
> +			run_test(&data, test_async_flip);
> +		}
> +
>  		igt_describe("Verify that the async flip timestamp does not "
>  			     "coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp") {
> -- 
> 2.49.0
> 
