Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F7606A331
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bjow5zNm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C351124FA;
	Fri, 13 Nov 2026 11:03:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504CC112535
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794567759; x=1826103759;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=15DMr+xtoGb+XFGT4PwaegTk1sHg7I9Oyi3gp0BZ3GQ=;
 b=Bjow5zNmTXN/Kdzb8k0OMdS4iMnJmAaGGt8vIgoVbey1b0FZBfN7SG0K
 FEyCXd9QmNpkg0vnEzVtbw2xv+HLuDN5MQzyCDnRhkq0nPqaQQIEyIiAS
 ccv97Vh+v5zrplye5rwU7TvI8q+N58d5fWKxVfXEa1z/Ygudtf/gDN1bl
 //jTyvnI3O7XnUEysFXWjn1CkS8U+EkTUCwsnD5C/ClmB6ISgAEOWhbry
 4IkvcVfE6UiHpKEiYLt28U1YGiCF7YncvTXRb0iT4yJmG+d9Jri6ppPCH
 nhdeTsmOdS6drQjlQZmJb/zJ0L9cV+lmKmwR2ROcWjb3FwMI76pPbKiPc A==;
X-CSE-ConnectionGUID: 0boJzpK0TYOTryf5y+Or+A==
X-CSE-MsgGUID: qNUOU9L/RuOO9jUmAds37g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3259482"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3259482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:02:39 -0800
X-CSE-ConnectionGUID: +tziTp3HQYW6ebXIOQ8oGA==
X-CSE-MsgGUID: DNDXPe5oSjey+z6tAzqe+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9445123"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:02:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com, chiahsuan.chung@amd.com, Ray Wu
 <ray.wu@amd.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_replay: Fix state and sink
 status checks
In-Reply-To: <20261113052845.3333547-1-ray.wu@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113052845.3333547-1-ray.wu@amd.com>
Date: Fri, 13 Nov 2026 13:02:33 +0200
Message-ID: <87585b0c7e851c63d31c6a8ddba95b20eb543d8e@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ray Wu <ray.wu@amd.com> wrote:
> Most checks in amd_replay can never fail:
> - State range checks use "&&" and are always false.
> - The live-mode test_mode check misses constant live, and the
>   static-screen check is always true.
> - The settle check accepts REPLAY_STATE_2 (entry only).
> - DPCD 0x378 is only checked for non-zero.
>
> Use "||" for the state ranges, fix both test_mode checks and require
> REPLAY_STATE_3 after settle. Fail on the 0x378 error bits (desync only
> when enabled in 0x37B) and sink device status 0x7, following the amdgpu
> DC bit layout.
>
> Also read DPCD with pread() so a short read cannot return a byte from
> the wrong offset, drop the double close of dir_fd, and fail instead of
> skip on page flip errors.

This patch just accidentally caught my eye.

Suffice it to say I think it's doing way too much at once. Some of the
things being fixed are pretty bad, and really should've been caught in
review two years ago. But please stick to good development practises
also when fixing past mistakes.


BR,
Jani.

>
> Signed-off-by: Ray Wu <ray.wu@amd.com>
> ---
>  tests/amdgpu/amd_replay.c | 92 +++++++++++++++++++++++----------------
>  1 file changed, 54 insertions(+), 38 deletions(-)
>
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index 775bed190..c2eb8ec04 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -16,6 +16,19 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
>  #define REPLAY_SETTLE_DELAY 10
>  #define FLIP_FRAME_BEFORE_TEST 60
>  
> +/*
> + * FreeSync Replay sink DPCDs, aligned with amdgpu kernel
> + * 'union dpcd_replay_configuration' and
> + * 'union replay_enable_and_configuration' in dc_dp_types.h
> + */
> +#define DP_SINK_PR_REPLAY_STATUS		0x378
> +#define DP_SINK_PR_ENABLE_AND_CONFIGURATION	0x37B
> +#define REPLAY_STATUS_STATE_TRANSITION_ERROR	(1 << 0)
> +#define REPLAY_STATUS_DESYNC_ERROR		(1 << 1)
> +#define REPLAY_STATUS_SINK_DEVICE_STATUS(x)	(((x) >> 2) & 0x7)
> +#define REPLAY_SINK_DEVICE_STATUS_ERROR		0x7
> +#define REPLAY_CONFIG_DESYNC_ERROR_VERIFY	(1 << 1)
> +
>  /* Common test data. */
>  struct test_data {
>  	igt_display_t display;
> @@ -159,7 +172,6 @@ static bool dpcd_read_byte(int drm_fd,
>  {
>  	DIR *dir;
>  	int dir_fd;
> -	uint8_t buf[16] = {0};
>  	*val = 0;
>  
>  	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
> @@ -171,7 +183,7 @@ static bool dpcd_read_byte(int drm_fd,
>  	for (;;) {
>  		struct dirent *ent;
>  		char path[5 + sizeof(ent->d_name)];
> -		int fd, ret, i, j, k;
> +		int fd, ret;
>  
>  		ent = readdir(dir);
>  		if (!ent)
> @@ -185,43 +197,53 @@ static bool dpcd_read_byte(int drm_fd,
>  		fd = open(path, O_RDONLY);
>  		igt_assert(fd >= 0);
>  
> -		k = (addr / 16) + 1;
> -		j = addr % 16;
> -
> -		/* read 16 bytes each loop */
> -		for (i = 0; i < k; i++) {
> -			ret = read(fd, buf, sizeof(buf));
> -			if (ret < 0)
> -				break;
> -			if (ret != sizeof(buf))
> -				break;
> -		}
> +		ret = pread(fd, val, 1, addr);
>  
>  		close(fd);
>  
> +		/* closedir() also closes dir_fd */
>  		closedir(dir);
> -		close(dir_fd);
>  
> -		if (ret > 0)
> -			*val = buf[j];
> -
> -		return (ret > 0);
> +		return (ret == 1);
>  	}
>  
>  	closedir(dir);
> -	close(dir_fd);
>  
>  	igt_skip("Missing /dev/drm_dp_aux*, check DRM_DISPLAY_DP_AUX_CHARDEV in kernel config\n");
>  
>  	return false;
>  }
>  
> +/* Check sink Replay status (DPCD 0x378) reports no error */
> +static void check_sink_status(struct test_data *data, igt_output_t *output)
> +{
> +	uint8_t status = 0, config = 0, error_mask;
> +
> +	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
> +		     DP_SINK_PR_ENABLE_AND_CONFIGURATION, &config),
> +		     "Failed to read DPCD 0x37B\n");
> +	igt_assert_f(dpcd_read_byte(data->fd, output->config.connector,
> +		     DP_SINK_PR_REPLAY_STATUS, &status),
> +		     "Failed to read DPCD 0x378\n");
> +	igt_debug("DPCD 0x378 = 0x%02X, 0x37B = 0x%02X\n", status, config);
> +
> +	/* Desync error is only reported when desync verification is enabled */
> +	error_mask = REPLAY_STATUS_STATE_TRANSITION_ERROR;
> +	if (config & REPLAY_CONFIG_DESYNC_ERROR_VERIFY)
> +		error_mask |= REPLAY_STATUS_DESYNC_ERROR;
> +
> +	igt_fail_on_f(status & error_mask,
> +		      "Sink reported Replay error, DPCD 0x378 = 0x%02X\n", status);
> +	igt_fail_on_f(REPLAY_STATUS_SINK_DEVICE_STATUS(status) == REPLAY_SINK_DEVICE_STATUS_ERROR,
> +		      "Sink reported device error, DPCD 0x378 = 0x%02X\n", status);
> +	igt_fail_on_f(status == 0, "Panel is not in replay mode\n");
> +}
> +
>  static void page_flip_test(struct test_data *data, igt_output_t *output,
>  						 enum test_mode test_mode, uint32_t frame_num)
>  {
>  	int ret, frame_count;
>  	enum replay_state replay_state;
> -	uint8_t panel_dpcd = 0;
>  
>  	if (!data || data->ref_fb.fb_id == 0 || data->ref_fb2.fb_id == 0
>  	    || frame_num <= 5) {
> @@ -233,18 +255,17 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
>  	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
>  		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
>  				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> -		igt_require(ret == 0);
> +		igt_assert_eq(ret, 0);
>  		kmstest_wait_for_pageflip(data->fd);
>  
> -		if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +		if ((test_mode == TEST_MODE_CONSTANT_LIVE || test_mode == TEST_MODE_INTERMITTENT_LIVE)
>  				&& frame_count > 5) {
>  			/* Panel Replay state needs few frame to enter the live mode */
>  			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> -			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>  			igt_debug("replay_state live mode = 0x%X\n", replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +			igt_fail_on_f(replay_state < REPLAY_STATE_4 || replay_state >= REPLAY_STATE_5,
>  					"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> -			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +			check_sink_status(data, output);
>  		}
>  
>  		if (frame_count % 2 == 0)
> @@ -259,7 +280,6 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>  	int edp_idx;
>  	enum replay_state replay_state;
>  	igt_output_t *output;
> -	uint8_t panel_dpcd = 0;
>  
>  	test_init(data);
>  
> @@ -295,23 +315,22 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>  		replay_state = igt_amd_read_replay_state(data->fd, output->name);
>  		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
>  		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> -		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +		igt_fail_on_f(replay_state < REPLAY_STATE_3,
>  			 "Panel Replay was not enabled for connector %s\n", output->name);
>  
>  		/* Do some page flip and let the replay go into live mode */
>  		page_flip_test(data, output, test_mode, 20);
>  
>  		/* Check Panel Replay state in static screen */
> -		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || test_mode == TEST_MODE_INTERMITTENT_LIVE) {
>  			/* Panel Replay state takes some time to settle its value on static screen */
>  			sleep(1);
>  
>  			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> -			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>  			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
>  				 "State should be REPLAY_STATE_3 (Active)\n");
> -			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +			check_sink_status(data, output);
>  		}
>  
>  		/* Do another page flip if we do the replay_intermittent_live test */
> @@ -322,12 +341,11 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>  			sleep(1);
>  
>  			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> -			dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>  			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
>  				 replay_state);
> -			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
>  				 "State should be REPLAY_STATE_3 (Active)\n");
> -			igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +			check_sink_status(data, output);
>  		}
>  
>  		igt_remove_fb(data->fd, &data->ref_fb);
> @@ -342,7 +360,6 @@ static void run_check_replay_suspend(struct test_data *data)
>  	int edp_idx;
>  	enum replay_state replay_state;
>  	igt_output_t *output;
> -	uint8_t panel_dpcd = 0;
>  
>  	test_init(data);
>  
> @@ -378,11 +395,10 @@ static void run_check_replay_suspend(struct test_data *data)
>  		sleep(REPLAY_SETTLE_DELAY);
>  
>  		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> -		dpcd_read_byte(data->fd, output->config.connector, 0x378, &panel_dpcd);
>  		igt_debug("replay_state static mode = 0x%X\n", replay_state);
> -		igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +		igt_fail_on_f(replay_state < REPLAY_STATE_3 || replay_state >= REPLAY_STATE_4,
>  			 "State should be REPLAY_STATE_3 (Active)\n");
> -		igt_fail_on_f(panel_dpcd == 0, "Panel is not in replay mode\n");
> +		check_sink_status(data, output);
>  
>  		igt_remove_fb(data->fd, &data->ref_fb);
>  		igt_remove_fb(data->fd, &data->ref_fb2);

-- 
Jani Nikula, Intel
