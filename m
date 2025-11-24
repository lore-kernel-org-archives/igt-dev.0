Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24428CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 09:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C998F10E1F8;
	Mon, 24 Nov 2025 09:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0ofsEBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339910E1F8
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 09:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763976879; x=1795512879;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=jSR2wSsHXBQg9UTnTDegfmDP5ALD+3PLJ8uR4ZtZfi8=;
 b=k0ofsEBvf1xxE+uDPQ7RsiNp8szMbDcuaOM3z1ROQ/Embd/SAyZwAD04
 d2Tk8nAs5/zUSwS5/jxQz3rqQYU01XtHt1QEuvPcjGQwp6FAqk5lfIxy4
 cqCnYKWDAeHzUMKAAONaJJ+MU7vs5X97yIE1Nnxi1taLms0Qdbv/t4o4J
 6Vxs/sQ7+LYv3HNeZS9qz8ayr7sr+SKjCNi+TwEcDWH2LvzwFTCs8rXOy
 GgprnmR5P/RBk/sLyNpIBS+5lkCHEgn201CNfwtcrv7pA+8GDLNmC51TB
 ayLG37ar1SYqGvmwRacZnRRBtHtIKm8SAnsiksSTsBoEJ6wZi74FTcj4a w==;
X-CSE-ConnectionGUID: YlwHCrmhSdS9Z8hUalnWUg==
X-CSE-MsgGUID: duDqE0jQTsiXXUwT0ECyfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65154227"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="65154227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 01:34:38 -0800
X-CSE-ConnectionGUID: 0zAxnO99Rqu46wfsgNiVSA==
X-CSE-MsgGUID: IUj56dszSceBNLSo2qLUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192307436"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 01:34:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] kms: Small cleanups and refactoring
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
Date: Mon, 24 Nov 2025 11:34:33 +0200
Message-ID: <e46f4335ed23eeb1946cdb0d2e467500b18fbc91@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 21 Nov 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Some fairly trivial cleanups and some refactoring.

Did not do detailed review, but, FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

on the series.


>
> Ville Syrj=C3=A4l=C3=A4 (8):
>   igt: Name drmModeCrtc variables 'drm_crtc'
>   lib/kms: Nuke PIPE_ANY
>   lib/kms: Nuke unused kmstest_{crtc,plane}
>   igt/kms: Nuke unused igt_pipe_*prop*() marcos and functions
>   lib/kms: Turn the igt_plane*prop*() marcos into functions
>   lib/kms: Turn the igt_output*prop*() marcos into functions
>   lib/kms: Turn the igt_pipe_obj*prop*() marcos into functions
>   test/kms_color: Don't dig around in display->pipes[] so much
>
>  lib/igt_kms.c                     |  10 +-
>  lib/igt_kms.h                     | 238 ++++++++++--------------------
>  tests/intel/kms_fb_coherency.c    |   2 +-
>  tests/intel/kms_flip_scaled_crc.c |   8 +-
>  tests/intel/kms_flip_tiling.c     |   2 +-
>  tests/intel/perf_pmu.c            |   2 +-
>  tests/intel/prime_mmap_kms.c      |   2 +-
>  tests/kms_atomic.c                |  25 ++--
>  tests/kms_color.c                 |  41 +++--
>  tests/kms_cursor_legacy.c         |   4 +-
>  tests/kms_flip_event_leak.c       |   2 +-
>  tests/kms_lease.c                 |  14 +-
>  tests/kms_plane.c                 |  16 +-
>  tests/kms_plane_multiple.c        |   2 +-
>  tests/kms_rmfb.c                  |  14 +-
>  tests/vmwgfx/vmw_prime.c          |   2 +-
>  tools/msm_dp_compliance.c         |  12 +-
>  17 files changed, 156 insertions(+), 240 deletions(-)

--=20
Jani Nikula, Intel
