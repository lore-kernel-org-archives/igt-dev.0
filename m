Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93FED49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F48910E9B4;
	Fri, 30 Jan 2026 10:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CXJBLD0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92710E9B4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770364; x=1801306364;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MDpzT2k8jx4SeWtZQ9MHH2+Ogzj1f1ni6G55ef2EiAo=;
 b=CXJBLD0vpW2J1bXJK3IvcqC9VC6Akwl0icYdUuxrNTHq610npVxrkVQ5
 wJcPYMGisgtuSxOPjFBA5mNOm2dUO0a48RDsArn/LfBA1sj9f02UPgGor
 ZbuvwgwGPJYyCtI1x+c75X3AHNHDaHWeMp8iHJWoKz1zNorShr/EeFPzH
 CoqYDeZ13I16JJ+VKEGKCCtsATLQSdgdFYfQz0YBGDObzdWoK/qpFasB9
 OiU1jB0Clv2IOpUggAGzh8LO0zXum0AIuiw5CgQ2uZLIPHJxJCMgy7ECb
 07DPT8LozPLknmyk4PMujZgR8z+IvrGgEH6mbVUtAwOHMa/u7qsZOd0LP Q==;
X-CSE-ConnectionGUID: sHtv1YUXTAur5vdlZ3tKrQ==
X-CSE-MsgGUID: 8LIzmnh8RaKnAZHXpI+ixQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70998326"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="70998326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:43 -0800
X-CSE-ConnectionGUID: jhLjkPIpSJasAoqJ7jLjbg==
X-CSE-MsgGUID: 6iRksAHgQOS3ITvczab07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208737718"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:52:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/15] lib/kms: Start introducing for_each_crtc*()
Date: Fri, 30 Jan 2026 12:52:22 +0200
Message-ID: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Start converting the for_each_pipe*() stuff to for_each_crtc*().

The series was getting a bit too big to handle so I cut it
after I got all the for_each_pipe_{single,valid}_output()
converted. There is still quite a bit of for_each_pipe() left
to do after this.

Haven't even smoke tested this. Fingers crossed...

Ville Syrjälä (15):
  lib/kms: Introduce for_each_crtc*()
  tests/drm_read: Use for_each_crtc*()
  tests/kms_plane_scaling: Use for_each_crtc*()
  tests/kms_color: Convert to for_each_crtc*()
  tests/intel/kms_pm_dc: Use for_each_crtc*()
  tests/kms_rotation_crc: Use for_each_crtc*()
  lib/kms: Use for_each_crtc_with_single_output() and for_each_crtc()
  lib/kms: Use for_each_crtc_with_single_output(), part 1
  lib/kms: Use for_each_crtc_with_single_output(), part 2
  lib/kms: Use for_each_crtc_with_single_output(), part 3
  lib/kms: Use for_each_crtc_with_valid_output(), part 1
  lib/kms: Use for_each_crtc_with_valid_output(), part 2
  lib/kms: Use for_each_crtc_with_valid_output(), part 3
  lib/kms: Use for_each_crtc_with_valid_output(), part 4
  lib/kms: Nuke for_each_pipe_with_*_output()

 lib/igt_kms.c                          |   4 +-
 lib/igt_kms.h                          |  70 ++++++++----
 tests/amdgpu/amd_cursor_overlay.c      |  16 ++-
 tests/drm_read.c                       |   8 +-
 tests/intel/kms_big_fb.c               |   6 +-
 tests/intel/kms_busy.c                 |  59 +++++-----
 tests/intel/kms_ccs.c                  |  19 +++-
 tests/intel/kms_cdclk.c                |  12 +-
 tests/intel/kms_draw_crc.c             |   8 +-
 tests/intel/kms_dsc.c                  |   6 +-
 tests/intel/kms_fb_coherency.c         |   6 +-
 tests/intel/kms_fence_pin_leak.c       |   8 +-
 tests/intel/kms_flip_tiling.c          |  15 ++-
 tests/intel/kms_frontbuffer_tracking.c |  14 +--
 tests/intel/kms_mmap_write_crc.c       |  10 +-
 tests/intel/kms_pipe_b_c_ivb.c         |   8 +-
 tests/intel/kms_pm_dc.c                |  36 +++---
 tests/intel/kms_pm_rpm.c               |   8 +-
 tests/intel/kms_psr2_sf.c              |   7 +-
 tests/intel/kms_psr2_su.c              |  15 +--
 tests/intel/kms_psr_stress_test.c      |   6 +-
 tests/intel/kms_pwrite_crc.c           |   6 +-
 tests/intel/perf_pmu.c                 |   8 +-
 tests/intel/prime_mmap_kms.c           |   6 +-
 tests/intel/xe_pat.c                   |   8 +-
 tests/kms_async_flips.c                |  23 ++--
 tests/kms_atomic.c                     | 147 ++++++++++++++-----------
 tests/kms_atomic_interruptible.c       |  79 ++++++++-----
 tests/kms_atomic_transition.c          |  25 +++--
 tests/kms_color.c                      |  28 ++---
 tests/kms_color_pipeline.c             |  12 +-
 tests/kms_cursor_crc.c                 |  86 ++++++++-------
 tests/kms_cursor_edge_walk.c           |  14 ++-
 tests/kms_flip_event_leak.c            |  11 +-
 tests/kms_invalid_mode.c               |  13 ++-
 tests/kms_lease.c                      |  15 ++-
 tests/kms_panel_fitting.c              |  12 +-
 tests/kms_pipe_crc_basic.c             |  74 ++++++++-----
 tests/kms_plane.c                      |   8 +-
 tests/kms_plane_alpha_blend.c          |  24 ++--
 tests/kms_plane_cursor.c               |  14 ++-
 tests/kms_plane_multiple.c             |  11 +-
 tests/kms_plane_scaling.c              | 119 ++++++++++----------
 tests/kms_prime.c                      |   6 +-
 tests/kms_properties.c                 |  22 ++--
 tests/kms_rmfb.c                       |  10 +-
 tests/kms_rotation_crc.c               |  25 ++---
 tests/kms_scaling_modes.c              |  12 +-
 tests/kms_sequence.c                   |  13 ++-
 tests/kms_universal_plane.c            |  49 +++++----
 tests/kms_vblank.c                     |  63 +++++++----
 tests/prime_vgem.c                     |   4 +-
 tests/vmwgfx/vmw_prime.c               |  16 +--
 53 files changed, 745 insertions(+), 559 deletions(-)

-- 
2.52.0

