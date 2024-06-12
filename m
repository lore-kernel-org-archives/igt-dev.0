Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37669C27C77
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 12:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076D10E081;
	Wed, 12 Jun 2024 12:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRV6ikbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649E710E081
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194880; x=1749730880;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zoKsY3fnekQHN1rxeXe0I2xuuUhaUM2C6FptQcPsn/w=;
 b=bRV6ikbTL1XDVQW46VUNIQJSPpC5HSSScRSfjpbxrBlvmrtc7UxjFIC5
 HHMalFjJxp3JVMrVwvQh992oAgIxUg72siHI9gCW3NiNpKTf5kpun4Y32
 NQ1iA9KafSItHcrcF+VoPhKXZf9nUgL8B/iTq4oCFPC1zX1rBsX251CQb
 GtgKWKWvjlczYGKkLLSR5gLEjnFzUiCnF9wOChTbHuKiPWrSn33Fv/nls
 PgAuuZTXs11ft+P2HdkHi+6jUomfK3rcvjTZJxwsW034Bv1dOqmxc5NCe
 krU/gNmkIOwmn0khLnP7T3RLAJKKMIDbLVQDzmxgzkhNG4/5DcsYtroxt Q==;
X-CSE-ConnectionGUID: 6v4Q/Hj+SCGTh+PJyLt6qw==
X-CSE-MsgGUID: nzPVhAW1SEScmVyGUzx6Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="14794318"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14794318"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:21:20 -0700
X-CSE-ConnectionGUID: AOyloIGdRKWhJnGPQK86Qg==
X-CSE-MsgGUID: rcndnO8YTaSSOLrUOijyBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="40246024"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 05:21:19 -0700
Date: Wed, 12 Jun 2024 14:21:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t 5/8] tests/kms_tiled_display: Test cleanup
Message-ID: <20240612122102.koqmwpeteslfracg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-6-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240611045348.3727239-6-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-06-11 at 10:23:45 +0530, Bhanuprakash Modem wrote:
> Make sure the below points in IGT cleanup:
> 
> - Sanitize the state before starting the subtest.
> - Clear the states before exiting the subtest.
> - Update existing libdrm APIs with IGT kms APIs.
> - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

While other patches from series looks simple this one is a lot
bigger and complicated. I suggest to split it into cleanups and
simplifications and putting more complicated changes into
separate patch.

Regards,
Kamil

> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_tiled_display.c | 129 ++++++++++++++------------------------
>  1 file changed, 48 insertions(+), 81 deletions(-)
> 
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 3ffd6a9a4..2096a63e1 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -79,7 +79,6 @@ typedef struct {
>  	igt_fb_t fb_test_pattern;
>  	igt_display_t display;
>  	data_connector_t *conns;
> -	enum igt_commit_style commit;
>  	struct timeval first_ts;
>  	int linetime_us;
>  
> @@ -188,25 +187,6 @@ reset_plane(igt_output_t *output)
>  	igt_plane_set_fb(primary, NULL);
>  }
>  
> -static void reset_output(igt_output_t *output)
> -{
> -	igt_output_set_pipe(output, PIPE_NONE);
> -}
> -
> -static void reset_mode(data_t *data)
> -{
> -	int count;
> -	igt_output_t *output;
> -	data_connector_t *conns = data->conns;
> -
> -	for (count = 0; count < data->num_h_tiles; count++) {
> -		output = igt_output_from_connector(&data->display,
> -						   conns[count].connector);
> -		igt_output_set_pipe(output, PIPE_NONE);
> -	}
> -	igt_display_commit2(&data->display, data->commit);
> -}
> -
>  static void test_cleanup(data_t *data)
>  {
>  	int count;
> @@ -215,11 +195,11 @@ static void test_cleanup(data_t *data)
>  	for (count = 0; count < data->num_h_tiles; count++) {
>  		if (conns[count].output) {
>  			reset_plane(conns[count].output);
> -			reset_output(conns[count].output);
> +			igt_output_set_pipe(conns[count].output, PIPE_NONE);
>  		}
>  	}
>  	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
> -	igt_display_commit2(&data->display, data->commit);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  	memset(conns, 0, sizeof(data_connector_t) * data->num_h_tiles);
>  }
>  
> @@ -230,8 +210,8 @@ static int mode_linetime_us(const drmModeModeInfo *mode)
>  
>  static void setup_mode(data_t *data)
>  {
> -	int count = 0, prev = 0, i = 0;
> -	bool pipe_in_use = false, found = false;
> +	int count = 0, i = 0;
> +	bool found = false;
>  	enum pipe pipe;
>  	drmModeModeInfo *mode;
>  	igt_output_t *output;
> @@ -242,51 +222,45 @@ static void setup_mode(data_t *data)
>  	 * This is done to ensure a complete modeset occures every
>  	 * time the test is run.
>  	 */
> -	reset_mode(data);
> +	igt_display_reset(&data->display);
>  
>  	for (count = 0; count < data->num_h_tiles; count++) {
> +		conns[count].pipe = PIPE_NONE;
>  		output = igt_output_from_connector(&data->display,
>  						   conns[count].connector);
>  
>  		for_each_pipe(&data->display, pipe) {
> -			pipe_in_use = false;
> -			found = false;
> -
> -			if (count > 0) {
> -				for (prev = count - 1; prev >= 0; prev--) {
> -					if (pipe == conns[prev].pipe) {
> -						pipe_in_use = true;
> -						break;
> -					}
> +			if (output->pending_pipe == pipe)
> +				continue;
> +
> +			igt_output_set_pipe(output, pipe);
> +			for (i = 0; i < conns[count].connector->count_modes; i++) {
> +				mode = &conns[count].connector->modes[i];
> +				if (mode->vdisplay == conns[count].tile.tile_v_size &&
> +				    mode->hdisplay == conns[count].tile.tile_h_size) {
> +					found = true;
> +					break;
>  				}
> -				if (pipe_in_use)
> -					continue;
>  			}
>  
> -			if (igt_pipe_connector_valid(pipe, output)) {
> -				conns[count].pipe = pipe;
> -				conns[count].output = output;
> -
> -				igt_output_set_pipe(conns[count].output,
> -						    conns[count].pipe);
> -				break;
> +			if (!found) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
>  			}
> -		}
> -		igt_require(conns[count].pipe != PIPE_NONE);
>  
> -		for (i = 0; i < conns[count].connector->count_modes; i++) {
> -			mode = &conns[count].connector->modes[i];
> -			if (mode->vdisplay == conns[count].tile.tile_v_size &&
> -			    mode->hdisplay == conns[count].tile.tile_h_size) {
> -				found = true;
> -				break;
> +			igt_output_override_mode(output, mode);
> +			if (!intel_pipe_output_combo_valid(&data->display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
>  			}
> +
> +			conns[count].pipe = pipe;
> +			conns[count].output = output;
> +			break;
>  		}
> -		igt_require(found);
> -		igt_output_override_mode(output, mode);
> +		igt_require(conns[count].pipe != PIPE_NONE);
>  		data->linetime_us = mode_linetime_us(mode);
>  	}
> -	igt_require(intel_pipe_output_combo_valid(&data->display));
>  	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  }
>  
> @@ -529,7 +503,6 @@ static void override_edid(data_t *data)
>  	igt_output_t *output;
>  	int num_outputs = 0;
>  	int num_tiles = 0;
> -	drmModeResPtr res;
>  
>  	igt_require(data->display.n_pipes >= 2);
>  
> @@ -551,10 +524,7 @@ static void override_edid(data_t *data)
>  	num_tiles = min(num_outputs, data->display.n_pipes);
>  
>  	/* disable everything so that we are sure to get a full modeset */
> -	res = drmModeGetResources(data->drm_fd);
> -	igt_require(res);
> -	kmstest_unset_all_crtcs(data->drm_fd, res);
> -	drmModeFreeResources(res);
> +	igt_display_reset(&data->display);
>  
>  	for (int i = 0; i < num_tiles; i++)
>  		force_edid_with_tile(data, outputs[i],
> @@ -563,28 +533,24 @@ static void override_edid(data_t *data)
>  
>  static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
>  {
> -		int ret;
> -
> -		get_number_of_h_tiles(data);
> -		igt_debug("Number of Horizontal Tiles: %d\n",
> -			  data->num_h_tiles);
> -		igt_require(data->num_h_tiles > 0);
> -		data->conns = calloc(data->num_h_tiles,
> -				     sizeof(data_connector_t));
> -		igt_assert(data->conns);
> -
> -		get_connectors(data);
> -		setup_mode(data);
> -		setup_framebuffer(data);
> -		timerclear(&data->first_ts);
> -		igt_display_commit_atomic(&data->display,
> +	int ret;
> +
> +	data->conns = calloc(data->num_h_tiles,
> +			     sizeof(data_connector_t));
> +	igt_assert(data->conns);
> +
> +	get_connectors(data);
> +	setup_mode(data);
> +	setup_framebuffer(data);
> +	timerclear(&data->first_ts);
> +	igt_display_commit_atomic(&data->display,
>  			DRM_MODE_ATOMIC_NONBLOCK |
>  			DRM_MODE_PAGE_FLIP_EVENT, data);
> -		while (!got_all_page_flips(data)) {
> -			ret = poll(pfd, 1, 1000);
> -			igt_assert(ret == 1);
> -			drmHandleEvent(data->drm_fd, drm_event);
> -		}
> +	while (!got_all_page_flips(data)) {
> +		ret = poll(pfd, 1, 1000);
> +		igt_assert(ret == 1);
> +		drmHandleEvent(data->drm_fd, drm_event);
> +	}
>  }
>  
>  igt_main
> @@ -596,14 +562,15 @@ igt_main
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		kmstest_set_vt_graphics_mode();
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
>  		igt_display_reset(&data.display);
>  
>  		pfd.fd = data.drm_fd;
>  		pfd.events = POLLIN;
>  		drm_event.version = 3;
>  		drm_event.page_flip_handler2 = page_flip_handler;
> -		data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
> -		igt_require(data.commit == COMMIT_ATOMIC);
>  
>  		get_number_of_h_tiles(&data);
>  		igt_debug("Number of real horizontal tiles: %d\n", data.num_h_tiles);
> -- 
> 2.43.2
> 
