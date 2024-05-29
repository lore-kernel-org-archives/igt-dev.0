Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FDDC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 14:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD84910E432;
	Wed, 29 May 2024 14:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vamm6SxS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C1D10E432
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716991757; x=1748527757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0CQRjh4P2W9uAPeDhpweUk0YjdTnhtKFsQqVQBZ6CmI=;
 b=Vamm6SxSckYw+/+nD4P9qkbtN1x6WyRMHdT1Txrtyw7FR7Vf37tbmdYE
 KbPBvas/1gOV8ZvbSnLCK1ftxrMZagckWQcu/MKOW1QeEy8sYNOX4hWqV
 uAxVVJR5+IAUTS/KS2v22lC3s6bNZaniyZrKVeSrWo4tsbjzf7ttN4+eV
 +ywYJ5LpopSrKaqbVuHweiczT4kIhIa9XsmWXMLm+eyWcojTq3xvgZj7g
 t6G13sOGfpdgcHSJHigGWU4QrMDRrFi7cUIC5yNWyfByJkwBotnTHb2LL
 3EdIDI/9JprHw+Jf3cTvvUJKZLJoBPWsPuz3x0nHsSsxovYzNgMDLMcPl w==;
X-CSE-ConnectionGUID: 5BjR5kTFRTCxV3OKiXjsPA==
X-CSE-MsgGUID: Jw4icrIHR36mn5DGkkxL6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24811493"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24811493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:09:17 -0700
X-CSE-ConnectionGUID: 9fjbQIG5TBWFjvsqNiRbdw==
X-CSE-MsgGUID: yRlJyZjEQGiKTsnBI5a76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35980327"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:09:15 -0700
Date: Wed, 29 May 2024 16:08:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tom Chung <chiahsuan.chung@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo.Siqueira@amd.com, alex.hung@amd.com
Subject: Re: [PATCH i-g-t, v2] tests/amdgpu/amd_replay: Add amd_replay IGT test
Message-ID: <20240529140859.uykbxfdabmpt6edq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tom Chung <chiahsuan.chung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo.Siqueira@amd.com,
 alex.hung@amd.com
References: <20240510030142.47958-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240510030142.47958-1-chiahsuan.chung@amd.com>
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

Hi Tom,
On 2024-05-10 at 11:01:42 +0800, Tom Chung wrote:
> [why]
> Add a basic IGT test for panel replay feature.
> 
> [how]
> Subtest case
> 
> a. static screen
>    1. Check if system support panel replay.
>    2. Start video flip for a while.
>    3. Stop video flip and wait for a while.
>    4. Check if replay state is in Replay mode.
> 
> b. Live mode (intermittent)
>    1. Check if system support panel replay.
>    2. Start video flip for a while.
>    3. Check if replay state is in Live mode.
>    4. Stop video flip and wait for a while.
>    5. Check if replay state is in Replay mode.
>    6. Repaet 2 to 5.
> 
> c. Live mode (constant)
>    1. Check if system support panel replay.
>    2. Start video flip for a while.
>    3. Check if replay state is in Live mode.
> 
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
>  v2: Modify the include header files in tests/amdgpu/amd_replay.c
> 
>  lib/igt_amd.c             | 102 ++++++++++++
>  lib/igt_amd.h             |  39 ++++-
>  tests/amdgpu/amd_replay.c | 318 ++++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build  |   1 +
>  4 files changed, 459 insertions(+), 1 deletion(-)
>  create mode 100755 tests/amdgpu/amd_replay.c
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 149af5151..8bc6fdc6a 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1014,6 +1014,108 @@ bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
>  	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_ILR_SETTING);
>  }
>  
> +/**
> + * igt_amd_output_has_replay_cap: check if eDP connector has replay_capability debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_CAP);
> +}
> +
> +/**
> + * igt_amd_replay_support_sink: check if sink device support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);

Add newline.

> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Sink support: yes");
> +}
> +
> +/**
> + * igt_amd_replay_support_drv: check if driver support Panel Replay
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name)
> +{
> +	char buf[128];
> +	int ret;
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("output %s: debugfs not found\n", connector_name);

Same here, add newline.

> +		return false;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_CAP, buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
-----------------^
> +		DEBUGFS_EDP_REPLAY_CAP, connector_name);
-----------------^
Align.

> +	close(fd);
> +
> +	if (ret < 1)
> +		return false;
> +
> +	return strstr(buf, "Driver support: yes");
> +}
> +
> +/**
> + * igt_amd_output_has_replay_state: check if eDP connector has replay_state debugfs entry
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name, on which we're reading the status
> + */
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name)
> +{
> +	return igt_amd_output_has_debugfs(drm_fd, connector_name, DEBUGFS_EDP_REPLAY_STATE);
> +}
> +
> +/**
> + * @brief Read Panel Replay State from debugfs interface
> + * @param drm_fd DRM file descriptor
> + * @param connector_name The connector's name, on which we're reading the status
> + * @return Panel Replay state as integer
> + */
> +int igt_amd_read_replay_state(int drm_fd, char *connector_name)
> +{
> +	char buf[4];
> +	int fd, ret;
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	if (fd < 0) {
> +		igt_info("Couldn't open connector %s debugfs directory\n", connector_name);

Add newline.

> +		return -1;
> +	}
> +
> +	ret = igt_debugfs_simple_read(fd, DEBUGFS_EDP_REPLAY_STATE, buf, sizeof(buf));
> +	close(fd);
> +
> +	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
> +		DEBUGFS_EDP_REPLAY_STATE, connector_name);
> +
> +	return strtol(buf, NULL, 10);
> +}
> +
>  /**
>   * igt_amd_output_has_psr_cap: check if eDP connector has psr_capability debugfs entry
>   * @drm_fd: DRM file descriptor
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 6780b99de..a41b423b7 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -47,6 +47,8 @@
>  #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
>  #define MAX_SUPPORTED_ILR 8
>  #define MULTIPLIER_TO_LR 270000
> +#define DEBUGFS_EDP_REPLAY_CAP "replay_capability"
> +#define DEBUGFS_EDP_REPLAY_STATE "replay_state"
>  #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>  #define DEBUGFS_EDP_PSR_STATE	"psr_state"
>  #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
> @@ -100,6 +102,35 @@ enum dc_link_training_type {
>  	LINK_TRAINING_NO_PATTERN
>  };
>  
> +/*
> + * enumeration of REPLAY STATE below should be aligned to the upstreamed
> + * amdgpu kernel driver 'enum replay_state' in dmub_cmd.h
> + */
> +enum replay_state {
> +	REPLAY_STATE_0 = 0x0,
> +	REPLAY_STATE_1 = 0x10,
> +	REPLAY_STATE_1A = 0x11,
> +	REPLAY_STATE_2 = 0x20,
> +	REPLAY_STATE_3 = 0x30,
> +	REPLAY_STATE_3INIT = 0x31,
> +	REPLAY_STATE_4 = 0x40,
> +	REPLAY_STATE_4A = 0x41,
> +	REPLAY_STATE_4B = 0x42,
> +	REPLAY_STATE_4C = 0x43,
> +	REPLAY_STATE_4D = 0x44,
> +	REPLAY_STATE_4B_LOCKED = 0x4A,
> +	REPLAY_STATE_4C_UNLOCKED = 0x4B,
> +	REPLAY_STATE_5 = 0x50,
> +	REPLAY_STATE_5A = 0x51,
> +	REPLAY_STATE_5B = 0x52,
> +	REPLAY_STATE_5A_LOCKED = 0x5A,
> +	REPLAY_STATE_5B_UNLOCKED = 0x5B,
> +	REPLAY_STATE_6 = 0x60,
> +	REPLAY_STATE_6A = 0x61,
> +	REPLAY_STATE_6B = 0x62,
> +	REPLAY_STATE_INVALID = 0xFF
> +};
> +
>  /*
>   * enumeration of PSR STATE below should be aligned to the upstreamed
>   * amdgpu kernel driver 'enum dc_psr_state' in dc_type.h
> @@ -135,7 +166,8 @@ enum amdgpu_debug_visual_confirm {
>  	VISUAL_CONFIRM_HDR	= 2,
>  	VISUAL_CONFIRM_MPCTREE	= 4,
>  	VISUAL_CONFIRM_PSR	= 5,
> -	VISUAL_CONFIRM_SWIZZLE	= 9
> +	VISUAL_CONFIRM_SWIZZLE  = 9,
> +	VISUAL_CONFIRM_REPLAY = 12
>  };
>  
>  uint32_t igt_amd_create_bo(int fd, uint64_t size);
> @@ -189,6 +221,11 @@ void igt_amd_write_ilr_setting(
>  	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
>  	uint8_t link_rate_set);
>  bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_cap(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_sink(int drm_fd, char *connector_name);
> +bool igt_amd_replay_support_drv(int drm_fd, char *connector_name);
> +bool igt_amd_output_has_replay_state(int drm_fd, char *connector_name);
> +int  igt_amd_read_replay_state(int drm_fd, char *connector_name);
>  bool igt_amd_output_has_psr_cap(int drm_fd, char *connector_name);
>  bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mode);
>  bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> new file mode 100755
-------------------^
Please do not set exec bit in file permissions.

Use script checkpatch.pl for checking for other problems,
like misaligned multi-line code above and below.

Read also recent patch to CONTRIBUTING.md:
https://patchwork.freedesktop.org/series/134188/

Regards,
Kamil

> index 000000000..f96d856f8
> --- /dev/null
> +++ b/tests/amdgpu/amd_replay.c
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include "igt_amd.h"
> +
> +/* hardware requirements:
> + * eDP panel that supports Panel Replay
> + */
> +IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
> +
> +#define REPLAY_SETTLE_DELAY 10
> +
> +/* Common test data. */
> +struct test_data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_pipe_t *pipe;
> +	drmModeModeInfo *mode;
> +	enum pipe pipe_id;
> +	int fd;
> +	int debugfs_fd;
> +	int w, h;
> +};
> +
> +struct {
> +	bool visual_confirm;
> +} opt = {
> +	.visual_confirm = false,	/* visual confirm debug option */
> +};
> +
> +const char *help_str =
> +"  --visual-confirm           Panel Replay visual confirm debug option enable\n";
> +
> +struct option long_options[] = {
> +	{"visual-confirm",	required_argument, NULL, 'v'},
> +	{ 0, 0, 0, 0 }
> +};
> +
> +enum test_mode {
> +	TEST_MODE_STATIC_SCREEN = 0,
> +	TEST_MODE_INTERMITTENT_LIVE,
> +	TEST_MODE_CONSTANT_LIVE,
> +	TEST_MODE_COUNT
> +};
> +
> +/* Common test setup. */
> +static void test_init(struct test_data *data)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	/* It doesn't matter which pipe we choose on amdpgu. */
> +	data->pipe_id = PIPE_A;
> +	data->pipe = &data->display.pipes[data->pipe_id];
> +
> +	igt_display_reset(display);
> +
> +	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
> +	igt_require(data->output);
> +	igt_info("output %s\n", data->output->name);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +	kmstest_dump_mode(data->mode);
> +
> +	data->primary =
> +		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +
> +	if (opt.visual_confirm) {
> +		/**
> +		 * if visual confirm option is enabled, we'd trigger a full modeset before test run
> +		 * to have Panel Replay visual confirm enable take effect. DPMS off -> ON transition
> +		 * is one of many approaches.
> +		 */
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +				DRM_MODE_DPMS_OFF);
> +		kmstest_set_connector_dpms(data->fd, data->output->config.connector,
> +				DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +/* Common test cleanup. */
> +static void test_fini(struct test_data *data)
> +{
> +		igt_display_t *display = &data->display;
> +
> +		igt_display_reset(display);
> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +}
> +
> +static int check_conn_type(struct test_data *data, uint32_t type)
> +{
> +	int i;
> +
> +	for (i = 0; i < data->display.n_outputs; i++) {
> +		uint32_t conn_type = data->display.outputs[i].config.connector->connector_type;
> +
> +		if (conn_type == type)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static bool replay_mode_supported(struct test_data *data)
> +{
> +	/* run Panel Replay test if eDP panel support Panel Replay */
> +	if (!igt_amd_output_has_replay_cap(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_CAP);
> +		return false;
> +	}
> +
> +	if (!igt_amd_output_has_replay_state(data->fd, data->output->name)) {
> +		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_REPLAY_STATE);
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_sink(data->fd, data->output->name)) {
> +		igt_warn(" output %s not support Panel Replay mode\n", data->output->name);
> +		return false;
> +	}
> +
> +	if (!igt_amd_replay_support_drv(data->fd, data->output->name)) {
> +		igt_warn(" kernel driver not support Panel Replay mode\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void run_check_replay(struct test_data *data, enum test_mode test_mode)
> +{
> +	int edp_idx, ret, frame_count, replay_state;
> +	igt_fb_t ref_fb, ref_fb2;
> +	igt_fb_t *flip_fb;
> +	igt_output_t *output;
> +
> +	test_init(data);
> +
> +	edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
> +	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
> +
> +	/* check if eDP support Panel Replay. */
> +	igt_skip_on(!replay_mode_supported(data));
> +
> +	for_each_connected_output(&data->display, output) {
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			continue;
> +
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.6,
> +				    0.6, 0.6, &ref_fb);
> +		igt_create_color_fb(data->fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888, 0, 0.0,
> +				    0.4, 0.14, &ref_fb2);
> +
> +		igt_plane_set_fb(data->primary, &ref_fb);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
> +		flip_fb = &ref_fb;
> +		drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		kmstest_wait_for_pageflip(data->fd);
> +
> +		/* Panel Replay state takes some time to settle its value on static screen */
> +		sleep(REPLAY_SETTLE_DELAY);
> +
> +		/* Check Panel Replay state */
> +		replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +		igt_debug("replay_state static mode before flip = 0x%X\n", replay_state);
> +		igt_fail_on_f(replay_state < 0, "Open Panel Replay state debugfs failed\n");
> +		igt_fail_on_f(replay_state < REPLAY_STATE_2,
> +			"Panel Replay was not enabled for connector %s\n", output->name);
> +
> +		/* Do some page flip and let the replay go into live mode */
> +		for (frame_count = 0; frame_count <= 20; frame_count++) {
> +			ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +					flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +			igt_require(ret == 0);
> +			kmstest_wait_for_pageflip(data->fd);
> +
> +			if (test_mode == (TEST_MODE_CONSTANT_LIVE || TEST_MODE_INTERMITTENT_LIVE)
> +						&& frame_count > 5) {
> +				/* Panel Replay state needs few frame to enter the live mode */
> +				replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +				igt_debug("replay_state live mode = 0x%X\n", replay_state);
> +				igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +						"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +			}
> +
> +			if (frame_count % 2 == 0)
> +				flip_fb = &ref_fb2;
> +			else
> +				flip_fb = &ref_fb;
> +		}
> +
> +		/* Check Panel Replay state in static screen */
> +		if (test_mode == TEST_MODE_STATIC_SCREEN || TEST_MODE_INTERMITTENT_LIVE) {
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			igt_debug("replay_state static mode = 0x%X\n", replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +					"State should be REPLAY_STATE_3 (Active)\n");
> +		}
> +
> +		/* Do another page flip if we do the replay_intermittent_live test */
> +		if (test_mode == TEST_MODE_INTERMITTENT_LIVE) {
> +			for (frame_count = 0; frame_count <= 30; frame_count++) {
> +				ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
> +						flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +				igt_require(ret == 0);
> +				kmstest_wait_for_pageflip(data->fd);
> +
> +				if (frame_count > 5) {
> +					/* Needs few frames to let state enter the live mode */
> +					replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +					igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE during flip = 0x%X\n",
> +							replay_state);
> +					igt_fail_on_f(replay_state < REPLAY_STATE_4 && replay_state >= REPLAY_STATE_5,
> +							"State should be REPLAY_STATE_4 (Active with single frame update)\n");
> +				}
> +
> +				if (frame_count % 2 == 0)
> +					flip_fb = &ref_fb2;
> +				else
> +					flip_fb = &ref_fb;
> +			}
> +
> +			/* Panel Replay state takes some time to settle its value on static screen */
> +			sleep(1);
> +
> +			replay_state = igt_amd_read_replay_state(data->fd, output->name);
> +			igt_debug("replay_state TEST_MODE_INTERMITTENT_LIVE after flip = 0x%X\n",
> +					replay_state);
> +			igt_fail_on_f(replay_state < REPLAY_STATE_3 && replay_state >= REPLAY_STATE_4,
> +					"State should be REPLAY_STATE_3 (Active)\n");
> +		}
> +
> +		igt_remove_fb(data->fd, &ref_fb);
> +		igt_remove_fb(data->fd, &ref_fb2);
> +	}
> +
> +	test_fini(data);
> +}
> +
> +static int opt_handler(int option, int option_index, void *data)
> +{
> +	switch (option) {
> +	case 'v':
> +		opt.visual_confirm = strtol(optarg, NULL, 0);
> +		igt_info("Panel Replay Visual Confirm %s\n", opt.visual_confirm ? "enabled" : "disabled");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
> +{
> +	struct test_data data;
> +
> +	igt_skip_on_simulation();
> +	memset(&data, 0, sizeof(data));
> +
> +	igt_fixture
> +	{
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		if (data.fd == -1)
> +			igt_skip("Not an amdgpu driver.\n");
> +
> +		data.debugfs_fd = igt_debugfs_dir(data.fd);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(&data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +
> +		/* check if visual confirm option available */
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_skip_on_f(!igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_REPLAY),
> +				      "set Panel Replay visual confirm failed\n");
> +		}
> +	}
> +
> +	igt_describe("Test whether Panel Replay can be enabled with static screen");
> +	igt_subtest("replay_static_screen") run_check_replay(&data, TEST_MODE_STATIC_SCREEN);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with intermittent live mdoe");
> +	igt_subtest("replay_intermittent_live") run_check_replay(&data, TEST_MODE_INTERMITTENT_LIVE);
> +
> +	igt_describe("Test whether Panel Replay can be enabled with constant live mdoe");
> +	igt_subtest("replay_constant_live") run_check_replay(&data, TEST_MODE_CONSTANT_LIVE);
> +
> +	igt_fixture
> +	{
> +		if (opt.visual_confirm) {
> +			igt_skip_on(!igt_amd_has_visual_confirm(data.fd));
> +			igt_require_f(igt_amd_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE),
> +				      "reset Panel Replay visual confirm failed\n");
> +		}
> +		close(data.debugfs_fd);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 3982a665f..69706fa70 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -30,6 +30,7 @@ if libdrm_amdgpu.found()
>  			  'amd_prime',
>  			  'amd_psr',
>  			  'amd_ras',
> +			  'amd_replay',
>  			  'amd_security',
>  			  'amd_uvd_dec',
>  			  'amd_uvd_enc',
> -- 
> 2.34.1
> 
