Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D401A103E174
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 13:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0510E11E;
	Wed, 18 Mar 2026 13:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/kjI6pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40D10E11E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773838855; x=1805374855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vJNBrbw1wsZrV/0LYAgIgxllBcHCEvvSNx87o+qfZVo=;
 b=g/kjI6pDU79DaUmZJ7YIOVe4XIHRREbYppBh12+whw7n2D37U9M/xkST
 wODOIGB4WZp7VSxvIrvvDYxOzYWcwhGVppl0Apx2cKWiXSGHzSe5uesaX
 Mh0GUse9cNBiSfkQ18TsQetaxDyiVGN2wS+XWnyqoviquzaWo3k5/2UIU
 O5Jl8pDiRJASh2lVFaERamOzKbJ8wQpncpQNWvrw4GtGVBksy3hoYdqCv
 rtg+vxHaqBcF9uoq0S7wxfeX0kbd2oXwbPy8fujw8vXzq0ThcnC5Ok6kZ
 ZXpM9E1rlgvkP0stTreDiJk4GWggguLyc9ywo9KAkJvjGgQMR+67XgHna w==;
X-CSE-ConnectionGUID: iXIf7MhLTEqq9Gaz47hmiQ==
X-CSE-MsgGUID: +qHEVPIfSpe0C99m/Cor2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74590037"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74590037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:00:54 -0700
X-CSE-ConnectionGUID: ti3GHVDNTkiqihtUYiw2sQ==
X-CSE-MsgGUID: K/BYA2xzSKmB9m4wvi7mDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222675625"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:00:53 -0700
Date: Wed, 18 Mar 2026 14:00:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_mode_switch: switch to
 for_each_crtc()
Message-ID: <20260318130038.xomvywnyx7cbhudm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
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

This is already merged but I have one small nit, see below.

> 
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

You keep old shape here but checkpatch.pl suggest simpler code:
		if (buffer2[crtc->crtc_index]) {

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

Same here, ' == NULL' could be dropped.

Regards,
Kamil

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
