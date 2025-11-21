Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D19BCFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76FB10E037;
	Fri, 21 Nov 2025 19:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sfhv7kcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF2510E037
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763751998; x=1795287998;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vc6dQUkLkNDtnkYNjZi7NcUYQgom9Eej/2JR9uiWVno=;
 b=Sfhv7kcP3mOMnLpIuspoWfHs/fY086PTqhndrBYEZf/lAm13YO6vOfnK
 zRP4TuWYOgVWy9Mtsg25MZkSDE0IpK83QwQ+WWtSDXYGYtrJWFYmNH+U5
 Hh7heRNDyRDPQTYk57th7Rq+o1z6lr44U6P1H/InqJfyRdoP8LnZKEG7a
 hORNz574/8ITnEIxHXtnrh1HnPaX6OGtp6XeNqs2l+bgcxlKnJQ7NzrQQ
 wz+eX4bSOPowKprkoG2WO2nq2vHqh+oe9o/95HfXrHO2ocZdB9/pbZTnd
 sgukTCl8ze8IbKyLWMgy6H71R9WIMaJq9IfOrzbxU8jTQ4aJTeMAIIJFQ Q==;
X-CSE-ConnectionGUID: 4rUvIPkZSt2KuIJ1zlP9fw==
X-CSE-MsgGUID: LjX/mwAYRSajagQt2hKY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65934951"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65934951"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:38 -0800
X-CSE-ConnectionGUID: dcFvsdMATbGj3q++r2Diig==
X-CSE-MsgGUID: /EP3RtBsSdOAIC3PByvY8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215126823"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:37 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/8] kms: Small cleanups and refactoring
Date: Fri, 21 Nov 2025 21:06:25 +0200
Message-ID: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Some fairly trivial cleanups and some refactoring.

Ville Syrjälä (8):
  igt: Name drmModeCrtc variables 'drm_crtc'
  lib/kms: Nuke PIPE_ANY
  lib/kms: Nuke unused kmstest_{crtc,plane}
  igt/kms: Nuke unused igt_pipe_*prop*() marcos and functions
  lib/kms: Turn the igt_plane*prop*() marcos into functions
  lib/kms: Turn the igt_output*prop*() marcos into functions
  lib/kms: Turn the igt_pipe_obj*prop*() marcos into functions
  test/kms_color: Don't dig around in display->pipes[] so much

 lib/igt_kms.c                     |  10 +-
 lib/igt_kms.h                     | 238 ++++++++++--------------------
 tests/intel/kms_fb_coherency.c    |   2 +-
 tests/intel/kms_flip_scaled_crc.c |   8 +-
 tests/intel/kms_flip_tiling.c     |   2 +-
 tests/intel/perf_pmu.c            |   2 +-
 tests/intel/prime_mmap_kms.c      |   2 +-
 tests/kms_atomic.c                |  25 ++--
 tests/kms_color.c                 |  41 +++--
 tests/kms_cursor_legacy.c         |   4 +-
 tests/kms_flip_event_leak.c       |   2 +-
 tests/kms_lease.c                 |  14 +-
 tests/kms_plane.c                 |  16 +-
 tests/kms_plane_multiple.c        |   2 +-
 tests/kms_rmfb.c                  |  14 +-
 tests/vmwgfx/vmw_prime.c          |   2 +-
 tools/msm_dp_compliance.c         |  12 +-
 17 files changed, 156 insertions(+), 240 deletions(-)

-- 
2.49.1

