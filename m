Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32007C36008
	for <igt-dev@archiver.kernel.org>; Sat, 29 Mar 2025 19:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5D10E05E;
	Sat, 29 Mar 2025 19:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gPpCU6MF";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D2A10E05E
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Mar 2025 19:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z73IH3er4jfChZ2Gm7fUmJ/y89Nsgmilcv4lqhCk/vI=; b=gPpCU6MFMTSura4apjxAuERjTV
 wHYKFCb8/ICUYFqyQkG3N/dB8yjy62Zh10exqv/9qOYwezbvWDrUNwJViU1l4XVl7zADPfqtqeqt2
 +dmfOofyHb3Y4lIdxQa6AFI/zSYHQnqk3dEgy99mxc7RQwFlNG5Pr2D/Q2qW/4E961ev7Vc6YJUps
 ozx6sRgON8zlP0R96xJVFwcYcOy1+hj2lEx6VOawvsDImti2db4BNXWnKXoz72lkOk6AthXt+c+Ss
 9A4XCAbPp7DXHfF1MnYOILtquDrIrHiID8oA+FSPaxdPs6DvhQ2fe1qDhe5hA9zC/EmwUtOotPR0W
 fuD4V8NQ==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tyboG-008TQG-FA; Sat, 29 Mar 2025 20:25:37 +0100
Date: Sat, 29 Mar 2025 16:25:29 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v4 3/3] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <7puzvifpwz34pzcy5irnurgu3n562tekdrilxx4zx7bcfd3fxt@uemtwqmtru6t>
References: <20250327221601.19086-1-andrealmeid@igalia.com>
 <20250327221601.19086-4-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327221601.19086-4-andrealmeid@igalia.com>
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

On 03/27, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 56 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5c7e1ae13..cc149dea2 100644
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
> @@ -213,6 +219,18 @@ static void require_atomic_async_cap(data_t *data)
>  		      "Skipping, atomic flip async flip not supported");
>  }
>  
> +static void require_overlay_flip_support(data_t *data)
> +{
> +	struct igt_fb *bufs = data->bufs_overlay;
> +	igt_plane_t *plane = data->plane_overlay;
> +	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
> +
> +	igt_plane_set_fb(plane, &bufs[0]);

Running `overlay-atomic` alone, the subtest passes, but running
`kmas_async_flip` subtests in a row the `overlay-atomic` fails here in a
kernel with overlay async support.

I suspect something from previous execution needs a sync flip for
setting modes before checking for overlay async support, or there is any
other leak from the previous subtest.

> +
> +	igt_require_f(!igt_display_try_commit_atomic(&data->display, flags, data),
> +		      "Async flip for overlay planes not supported\n");
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -228,12 +246,15 @@ static void test_init(data_t *data)
>  	igt_output_set_pipe(data->output, data->pipe);
>  
>  	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	if (data->overlay_path)
> +		data->plane_overlay = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>  }
>  
>  static void test_finish(data_t *data)
>  {
>  	data->alternate_sync_async = false;
>  	data->atomic_path = false;
> +	data->overlay_path = false;
>  }
>  
>  static void test_init_fbs(data_t *data)
> @@ -254,16 +275,27 @@ static void test_init_fbs(data_t *data)
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
These bufs_overlay fbs should be removed when the test finished,
together with bufs fbs in the last igt_fixture of the test.
> +		}
>  	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
>  	igt_plane_set_size(data->plane, width, height);
> +
> +	if (data->overlay_path) {
> +		igt_plane_set_fb(data->plane_overlay, &data->bufs[0]);
I didn't get why both primary and overlay planes are set to the same
bufs[0] fb here, should it be data->bufs_overlay[0] ?
> +		igt_plane_set_size(data->plane_overlay, width, height);
> +	}
>  }
>  
>  static bool async_flip_needs_extra_frame(data_t *data)
> @@ -291,12 +323,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
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
> @@ -312,6 +349,9 @@ static void test_async_flip(data_t *data)
>  
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	if (data->overlay_path)
I wonder if the bufs_overlay fbs should be initialize and set here, after
igt_display_commit2, instead of together with bufs fbs in the
test_init_fbs()
> +		require_overlay_flip_support(data);
> +
>  	gettimeofday(&start, NULL);
>  	frame = 1;
>  	do {
> @@ -817,6 +857,14 @@ igt_main
>  			run_test(&data, test_async_flip);
>  		}
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
> 
