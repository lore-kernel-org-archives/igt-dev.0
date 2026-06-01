Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD7ECD6E56
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 09:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1250113088;
	Mon,  1 Jun 2026 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8d6cLox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0307411307F
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780306284; x=1811842284;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pFdQtbWkKUmsYIAv5rW9WFlrvb3KOvhWpnUkKkobr+c=;
 b=Y8d6cLox0zVOcAyMoPZBll78jRnT/O4e6Qbk5d32iDKiDZkzG4Mv2nnN
 4f1+KzQCSgPkqW0MgSVvhuplQtYpWOEwcF4s2d5653x5oN9phGE/joUPb
 BqbmwcK7RSL5nK7OzunZ6eUQAa8ewAzWkDzOXUY5BhTA6EaX3ScE+8aTm
 BX8t3LnF6nFkvDtBcHDtb5x3GN5lrVpGD1p7srydeUIaHbPJBQTRQp0y8
 sjfBjwHJkvTu7sUTMM+zvZG6YMlX9SZfGkcGrw2vwhi6i/eybosolhUY4
 4eu3zyVNraEppJHgEbzCBk4PCAPFdub7oBBYvB/UVHQiflq6iyzaLCsTj Q==;
X-CSE-ConnectionGUID: dx1m3oXxSZGR/G1/PH72hw==
X-CSE-MsgGUID: yKZNMJ8lS2modZGBfTPT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81120339"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="81120339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 02:31:23 -0700
X-CSE-ConnectionGUID: 7gt/iNgtQ6WmgKd87h3BMA==
X-CSE-MsgGUID: W9fdmBTdTbmNiEVkpw/vfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="239115921"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:31:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, Juha-Pekka
 Heikkila <juhapekka.heikkila@gmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Karthik B S <karthik.b.s@intel.com>, Swati
 Sharma <swati2.sharma@intel.com>
Subject: Re: [RFC] lib/kms: rename enum pipe to vendor_pipe, crtc->pipe to
 crtc->vendor_pipe
In-Reply-To: <20260414123309.5uf3pziohig4ecjn@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410170558.471150-1-jani.nikula@intel.com>
 <20260414123309.5uf3pziohig4ecjn@kamilkon-DESK.igk.intel.com>
Date: Mon, 01 Jun 2026 12:31:18 +0300
Message-ID: <30b988304d7d2dcfb5812a67a62275478406cdfd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 14 Apr 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2026-04-10 at 20:05:58 +0300, Jani Nikula wrote:
>> Historically, CRTCs and CRTC indexes have been called "pipes" in IGT,
>> due to IGT's Intel origins. This has been increasingly confusing, and
>> downright wrong with the idea of not having 1:1 mapping between pipes
>> and CRTC indexes. While CRTC indexes are always consecutive in the order
>> the CRTCs were created in the kernel, you could be missing pipes in
>> between, or create them in different order.
>> 
>> This conflation has been largely fixed in IGT recently (which is
>> evidenced by the relatively small footprint of this change). But the
>> idea of "pipe" is still there.
>> 
>> Rename enum pipe to vendor_pipe, and crtc->pipe member to
>> crtc->vendor_pipe to further emphasize that they're not generic but
>> rather GPU vendor specific concepts, and should be avoided in generic
>> code.
>> 
>> The vendor pipe usage remains in some generic lib/kms code for legacy
>> reasons, but works due to it matching CRTC index by default for
>> non-Intel.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> "hardware pipe" is another alternative, but I think "vendor pipe" leaves
>
> I like hardware more.

We stalled here a bit.

I'm not dead set on the naming, other than I think we should rename to
emphasize "pipe" is not generic and should be avoided.

BR,
Jani.


>
> +cc few other KMS devs
>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
> Regards,
> Kamil
>
>> the door open for a more generic interpretation and application for
>> non-Intel devices.
>> ---
>>  lib/igt_kms.c                          | 22 +++++++++---------
>>  lib/igt_kms.h                          | 20 ++++++++++------
>>  tests/intel/kms_busy.c                 | 16 ++++++-------
>>  tests/intel/kms_dp_link_training.c     |  2 +-
>>  tests/intel/kms_dsc_helper.c           |  2 +-
>>  tests/intel/kms_frontbuffer_tracking.c |  2 +-
>>  tests/intel/kms_joiner.c               | 32 +++++++++++++-------------
>>  tests/intel/kms_joiner_helper.c        |  6 ++---
>>  tests/intel/kms_pipe_b_c_ivb.c         |  4 ++--
>>  tests/intel/kms_pipe_stress.c          | 22 +++++++++---------
>>  tests/intel/kms_pm_dc.c                |  8 +++----
>>  tests/intel/kms_pm_lpsp.c              |  2 +-
>>  tests/intel/kms_psr2_sf.c              |  4 ++--
>>  tests/intel/perf_pmu.c                 |  2 +-
>>  tests/kms_cursor_crc.c                 |  2 +-
>>  tests/kms_cursor_edge_walk.c           |  2 +-
>>  tests/kms_panel_fitting.c              |  2 +-
>>  tests/kms_plane_scaling.c              |  2 +-
>>  18 files changed, 79 insertions(+), 73 deletions(-)
>> 
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 2dbf9ec38458..f0364d5c723a 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -1050,7 +1050,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
>>   *
>>   * Returns: A string representing @pipe, e.g. "A".
>>   */
>> -const char *kmstest_pipe_name(enum pipe pipe)
>> +const char *kmstest_pipe_name(enum vendor_pipe pipe)
>>  {
>>  	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H\0I\0J\0K\0L\0M\0N\0O\0P";
>>  
>> @@ -3111,7 +3111,7 @@ static int crtc_pipe_compare(const void *_a, const void *_b)
>>  {
>>  	const igt_crtc_t *a = _a, *b = _b;
>>  
>> -	return a->pipe - b->pipe;
>> +	return a->vendor_pipe - b->vendor_pipe;
>>  }
>>  
>>  /**
>> @@ -3182,7 +3182,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>>  
>>  		crtc->crtc_id = resources->crtcs[crtc_index];
>>  		crtc->crtc_index = crtc_index;
>> -		crtc->pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
>> +		crtc->vendor_pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
>>  	}
>>  
>>  	/* For Intel, sort the CRTCs in pipe order */
>> @@ -3602,7 +3602,7 @@ static int output_crtc_pipe_compare(const void *_a, const void *_b)
>>  
>>  	/* pipe order for valid output/crtc combos */
>>  	if (a->crtc && b->crtc)
>> -		return a->crtc->pipe - b->crtc->pipe;
>> +		return a->crtc->vendor_pipe - b->crtc->vendor_pipe;
>>  
>>  	/* valid combos before empty elements */
>>  	return !b->crtc - !a->crtc;
>> @@ -5295,7 +5295,7 @@ const char *igt_crtc_name(igt_crtc_t *crtc)
>>  	if (crtc == NULL)
>>  		return "None";
>>  
>> -	return kmstest_pipe_name(crtc->pipe);
>> +	return kmstest_pipe_name(crtc->vendor_pipe);
>>  }
>>  
>>  /**
>> @@ -7009,7 +7009,7 @@ bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>>   *
>>   * Returns: True if joiner is enabled, false otherwise.
>>   */
>> -bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
>> +bool igt_is_joiner_enabled_for_pipe(int drmfd, enum vendor_pipe pipe)
>>  {
>>  	char buf[16384], master_str[64], slave_str[64];
>>  	int dir, res;
>> @@ -7229,7 +7229,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>  	igt_crtc_t *crtc;
>>  	igt_output_t *output;
>>  	struct {
>> -		enum pipe idx;
>> +		enum vendor_pipe idx;
>>  		drmModeModeInfo *mode;
>>  		igt_output_t *output;
>>  		bool force_joiner;
>> @@ -7248,7 +7248,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>  		if (!output->pending_crtc)
>>  			continue;
>>  
>> -		pipes[pipes_in_use].idx = output->pending_crtc->pipe;
>> +		pipes[pipes_in_use].idx = output->pending_crtc->vendor_pipe;
>>  		pipes[pipes_in_use].mode = igt_output_get_mode(output);
>>  		pipes[pipes_in_use].output = output;
>>  		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
>> @@ -8088,12 +8088,12 @@ igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
>>  	return NULL;
>>  }
>>  
>> -igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
>> +igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum vendor_pipe pipe)
>>  {
>>  	igt_crtc_t *crtc;
>>  
>>  	for_each_crtc(display, crtc) {
>> -		if (crtc->pipe == pipe)
>> +		if (crtc->vendor_pipe == pipe)
>>  			return crtc;
>>  	}
>>  
>> @@ -8155,7 +8155,7 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
>>  	igt_crtc_t *next;
>>  
>>  	for_each_crtc(display, next) {
>> -		if (!crtc || next->pipe > crtc->pipe)
>> +		if (!crtc || next->vendor_pipe > crtc->vendor_pipe)
>>  			return next;
>>  	}
>>  
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 9a3fa980d89d..f2720490ae7f 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -49,7 +49,13 @@
>>  #define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
>>  
>>  /**
>> - * pipe:
>> + * vendor_pipe:
>> + *
>> + * GPU vendor-specific hardware pipe, which may be different from the CRTC
>> + * index. Only code and tests that specifically need to know the pipe should use
>> + * this, and conditional to the device in question. Defaults to matching the
>> + * CRTC index, but do not rely on it.
>> + *
>>   * @PIPE_NONE: Invalid pipe, used for disconnecting a output from a pipe.
>>   * @PIPE_A: First crtc.
>>   * @PIPE_B: Second crtc.
>> @@ -69,7 +75,7 @@
>>   * @PIPE_P: Sixteenth crtc.
>>   * @IGT_MAX_PIPES: Max number of pipes allowed.
>>   */
>> -enum pipe {
>> +enum vendor_pipe {
>>          PIPE_NONE = -1,
>>          PIPE_A = 0,
>>          PIPE_B,
>> @@ -89,7 +95,7 @@ enum pipe {
>>          PIPE_P,
>>          IGT_MAX_PIPES
>>  };
> [cut]

-- 
Jani Nikula, Intel
