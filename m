Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B902C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 12:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47AD10E730;
	Mon, 13 May 2024 12:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njTjpTy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6245810E730
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715602253; x=1747138253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iv3jav+AmZifi3U/bLAnMVDu6b0B4Ud9VIvR5zYcvPE=;
 b=njTjpTy6vaStpHtMWt9PDwhmDywdU1KGLOUnyaTb6VBan57nA3D+35wf
 mpgWK0e4K84tDLx7/DJWdQ44jyK9k2qTsvU/Kjxqr5w3PLbtYGiR/Uoul
 +ku2nwSEEILmjJW2Y1KR1IW4bRvHtAYs0dZWS7jl3RE541PijWETN1sx7
 VSXYctKfyAX9IdziVZuvNFlOnotWlK30tOqn/Eg44jeq76Srun1DFbz3J
 05MJBuMXzo5ZVbqcJ+gJ+fPAuakdv2UV5gBmjqwkSAi/9+/sctztYzD8L
 KqcILrCm3pUwaLKy1SVzBxP9ZXyuXG4gci+1ohqJgBR8HS+XxSTU2SzA9 w==;
X-CSE-ConnectionGUID: +WD+ogt0S5iT/VD1Gd73Uw==
X-CSE-MsgGUID: Kbm0NyBdQT6PDAPHfsdZLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15324771"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="15324771"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:10:53 -0700
X-CSE-ConnectionGUID: 0nE/EvO2QXGKDDztK8iPig==
X-CSE-MsgGUID: /vwGtxmMQGaK5i9aOVlDZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30273712"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:10:52 -0700
Date: Mon, 13 May 2024 14:10:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/kms_bw: allow physically connected only
Message-ID: <20240513121049.gtkyleje5lqqs2xu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
References: <20240512160158.3328235-1-kunal1.joshi@intel.com>
 <20240512160158.3328235-3-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240512160158.3328235-3-kunal1.joshi@intel.com>
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

Hi Kunal,
On 2024-05-12 at 21:31:57 +0530, Kunal Joshi wrote:
> modify kms_bw test to only run on physically connected displays,
--^
Start from uppercase.


> avoiding issues with forcing a 4K EDID on disconnected connectors.
> 
> For instance, consider a system with 2 DP and 2 HDMI connectors
> (DP-1, DP-2, HDMI-1, HDMI-2). Forcing EDID on DP is currently problematic,
> and we only support forcing for HDMI. However, if there's only one
> TMDS encoder, we can only drive one HDMI display, not two.
> 
> For now, the test will only run on physically connected displays.
> Future improvements may consider the encoder count to handle such
> scenarios more gracefully.
> 

Add to cc a few amd devs.

Regards,
Kamil

> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_bw.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index b50f324af..4aabb02b7 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -61,6 +61,7 @@ typedef struct data {
>          int h[IGT_MAX_PIPES];
>          int fd;
>  	int num_pipes;
> +	int num_outputs;
>  } data_t;
>  
>  static drmModeModeInfo test_mode[] = {
> @@ -105,8 +106,9 @@ static drmModeModeInfo test_mode[] = {
>  static void test_init(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> -	int i, max_pipes = display->n_pipes;
> +	int i;
>  	igt_output_t *output;
> +	data->num_outputs = 0;
>  
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] = i;
> @@ -118,23 +120,22 @@ static void test_init(data_t *data)
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>  
> -	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
> -		if (!data->pipe[i])
> -			continue;
> -
> -		output = &display->outputs[i];
> -
> -		data->output[i] = output;
> +	i = 0;
>  
> +	for_each_output(display, output) {
>  		/* Only allow physically connected displays for the tests. */
>  		if (!igt_output_is_connected(output))
>  			continue;
>  
> +		data->output[i] = output;
> +		data->num_outputs++;
> +
>  		igt_assert(kmstest_get_connector_default_mode(
>  			data->fd, output->config.connector, &data->mode[i]));
>  
>  		data->w[i] = data->mode[i].hdisplay;
>  		data->h[i] = data->mode[i].vdisplay;
> +		i++;
>  	}
>  
>  
> @@ -156,27 +157,12 @@ static void test_fini(data_t *data)
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  }
>  
> -/* Forces a mode for a connector. */
> -static void force_output_mode(data_t *d, igt_output_t *output,
> -			      const drmModeModeInfo *mode)
> -{
> -	/* This allows us to create a virtual sink. */
> -	if (!igt_output_is_connected(output)) {
> -		kmstest_force_edid(d->fd, output->config.connector,
> -				   igt_kms_get_4k_edid());
> -
> -		kmstest_force_connector(d->fd, output->config.connector,
> -					FORCE_CONNECTOR_DIGITAL);
> -	}
> -
> -	igt_output_override_mode(output, mode);
> -}
> -
>  static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
>  	struct igt_fb buffer[IGT_MAX_PIPES];
>  	igt_crc_t zero, captured[IGT_MAX_PIPES];
> +	int i = 0;
>  	int ret;
>  
>  	igt_skip_on_f(pipe >= data->num_pipes,
> @@ -184,6 +170,10 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>  
>  	test_init(data);
>  
> +	igt_skip_on_f(pipe >= data->num_outputs,
> +				  "%d connected outputs required but found %d\n",
> +				  pipe+1, data->num_outputs+1);
> +
>  	/* create buffers */
>  	for (i = 0; i <= pipe; i++) {
>  		output = data->output[i];
> @@ -191,7 +181,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>  			continue;
>  		}
>  
> -		force_output_mode(data, output, mode);
> +		igt_output_override_mode(output, mode);
>  
>  		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>  				    mode->vdisplay, DRM_FORMAT_XRGB8888,
> @@ -199,6 +189,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>  				    &buffer[i]);
>  
>  		igt_output_set_pipe(output, i);
> +		igt_info("Assigned output %s to pipe %s with mode %dx%d@%d\n",
> +				 igt_output_name(output), kmstest_pipe_name(i),
> +				 mode->hdisplay, mode->vdisplay, mode->vrefresh);
>  
>  		igt_plane_set_fb(data->primary[i], &buffer[i]);
>  	}
> -- 
> 2.34.1
> 
