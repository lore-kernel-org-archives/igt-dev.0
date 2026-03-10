Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02DFCC9DB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 08:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812A910E227;
	Tue, 10 Mar 2026 08:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFkFY7qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571F810E692
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773132559; x=1804668559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r0DjldgnT2JmYVbjJ1ieoy2yxDQ94vcGOlGtwGSmwGU=;
 b=PFkFY7qMD5zfppA+s+jj3N3JYpUOPOgJqwXSoUtgloioY5FM0rwlGy2i
 cn3bvmPVDOSm/gt7P8wX7rBS/Q6Sr5ME0lfWAoPrxnyef3WMScUKVsYof
 SfZK1FIAVR5Dugb7y2hliruwKo3N1JcurJXk1ZMwSfgxPMuaWsqLc8v4d
 Ksy6FyVvTvLAdtw9zTcT2ihRhnz9TmmN/y9sf+cP1moaVNT5JXsQDfbf7
 PBBJ0EQKGbAH108jtmxEg9/eeaEtm+KypzgCX799M5URG2/9VocLvV7u5
 IiLZEMpPmv3vpCUmiut5Bw5kqOSpmR1VrYMZwfsU8xW/6Ef/rn4ZEmF5F g==;
X-CSE-ConnectionGUID: ZenwoZkfT5Wwp8TuYt+iHA==
X-CSE-MsgGUID: Aoue/eRAQviYa9yAWqt9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78049389"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="78049389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:49:17 -0700
X-CSE-ConnectionGUID: K1RZY7lCS8G/KzFJ7GGYmQ==
X-CSE-MsgGUID: p04K0jJoSMqu7WR9v2llMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219292351"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.33])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:49:14 -0700
Date: Tue, 10 Mar 2026 10:49:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/i915/fbc: switch the interface from pipe to CRTC
Message-ID: <aa_bB3ZLVSQ-vanb@intel.com>
References: <20260309164225.716195-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309164225.716195-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Mar 09, 2026 at 06:42:25PM +0200, Jani Nikula wrote:
> All of the FBC functionality assumes CRTC index, even though the
> functions have enum pipe as parameter. Switch to CRTC to reflect what
> the functions expect in reality.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  lib/i915/intel_fbc.c                   | 33 ++++++++++++--------------
>  lib/i915/intel_fbc.h                   |  6 ++---
>  tests/intel/kms_dirtyfb.c              |  8 +++----
>  tests/intel/kms_fbc_dirty_rect.c       |  7 +++---
>  tests/intel/kms_frontbuffer_tracking.c | 13 ++++------
>  tests/intel/kms_psr.c                  |  7 +++---
>  tests/intel/kms_psr2_sf.c              |  7 +++---
>  7 files changed, 35 insertions(+), 46 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 84c66929dabc..9ea5e3cf68fd 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -14,21 +14,20 @@
>  #define FBC_STATUS_BUF_LEN 128
>  
>  /**
> - * intel_fbc_supported_on_chipset:
> - * @device: fd of the device
> - * @pipe: Display pipe
> + * intel_fbc_supported:
> + * @crtc: CRTC
>   *
> - * Check if FBC is supported by chipset on given pipe.
> + * Check if FBC is supported by chipset on given CRTC.
>   *
>   * Returns:
>   * true if FBC is supported and false otherwise.
>   */
> -bool intel_fbc_supported_on_chipset(int device, enum pipe pipe)
> +bool intel_fbc_supported(igt_crtc_t *crtc)
>  {
>  	char buf[FBC_STATUS_BUF_LEN];
>  	int dir;
>  
> -	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
> +	dir = igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, O_DIRECTORY);
>  	igt_require_fd(dir);
>  	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
>  	close(dir);
> @@ -39,13 +38,13 @@ bool intel_fbc_supported_on_chipset(int device, enum pipe pipe)
>  		!strstr(buf, "stolen memory not initialised\n");
>  }
>  
> -static bool _intel_fbc_is_enabled(int device, enum pipe pipe, int log_level, char *last_fbc_buf)
> +static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fbc_buf)
>  {
>  	char buf[FBC_STATUS_BUF_LEN];
>  	bool print = true;
>  	int dir;
>  
> -	dir = igt_debugfs_crtc_dir(device, pipe, O_DIRECTORY);
> +	dir = igt_debugfs_crtc_dir(crtc->display->drm_fd, crtc->crtc_index, O_DIRECTORY);

We should probably add a igt_crtc_t* wrapper for that.

>  	igt_require_fd(dir);
>  	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
>  	close(dir);
> @@ -64,37 +63,35 @@ static bool _intel_fbc_is_enabled(int device, enum pipe pipe, int log_level, cha
>  
>  /**
>   * intel_fbc_is_enabled:
> - * @device: fd of the device
> - * @pipe: Display pipe
> + * @crtc: CRTC
>   * @log_level: Wanted loglevel
>   *
> - * Check if FBC is enabled on given pipe. Loglevel can be used to
> - * control at which loglevel current state is printed out.
> + * Check if FBC is enabled on given CRTC. Loglevel can be used to control
> + * at which loglevel current state is printed out.
>   *
>   * Returns:
>   * true if FBC is enabled.
>   */
> -bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
> +bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level)
>  {
>  	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
>  
> -	return _intel_fbc_is_enabled(device, pipe, log_level, last_fbc_buf);
> +	return _intel_fbc_is_enabled(crtc, log_level, last_fbc_buf);
>  }
>  
>  /**
>   * intel_fbc_wait_until_enabled:
> - * @device: fd of the device
> - * @pipe: Display pipe
> + * @crtc: CRTC
>   *
>   * Wait until fbc is enabled. Used timeout is constant 2 seconds.
>   *
>   * Returns:
>   * true if FBC got enabled.
>   */
> -bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
> +bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc)
>  {
>  	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
> -	bool enabled = igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
> +	bool enabled = igt_wait(_intel_fbc_is_enabled(crtc, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
>  
>  	if (!enabled)
>  		igt_info("FBC is not enabled: \n%s\n", last_fbc_buf);
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index fe9edcbc31cf..6d188995de3c 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -13,9 +13,9 @@
>  
>  enum psr_mode;
>  
> -bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
> -bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
> -bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
> +bool intel_fbc_supported(igt_crtc_t *crtc);
> +bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
> +bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
>  void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
>  bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
>  bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);

As a followup the rest of this stuff should perhaps be converted to
take igt_display_t* instead of the current mishmash of
fd/disp_ver/whatever...

Anyways, this patch is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 0ee0fe43c463..d5e7e61a4a1b 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -100,7 +100,7 @@ static bool check_support(data_t *data)
>  	case FEATURE_NONE:
>  		return true;
>  	case FEATURE_FBC:
> -		if (!intel_fbc_supported_on_chipset(data->drm_fd, data->crtc->pipe)) {
> +		if (!intel_fbc_supported(data->crtc)) {
>  			igt_info("FBC is not supported on this chipset\n");
>  			return false;
>  		}
> @@ -168,8 +168,7 @@ static void check_feature_enabled(data_t *data)
>  	case FEATURE_NONE:
>  		break;
>  	case FEATURE_FBC:
> -		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> -							  data->crtc->pipe),
> +		igt_assert_f(intel_fbc_wait_until_enabled(data->crtc),
>  			     "FBC still disabled\n");
>  		break;
>  	case FEATURE_PSR:
> @@ -194,8 +193,7 @@ static void check_feature(data_t *data)
>  	case FEATURE_NONE:
>  		break;
>  	case FEATURE_FBC:
> -		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> -							  data->crtc->pipe),
> +		igt_assert_f(intel_fbc_wait_until_enabled(data->crtc),
>  			     "FBC disabled\n");
>  		/* TODO: Add compression check here */
>  		break;
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
> index ce2da42dde8f..9a0146460b18 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -122,9 +122,8 @@ set_fb_and_collect_crc(data_t *data, igt_plane_t *plane, struct igt_fb *fb,
>  	igt_pipe_crc_start(data->pipe_crc);
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
>  	igt_pipe_crc_stop(data->pipe_crc);
> -	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->crtc->pipe,
> -					  IGT_LOG_INFO),
> -					  "FBC is not enabled\n");
> +	igt_assert_f(intel_fbc_is_enabled(data->crtc, IGT_LOG_INFO),
> +		     "FBC is not enabled\n");
>  }
>  
>  static void
> @@ -412,7 +411,7 @@ static bool prepare_test(data_t *data)
>  	data->pipe_crc = igt_crtc_crc_new(data->crtc,
>  					  IGT_PIPE_CRC_SOURCE_AUTO);
>  
> -	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->crtc->pipe),
> +	igt_require_f(intel_fbc_supported(data->crtc),
>  		      "FBC not supported by the chipset on pipe\n");
>  
>  	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 08e08c594c0d..12f51047d286 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -2152,7 +2152,7 @@ static void teardown_crcs(void)
>  
>  static void setup_fbc(void)
>  {
> -	if (!intel_fbc_supported_on_chipset(drm.fd, prim_mode_params.crtc->pipe)) {
> +	if (!intel_fbc_supported(prim_mode_params.crtc)) {
>  		igt_info("Can't test FBC: not supported on this chipset\n");
>  		return;
>  	}
> @@ -2360,18 +2360,15 @@ static void do_status_assertions(int flags)
>  		igt_require(!fbc_stride_not_supported());
>  		igt_require(!fbc_mode_too_large());
>  		igt_require(!fbc_psr_not_possible());
> -		if (!intel_fbc_wait_until_enabled(drm.fd, prim_mode_params.crtc->pipe)) {
> -			igt_assert_f(intel_fbc_is_enabled(drm.fd,
> -						    prim_mode_params.crtc->pipe,
> -						    IGT_LOG_WARN),
> +		if (!intel_fbc_wait_until_enabled(prim_mode_params.crtc)) {
> +			igt_assert_f(intel_fbc_is_enabled(prim_mode_params.crtc, IGT_LOG_WARN),
>  				     "FBC disabled\n");
>  		}
>  
>  		if (opt.fbc_check_compression)
>  			igt_assert(fbc_wait_for_compression());
>  	} else if (flags & ASSERT_FBC_DISABLED) {
> -		igt_assert(!intel_fbc_wait_until_enabled(drm.fd,
> -						   prim_mode_params.crtc->pipe));
> +		igt_assert(!intel_fbc_wait_until_enabled(prim_mode_params.crtc));
>  	}
>  
>  	if (flags & ASSERT_PSR_ENABLED) {
> @@ -4225,7 +4222,7 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>  					continue;
>  				}
>  
> -				if (!intel_fbc_supported_on_chipset(drm.fd, crtc->pipe)) {
> +				if (!intel_fbc_supported(crtc)) {
>  					igt_info("Can't test FBC: not supported on pipe-%s\n", igt_crtc_name(crtc));
>  					continue;
>  				}
> diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
> index ff9c23cec032..862b9f2ffe87 100644
> --- a/tests/intel/kms_psr.c
> +++ b/tests/intel/kms_psr.c
> @@ -749,9 +749,8 @@ static void test_setup(data_t *data)
>  		setup_test_plane(data, data->test_plane_id);
>  		if (psr_wait_entry_if_enabled(data)) {
>  			if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
> -				igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> -									  crtc->pipe),
> -									  "FBC still disabled\n");
> +				igt_assert_f(intel_fbc_wait_until_enabled(crtc),
> +					     "FBC still disabled\n");
>  			psr_entered = true;
>  			break;
>  		}
> @@ -802,7 +801,7 @@ int igt_main()
>  		disp_ver = intel_display_ver(data.devid);
>  
>  		for_each_crtc(&data.display, crtc) {
> -			if (intel_fbc_supported_on_chipset(data.drm_fd, crtc->pipe))
> +			if (intel_fbc_supported(crtc))
>  				fbc_chipset_support = true;
>  		}
>  	}
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index 5bcbc8df4741..7a8b7826b3a7 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -957,9 +957,8 @@ static void run(data_t *data)
>  	igt_assert(psr_wait_entry(data->debugfs_fd, data->psr_mode, data->output));
>  
>  	if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
> -		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
> -							  data->crtc->pipe),
> -							  "FBC still disabled\n");
> +		igt_assert_f(intel_fbc_wait_until_enabled(data->crtc),
> +			     "FBC still disabled\n");
>  
>  	if (is_et_check_needed(data))
>  		igt_assert_f(early_transport_check(data->debugfs_fd),
> @@ -1197,7 +1196,7 @@ int igt_main()
>  						data.output) {
>  			data.crtc = crtc;
>  
> -			if (intel_fbc_supported_on_chipset(data.drm_fd, data.crtc->pipe))
> +			if (intel_fbc_supported(data.crtc))
>  				fbc_chipset_support = true;
>  
>  			for (i = 0; i < ARRAY_SIZE(psr_status); i++) {
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
