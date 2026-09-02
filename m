Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7440CC624D3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 17:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEF710F2F6;
	Wed,  2 Sep 2026 17:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1eLHm+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384E10F2F6
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788370408; x=1819906408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W0g8Qmv7xCRjFYzOy8/DBfx8Xq+GQJfa2NUAY+QrOTk=;
 b=G1eLHm+RTH+EfatWB0mJti6um+CfNIFJbjMmT8eTA2sdRJoK5AayyX/o
 hv+6rOk9yUUuvh12BweZaa7PZYHeMJ4XoeUyraPOuGuQ8yaA5dS/D5SbU
 NS1WgaHuILDCCFYxVOz09IhDGClUKgQUUcCK1x0q3XSsVjit+Gkf2teIU
 +58eKYrygOLoOJnyxk0ZBgZvqrSSw9S4qVu3Je48BKf8/GtqjY1mR2cw4
 KL7r9ygmxtg6oKNSZgIoaZPN18IlhNlubg8nHRvJBvWM7JazqHY4ZbDaY
 EQUkYFPSgztJmp1k7feERU/8dgGyyUk7juKiOoxpwBw4Z0aQK89q2c6fD g==;
X-CSE-ConnectionGUID: hAKMV3ktS8eLByon27bO5g==
X-CSE-MsgGUID: sOn2aGOLRyifplmaWkQ+qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106359336"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106359336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:33:28 -0700
X-CSE-ConnectionGUID: GcrMiB5BSYeL0TsprhErFw==
X-CSE-MsgGUID: 0cfvzcl/TwW4kQm6T4214A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266872973"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 10:33:26 -0700
Date: Wed, 2 Sep 2026 19:33:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [PATCH i-g-t 3/4] lib/kms: rename enum pipe to hardware_pipe,
 crtc->pipe to crtc->hardware_pipe
Message-ID: <20260902173324.tc2jgn456le2cfgr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <cover.1788252273.git.jani.nikula@intel.com>
 <1e7eaabafa8103312bc10565ac9d77d7dcaffa98.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e7eaabafa8103312bc10565ac9d77d7dcaffa98.1788252273.git.jani.nikula@intel.com>
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
On 2026-09-01 at 11:46:39 +0300, Jani Nikula wrote:
> Historically, CRTCs and CRTC indexes have been called "pipes" in IGT,
> due to IGT's Intel origins. This has been increasingly confusing, and
> downright wrong with the idea of not having 1:1 mapping between pipes
> and CRTC indexes. While CRTC indexes are always consecutive in the order
> the CRTCs were created in the kernel, you could be missing pipes in
> between, or create them in different order.
> 
> This conflation has been largely fixed in IGT recently (which is
> evidenced by the relatively small footprint of this change). But the
> idea of "pipe" is still there.
> 
> Rename enum pipe to hardware_pipe, and crtc->pipe member to
> crtc->hardware_pipe to further emphasize that they're not generic but
> rather GPU hardware vendor specific concepts, and should be avoided in
> generic code.
> 
> The hardware pipe usage remains in some generic lib/kms code for legacy
> reasons, but works due to it matching CRTC index by default for
> non-Intel.
> 
> v2: s/vendor_pipe/hardware_pipe/g
> 
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/igt_kms.c                          | 28 +++++++++++-----------
>  lib/igt_kms.h                          | 20 ++++++++++------
>  tests/intel/kms_busy.c                 | 16 ++++++-------
>  tests/intel/kms_dp_link_training.c     |  2 +-
>  tests/intel/kms_dsc.c                  |  2 +-
>  tests/intel/kms_dsc_helper.c           |  4 ++--
>  tests/intel/kms_dsc_helper.h           |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  tests/intel/kms_joiner.c               | 32 +++++++++++++-------------
>  tests/intel/kms_joiner_helper.c        |  8 +++----
>  tests/intel/kms_mst.c                  |  2 +-
>  tests/intel/kms_pipe_b_c_ivb.c         |  4 ++--
>  tests/intel/kms_pipe_stress.c          | 24 +++++++++----------
>  tests/intel/kms_pm_dc.c                |  8 +++----
>  tests/intel/kms_pm_lpsp.c              |  2 +-
>  tests/intel/kms_psr2_sf.c              |  4 ++--
>  tests/intel/perf_pmu.c                 |  2 +-
>  tests/kms_cursor_crc.c                 |  2 +-
>  tests/kms_cursor_edge_walk.c           |  2 +-
>  tests/kms_display_modes.c              |  2 +-
>  tests/kms_panel_fitting.c              |  2 +-
>  tests/kms_plane_scaling.c              |  2 +-
>  22 files changed, 89 insertions(+), 83 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2d78e3bee31d..f32f655d5fae 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1059,7 +1059,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>   *
>   * Returns: A string representing @pipe, e.g. "A".
>   */
> -const char *kmstest_pipe_name(enum pipe pipe)
> +const char *kmstest_pipe_name(enum hardware_pipe pipe)
>  {
>  	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H\0I\0J\0K\0L\0M\0N\0O\0P";
>  
> @@ -3115,7 +3115,7 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
>  {
>  	const igt_crtc_t *a = _a, *b = _b;
>  
> -	return a->pipe - b->pipe;
> +	return a->hardware_pipe - b->hardware_pipe;
>  }
>  
>  /**
> @@ -3190,7 +3190,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  		crtc->crtc_id = resources->crtcs[crtc_index];
>  		crtc->crtc_index = crtc_index;
> -		crtc->pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
> +		crtc->hardware_pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
>  	}
>  
>  	/* For Intel, sort the CRTCs in pipe order */
> @@ -3619,7 +3619,7 @@ static int output_crtc_pipe_compare(const void *_a, const void *_b)
>  
>  	/* pipe order for valid output/crtc combos */
>  	if (a->crtc && b->crtc)
> -		return a->crtc->pipe - b->crtc->pipe;
> +		return a->crtc->hardware_pipe - b->crtc->hardware_pipe;
>  
>  	/* valid combos before empty elements */
>  	return !b->crtc - !a->crtc;
> @@ -5312,7 +5312,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc)
>  	if (crtc == NULL)
>  		return "None";
>  
> -	return kmstest_pipe_name(crtc->pipe);
> +	return kmstest_pipe_name(crtc->hardware_pipe);
>  }
>  
>  /**
> @@ -7212,7 +7212,7 @@ bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connecto
>   *
>   * Returns: True if joiner is enabled, false otherwise.
>   */
> -bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe)
>  {
>  	char buf[16384], master_str[64], slave_str[64];
>  	int dir, res;
> @@ -7431,9 +7431,9 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  	uint8_t i, pipes_in_use = 0;
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
> -	enum pipe last_pipe = PIPE_NONE;
> +	enum hardware_pipe last_pipe = PIPE_NONE;
>  	struct {
> -		enum pipe idx;
> +		enum hardware_pipe idx;
>  		drmModeModeInfo *mode;
>  		igt_output_t *output;
>  		bool force_joiner;
> @@ -7442,8 +7442,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  
>  	/* Get last pipe */
>  	for_each_crtc(display, crtc) {
> -		if (crtc->pipe > last_pipe)
> -			last_pipe = crtc->pipe;
> +		if (crtc->hardware_pipe > last_pipe)
> +			last_pipe = crtc->hardware_pipe;
>  	}
>  
>  	/*
> @@ -7454,7 +7454,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  		if (!output->pending_crtc)
>  			continue;
>  
> -		pipes[pipes_in_use].idx = output->pending_crtc->pipe;
> +		pipes[pipes_in_use].idx = output->pending_crtc->hardware_pipe;
>  		pipes[pipes_in_use].mode = igt_output_get_mode(output);
>  		pipes[pipes_in_use].output = output;
>  		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
> @@ -7924,12 +7924,12 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
>  	return NULL;
>  }
>  
> -igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
> +igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum hardware_pipe pipe)
>  {
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc(display, crtc) {
> -		if (crtc->pipe == pipe)
> +		if (crtc->hardware_pipe == pipe)
>  			return crtc;
>  	}
>  
> @@ -7991,7 +7991,7 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>  	igt_crtc_t *next;
>  
>  	for_each_crtc(display, next) {
> -		if (!crtc || next->pipe > crtc->pipe)
> +		if (!crtc || next->hardware_pipe > crtc->hardware_pipe)
>  			return next;
>  	}
>  
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 695f666bacb9..b7653b8ad49a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -51,7 +51,13 @@
>  #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>  
>  /**
> - * pipe:
> + * hardware_pipe:
> + *
> + * GPU vendor-specific hardware pipe, which may be different from the CRTC
> + * index. Only code and tests that specifically need to know the pipe should use
> + * this, and conditional to the device in question. Defaults to matching the
> + * CRTC index, but do not rely on it.
> + *
>   * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a pipe.
>   * @PIPE_A: First crtc.
>   * @PIPE_B: Second crtc.
> @@ -71,7 +77,7 @@
>   * @PIPE_P: Sixteenth crtc.
>   * @IGT_MAX_PIPES: Max number of pipes allowed.
>   */
> -enum pipe {
> +enum hardware_pipe {
>          PIPE_NONE = -1,
>          PIPE_A = 0,
>          PIPE_B,
> @@ -91,7 +97,7 @@ enum pipe {
>          PIPE_P,
>          IGT_MAX_PIPES
>  };
> -const char *kmstest_pipe_name(enum pipe pipe);
> +const char *kmstest_pipe_name(enum hardware_pipe pipe);
>  const char *kmstest_plane_type_name(int plane_type);
>  
>  enum port {
> @@ -478,8 +484,8 @@ typedef struct _igt_plane {
>   */
>  struct _igt_crtc {
>  	igt_display_t *display;
> -	/* ID of a hardware pipe */
> -	enum pipe pipe;
> +	/* ID of a hardware pipe. This may be vendor specific. Use crtc_index instead. */
> +	enum hardware_pipe hardware_pipe;
>  
>  	int n_planes;
>  	int num_primary_planes;
> @@ -581,7 +587,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc);
>  
>  igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
>  igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index);
> -igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe);
> +igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum hardware_pipe pipe);
>  igt_crtc_t *igt_first_crtc(igt_display_t *display);
>  igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
>  igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
> @@ -1352,7 +1358,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode);
>  bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>  					   int max_dotclock, drmModeModeInfo *mode);
> -bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe);
>  bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
>  bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>  			  int max_dotclock, drmModeModeInfo *mode);
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 039cc6ae8dab..60e12e72859e 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -432,7 +432,7 @@ const char *help_str =
>  int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  {
>  	igt_display_t display = { .drm_fd = -1, .n_crtcs = IGT_MAX_PIPES };
> -	enum pipe active_pipes[IGT_MAX_PIPES];
> +	enum hardware_pipe active_pipes[IGT_MAX_PIPES];
>  	igt_output_t *output;
>  	uint32_t last_pipe = 0;
>  	igt_crtc_t *crtc;
> @@ -465,7 +465,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  		/* Get active pipes. */
>  		for_each_crtc(&display, crtc)
> -			active_pipes[last_pipe++] = crtc->pipe;
> +			active_pipes[last_pipe++] = crtc->hardware_pipe;
>  		last_pipe--;
>  	}
>  
> @@ -497,8 +497,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  			if (!crtc_output_combo_valid(&display, output, crtc))
>  				continue;
>  
> -			if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -					  crtc->pipe != active_pipes[last_pipe])
> +			if (!all_pipes && crtc->hardware_pipe != active_pipes[0] &&
> +					  crtc->hardware_pipe != active_pipes[last_pipe])
>  				continue;
>  
>  			igt_dynamic_f("flip-pipe-%s", igt_crtc_name(crtc))
> @@ -522,8 +522,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  			if (!crtc_output_combo_valid(&display, output, crtc))
>  				continue;
>  
> -			if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -					  crtc->pipe != active_pipes[last_pipe])
> +			if (!all_pipes && crtc->hardware_pipe != active_pipes[0] &&
> +					  crtc->hardware_pipe != active_pipes[last_pipe])
>  				continue;
>  
>  			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc))
> @@ -557,8 +557,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  				if (!crtc_output_combo_valid(&display, output, crtc))
>  					continue;
>  
> -				if (!all_pipes && crtc->pipe != active_pipes[0] &&
> -						  crtc->pipe != active_pipes[last_pipe])
> +				if (!all_pipes && crtc->hardware_pipe != active_pipes[0] &&
> +						  crtc->hardware_pipe != active_pipes[last_pipe])
>  					continue;
>  
>  				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
> index e165ee81d7ed..f67fdf59dd70 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -155,7 +155,7 @@ static void do_modeset(data_t *data, bool mst)
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc(&data->display, crtc) {
> -		valid_pipes_mask |= BIT(crtc->pipe);
> +		valid_pipes_mask |= BIT(crtc->hardware_pipe);
>  		n_pipes++;
>  	}
>  
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 1e30f6feef22..a9e4d976b91f 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -369,7 +369,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>  			/* Check joiner constraints for this pipe */
>  			if (joined_pipes != JOINED_PIPES_DEFAULT &&
>  			    !check_dsc_joiner_constraints(data->drm_fd, data->output,
> -							  display, crtc->pipe,
> +							  display, crtc->hardware_pipe,
>  							  n_pipes, joined_pipes))
>  				continue;
>  
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 9f581758f9a3..2e57c2df2e6a 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -91,7 +91,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t *output,
>  	drmModeConnector *connector = output->config.connector;
>  
>  	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
> -	    (crtc->pipe == PIPE_A) && IS_GEN11(devid)) {
> +	    (crtc->hardware_pipe == PIPE_A) && IS_GEN11(devid)) {
>  		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n",
>  			 igt_crtc_name(crtc), output->name);
>  		return false;
> @@ -215,7 +215,7 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>  bool check_dsc_joiner_constraints(int drm_fd,
>  				  igt_output_t *output,
>  				  igt_display_t *display,
> -				  enum pipe pipe,
> +				  enum hardware_pipe pipe,
>  				  int num_pipes,
>  				  enum joined_pipes type)
>  {
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index 542fe46dec77..0209cb1ee774 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -41,7 +41,7 @@ void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>  void restore_force_dsc_fractional_bpp_en(void);
>  bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
>  bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output,
> -				  igt_display_t *display, enum pipe pipe,
> +				  igt_display_t *display, enum hardware_pipe pipe,
>  				  int num_pipes,
>  				  enum joined_pipes type);
>  
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 4dd2f4e70f36..63131e135d30 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -1234,7 +1234,7 @@ static bool find_connector(bool edp_only, bool pipe_a,
>  		if (edp_only && c->connector_type != DRM_MODE_CONNECTOR_eDP)
>  			continue;
>  
> -		if (pipe_a && crtc->pipe != PIPE_A)
> +		if (pipe_a && crtc->hardware_pipe != PIPE_A)
>  			continue;
>  
>  		if (output == forbidden_output || crtc == forbidden_crtc) {
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index dfcb24004775..fce24f2bd087 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -98,7 +98,7 @@ typedef struct {
>  	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>  	igt_output_t *mixed_output[IGT_MAX_PIPES];
>  	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
> -	enum pipe pipe_seq[IGT_MAX_PIPES];
> +	enum hardware_pipe pipe_seq[IGT_MAX_PIPES];
>  	igt_display_t display;
>  	bool ultra_joiner_supported;
>  } data_t;
> @@ -131,7 +131,7 @@ static void enable_force_joiner_on_all_non_ultra_joiner_outputs(data_t *data)
>  	}
>  }
>  
> -static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
> +static enum hardware_pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
>  {
>  	if ((data->master_pipes & available_pipe_mask) == 0)
>  		return PIPE_NONE;
> @@ -139,17 +139,17 @@ static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask
>  	return ffs(data->master_pipes & available_pipe_mask) - 1;
>  }
>  
> -static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t available_pipe_mask)
> +static enum hardware_pipe setup_pipe(data_t *data, igt_output_t *output, enum hardware_pipe pipe, uint32_t available_pipe_mask)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_crtc_t *crtc;
> -	enum pipe master_pipe;
> +	enum hardware_pipe master_pipe;
>  	uint32_t attempt_mask;
>  
>  	crtc = igt_crtc_for_pipe(display, pipe);
>  	igt_assert_f(crtc, "There is no pipe %s\n", kmstest_pipe_name(pipe));
>  
> -	attempt_mask = BIT(crtc->pipe);
> +	attempt_mask = BIT(crtc->hardware_pipe);
>  	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>  
>  	if (master_pipe == PIPE_NONE)
> @@ -157,7 +157,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>  
>  	igt_info("Using pipe %s as master and %s slave for %s\n",
>  		 igt_crtc_name(crtc),
> -		 kmstest_pipe_name(crtc->pipe + 1), output->name);
> +		 kmstest_pipe_name(crtc->hardware_pipe + 1), output->name);
>  	igt_output_set_crtc(output, crtc);
>  
>  	return master_pipe;
> @@ -167,7 +167,7 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
>  {
>  	igt_display_t *display = &data->display;
>  	igt_crtc_t *crtc;
> -	enum pipe pipe = PIPE_A;
> +	enum hardware_pipe pipe = PIPE_A;
>  	igt_plane_t *primary;
>  	igt_fb_t fb;
>  
> @@ -223,7 +223,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>  	drmModeModeInfo uj_mode;
>  	int status;
>  	bool ultrajoiner_found;
> -	enum pipe pipe;
> +	enum hardware_pipe pipe;
>  	bool force_joiner_supported;
>  
>  	drmModeConnector *connector = output->config.connector;
> @@ -278,7 +278,7 @@ static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *o
>  static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>  {
>  	int i;
> -	enum pipe pipe, master_pipe;
> +	enum hardware_pipe pipe, master_pipe;
>  	uint32_t available_pipe_mask = BIT(data->n_pipes) - 1;
>  	igt_output_t *output;
>  	igt_plane_t *primary;
> @@ -313,7 +313,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>  {
>  	int i, cleanup;
>  	uint32_t available_pipe_mask;
> -	enum pipe pipe, master_pipe;
> +	enum hardware_pipe pipe, master_pipe;
>  	igt_output_t **outputs;
>  	igt_output_t *output;
>  	igt_plane_t *primary[output_count];
> @@ -359,7 +359,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>  	int i, j, ret;
>  	uint32_t available_pipe_mask;
>  	uint32_t attempt_mask;
> -	enum pipe master_pipe;
> +	enum hardware_pipe master_pipe;
>  	igt_output_t **outputs;
>  	igt_output_t *output;
>  	igt_plane_t *primary[INVALID_TEST_OUTPUT];
> @@ -381,7 +381,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>  
>  		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>  			igt_crtc_t *crtc;
> -			enum pipe pipe = data->pipe_seq[i + j];
> +			enum hardware_pipe pipe = data->pipe_seq[i + j];
>  			/*
>  			 * In the mixed case only the first output (j == 0) is a
>  			 * big joiner output; the second is a non-big-joiner output.
> @@ -441,7 +441,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>  
>  	for (i = 0; i < len; i++) {
>  		igt_crtc_t *crtc;
> -		enum pipe pipe = data->pipe_seq[data->n_pipes - 1];
> +		enum hardware_pipe pipe = data->pipe_seq[data->n_pipes - 1];
>  
>  		igt_display_reset(&data->display);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -508,7 +508,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>  
>  		for (j = 0; j < data->n_pipes; j++) {
>  			igt_crtc_t *crtc;
> -			enum pipe pipe;
> +			enum hardware_pipe pipe;
>  
>  			/* Ultra joiner is only valid on PIPE_A */
>  			if (invalid_pipe && j == PIPE_A)
> @@ -579,7 +579,7 @@ static void test_basic_max_non_joiner(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
>  	int count;
> -	enum pipe pipe;
> +	enum hardware_pipe pipe;
>  	igt_output_t **outputs, *output;
>  	igt_fb_t fb;
>  	igt_plane_t *primary;
> @@ -698,7 +698,7 @@ int igt_main()
>  		data.n_pipes = 0;
>  		for_each_crtc(&data.display, crtc) {
>  			data.n_pipes++;
> -			data.pipe_seq[j] = crtc->pipe;
> +			data.pipe_seq[j] = crtc->hardware_pipe;
>  			j++;
>  		}
>  	}
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 5bacf6cb9e27..36168030475c 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -75,7 +75,7 @@ static int find_consecutive_pipes(int n_pipes,
>  	return -1;
>  }
>  
> -static enum pipe get_next_master_pipe(uint32_t pipe_mask)
> +static enum hardware_pipe get_next_master_pipe(uint32_t pipe_mask)
>  {
>  	int i;
>  
> @@ -106,8 +106,8 @@ void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *mas
>  	*master_pipes = 0;
>  
>  	for_each_crtc(display, crtc) {
> -		if (igt_crtc_for_pipe(display, crtc->pipe + 1)) {
> -			*master_pipes |= BIT(crtc->pipe);
> +		if (igt_crtc_for_pipe(display, crtc->hardware_pipe + 1)) {
> +			*master_pipes |= BIT(crtc->hardware_pipe);
>  			igt_info("Found master pipe %s\n", igt_crtc_name(crtc));
>  		}
>  	}
> @@ -138,7 +138,7 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>  {
>  	int i = 0, idx  = 0, needed = 0, start = 0;
>  	uint32_t available_pipes_mask = 0;
> -	enum pipe mp = PIPE_NONE;
> +	enum hardware_pipe mp = PIPE_NONE;
>  	igt_output_t *out;
>  
>  	for (idx = 0; idx < num_outputs; idx++) {
> diff --git a/tests/intel/kms_mst.c b/tests/intel/kms_mst.c
> index e5b7f162aba0..8b04cd3cfffc 100644
> --- a/tests/intel/kms_mst.c
> +++ b/tests/intel/kms_mst.c
> @@ -280,7 +280,7 @@ static void mst_suspend_read_crc(igt_display_t *display)
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc(display, crtc)
> -		valid_pipes_mask |= BIT(crtc->pipe);
> +		valid_pipes_mask |= BIT(crtc->hardware_pipe);
>  
>  	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
>  
> diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
> index a39b46ca23e0..8bf075106689 100644
> --- a/tests/intel/kms_pipe_b_c_ivb.c
> +++ b/tests/intel/kms_pipe_b_c_ivb.c
> @@ -160,10 +160,10 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
>  	*output2 = NULL;
>  
>  	for_each_crtc_with_valid_output(&data->display, crtc, output) {
> -		if (crtc->pipe == PIPE_B && !*output1 && output != *output2)
> +		if (crtc->hardware_pipe == PIPE_B && !*output1 && output != *output2)
>  			*output1 = output;
>  
> -		if (crtc->pipe == PIPE_C && output != *output1 && !*output2)
> +		if (crtc->hardware_pipe == PIPE_C && output != *output1 && !*output2)
>  			*output2 = output;
>  
>  		igt_output_set_crtc(output, NULL);
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 5362fe9f3581..cc222dbc1d12 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -386,8 +386,8 @@ static void cleanup_plane_fbs(struct data *data, igt_crtc_t *crtc, int start,
>  
>  	while (i < end) {
>  		igt_remove_fb(data->display.drm_fd,
> -			      &data->fb[crtc->pipe * MAX_PLANES + i]);
> -		data->fb[crtc->pipe * MAX_PLANES + i].fb_id = 0;
> +			      &data->fb[crtc->hardware_pipe * MAX_PLANES + i]);
> +		data->fb[crtc->hardware_pipe * MAX_PLANES + i].fb_id = 0;
>  		i++;
>  	}
>  }
> @@ -407,14 +407,14 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  	if (!mode)
>  		mode = igt_output_get_mode(output);
>  
> -	if (data->last_mode[crtc->pipe] != mode) {
> +	if (data->last_mode[crtc->hardware_pipe] != mode) {
>  		ret = commit_mode(data, output,
>  				  crtc, mode);
>  
>  		if (ret)
>  			return ret;
>  
> -		data->last_mode[crtc->pipe] = mode;
> +		data->last_mode[crtc->hardware_pipe] = mode;
>  		new_mode = true;
>  	}
>  
> @@ -422,7 +422,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  	 * Looks like we can't have planes on that pipe at all
>  	 * or mode hasn't changed
>  	 */
> -	if (!data->num_planes[crtc->pipe] || !new_mode)
> +	if (!data->num_planes[crtc->hardware_pipe] || !new_mode)
>  		return 0;
>  
>  	/* Set up overlay/primary planes up to the configured limit. */
> @@ -443,7 +443,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  		 * in the reduction loop below.
>  		 */
>  		universal_plane_set_fb(plane,
> -				       &data->fb[crtc->pipe * MAX_PLANES + i],
> +				       &data->fb[crtc->hardware_pipe * MAX_PLANES + i],
>  				       plane_width, plane_height);
>  
>  		ret = try_plane_scaling(data, plane, plane_width, plane_height);
> @@ -456,7 +456,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  			plane_height /= 2;
>  
>  			/* Keep source crop in sync with the reduced destination. */
> -			igt_fb_set_size(&data->fb[crtc->pipe * MAX_PLANES + i],
> +			igt_fb_set_size(&data->fb[crtc->hardware_pipe * MAX_PLANES + i],
>  					plane, plane_width, plane_height);
>  
>  			ret = try_plane_scaling(data, plane, plane_width, plane_height);
> @@ -466,10 +466,10 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  		}
>  		if (ret) {
>  			igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
> -				 crtc->pipe);
> -			data->num_planes[crtc->pipe] = i;
> +				 crtc->hardware_pipe);
> +			data->num_planes[crtc->hardware_pipe] = i;
>  			igt_info("Max num planes for pipe %d set to %d\n",
> -				 crtc->pipe, i);
> +				 crtc->hardware_pipe, i);
>  			/*
>  			 * We have now determined max amount of full sized planes, we will just
>  			 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
> @@ -479,7 +479,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  			cleanup_plane_fbs(data, crtc, i, MAX_PLANES);
>  		}
>  
> -		if (++i >= data->num_planes[crtc->pipe])
> +		if (++i >= data->num_planes[crtc->hardware_pipe])
>  			break;
>  	}
>  
> @@ -493,7 +493,7 @@ static int crtc_stress(struct data *data, igt_output_t *output,
>  	for_each_plane_on_crtc(crtc, plane) {
>  		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>  			cursor_plane_set_fb(plane,
> -					    &data->cursor_fb[crtc->pipe],
> +					    &data->cursor_fb[crtc->hardware_pipe],
>  					    cursor_width, cursor_height);
>  			if (igt_display_try_commit_atomic(&data->display,
>  							  DRM_MODE_ATOMIC_TEST_ONLY |
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 981232decb6d..318a5439e6b4 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -163,7 +163,7 @@ static void set_output_on_pipe_b(data_t *data)
>  		drmModeConnectorPtr c = output->config.connector;
>  
>  		/* DC5 with PIPE_B transaction */
> -		if (crtc->pipe != PIPE_B)
> +		if (crtc->hardware_pipe != PIPE_B)
>  			continue;
>  
>  		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
> @@ -191,11 +191,11 @@ static void setup_output(data_t *data)
>  
>  		if (disp_ver >= 13) {
>  			if (disp_ver == 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
> -				is_low_power = (crtc->pipe == PIPE_A);
> +				is_low_power = (crtc->hardware_pipe == PIPE_A);
>  			else
> -				is_low_power = (crtc->pipe == PIPE_A || crtc->pipe == PIPE_B);
> +				is_low_power = (crtc->hardware_pipe == PIPE_A || crtc->hardware_pipe == PIPE_B);
>  		} else {
> -			is_low_power = (crtc->pipe == PIPE_A);
> +			is_low_power = (crtc->hardware_pipe == PIPE_A);
>  		}
>  
>  		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the DC5 transaction.\n");
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 6d4e64da01fe..dcaf0b631557 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -234,7 +234,7 @@ int igt_main()
>  					continue;
>  
>  				/* LPSP is low power single pipe usages i.e. PIPE_A */
> -				if (crtc->pipe != PIPE_A)
> +				if (crtc->hardware_pipe != PIPE_A)
>  					continue;
>  
>  				if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index eec916c25305..fa7090ce82ad 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -1046,11 +1046,11 @@ static void cleanup(data_t *data)
>  
>  static bool sel_fetch_pipe_combo_valid(data_t *data)
>  {
> -	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->pipe != PIPE_A)
> +	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->hardware_pipe != PIPE_A)
>  		return false;
>  
>  	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
> -	    data->crtc->pipe != PIPE_A && data->crtc->pipe != PIPE_B)
> +	    data->crtc->hardware_pipe != PIPE_A && data->crtc->hardware_pipe != PIPE_B)
>  		return false;
>  
>  	return true;
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 1e389958fc35..8249faaad823 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1173,7 +1173,7 @@ event_wait(int gem_fd, const intel_ctx_t *ctx,
>  		uint64_t val[2];
>  
>  		batch[6] = MI_WAIT_FOR_EVENT;
> -		switch (crtc->pipe) {
> +		switch (crtc->hardware_pipe) {
>  		case PIPE_A:
>  			batch[6] |= MI_WAIT_FOR_PIPE_A_VBLANK;
>  			batch[5] = ~(1 << 3);
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 5a6cc7717425..6334f8f775c8 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -240,7 +240,7 @@ static bool chv_cursor_broken(data_t *data, int x)
>  	if (x >= 0)
>  		return false;
>  
> -	return IS_CHERRYVIEW(devid) && data->crtc->pipe == PIPE_C;
> +	return IS_CHERRYVIEW(devid) && data->crtc->hardware_pipe == PIPE_C;
>  }
>  
>  static bool cursor_visible(data_t *data, int x, int y)
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 8036d43d5eef..7b6bee67e684 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -123,7 +123,7 @@ static void cursor_move(data_t *data, int x, int y, int i)
>  	 * fails). So let's accept a failure from the ioctl in that case.
>  	 */
>  	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) == 0 ||
> -		   (IS_CHERRYVIEW(data->devid) && data->crtc->pipe == PIPE_C &&
> +		   (IS_CHERRYVIEW(data->devid) && data->crtc->hardware_pipe == PIPE_C &&
>  		    x < 0 && x > -data->curw));
>  	igt_wait_for_vblank(data->crtc);
>  }
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index c1876aa0514f..3030f29cfd45 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -193,7 +193,7 @@ static void run_extendedmode_test(data_t *data) {
>  			if (output1 == output2)
>  				continue;
>  
> -			if (crtc1->pipe > crtc2->pipe &&
> +			if (crtc1->hardware_pipe > crtc2->hardware_pipe &&
>  			    igt_check_output_is_dp_mst(output1) ==
>  			    igt_check_output_is_dp_mst(output2))
>  				continue;
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index bc78d9a6f41d..478e8b5d7bf2 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -170,7 +170,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display, igt_crtc_t *crtc,
>  		 */
>  		if (IS_GEN8(devid) ||
>  			(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
> -			(IS_GEN9(devid) && crtc->pipe == PIPE_C)) {
> +			(IS_GEN9(devid) && crtc->hardware_pipe == PIPE_C)) {
>  			is_plane_scaling_active = false;
>  		}
>  	}
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 90dc5593579f..091b8114e6fd 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -695,7 +695,7 @@ static bool test_crtc_iteration(data_t *data, igt_crtc_t *crtc, int iteration)
>  	    data->extended)
>  		return true;
>  
> -	if ((crtc->pipe > PIPE_B) && (iteration >= 2))
> +	if ((crtc->hardware_pipe > PIPE_B) && (iteration >= 2))
>  		return false;
>  
>  	return true;
> -- 
> 2.47.3
> 
