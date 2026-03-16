Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F67F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD610E2A4;
	Mon, 16 Mar 2026 16:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZ45X0HZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57010E2B5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773678211; x=1805214211;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tQRNMah1Y2gK+Ywma7tN1xZz9b6nUHdNAC1AwDqBSO8=;
 b=OZ45X0HZ6mQTT/lEf300v4hBvUs+SBcOHg6sRPoe2MDi6C3Nt7DgPbkK
 gQ3yTuz+ldEg9M26+VYhZjqQMhbPWBXeur/8yHAYQakxjqaBQO0vOgKaf
 YbyWFe7cx06WuHdmETD8HwpllIXzYoSrS8Gx+a4yu+2k89pYGTKDw5Fei
 qtxbArmSloQymYulag8GAvWXv58mgwrjMhqfT8n+qujlQZqahy9CYYtVV
 XAXTCz85fJdPSR6y9AARYklPOO/yWp5SLaKMFSZij3I7B3firolXsCwJJ
 J7mq48O50iVLBrvqqDteflVgF1Pb9tacHVhLwW1Xtzs3lPNaOpzKT/QD4 A==;
X-CSE-ConnectionGUID: hSzMWffNTfWrMF0dQ1/1xw==
X-CSE-MsgGUID: 69eb+MhhRB2w9UXRRJpX3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85328708"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85328708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:23:31 -0700
X-CSE-ConnectionGUID: 2XByCWSwRXmJplFAgrnOrw==
X-CSE-MsgGUID: Q9DH+J+GQxKM7hIiF32h+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221005338"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:23:28 -0700
Date: Mon, 16 Mar 2026 17:23:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to
 for_each_crtc()
Message-ID: <20260316162312.pzh7xgyr7zpu6ml4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260306134937.136749-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306134937.136749-1-jani.nikula@intel.com>
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

Hi Jani,
On 2026-03-06 at 15:49:37 +0200, Jani Nikula wrote:
> Convert the test to use for_each_crtc() to avoid having to use
> igt_crtc_for_pipe(). Prefer crtc->crtc_index over crtc->pipe.
> 
> As a side effect, fix an off-by-one in i <= num_pipes loop.
> 
> Note: The implementation relies on the fact that on AMD hardware
> for_each_crtc() returns CRTCs in CRTC index order.
> 

+cc amd developers
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Regards,
Kamil

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  tests/amdgpu/amd_mode_switch.c | 60 +++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
> index 4da07c412996..5815ec34cb12 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -39,12 +39,12 @@ static void test_init(data_t *data)
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc(display, crtc) {
> -		igt_output_t *output = &display->outputs[crtc->pipe];
> +		igt_output_t *output = &display->outputs[crtc->crtc_index];
>  
> -		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
> -								    DRM_PLANE_TYPE_PRIMARY);
> +		data->primary[crtc->crtc_index] = igt_crtc_get_plane_type(crtc,
> +									  DRM_PLANE_TYPE_PRIMARY);
>  
> -		data->output[crtc->pipe] = output;
> +		data->output[crtc->crtc_index] = output;
>  	}
>  
>  	igt_require(data->output[0]);
> @@ -79,13 +79,12 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
> +	igt_crtc_t *crtc;
>  	struct igt_fb *buffer1[MAX_PIPES] = { NULL };
>  	struct igt_fb *buffer2[MAX_PIPES] = { NULL };
>  	drmModeConnectorPtr conn;
>  	drmModeModeInfoPtr kmode;
>  	void *user_data = NULL;
> -	int i = 0;
> -	int j = 0;
>  
>  	test_init(data);
>  
> @@ -94,11 +93,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  		      "ASIC does not have %d outputs/pipes\n", num_pipes);
>  
>  	/* First supported mode */
> +	for_each_crtc(display, crtc) {
> +		if (crtc->crtc_index >= num_pipes)
> +			break;
>  
> -	for (j = 0; j < num_pipes; j++) {
> -		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
> -
> -		output = data->output[j];
> +		output = data->output[crtc->crtc_index];
>  		if (!igt_output_is_connected(output))
>  			continue;
>  
> @@ -106,18 +105,18 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  			data->fd, output->config.connector->connector_id);
>  
>  		kmode = &conn->modes[0];
> -		if (buffer1[j] == NULL) {
> +		if (buffer1[crtc->crtc_index] == NULL) {
>  			igt_fb_t fb;
> -			buffer1[j] = &fb;
> +			buffer1[crtc->crtc_index] = &fb;
>  			igt_create_color_fb(data->fd, kmode->hdisplay,
>  					    kmode->vdisplay,
>  					    DRM_FORMAT_XRGB8888,
>  					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
> -					    0.f, buffer1[j]);
> +					    0.f, buffer1[crtc->crtc_index]);
>  		}
>  		igt_output_set_crtc(output, crtc);
>  		force_output_mode(data, output, kmode);
> -		igt_plane_set_fb(data->primary[j], buffer1[j]);
> +		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[crtc->crtc_index]);
>  		drmModeFreeConnector(conn);
>  	}
>  
> @@ -126,8 +125,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  
>  	/* Last supported mode */
>  
> -	for (j = 0; j < num_pipes; j++) {
> -		output = data->output[j];
> +	for_each_crtc(display, crtc) {
> +		if (crtc->crtc_index >= num_pipes)
> +			break;
> +
> +		output = data->output[crtc->crtc_index];
>  		if (!igt_output_is_connected(output))
>  			continue;
>  
> @@ -135,17 +137,17 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  			data->fd, output->config.connector->connector_id);
>  
>  		kmode = &conn->modes[conn->count_modes - 1];
> -		if (buffer2[j] == NULL) {
> +		if (buffer2[crtc->crtc_index] == NULL) {
>  			igt_fb_t fb;
> -			buffer2[j] = &fb;
> +			buffer2[crtc->crtc_index] = &fb;
>  			igt_create_color_fb(data->fd, kmode->hdisplay,
>  					    kmode->vdisplay,
>  					    DRM_FORMAT_XRGB8888,
>  					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
> -					    0.f, buffer2[j]);
> +					    0.f, buffer2[crtc->crtc_index]);
>  		}
>  		force_output_mode(data, output, kmode);
> -		igt_plane_set_fb(data->primary[j], buffer2[j]);
> +		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer2[crtc->crtc_index]);
>  		drmModeFreeConnector(conn);
>  	}
>  
> @@ -153,8 +155,11 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  				  user_data);
>  
>  	/* First supported again */
> -	for (j = 0; j < num_pipes; j++) {
> -		output = data->output[j];
> +	for_each_crtc(display, crtc) {
> +		if (crtc->crtc_index >= num_pipes)
> +			break;
> +
> +		output = data->output[crtc->crtc_index];
>  		if (!igt_output_is_connected(output))
>  			continue;
>  
> @@ -163,7 +168,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  
>  		kmode = &conn->modes[0];
>  		force_output_mode(data, output, kmode);
> -		igt_plane_set_fb(data->primary[j], buffer1[j]);
> +		igt_plane_set_fb(data->primary[crtc->crtc_index], buffer1[crtc->crtc_index]);
>  		drmModeFreeConnector(conn);
>  	}
>  
> @@ -172,9 +177,12 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
>  
>  	test_fini(data);
>  
> -	for (i = 0; i <= num_pipes; i++) {
> -		igt_remove_fb(data->fd, buffer1[i]);
> -		igt_remove_fb(data->fd, buffer2[i]);
> +	for_each_crtc(display, crtc) {
> +		if (crtc->crtc_index >= num_pipes)
> +			break;
> +
> +		igt_remove_fb(data->fd, buffer1[crtc->crtc_index]);
> +		igt_remove_fb(data->fd, buffer2[crtc->crtc_index]);
>  	}
>  }
>  
> -- 
> 2.47.3
> 
