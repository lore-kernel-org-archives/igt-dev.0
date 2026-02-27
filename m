Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B0CFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0EB10EA4E;
	Fri, 27 Feb 2026 08:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LonPQ7G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9AF10EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179620; x=1803715620;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CwjAD+XbRWYVMMD7oRet/POnfweehSxGp7MtHDtywXY=;
 b=LonPQ7G+zNnVwTXjISgD8MkqBnzCzRn6KKYLkuwimNFqnE4syadMsmY1
 yi7gSUBmWMDXXKu9plBezB1zewZdv8YaKwgkNdc6lGtRDTW1FiRRKCLIH
 6liuCImEvCTbfwHoH9w83stL6Ph4/DxW0mYqnpQufCwTRTixVzFBsb5Lf
 ISD1mxlpoghbO0qrUX55n9XkwXi+Nj3jb8+2EgtqVO7vQ5s5798wtlFif
 dgL3O/02J3SoSSW63fYXS7CVk6OpAH//y+5/KmjnpH13SiLMP0SS0N8uu
 n9m72FkxKbxPW281xe9xwKQFeus63EDyMcwflNqq7VkpaLgrLuJzTgBdN A==;
X-CSE-ConnectionGUID: JdUpUA2cRZSnBBvuB2cxpA==
X-CSE-MsgGUID: oknNvlALRD6GLnrN7khslg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73130478"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73130478"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:06:58 -0800
X-CSE-ConnectionGUID: tLbjRP43T6+663H5M8rXUg==
X-CSE-MsgGUID: 5CnK8pasSwCS8oVN/ReZ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="254611342"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:06:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/17] lib/kms: Finish the igt_crtc_t API refactoring
Date: Fri, 27 Feb 2026 10:06:36 +0200
Message-ID: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Convert the remaining (more or less) igt_kms APIs to
igt_crtc_t* from enum pipe.

To get rid of the kmstest_vbl*() stuff from most places I 
did some (technically functional) pipe to crtc_index conversions,
and then added the igt_crtc_t* based igt_crtc_vbl*() wrappers.

There are also some cleanups of a few random leftovers from
earlier conversion attempts.

I also did a bunch of renaming across the tree, just to
reduce the appearance of the word "pipe". That should hopefully
make it a bit easier to see which parts of the codebase still
need work.

Ville Syrjälä (17):
  lib/kms: Replace igt_pipe_has_valid_output() with
    igt_crtc_has_valid_output()
  lib/kms: Replace igt_display_require_output_on_pipe() with
    igt_display_require_output_on_crtc()
  lib/kms: Replace igt_get_single_output_for_pipe() with
    igt_get_single_output_for_crtc()
  lib/kms: Make the igt_*_bpc_*() interfaces more abstract
  tests/kms: Use igt_crtc_name()
  tests/kms: Clean up crtc->pipe comparions
  tests/vmwgfx/vmw_prime: Replace igt_pipe_crc_new() with
    igt_crtc_crc_new()
  lib/kms: Prefer "crtc" over "pipe" in function names
  tests/kms_color*: Prefer "crtc" over "pipe" in function names
  tests/kms: Prefer "crtc" over "pipe" in function names
  tests/kms_tiled_display: Remove mention of PIPE_NONE
  tests/kms: Remove hand rolled get_vblank() stuff
  lib/kms: Fix kmstest_get_vblank() docs
  tests/kms: Pass crtc_index to kmstest_get_vbl_flag()
  tests/kms: Pass crtc_index to kmstest_get_vblank()
  lib/kms: Introduce igt_crtc_get_vbl_flag()
  lib/kms: Introduce igt_crtc_get_vblank()

 lib/igt_kms.c                                 | 120 ++++++++++--------
 lib/igt_kms.h                                 |  19 +--
 tests/amdgpu/amd_abm.c                        |   3 +-
 tests/amdgpu/amd_bypass.c                     |   5 +-
 tests/amdgpu/amd_color.c                      |   3 +-
 tests/amdgpu/amd_dp_dsc.c                     |   7 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   6 +-
 tests/amdgpu/amd_max_bpc.c                    |   4 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |   2 +-
 tests/amdgpu/amd_psr.c                        |   3 +-
 tests/amdgpu/amd_replay.c                     |   3 +-
 tests/chamelium/kms_chamelium_color.c         |  22 ++--
 .../kms_chamelium_sharpness_filter.c          |   4 +-
 tests/drm_read.c                              |   4 +-
 tests/intel/gem_eio.c                         |   2 +-
 tests/intel/kms_busy.c                        |  10 +-
 tests/intel/kms_ccs.c                         |   3 +-
 tests/intel/kms_dsc.c                         |   4 +-
 tests/intel/kms_dsc_helper.c                  |   2 +-
 tests/intel/kms_flip_tiling.c                 |   4 +-
 tests/intel/kms_pipe_b_c_ivb.c                |  40 +++---
 tests/intel/kms_pipe_stress.c                 |  28 +---
 tests/intel/perf_pmu.c                        |   2 +-
 tests/kms_async_flips.c                       |   8 +-
 tests/kms_atomic.c                            |  26 ++--
 tests/kms_atomic_interruptible.c              |  16 +--
 tests/kms_atomic_transition.c                 |   6 +-
 tests/kms_bw.c                                |   3 +-
 tests/kms_color.c                             |  24 ++--
 tests/kms_color_helper.c                      |  34 ++---
 tests/kms_color_helper.h                      |   8 +-
 tests/kms_color_pipeline.c                    |   2 +-
 tests/kms_cursor_legacy.c                     | 119 ++++++++++-------
 tests/kms_display_modes.c                     |   2 +-
 tests/kms_dither.c                            |   4 +-
 tests/kms_hdr.c                               |  31 +++--
 tests/kms_pipe_crc_basic.c                    |  10 +-
 tests/kms_plane.c                             |   9 +-
 tests/kms_plane_alpha_blend.c                 |  10 +-
 tests/kms_plane_multiple.c                    |   2 +-
 tests/kms_plane_scaling.c                     |  40 +++---
 tests/kms_properties.c                        |  20 +--
 tests/kms_rotation_crc.c                      |  10 +-
 tests/kms_tiled_display.c                     |   3 +-
 tests/kms_universal_plane.c                   |  32 ++---
 tests/kms_vblank.c                            |  24 ++--
 tests/kms_vrr.c                               |   8 +-
 tests/nouveau_crc.c                           |   6 +-
 tests/prime_vgem.c                            |  28 +---
 tests/vmwgfx/vmw_prime.c                      |   4 +-
 50 files changed, 397 insertions(+), 392 deletions(-)

-- 
2.52.0

