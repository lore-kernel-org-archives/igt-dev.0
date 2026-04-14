Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4D9F9D0C9
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 12:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D060C10E5EB;
	Tue, 14 Apr 2026 12:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lebil3wb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D1110E5E8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 12:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776169999; x=1807705999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s+SAzuUMh4d5QtM46IGlyHPfnR80T0KlwxzW5u7nDDw=;
 b=lebil3wb8sRlYM51IoQUXVspXf333hlmBcfvUI85dZm4EMkJB2spIljt
 5MYB9W0PUBrc8LhqB5oppUeMQYovVsLgSzWDuwj412BhmdelYKNgoMT4e
 LHsa6Ff2LzA4Yk0IgR6SKLDLcRQjrm5HxtgwQT4Jjc7t1SNu/b6EwKQUW
 EeThvTMeh1tzY8HdVEl7KD5Hp39Hdqza2KZ0gtbMMTm19FZmsgH8YJ4x0
 8BR9irdPdDHE4k/WVXy84NVv4Y7mvCYkp2F8dBcNibpxt/84MvCSy+EmY
 90YKfQYJHfytvE86apGXdfU9P7DFYxneb84nTxUhiTJW6bsBePqORDvgJ A==;
X-CSE-ConnectionGUID: vPQxsrSZSj2quASU7XxDWg==
X-CSE-MsgGUID: A7H+haZvScOShUOsOEv/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="99769429"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99769429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:33:14 -0700
X-CSE-ConnectionGUID: PPuYNN8yR5KL8JTvlrP1Fw==
X-CSE-MsgGUID: eO0ORt1URPm8dr9vtO+3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229211290"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:33:12 -0700
Date: Tue, 14 Apr 2026 14:33:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [RFC] lib/kms: rename enum pipe to vendor_pipe, crtc->pipe to
 crtc->vendor_pipe
Message-ID: <20260414123309.5uf3pziohig4ecjn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260410170558.471150-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410170558.471150-1-jani.nikula@intel.com>
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
On 2026-04-10 at 20:05:58 +0300, Jani Nikula wrote:
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
> Rename enum pipe to vendor_pipe, and crtc->pipe member to
> crtc->vendor_pipe to further emphasize that they're not generic but
> rather GPU vendor specific concepts, and should be avoided in generic
> code.
> 
> The vendor pipe usage remains in some generic lib/kms code for legacy
> reasons, but works due to it matching CRTC index by default for
> non-Intel.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> "hardware pipe" is another alternative, but I think "vendor pipe" leaves

I like hardware more.

+cc few other KMS devs

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil

> the door open for a more generic interpretation and application for
> non-Intel devices.
> ---
>  lib/igt_kms.c                          | 22 +++++++++---------
>  lib/igt_kms.h                          | 20 ++++++++++------
>  tests/intel/kms_busy.c                 | 16 ++++++-------
>  tests/intel/kms_dp_link_training.c     |  2 +-
>  tests/intel/kms_dsc_helper.c           |  2 +-
>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>  tests/intel/kms_joiner.c               | 32 +++++++++++++-------------
>  tests/intel/kms_joiner_helper.c        |  6 ++---
>  tests/intel/kms_pipe_b_c_ivb.c         |  4 ++--
>  tests/intel/kms_pipe_stress.c          | 22 +++++++++---------
>  tests/intel/kms_pm_dc.c                |  8 +++----
>  tests/intel/kms_pm_lpsp.c              |  2 +-
>  tests/intel/kms_psr2_sf.c              |  4 ++--
>  tests/intel/perf_pmu.c                 |  2 +-
>  tests/kms_cursor_crc.c                 |  2 +-
>  tests/kms_cursor_edge_walk.c           |  2 +-
>  tests/kms_panel_fitting.c              |  2 +-
>  tests/kms_plane_scaling.c              |  2 +-
>  18 files changed, 79 insertions(+), 73 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2dbf9ec38458..f0364d5c723a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1050,7 +1050,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>   *
>   * Returns: A string representing @pipe, e.g. "A".
>   */
> -const char *kmstest_pipe_name(enum pipe pipe)
> +const char *kmstest_pipe_name(enum vendor_pipe pipe)
>  {
>  	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H\0I\0J\0K\0L\0M\0N\0O\0P";
>  
> @@ -3111,7 +3111,7 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
>  {
>  	const igt_crtc_t *a = _a, *b = _b;
>  
> -	return a->pipe - b->pipe;
> +	return a->vendor_pipe - b->vendor_pipe;
>  }
>  
>  /**
> @@ -3182,7 +3182,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  		crtc->crtc_id = resources->crtcs[crtc_index];
>  		crtc->crtc_index = crtc_index;
> -		crtc->pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
> +		crtc->vendor_pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
>  	}
>  
>  	/* For Intel, sort the CRTCs in pipe order */
> @@ -3602,7 +3602,7 @@ static int output_crtc_pipe_compare(const void *_a, const void *_b)
>  
>  	/* pipe order for valid output/crtc combos */
>  	if (a->crtc && b->crtc)
> -		return a->crtc->pipe - b->crtc->pipe;
> +		return a->crtc->vendor_pipe - b->crtc->vendor_pipe;
>  
>  	/* valid combos before empty elements */
>  	return !b->crtc - !a->crtc;
> @@ -5295,7 +5295,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc)
>  	if (crtc == NULL)
>  		return "None";
>  
> -	return kmstest_pipe_name(crtc->pipe);
> +	return kmstest_pipe_name(crtc->vendor_pipe);
>  }
>  
>  /**
> @@ -7009,7 +7009,7 @@ bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>   *
>   * Returns: True if joiner is enabled, false otherwise.
>   */
> -bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum vendor_pipe pipe)
>  {
>  	char buf[16384], master_str[64], slave_str[64];
>  	int dir, res;
> @@ -7229,7 +7229,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	struct {
> -		enum pipe idx;
> +		enum vendor_pipe idx;
>  		drmModeModeInfo *mode;
>  		igt_output_t *output;
>  		bool force_joiner;
> @@ -7248,7 +7248,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  		if (!output->pending_crtc)
>  			continue;
>  
> -		pipes[pipes_in_use].idx = output->pending_crtc->pipe;
> +		pipes[pipes_in_use].idx = output->pending_crtc->vendor_pipe;
>  		pipes[pipes_in_use].mode = igt_output_get_mode(output);
>  		pipes[pipes_in_use].output = output;
>  		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
> @@ -8088,12 +8088,12 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
>  	return NULL;
>  }
>  
> -igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
> +igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum vendor_pipe pipe)
>  {
>  	igt_crtc_t *crtc;
>  
>  	for_each_crtc(display, crtc) {
> -		if (crtc->pipe == pipe)
> +		if (crtc->vendor_pipe == pipe)
>  			return crtc;
>  	}
>  
> @@ -8155,7 +8155,7 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>  	igt_crtc_t *next;
>  
>  	for_each_crtc(display, next) {
> -		if (!crtc || next->pipe > crtc->pipe)
> +		if (!crtc || next->vendor_pipe > crtc->vendor_pipe)
>  			return next;
>  	}
>  
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 9a3fa980d89d..f2720490ae7f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -49,7 +49,13 @@
>  #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>  
>  /**
> - * pipe:
> + * vendor_pipe:
> + *
> + * GPU vendor-specific hardware pipe, which may be different from the CRTC
> + * index. Only code and tests that specifically need to know the pipe should use
> + * this, and conditional to the device in question. Defaults to matching the
> + * CRTC index, but do not rely on it.
> + *
>   * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a pipe.
>   * @PIPE_A: First crtc.
>   * @PIPE_B: Second crtc.
> @@ -69,7 +75,7 @@
>   * @PIPE_P: Sixteenth crtc.
>   * @IGT_MAX_PIPES: Max number of pipes allowed.
>   */
> -enum pipe {
> +enum vendor_pipe {
>          PIPE_NONE = -1,
>          PIPE_A = 0,
>          PIPE_B,
> @@ -89,7 +95,7 @@ enum pipe {
>          PIPE_P,
>          IGT_MAX_PIPES
>  };
[cut]
