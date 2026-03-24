Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55525F532FD
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035E510E637;
	Tue, 24 Mar 2026 09:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SURW1TgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3AE10E637
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774343354; x=1805879354;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9sjqb/PbsEC5jx0cWS11y+2QDDoeTojIrMDX7vipsMI=;
 b=SURW1TgYiCD9KCqCnYAUeCvH3JLybPvpSyUutV819vBSaMw9LqVcCH4S
 Kc5HIi5duujXHqcIyIt4yVus89MF0FI/ceJ5IoacOOPAqzwm+kHvPCe2e
 wvm3kN5mJo/bfP73GU9sk1ffs9hZjyaWYbJGTuMrUTtSH3hvfsrlGiv6S
 K/eJD/tc8SXC3RRWw9QLLI0yUTybVNMAEqHf0qpm3C4uce+KWPD2TeIW0
 2uPzUBQQ8+JN6uJPXLk9XrHDG/l09slr/XY4c0zF/28Hiq/oTY2x7WOcw
 IHGgQxeNG2kigOuIq+1obunKCSb/5Rub/UVEjcmmD0b47TDwFdv8Lf3/T g==;
X-CSE-ConnectionGUID: ojy8GkrFRVSn1K/R97K2ow==
X-CSE-MsgGUID: py3alIs3SE6FfI3Gm9vUOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79261845"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79261845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:09:14 -0700
X-CSE-ConnectionGUID: IRiATvu+SjWtCEFGgwDckA==
X-CSE-MsgGUID: tZDt3xFzSzWKkSCs3rQ90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="221399991"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:09:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex
 Hung <alex.hung@amd.com>
Subject: Re: [PATCH i-g-t 0/7] tests: lots of s/crtc->pipe/crtc->crtc_index/
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1774005763.git.jani.nikula@intel.com>
Date: Tue, 24 Mar 2026 11:09:10 +0200
Message-ID: <c066ab16457a8e089bf9bed8d5624877e256282d@intel.com>
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

On Fri, 20 Mar 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Do a bunch of s/crtc->pipe/crtc->crtc_index/ where the crtc->pipe isn't
> actually needed or relevant, e.g. basically all of amdgpu tests.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Hung <alex.hung@amd.com>

Ping, this should be trivial and quick to review, and I'd like to get
this moving.

BR,
Jani.


>
> Jani Nikula (7):
>   tests/amdgpu/amd_plane: s/crtc->pipe/crtc->crtc_index/
>   tests/amdgpu/amd_dp_dsc: s/crtc->pipe/crtc->crtc_index/
>   tests/amdgpu/amd_subvp: s/crtc->pipe/crtc->crtc_index/
>   tests/amdgpu/amd_hotplug: s/crtc->pipe/crtc->crtc_index/
>   tests/amdgpu/amd_multidisplay_modeset: s/crtc->pipe/crtc->crtc_index/
>   tests/amdgpu/amd_vrr_range: s/crtc->pipe/crtc->crtc_index/
>   tests/kms_atomic_transition: s/crtc->pipe/crtc->crtc_index/
>
>  tests/amdgpu/amd_dp_dsc.c               | 142 ++++++++++++------------
>  tests/amdgpu/amd_hotplug.c              |  52 +++++----
>  tests/amdgpu/amd_multidisplay_modeset.c |  30 ++---
>  tests/amdgpu/amd_plane.c                |  27 ++---
>  tests/amdgpu/amd_subvp.c                |  16 +--
>  tests/amdgpu/amd_vrr_range.c            |   4 +-
>  tests/kms_atomic_transition.c           |  18 +--
>  7 files changed, 144 insertions(+), 145 deletions(-)

-- 
Jani Nikula, Intel
