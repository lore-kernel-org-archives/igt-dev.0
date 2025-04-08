Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A52C369A4
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 16:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513EB10E275;
	Tue,  8 Apr 2025 16:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IDSIwULn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7910E257
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WpgY9whb2jwnzhYUze6LtTjBDigWkChlCGvsPkopnqs=; b=IDSIwULn83ylUdwotZ+CJPO1AD
 sbpf9BRdyWlv4hcC9VmAEYwkMQWowQPXeWJ95IL1OO6sdaY8VpuCZFPRQKYQqqflAZ1cCuV7WCzOR
 TaYcb3VH/TdOnZKRtI3TWk6/aIS1pgKOUaTNvk9LkrFD/eD9EGWJ/NzHSCgK8y0TgFz31Iql4PTT7
 iDEEVZDfljenD/hgSGqK492JDu2hS8qJrDO29lSDVHgevVEmYBBgerUI9nddqaCXBwscP10/wVrVa
 Cp6s3ypknM4Nxmt4TaA+DGYkUH4UG9mzxC1wwCLTpRRagLPBskjdDaOJ+nxqzC8hDj3fQBlj+oAkH
 V6zbWrfQ==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2Bck-00DOMy-2d; Tue, 08 Apr 2025 18:16:30 +0200
Date: Tue, 8 Apr 2025 13:16:20 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v6 4/4] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <afnz6bdd4ocgkhj372owmzarejsrsyfbtettjhhsj73eqv4pxz@mt3phtr6l3wp>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-5-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408000221.140459-5-andrealmeid@igalia.com>
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

On 04/07, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.

Hey,

LGTM. Thanks!

Reviewed-by: Melissa Wen <mwen@igalia.com>

Alex,

Can you check if it's fine for AMD too?

> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 77 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 3535817b4..40773260a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -85,6 +85,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and resume cycle
> + *
> + * SUBTEST: overlay-atomic
> + * Description: Verify overlay planes with async flips in atomic API
>   */
>  
>  #define CURSOR_POS 128
> @@ -105,12 +108,14 @@ typedef struct {
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
> @@ -122,6 +127,7 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	bool overlay_path;
>  } data_t;
>  
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -217,6 +223,25 @@ static void require_atomic_async_cap(data_t *data)
>  	igt_require_f(ret, "Atomic async flip not supported\n");
>  }
>  
> +static void require_overlay_flip_support(data_t *data)
> +{
> +	struct igt_fb *bufs = data->bufs_overlay;
> +	igt_plane_t *plane = data->plane_overlay;
> +	int flags = DRM_MODE_PAGE_FLIP_EVENT;
> +
> +	igt_plane_set_fb(plane, &bufs[0]);
> +
> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
> +		      "Overlay planes not supported\n");
> +
> +	flags |= DRM_MODE_PAGE_FLIP_ASYNC;
> +
> +	igt_plane_set_fb(plane, &bufs[1]);
> +
> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
> +		      "Async flip for overlay planes not supported\n");
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -232,12 +257,15 @@ static void test_init(data_t *data)
>  	igt_output_set_pipe(data->output, data->pipe);
>  
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->plane_overlay = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>  }
>  
>  static void test_init_ops(data_t *data)
>  {
>  	data->alternate_sync_async = false;
>  	data->atomic_path = false;
> +	data->overlay_path = false;
>  }
>  
>  static void test_init_fbs(data_t *data)
> @@ -252,22 +280,40 @@ static void test_init_fbs(data_t *data)
>  	width = mode->hdisplay;
>  	height = mode->vdisplay;
>  
> +	/* if the modifier or the output changed, we need to recreate the buffers */
>  	if (prev_output_id != data->output->id ||
>  	    prev_modifier != data->modifier) {
>  		prev_output_id = data->output->id;
>  		prev_modifier = data->modifier;
>  
> -		if (data->bufs[0].fb_id) {
> +		if (data->bufs[0].fb_id)
>  			for (i = 0; i < NUM_FBS; i++)
>  				igt_remove_fb(data->drm_fd, &data->bufs[i]);
> -		}
>  
> +		if (data->bufs_overlay[0].fb_id)
> +			for (i = 0; i < NUM_FBS; i++)
> +				igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
> +	}
> +
> +	if (!data->bufs[0].fb_id)
>  		for (i = 0; i < NUM_FBS; i++)
>  			make_fb(data, &data->bufs[i], width, height, i);
> -	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
>  	igt_plane_set_size(data->plane, width, height);
> +
> +	if (!data->bufs_overlay[0].fb_id && data->overlay_path) {
> +		for (i = 0; i < NUM_FBS; i++)
> +			make_fb(data, &data->bufs_overlay[i], width, height, i);
> +
> +		igt_plane_set_fb(data->plane_overlay, &data->bufs_overlay[0]);
> +		igt_plane_set_size(data->plane_overlay, width, height);
> +	}
> +
> +	/* remove unused buffers */
> +	if (data->bufs_overlay[0].fb_id && !data->overlay_path)
> +		for (i = 0; i < NUM_FBS; i++)
> +			igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>  }
>  
>  static bool async_flip_needs_extra_frame(data_t *data)
> @@ -295,12 +341,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
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
> @@ -316,6 +367,9 @@ static void test_async_flip(data_t *data)
>  
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	if (data->overlay_path)
> +		require_overlay_flip_support(data);
> +
>  	gettimeofday(&start, NULL);
>  	frame = 1;
>  	do {
> @@ -824,6 +878,15 @@ igt_main
>  			run_test(&data, test_async_flip);
>  		}
>  
> +		igt_describe("Verify overlay planes with async flips in atomic API");
> +		igt_subtest_with_dynamic("overlay-atomic") {
> +			test_init_ops(&data);
> +			igt_require(is_amdgpu_device(data.drm_fd));
> +			data.atomic_path = true;
> +			data.overlay_path = true;
> +			run_test(&data, test_async_flip);
> +		}
> +
>  		igt_describe("Verify that the async flip timestamp does not "
>  			     "coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp") {
> @@ -927,8 +990,10 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		for (i = 0; i < NUM_FBS; i++)
> +		for (i = 0; i < NUM_FBS; i++) {
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> +			igt_remove_fb(data.drm_fd, &data.bufs_overlay[i]);
> +		}
>  
>  		if (is_intel_device(data.drm_fd))
>  			buf_ops_destroy(data.bops);
> -- 
> 2.49.0
> 
