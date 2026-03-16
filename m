Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4027CF506E2
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 14:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33B810E23C;
	Mon, 16 Mar 2026 14:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ar8/Efyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867010E23C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773672902; x=1805208902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JfzAZzvp4g5Y1+8ZT70tcX+B7oh80MxKyT83rT7AwGM=;
 b=ar8/EfyylH0dxzSng2/gPRZFNAFtfsxoyaZ7vkZQQ1QY4QUBx+NPJgzX
 5nLKQi1e3cP5d3+0PM91XngGheoWOoJ1oOOZuQM8V2Nx08ITF8d5KRXiD
 W4Y2YkTo9p/IPyxuq9lC2jnu9aBT7F48IwCcl1UFJxIG7PdddLn4+KMkj
 Hd/K2eygJjUdqO9rs1+tEs/xQOg78XG1pJAHY7BruD8LVaHJwTuJ5e5gY
 sococ39sia4EHPfbebqdpRfenRtDyJhKFy0W9E6Sz/3hefy8NUxBX9ICh
 r8e8kfR7YGRg0O08WBMjOsr8qud7eBqmzHroMHlpTqZESzQ+FLb/UkeOM Q==;
X-CSE-ConnectionGUID: iEzRNu7LRSOmlqO/DCTmBg==
X-CSE-MsgGUID: 68RGwUiGQ6S1KQC4StjPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77299563"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77299563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:55:02 -0700
X-CSE-ConnectionGUID: lU11yIPmSim973jGwRP+3A==
X-CSE-MsgGUID: AQzX9Zs9Tv64TCz/aIsR2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226068353"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:55:01 -0700
Date: Mon, 16 Mar 2026 16:54:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/12] Prepare for returning NULL from
 igt_crtc_for_pipe()
Message-ID: <abgZwkJhe3g3q2N5@intel.com>
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

I was hoping to make igt_crtc_for_pipe() just skip if the CRTC
doesn't exist. But maybe there are still too many places that
assume they can ask for any pipe and not skip?

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
