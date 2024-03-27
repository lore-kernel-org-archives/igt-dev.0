Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA750C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 14:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2854510FD54;
	Wed, 27 Mar 2024 14:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MB1w5yWw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCB510FD54
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711550771; x=1743086771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8IKknhT9mVf+3YHrSlUMnes9mCnPqSe+DZJKeunn4io=;
 b=MB1w5yWwBzKhm21ojvOZL1u6ogPv2HkvB1/2LGEucehyDupaBF3926TS
 hOc2dFeAS4U9MOOsdhUv6QKOpQ9rJ3Iq/bpJBwQ8OlpOny3YZCXueG0f/
 Ib4sRZM4AvCqe7nG8dpHqshiA2KJC3Nc9bfKFLvOmEnsGgRWBQ3YiewjM
 mGeQo4nsbvOg29EG4GEccvWBJn0UslkI8VgASeH+wKdirjZkpfMD24Ujs
 TRqS2rL2FaKoL8oPSMxJcwmyir4NFm48GxBSLfkNnb6c/b++YTWKyQAlt
 m4hfIBlGQRlPMh2Eer2NI+5aNGJCdGpK1Bj2yTyjOAADXkMJsnQf3Ovrf g==;
X-CSE-ConnectionGUID: wQZrLUu0TNWafhtWNIaO3Q==
X-CSE-MsgGUID: QI5aeVMASBSFugRWhkpZcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6843543"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6843543"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20965531"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:46:09 -0700
Date: Wed, 27 Mar 2024 15:46:05 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, rodrigo.siqueira@amd.com,
 harry.wentland@amd.com, hersenxs.wu@amd.com
Subject: Re: [PATCH 1/3] tests/amdgpu/amd_dp_dsc: Correct code style problems
Message-ID: <20240327144605.zdyxdwpa6urvbo2p@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 rodrigo.siqueira@amd.com, harry.wentland@amd.com,
 hersenxs.wu@amd.com
References: <20240321224758.1531610-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321224758.1531610-1-alex.hung@amd.com>
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

Hi Alex,
On 2024-03-21 at 16:47:56 -0600, Alex Hung wrote:
> Use "indent -linux" to fix code styles such as idententation and spaces.
> Some manual fixes were also applied for consistency.
> 
> There are no funtional changes.

I would suggest also using checkpatch.pl script from Linux kernel
on final patches before sending, some warnings (like line too long)
can be sometimes ignored but it very often points to style problems.

It finds few nits, see below.

> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/amdgpu/amd_dp_dsc.c | 154 +++++++++++++++++---------------------
>  1 file changed, 68 insertions(+), 86 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index e782ce84a..f2da98259 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -66,11 +66,8 @@ static void test_init(data_t *data)
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] = PIPE_A + i;
>  		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
> -		data->primary[i] = igt_pipe_get_plane_type(
> -				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> -		data->pipe_crc[i] =
> -				igt_pipe_crc_new(data->fd, data->pipe_id[i],
> -						 IGT_PIPE_CRC_SOURCE_AUTO);
> +		data->primary[i] = igt_pipe_get_plane_type(data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->pipe_crc[i] = igt_pipe_crc_new(data->fd, data->pipe_id[i], IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>  
>  	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
> @@ -79,19 +76,16 @@ static void test_init(data_t *data)
>  
>  		/* Only allow physically connected displays for the tests. */
>  		if (!igt_output_is_connected(output))
> -				continue;
> +			continue;
>  
> -		/* Ensure that outpus are DP, DSC & FEC capable*/
> -		if (!(is_dp_fec_supported(data->fd, output->name) &&
> -			is_dp_dsc_supported(data->fd, output->name)))
> +		/* Ensure that outpus are DP, DSC & FEC capable */
> +		if (!(is_dp_fec_supported(data->fd, output->name) && is_dp_dsc_supported(data->fd, output->name)))
>  			continue;
>  
> -		if (output->config.connector->connector_type !=
> -			DRM_MODE_CONNECTOR_DisplayPort)
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
>  			continue;
>  
> -		igt_assert(kmstest_get_connector_default_mode(
> -				data->fd, output->config.connector, &data->mode[n]));
> +		igt_assert(kmstest_get_connector_default_mode(data->fd, output->config.connector, &data->mode[n]));
>  
>  		n += 1;
>  	}
> @@ -117,11 +111,11 @@ static void test_dsc_enable(data_t *data)
>  			continue;
>  
>  		igt_create_pattern_fb(data->fd,
> -					data->mode[i].hdisplay,
> -					data->mode[i].vdisplay,
> -					DRM_FORMAT_XRGB8888,
> -					0,
> -					&ref_fb);
> +				      data->mode[i].hdisplay,
> +				      data->mode[i].vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      0,
> +				      &ref_fb);
>  		igt_output_set_pipe(output, data->pipe_id[i]);
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> @@ -144,11 +138,11 @@ static void test_dsc_enable(data_t *data)
>  		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
>  
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
> -		igt_display_commit_atomic(display,DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  
>  		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
>  
> -		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
> +		/* Revert DSC back to automatic mechanism by disabling state overwrites */
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  
>  		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
> @@ -167,12 +161,12 @@ static void test_dsc_enable(data_t *data)
>  }
>  
>  static bool update_slice_height(data_t *data, int v_addressable,
> -					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
> +				int *num_slices, igt_output_t * output, int conn_idx, igt_fb_t ref_fb)
-----------------------------------------------^
This should be: igt_output_t *output

s/igt_output_t * output/igt_output_t *output/

Btw igt style is align to parameters and try to keep under 100 colums,
or better 80, so:

static bool update_slice_height(data_t *data, int v_addressable,
                                int *num_slices, igt_output_t *output,
                                int conn_idx, igt_fb_t ref_fb)

>  {
>  	int i;
>  	bool pass = true;
>  
> -	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
> +	for (i = 0; i < NUM_SLICE_SLOTS; i++) {
>  		int act_slice_height;
>  		int slice_height = v_addressable / num_slices[i] + (v_addressable % num_slices[i]);
>  
> @@ -201,12 +195,12 @@ static bool update_slice_height(data_t *data, int v_addressable,
>  }
>  
>  static bool update_slice_width(data_t *data, int h_addressable,
> -					  int *num_slices, igt_output_t *output, int conn_idx, igt_fb_t ref_fb)
> +			       int *num_slices, igt_output_t * output, int conn_idx, igt_fb_t ref_fb)
-----------------------------------------------^
Same here.

Regards,
Kamil

>  {
>  	int i;
>  	bool pass = true;
>  
> -	for(i = 0; i < NUM_SLICE_SLOTS; i++) {
> +	for (i = 0; i < NUM_SLICE_SLOTS; i++) {
>  		int act_slice_width;
>  		int slice_width = h_addressable / num_slices[i] + (h_addressable % num_slices[i]);
>  
> @@ -240,9 +234,9 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>  	igt_output_t *output;
>  	igt_display_t *display = &data->display;
>  	igt_fb_t ref_fb;
> -	int num_slices [] = { 1, 2, 4, 8 };
> +	int num_slices[] = { 1, 2, 4, 8 };
>  	int h_addressable, v_addressable;
> -	bool ret_slice_height= false, ret_slice_width = false;
> +	bool ret_slice_height = false, ret_slice_width = false;
>  	int i, test_conn_cnt = 0;
>  
>  	test_init(data);
> @@ -255,11 +249,11 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>  			continue;
>  
>  		igt_create_pattern_fb(data->fd,
> -					data->mode[i].hdisplay,
> -					data->mode[i].vdisplay,
> -					DRM_FORMAT_XRGB8888,
> -					0,
> -					&ref_fb);
> +				      data->mode[i].hdisplay,
> +				      data->mode[i].vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      0,
> +				      &ref_fb);
>  		igt_output_set_pipe(output, data->pipe_id[i]);
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> @@ -296,7 +290,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
>  
>  		dsc_after = igt_amd_read_dsc_clock_status(data->fd, output->name);
>  
> -		/* Revert DSC back to automatic mechanism by disabling state overwrites*/
> +		/* Revert DSC back to automatic mechanism by disabling state overwrites */
>  		igt_plane_set_fb(data->primary[i], &ref_fb);
>  
>  		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
> @@ -321,43 +315,41 @@ static void test_dsc_link_settings(data_t *data)
>  	igt_output_t *output;
>  	igt_fb_t ref_fb[MAX_PIPES];
>  	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
> -    int lane_count[4], link_rate[4], link_spread[4];
> +	int lane_count[4], link_rate[4], link_spread[4];
>  	igt_display_t *display = &data->display;
>  	int i, lc, lr;
> -    bool dsc_on;
> -	const enum dc_lane_count lane_count_vals[] =
> -	{
> +	bool dsc_on;
> +	const enum dc_lane_count lane_count_vals[] = {
>  		LANE_COUNT_TWO,
>  		LANE_COUNT_FOUR
>  	};
> -	const enum dc_link_rate link_rate_vals[] =
> -	{
> +	const enum dc_link_rate link_rate_vals[] = {
>  		LINK_RATE_LOW,
>  		LINK_RATE_HIGH,
>  		LINK_RATE_HIGH2,
>  		LINK_RATE_HIGH3
>  	};
>  
> -    test_init(data);
> +	test_init(data);
>  
> -    /* Setup all outputs */
> +	/* Setup all outputs */
>  	for_each_pipe(&data->display, i) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
>  
> -        igt_create_pattern_fb(data->fd,
> -                    data->mode[i].hdisplay,
> -                    data->mode[i].vdisplay,
> -                    DRM_FORMAT_XRGB8888,
> -                    0,
> -                    &ref_fb[i]);
> +		igt_create_pattern_fb(data->fd,
> +				      data->mode[i].hdisplay,
> +				      data->mode[i].vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      0,
> +				      &ref_fb[i]);
>  		igt_output_set_pipe(output, data->pipe_id[i]);
>  		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
>  	}
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>  
> -    /* Collect reference CRCs */
> +	/* Collect reference CRCs */
>  	for_each_pipe(&data->display, i) {
>  		output = data->output[i];
>  		if (!output || !igt_output_is_connected(output))
> @@ -376,11 +368,10 @@ static void test_dsc_link_settings(data_t *data)
>  
>  				/* Write lower link settings */
>  				igt_info("Applying lane count: %d, link rate 0x%02x, on default training\n",
> -						lane_count_vals[lc], link_rate_vals[lr]);
> +					 lane_count_vals[lc], link_rate_vals[lr]);
>  				igt_amd_write_link_settings(data->fd, output->name,
> -							lane_count_vals[lc],
> -							link_rate_vals[lr],
> -							LINK_TRAINING_DEFAULT);
> +							    lane_count_vals[lc],
> +							    link_rate_vals[lr], LINK_TRAINING_DEFAULT);
>  				usleep(500 * MSEC_PER_SEC);
>  			}
>  
> @@ -393,10 +384,7 @@ static void test_dsc_link_settings(data_t *data)
>  					continue;
>  
>  				/* Verify lower link settings */
> -				igt_amd_read_link_settings(data->fd, output->name,
> -							lane_count,
> -							link_rate,
> -							link_spread);
> +				igt_amd_read_link_settings(data->fd, output->name, lane_count, link_rate, link_spread);
>  
>  				igt_assert_f(lane_count[0] == lane_count_vals[lc], "Lowering lane count settings failed\n");
>  				igt_assert_f(link_rate[0] == link_rate_vals[lr], "Lowering link rate settings failed\n");
> @@ -404,10 +392,8 @@ static void test_dsc_link_settings(data_t *data)
>  				/* Log current mode and DSC status */
>  				dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
>  				igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> -							data->mode[i].hdisplay,
> -							data->mode[i].vdisplay,
> -							data->mode[i].vrefresh,
> -							dsc_on ? "ON" : "OFF");
> +					 data->mode[i].hdisplay,
> +					 data->mode[i].vdisplay, data->mode[i].vrefresh, dsc_on ? "ON" : "OFF");
>  
>  				igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
>  				igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
> @@ -423,7 +409,7 @@ static void test_dsc_link_settings(data_t *data)
>  		igt_remove_fb(data->fd, &ref_fb[i]);
>  	}
>  
> -    test_fini(data);
> +	test_fini(data);
>  }
>  
>  static void test_dsc_bpc(data_t *data)
> @@ -433,10 +419,10 @@ static void test_dsc_bpc(data_t *data)
>  	igt_crc_t test_crc;
>  	igt_display_t *display = &data->display;
>  	int i, bpc, max_supported_bpc[MAX_PIPES];
> -    bool dsc_on;
> -	const int bpc_vals[] = {12, 10, 8};
> +	bool dsc_on;
> +	const int bpc_vals[] = { 12, 10, 8 };
>  
> -    test_init(data);
> +	test_init(data);
>  
>  	/* Find max supported bpc */
>  	for_each_pipe(&data->display, i) {
> @@ -447,7 +433,7 @@ static void test_dsc_bpc(data_t *data)
>  		max_supported_bpc[i] = igt_get_output_max_bpc(data->fd, output->name);
>  	}
>  
> -    /* Setup all outputs */
> +	/* Setup all outputs */
>  	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
>  		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
>  
> @@ -463,11 +449,11 @@ static void test_dsc_bpc(data_t *data)
>  			igt_info("Setting bpc = %d\n", bpc_vals[bpc]);
>  			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, bpc_vals[bpc]);
>  			igt_create_pattern_fb(data->fd,
> -						data->mode[i].hdisplay,
> -						data->mode[i].vdisplay,
> -						DRM_FORMAT_XRGB8888,
> -						0,
> -						&ref_fb[i]);
> +					      data->mode[i].hdisplay,
> +					      data->mode[i].vdisplay,
> +					      DRM_FORMAT_XRGB8888,
> +					      0,
> +					      &ref_fb[i]);
>  			igt_output_set_pipe(output, data->pipe_id[i]);
>  			igt_plane_set_fb(data->primary[i], &ref_fb[i]);
>  		}
> @@ -488,16 +474,15 @@ static void test_dsc_bpc(data_t *data)
>  
>  			/* Check current bpc */
>  			igt_info("Verifying display %s has correct bpc\n", output->name);
> -			igt_assert_output_bpc_equal(data->fd, data->pipe_id[i],
> -						    output->name, bpc_vals[bpc]);
> +			igt_assert_output_bpc_equal(data->fd, data->pipe_id[i], output->name, bpc_vals[bpc]);
>  
>  			/* Log current mode and DSC status */
>  			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
>  			igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> -						data->mode[i].hdisplay,
> -						data->mode[i].vdisplay,
> -						data->mode[i].vrefresh,
> -						dsc_on ? "ON" : "OFF");
> +				 data->mode[i].hdisplay,
> +				 data->mode[i].vdisplay,
> +				 data->mode[i].vrefresh,
> +				 dsc_on ? "ON" : "OFF");
>  		}
>  
>  		/* Cleanup all fbs */
> @@ -513,17 +498,15 @@ static void test_dsc_bpc(data_t *data)
>  		}
>  	}
>  
> -    test_fini(data);
> +	test_fini(data);
>  }
>  
> -igt_main
> -{
> +igt_main {
>  	data_t data = { 0 };
>  
>  	igt_skip_on_simulation();
>  
> -	igt_fixture
> -	{
> +	igt_fixture {
>  		data.fd = drm_open_driver_master(DRIVER_ANY);
>  
>  		igt_display_require(&data.display, data.fd);
> @@ -536,22 +519,21 @@ igt_main
>  
>  	igt_describe("Forces DSC on/off & ensures it is reset properly");
>  	igt_subtest("dsc-enable-basic")
> -		    test_dsc_enable(&data);
> +	    test_dsc_enable(&data);
>  
>  	igt_describe("Tests various DSC slice dimensions");
>  	igt_subtest("dsc-slice-dimensions-change")
> -		    test_dsc_slice_dimensions_change(&data);
> +	    test_dsc_slice_dimensions_change(&data);
>  
>  	igt_describe("Tests various combinations of link_rate + lane_count and logs if DSC enabled/disabled");
>  	igt_subtest("dsc-link-settings")
> -		    test_dsc_link_settings(&data);
> +	    test_dsc_link_settings(&data);
>  
>  	igt_describe("Tests different bpc settings and logs if DSC is enabled/disabled");
>  	igt_subtest("dsc-bpc")
> -			test_dsc_bpc(&data);
> +	    test_dsc_bpc(&data);
>  
> -	igt_fixture
> -	{
> +	igt_fixture {
>  		igt_reset_connectors();
>  		igt_display_fini(&data.display);
>  	}
> -- 
> 2.34.1
> 
