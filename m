Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA9AEA3F27
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714BF10E5CC;
	Tue, 10 Feb 2026 16:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/c8nZOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B947010E5CC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739821; x=1802275821;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZQWk+fSTHhRqKvTrrm3tRSEB9Eclq8LDLKWUpBkg5zY=;
 b=k/c8nZOWtcPF7Z2n6pCdk0n2PswGq+oq7Q7Y7tmmtXOs2i8qZMl1iw3B
 5ZMvUaM4n+AGI5ZDDmfIkNOBTB0Peo4a6HeGoHjut1JyBjXdbnr3W8MEW
 f1xa0ymqfsFE5zWdYNgSZZ5tA/ze16RRKAzJT4b4sLUppL5/Gld/Xa2FP
 XWm25UeoJBqQKKPgCD83owSWQvbeK59wqjQSSyPWn2rLnDw36mlHIMJsp
 pDqElOx4y7r1EsJtWRFooAopQbPGPv3p5mm/Wfer8ds3iVMdo8j0AN2zh
 Jf4ZE0ybHHlVNwf9JkV9sDNDz1xQ16FDy07zOveoLx2T353aB2HwYZddP A==;
X-CSE-ConnectionGUID: /h10JLJiQJag8DO1KQ2gFw==
X-CSE-MsgGUID: zAfbBmgIS+qIVroCkkHZ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770653"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770653"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:21 -0800
X-CSE-ConnectionGUID: kn13Oe79R0ucDlxM4aO4Lg==
X-CSE-MsgGUID: 6CiI6zQyQ2O2DrtfbMBfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061284"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/5] tests/kms: Prep work for more pipe->crtc conversion
Date: Tue, 10 Feb 2026 18:10:11 +0200
Message-ID: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
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

Do some prep work that seems helpful for subsequent
cocci based pipe->crtc conversions.

Ville Syrjälä (5):
  tests/kms: Clean up display varaibles used for igt_crtc_for_pipe()
  tests/kms: Introduce more local 'display' variables
  tests/kms: Pull the igt_crtc_for_pipe() call earlier
  tests/kms: Pull igt_crtc_for_pipe() calls earlier, when dealing with
    planes
  tests/kms: Introduce local 'crtc' variables

 tests/amdgpu/amd_abm.c                        |   5 +-
 tests/amdgpu/amd_assr.c                       |   5 +-
 tests/amdgpu/amd_bypass.c                     |   2 +-
 tests/amdgpu/amd_color.c                      |   2 +-
 tests/amdgpu/amd_cursor_overlay.c             |  13 ++-
 tests/amdgpu/amd_dp_dsc.c                     |   8 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   4 +-
 tests/amdgpu/amd_hotplug.c                    |   2 +-
 tests/amdgpu/amd_ilr.c                        |   3 +-
 tests/amdgpu/amd_link_settings.c              |   3 +-
 tests/amdgpu/amd_mall.c                       |   2 +-
 tests/amdgpu/amd_max_bpc.c                    |   2 +-
 tests/amdgpu/amd_mem_leak.c                   |   2 +-
 tests/amdgpu/amd_mode_switch.c                |   3 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |   2 +-
 tests/amdgpu/amd_odm.c                        |   4 +-
 tests/amdgpu/amd_plane.c                      |  12 +-
 tests/amdgpu/amd_psr.c                        |  18 +--
 tests/amdgpu/amd_replay.c                     |   2 +-
 tests/amdgpu/amd_subvp.c                      |   2 +-
 tests/chamelium/kms_chamelium_color.c         |  25 +++--
 tests/chamelium/kms_chamelium_helper.c        |   2 +-
 .../kms_chamelium_sharpness_filter.c          |  38 ++++---
 tests/intel/gem_eio.c                         |   2 +-
 tests/intel/gem_exec_reloc.c                  |   2 +-
 tests/intel/kms_big_fb.c                      |  18 +--
 tests/intel/kms_busy.c                        |   8 +-
 tests/intel/kms_ccs.c                         |   5 +-
 tests/intel/kms_cdclk.c                       |   8 +-
 tests/intel/kms_dirtyfb.c                     |   5 +-
 tests/intel/kms_dp_linktrain_fallback.c       |   3 +-
 tests/intel/kms_dsc.c                         |   2 +-
 tests/intel/kms_fb_coherency.c                |   4 +-
 tests/intel/kms_fbc_dirty_rect.c              |   5 +-
 tests/intel/kms_fence_pin_leak.c              |   5 +-
 tests/intel/kms_flip_scaled_crc.c             |  21 ++--
 tests/intel/kms_flip_tiling.c                 |   3 +-
 tests/intel/kms_joiner.c                      |  28 +++--
 tests/intel/kms_mmap_write_crc.c              |   4 +-
 tests/intel/kms_pipe_b_c_ivb.c                |   8 +-
 tests/intel/kms_pipe_stress.c                 |  15 ++-
 tests/intel/kms_pm_lpsp.c                     |   3 +-
 tests/intel/kms_psr2_sf.c                     |   7 +-
 tests/intel/kms_psr2_su.c                     |   3 +-
 tests/intel/kms_pwrite_crc.c                  |   4 +-
 tests/intel/kms_sharpness_filter.c            |   6 +-
 tests/intel/perf_pmu.c                        |   2 +-
 tests/intel/prime_mmap_kms.c                  |   2 +-
 tests/kms_async_flips.c                       |   8 +-
 tests/kms_atomic.c                            |  20 ++--
 tests/kms_atomic_interruptible.c              |   4 +-
 tests/kms_atomic_transition.c                 | 105 +++++++++++-------
 tests/kms_bw.c                                |   2 +-
 tests/kms_color.c                             |  38 ++++---
 tests/kms_color_pipeline.c                    |   5 +-
 tests/kms_concurrent.c                        |  36 +++---
 tests/kms_content_protection.c                |   7 +-
 tests/kms_cursor_crc.c                        |  14 ++-
 tests/kms_cursor_edge_walk.c                  |   4 +-
 tests/kms_cursor_legacy.c                     |   8 +-
 tests/kms_display_modes.c                     |   8 +-
 tests/kms_dither.c                            |  13 ++-
 tests/kms_hdr.c                               |  28 +++--
 tests/kms_invalid_mode.c                      |   3 +-
 tests/kms_lease.c                             |   2 +-
 tests/kms_panel_fitting.c                     |   7 +-
 tests/kms_pipe_crc_basic.c                    |  23 ++--
 tests/kms_plane.c                             |  72 +++++++-----
 tests/kms_plane_alpha_blend.c                 |  35 +++---
 tests/kms_plane_cursor.c                      |  12 +-
 tests/kms_plane_lowres.c                      |   5 +-
 tests/kms_plane_multiple.c                    |  23 ++--
 tests/kms_plane_scaling.c                     |  51 +++++----
 tests/kms_properties.c                        |   2 +-
 tests/kms_rmfb.c                              |   9 +-
 tests/kms_rotation_crc.c                      |  27 +++--
 tests/kms_scaling_modes.c                     |   2 +-
 tests/kms_sequence.c                          |   2 +-
 tests/kms_tiled_display.c                     |   6 +-
 tests/kms_universal_plane.c                   |  58 ++++++----
 tests/kms_vblank.c                            |   6 +-
 tests/kms_vrr.c                               |  12 +-
 tests/nouveau_crc.c                           |  15 ++-
 tests/vmwgfx/vmw_prime.c                      |   4 +-
 tools/amd_hdmi_compliance.c                   |   2 +-
 85 files changed, 612 insertions(+), 400 deletions(-)

-- 
2.52.0

