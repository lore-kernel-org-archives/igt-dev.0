Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8821F109024E
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 16:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CC210E890;
	Thu, 19 Mar 2026 16:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mdJoAjcx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FB110E890
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773936444; x=1805472444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dm5IHecbIWK5moFhdZUzNR2vKiAXY6KIrZ5MvjGZgnM=;
 b=mdJoAjcxzEtGz2Ha8qd2+j2o4kXFwfMdudj06E82bh87ddPHS10727KB
 yHRgoITa0CWMMhLhWOvPI3Y9reAj1Eu198/I66Ydg2l7P02+znxQ/mPT/
 6nd0Zu65I5z/xksHMPxE2YyK60NoKRA58jSiwpCJLrPBQdPaZwdZXBv3b
 AOLNHh9vjCFoH0nnJJZ2ycw+kSpvs9IoCE+i1PbrxF5odK1t0d2twsZeM
 Ragr8tq3QEDj0Rn046YKcX3mSRWiXrNYJk9QUjLbUr4EVIb8Uz7PDbdJT
 l44v+O9IIxOnW0GBkgetWlWtCyXAAma6RkH4dWPoy2iapOcOhj8yxVFAE w==;
X-CSE-ConnectionGUID: b13SArpKTnOIG61ignIvkg==
X-CSE-MsgGUID: Nsh7DVNMRl6fnUjwq7xIUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="77618302"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="77618302"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 09:07:24 -0700
X-CSE-ConnectionGUID: aZ5HoUaFRNuU44YuiZdgBQ==
X-CSE-MsgGUID: G4CSTQl4QbaY4yzeJTJpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="223031325"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.169])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 09:07:22 -0700
Date: Thu, 19 Mar 2026 18:07:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/12] Prepare for returning NULL from
 igt_crtc_for_pipe()
Message-ID: <abwfJ0WSLnHqJHfH@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
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

On Mon, Mar 16, 2026 at 01:19:02PM +0200, Jani Nikula wrote:
> We want to return NULL for invalid pipes from igt_crtc_for_pipe(), so
> that we don't need to have igt_crtc_t objects with crtc->valid == false
> around.
> 
> The primary way to prepare for this is to avoid using
> igt_crtc_for_pipe() altogether. We've done a *lot* of that already, and
> continue to do so here.
> 
> For the remaining ones, start off by ensuring crtc->valid == true, one
> way or other. This ensures the test logic is sane and actually operates
> on valid CRTCs. Once this prep is done, we can actually return NULL from
> igt_crtc_for_pipe(), and check for crtc != NULL instead of crtc->valid
> == true.

Looks OK to me. Eventually I think I'd like igt_crtc_for_pipe() to
skip on its own to reduce the work each tests has to do, but it
seems too early for that at this time.

Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> BR,
> Jani.
> 
> 
> Jani Nikula (12):
>   tests/amdgpu/amd_mode_switch: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/amdgpu/amd_multidisplay_modeset: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/intel/kms_cdclk: use igt_next_crtc()
>   tests/intel/kms_joiner: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/intel/kms_joiner_helper: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/intel/kms_pipe_b_c_ivb: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/intel/kms_pipe_stress: Prepare for returning NULL from
>     igt_crtc_for_pipe()
>   tests/kms_bw: fix misleading indent
>   tests/kms_bw: clarify what's going on with proper variable naming
>   tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
>   tests/kms_explicit_fence: store igt_crtc_t* instead of pipe in data
>   lib/kms: convert igt_crtc_for_pipe() into a proper function
> 
>  lib/igt_kms.c                           |  8 +++
>  lib/igt_kms.h                           |  8 +--
>  tests/amdgpu/amd_mode_switch.c          |  2 +
>  tests/amdgpu/amd_multidisplay_modeset.c |  2 +
>  tests/intel/kms_cdclk.c                 | 10 ++--
>  tests/intel/kms_joiner.c                | 66 ++++++++++++++++++-------
>  tests/intel/kms_joiner_helper.c         | 16 +++---
>  tests/intel/kms_pipe_b_c_ivb.c          | 28 +++++++----
>  tests/intel/kms_pipe_stress.c           |  4 ++
>  tests/kms_bw.c                          | 48 +++++++++---------
>  tests/kms_explicit_fence.c              | 14 +++---
>  11 files changed, 131 insertions(+), 75 deletions(-)
> 
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
