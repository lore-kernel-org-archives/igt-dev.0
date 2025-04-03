Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC544C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 15:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843F610E247;
	Thu,  3 Apr 2025 15:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Gl0DGh3F";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFB110E247
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U19e/dInm5BjUdh7UYE+pn1fseqhOGAkqdP4GP/XWDc=; b=Gl0DGh3F1gMmsEiX8BgEKjG/uV
 ILDDL1To5g0GNYoo7DfKbP3J5a9ENLZXY7fr74YpXWSXTX1pnFgqrotOSGbYsZKe0HjZQm8W2LOW7
 Ukif7RBBRyzMhWnyfCAje3VtaVojHvhqTyDQDE/bcUpDlC6kQeRhHThpmxCd1d9EaFhZClvQ8Y0jF
 2374JNDsUS7LUjyxuJPQRJfTPDUnwydmx7+lIauTdQ3vbnbJwtu9eE2Zakg7DtzQygHvXrqm1yqrh
 nV4/HYWLivCRSuSIV7TNjRaHPp9DqHfw7+fpm87T7daLRMeebMagKdBFhof+mmgXEjFFmb5VWgvlc
 DVsMA+WA==;
Received: from [189.6.35.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u0Mam-00AtH8-2d; Thu, 03 Apr 2025 17:34:56 +0200
Date: Thu, 3 Apr 2025 12:34:48 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v5 4/4] tests/kms_async_flips: Create subtest for overlay
 planes
Message-ID: <gzspghgah5uyelk5x7wpxfzmnroimdskke3ws5qx34ed4jrmyf@n5vke4yop6cm>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
 <20250402022922.210495-5-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402022922.210495-5-andrealmeid@igalia.com>
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

On 04/01, André Almeida wrote:
> amdgpu can perform async flips in overlay planes as well, so create a
> test for that.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  tests/kms_async_flips.c | 73 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6986278d7..98000fc92 100644
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
> @@ -213,6 +219,25 @@ static void require_atomic_async_cap(data_t *data)
>  		      "Atomic flip async flip not supported\n");
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
> @@ -228,12 +253,15 @@ static void test_init(data_t *data)
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
> @@ -242,6 +270,7 @@ static void test_init_fbs(data_t *data)
>  	uint32_t width, height;
>  	static uint32_t prev_output_id;
>  	static uint64_t prev_modifier;
> +	static bool prev_overlay;
>  	drmModeModeInfo *mode;
>  
>  	mode = igt_output_get_mode(data->output);
> @@ -249,21 +278,35 @@ static void test_init_fbs(data_t *data)
>  	height = mode->vdisplay;
>  
>  	if (prev_output_id != data->output->id ||
> -	    prev_modifier != data->modifier) {
> +	    prev_modifier != data->modifier ||
> +	    prev_overlay != data->overlay_path) {
>  		prev_output_id = data->output->id;
>  		prev_modifier = data->modifier;
> +		prev_overlay = data->overlay_path;
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
> +			if (data->overlay_path) {
> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
> +			}
> +		}

I don't think this logic is correct.

In the way it is implemented, if we are running a subtest just after the
overlay-atomic, but with `data->overlay_path = false`, bufs_overlays
won't be removed.
In addition, if we are running the overlay-atomic subtest, where
`prev_overlay != data->overlay_path`, data->bufs will be recreated
unnecessarily (because both `prev_overlay != data->overlay_path` and
`data->bufs[0].fb_id` conditions are satisfied).

I understand that what you intended to do would be something like this:

	if (prev_output_id != data->output->id ||
	    prev_modifier != data->modifier) {
		prev_output_id = data->output->id;
		prev_modifier = data->modifier;

		if (data->bufs[0].fb_id) {
			for (i = 0; i < NUM_FBS; i++)
				igt_remove_fb(data->drm_fd, &data->bufs[i]);
		}

		for (i = 0; i < NUM_FBS; i++)
			make_fb(data, &data->bufs[i], width, height, i);
	}

	if (prev_overlay != data->overlay_path) {
		prev_overlay = data->overlay_path;

		if (data->bufs_overlay[0].fb_id) {
			for (i = 0; i < NUM_FBS; i++)
				igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
		}

		for (i = 0; i < NUM_FBS; i++) {
			if (data->overlay_path)
				make_fb(data, &data->bufs_overlay[i], width, height, i);
		}
	}

Then I undertand we will only create bufs_overlays if we are running
overlay-atomic for the first time and remove those fbs in the first
execution of the next subtest that doesn't need it. And
`data->overlay_path` doesn't affect primary fbs if not needed.

>  	}
>  
>  	igt_plane_set_fb(data->plane, &data->bufs[0]);
>  	igt_plane_set_size(data->plane, width, height);
> +
> +	if (data->overlay_path) {
> +		igt_plane_set_fb(data->plane_overlay, &data->bufs_overlay[0]);
> +		igt_plane_set_size(data->plane_overlay, width, height);
> +	}
>  }
>  
>  static bool async_flip_needs_extra_frame(data_t *data)
> @@ -291,12 +334,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
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
> @@ -312,6 +360,9 @@ static void test_async_flip(data_t *data)
>  
>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	if (data->overlay_path)
> +		require_overlay_flip_support(data);
> +
>  	gettimeofday(&start, NULL);
>  	frame = 1;
>  	do {
> @@ -817,6 +868,14 @@ igt_main
>  			run_test(&data, test_async_flip);
>  		}
>  
> +		igt_describe("Verify overlay planes with async flips in atomic API");
> +		igt_subtest_with_dynamic("overlay-atomic") {

Missing `test_init_ops()` here.

Melissa

> +			igt_require(is_amdgpu_device(data.drm_fd));
> +			data.atomic_path = true;
> +			data.overlay_path = true;
> +			run_test(&data, test_async_flip);
> +		}
> +
>  		igt_describe("Verify that the async flip timestamp does not "
>  			     "coincide with either previous or next vblank");
>  		igt_subtest_with_dynamic("test-time-stamp") {
> @@ -920,8 +979,10 @@ igt_main
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
