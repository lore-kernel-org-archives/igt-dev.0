Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAA3CA5FB7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1317C10E1A5;
	Tue, 20 Jan 2026 17:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lo9IjIrs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7C110E1A5
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929421; x=1800465421;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4DqzJWbtLGV7RZw8QxngZC5HEKD/Zr06wXkY4OEM40=;
 b=Lo9IjIrsDIU0ickKkYS5URt70i+5rLcFxkknOvypWdgKK425llZZ7dhc
 k1ARWf7xYxrkF7WSnMn/GRMQQHqHaKzgA9n05nmLiS58f/W/juDDQQyDW
 +DBmkiJMbl3PHFMWz8Y+3YtK4IyD8qzzNabqF2biqDbfInRBtWEMkB6xi
 ry3q1Jr4mTXVtBM2bWZVcTjzbUqu5Qt1n2OYIaKLLh+h57IOWb3K7LM0a
 2N9cg8xrVB0n/FYww+ARBYuwstB9n/hi9WY4chppfxqxuwXH0loL3WGr9
 ltJub5hsXXyz06ZfW98aaAREKSSQymtwQ2Mf/kkd/PV6lb0CG/RCfhiaV Q==;
X-CSE-ConnectionGUID: w6tV3rJNSUWRPWu6UP8hxg==
X-CSE-MsgGUID: JDCuK1+vSFS7G8lS0ApB/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72731843"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72731843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:00 -0800
X-CSE-ConnectionGUID: h3lctFxGTH+BB1aJH2BRMA==
X-CSE-MsgGUID: e0zznBndTe+bEVSC8NNPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206221930"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:16:59 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/12] lib/kms: More pipe->crtc conversion
Date: Tue, 20 Jan 2026 19:16:43 +0200
Message-ID: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

Use igt_crtc_t in a few more places (namely CRC), and rename
a bunch of stuff to use the crtc terminilogy for consistency.

Ville Syrjälä (12):
  igt/kms: Nuke igt_pipe_is_prop_changed() and igt_pipe_set_prop_value()
  lib/kms: Rename igt_pipe_obj_*_prop()
  lib/kms: Pass igt_crtc_t to igt_pipe_refresh()
  lib/kms: Don't pass 'display' to igt_fill_pipe_props)_
  lib/kms: Rename a bunch of crtc functions
  lib/kms: Eliminate some redundant igt_crtc_for_pipe()s
  lib/crc: Convert igt_pipe_crc away from enum pipe
  lib/kms: Add igt_crtc_t based CRC wrappers
  lib/kms: Use igt_crtc_crc_new()
  lib/kms: Use igt_crtc_crc_new() more
  lib/kms: Use igt_crtc_crc_new_nonblock() more
  lib/kms: Use igt_crtc_crc_new() even more

 lib/igt_kms.c                                 | 176 ++++++++++--------
 lib/igt_kms.h                                 |  78 +++-----
 lib/igt_pipe_crc.c                            |  32 ++--
 lib/igt_pipe_crc.h                            |   6 +-
 tests/amdgpu/amd_abm.c                        |   4 +-
 tests/amdgpu/amd_assr.c                       |   2 +-
 tests/amdgpu/amd_bypass.c                     |  12 +-
 tests/amdgpu/amd_color.c                      |  26 +--
 tests/amdgpu/amd_cursor_overlay.c             |  10 +-
 tests/amdgpu/amd_dp_dsc.c                     |   4 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   5 +-
 tests/amdgpu/amd_hotplug.c                    |   8 +-
 tests/amdgpu/amd_ilr.c                        |   4 +-
 tests/amdgpu/amd_link_settings.c              |   2 +-
 tests/amdgpu/amd_mall.c                       |   6 +-
 tests/amdgpu/amd_max_bpc.c                    |   6 +-
 tests/amdgpu/amd_mem_leak.c                   |   4 +-
 tests/amdgpu/amd_mode_switch.c                |   2 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  11 +-
 tests/amdgpu/amd_odm.c                        |   4 +-
 tests/amdgpu/amd_plane.c                      |  14 +-
 tests/amdgpu/amd_psr.c                        |  10 +-
 tests/amdgpu/amd_replay.c                     |   4 +-
 tests/amdgpu/amd_subvp.c                      |   5 +-
 tests/chamelium/kms_chamelium_color.c         |  18 +-
 tests/chamelium/kms_chamelium_helper.c        |  12 +-
 .../kms_chamelium_sharpness_filter.c          |  14 +-
 tests/intel/gem_pxp.c                         |   8 +-
 tests/intel/kms_big_fb.c                      |  10 +-
 tests/intel/kms_busy.c                        |   2 +-
 tests/intel/kms_ccs.c                         |   2 +-
 tests/intel/kms_cdclk.c                       |   2 +-
 tests/intel/kms_dirtyfb.c                     |   4 +-
 tests/intel/kms_draw_crc.c                    |   3 +-
 tests/intel/kms_fb_coherency.c                |   2 +-
 tests/intel/kms_fbc_dirty_rect.c              |   2 +-
 tests/intel/kms_flip_scaled_crc.c             |   6 +-
 tests/intel/kms_flip_tiling.c                 |   2 +-
 tests/intel/kms_frontbuffer_tracking.c        |   8 +-
 tests/intel/kms_mmap_write_crc.c              |   2 +-
 tests/intel/kms_pipe_stress.c                 |   2 +-
 tests/intel/kms_pm_dc.c                       |   5 +-
 tests/intel/kms_pwrite_crc.c                  |   2 +-
 tests/intel/kms_sharpness_filter.c            |  14 +-
 tests/intel/xe_pat.c                          |   3 +-
 tests/intel/xe_pxp.c                          |  12 +-
 tests/kms_async_flips.c                       |   3 +-
 tests/kms_atomic.c                            |  56 +++---
 tests/kms_atomic_interruptible.c              |   2 +-
 tests/kms_atomic_transition.c                 |  20 +-
 tests/kms_bw.c                                |   4 +-
 tests/kms_color.c                             |  39 ++--
 tests/kms_color_helper.c                      |  24 +--
 tests/kms_color_pipeline.c                    |   5 +-
 tests/kms_concurrent.c                        |   2 +-
 tests/kms_content_protection.c                |   8 +-
 tests/kms_cursor_crc.c                        |   2 +-
 tests/kms_cursor_edge_walk.c                  |   2 +-
 tests/kms_cursor_legacy.c                     |  12 +-
 tests/kms_display_modes.c                     |  14 +-
 tests/kms_dither.c                            |   2 +-
 tests/kms_hdr.c                               |   6 +-
 tests/kms_lease.c                             |  10 +-
 tests/kms_multipipe_modeset.c                 |  10 +-
 tests/kms_pipe_crc_basic.c                    |   8 +-
 tests/kms_plane.c                             |   6 +-
 tests/kms_plane_alpha_blend.c                 |  12 +-
 tests/kms_plane_cursor.c                      |  10 +-
 tests/kms_plane_lowres.c                      |   2 +-
 tests/kms_plane_multiple.c                    |   8 +-
 tests/kms_plane_scaling.c                     |   6 +-
 tests/kms_prime.c                             |   2 +-
 tests/kms_rmfb.c                              |   3 +-
 tests/kms_rotation_crc.c                      |   4 +-
 tests/kms_universal_plane.c                   |   2 +-
 tests/kms_vrr.c                               |  11 +-
 tests/nouveau_crc.c                           |  16 +-
 tools/amd_hdmi_compliance.c                   |   4 +-
 78 files changed, 438 insertions(+), 447 deletions(-)

-- 
2.52.0

