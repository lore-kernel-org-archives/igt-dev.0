Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BED0D2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 09:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85E10E6B3;
	Wed, 10 Dec 2025 09:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOy9MilO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A4010E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765359548; x=1796895548;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kmOLI9etaduw6pNmjXslvRtE5a+iR7VTwCouPOlXSt0=;
 b=KOy9MilOMLfjMubo3zu5cIayuOWWLThrIFhgnB1LQUzoX3O/ATL+PZzR
 1+ykgOrAiR+0XjjEmlndf1FWKIAb8H4mLSDeFS1ONW/a27gBThkigJ7J+
 z/rhESMFG01nVp00YbjBWPenANqwGEmevVCW9nUeGke0qcqfyCsEGU1En
 V3y/zx2G/tOJ/icMhhDoyLVes57GYIRtcsdzwhFp9gJMcaU0VkAL/VABM
 ayOtG1zlwViD92LOGXgaGlETAuYops1OtUEBiMYGtLetkf+D/9C1SEXPT
 yIbGYTNbIqZc9NCwQuOCWdVB7Dj5wI5DGvgMuQEOPQonV1/QZF4rSAeIJ A==;
X-CSE-ConnectionGUID: 11bYgnT6Qjuth5p+3ZQWjQ==
X-CSE-MsgGUID: AYWReec9SfuVsuhjd9Bpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77943228"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="77943228"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:07 -0800
X-CSE-ConnectionGUID: nhT3wTmsTkitZx8XpKjFVA==
X-CSE-MsgGUID: XhsNWAE1QJG4wYXtJsz4pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="233865753"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/10] lib/kms: Move towards using 'crtcs' instead of
 'pipes'
Date: Wed, 10 Dec 2025 11:38:53 +0200
Message-ID: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
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

Start moving towards using igt_pipe_t (or rather igt_crtc_t as it
will be known afterwards) instead of pipes. Pipes are really an
Intel hardware concept and even there things tend to fall apart when
we introduce stuff like pipe joining. So the plan is to use the
more abstract crtc concept as much as possible, only dealing with
pipes when we absolutely have to.

Mostly just refactoring, done with cocci and sed. A few manual
things here and there.

I wanted to include some s/pipe/crtc/ variable renaming here
as well, but I hit some pathological coccinelle performace issue
around igt_kms.c which I'll need to mitigate or else it takes
forever to apply the semantic patch.

Ville Syrjälä (10):
  tests/intel/kms_dp_linktrain_fallback: Reduce side effects in
    igt_output_set_pipe() args
  lib/kms: Introduce igt_display_n_crtcs()
  lib/kms: Use igt_display_n_crtcs() everywhere
  lib/kms: Introduce igt_crtc_for_pipe()
  lib/kms: Use igt_crtc_for_pipe() everywhere
  lib/kms: Remove tall tales about 'pipe' in DRM_IOCTL_WAIT_VBLANK
  lib/kms: Pass the entire igt_pipe_t to igt_wait_for_vblank*()
  lib/kms: Introduce igt_output_set_crtc()
  lib/kms: Replace igt_output_set_pipe() with igt_output_set_crtc()
  lib/kms: Rename igt_pipe_t to igt_crtc_t

 benchmarks/kms_fb_stress.c                    |   3 +-
 lib/igt_kms.c                                 | 204 +++++++++---------
 lib/igt_kms.h                                 |  70 +++---
 tests/amdgpu/amd_abm.c                        |  10 +-
 tests/amdgpu/amd_assr.c                       |   9 +-
 tests/amdgpu/amd_bypass.c                     |   7 +-
 tests/amdgpu/amd_color.c                      |   7 +-
 tests/amdgpu/amd_dp_dsc.c                     |  20 +-
 tests/amdgpu/amd_freesync_video_mode.c        |   5 +-
 tests/amdgpu/amd_hotplug.c                    |  10 +-
 tests/amdgpu/amd_ilr.c                        |  12 +-
 tests/amdgpu/amd_link_settings.c              |   9 +-
 tests/amdgpu/amd_mall.c                       |   7 +-
 tests/amdgpu/amd_max_bpc.c                    |   7 +-
 tests/amdgpu/amd_mem_leak.c                   |   7 +-
 tests/amdgpu/amd_mode_switch.c                |   9 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  15 +-
 tests/amdgpu/amd_odm.c                        |  10 +-
 tests/amdgpu/amd_plane.c                      |  24 ++-
 tests/amdgpu/amd_psr.c                        |  27 ++-
 tests/amdgpu/amd_replay.c                     |   7 +-
 tests/amdgpu/amd_subvp.c                      |  11 +-
 tests/chamelium/kms_chamelium_color.c         |  28 +--
 tests/chamelium/kms_chamelium_edid.c          |   5 +-
 tests/chamelium/kms_chamelium_helper.c        |  11 +-
 tests/chamelium/kms_chamelium_hpd.c           |   8 +-
 .../kms_chamelium_sharpness_filter.c          |  16 +-
 tests/drm_read.c                              |   3 +-
 tests/intel/gem_eio.c                         |   7 +-
 tests/intel/gem_exec_reloc.c                  |   3 +-
 tests/intel/gem_pxp.c                         |  11 +-
 tests/intel/kms_big_fb.c                      |  17 +-
 tests/intel/kms_busy.c                        |  26 +--
 tests/intel/kms_ccs.c                         |   3 +-
 tests/intel/kms_cdclk.c                       |  19 +-
 tests/intel/kms_dirtyfb.c                     |   8 +-
 tests/intel/kms_dp_linktrain_fallback.c       |   7 +-
 tests/intel/kms_draw_crc.c                    |   3 +-
 tests/intel/kms_dsc.c                         |   5 +-
 tests/intel/kms_fb_coherency.c                |   8 +-
 tests/intel/kms_fbc_dirty_rect.c              |   5 +-
 tests/intel/kms_fence_pin_leak.c              |   7 +-
 tests/intel/kms_flip_scaled_crc.c             |  14 +-
 tests/intel/kms_flip_tiling.c                 |   5 +-
 tests/intel/kms_frontbuffer_tracking.c        |  40 ++--
 tests/intel/kms_joiner.c                      |  20 +-
 tests/intel/kms_joiner_helper.c               |   8 +-
 tests/intel/kms_mmap_write_crc.c              |   8 +-
 tests/intel/kms_pipe_b_c_ivb.c                |   6 +-
 tests/intel/kms_pipe_stress.c                 |  12 +-
 tests/intel/kms_pm_backlight.c                |   7 +-
 tests/intel/kms_pm_dc.c                       |  10 +-
 tests/intel/kms_pm_lpsp.c                     |   7 +-
 tests/intel/kms_pm_rpm.c                      |   3 +-
 tests/intel/kms_psr.c                         |   5 +-
 tests/intel/kms_psr2_sf.c                     |  11 +-
 tests/intel/kms_psr2_su.c                     |   8 +-
 tests/intel/kms_psr_stress_test.c             |   5 +-
 tests/intel/kms_pwrite_crc.c                  |   8 +-
 tests/intel/kms_sharpness_filter.c            |  11 +-
 tests/intel/perf_pmu.c                        |   8 +-
 tests/intel/prime_mmap_kms.c                  |   5 +-
 tests/intel/xe_pat.c                          |   3 +-
 tests/intel/xe_pxp.c                          |  20 +-
 tests/kms_async_flips.c                       |   8 +-
 tests/kms_atomic.c                            |  40 ++--
 tests/kms_atomic_interruptible.c              |  10 +-
 tests/kms_atomic_transition.c                 |  70 +++---
 tests/kms_bw.c                                |  10 +-
 tests/kms_color.c                             |  59 +++--
 tests/kms_color_helper.c                      |  23 +-
 tests/kms_color_helper.h                      |  14 +-
 tests/kms_colorop.c                           |   3 +-
 tests/kms_concurrent.c                        |  18 +-
 tests/kms_content_protection.c                |   8 +-
 tests/kms_cursor_crc.c                        |  29 ++-
 tests/kms_cursor_edge_walk.c                  |  11 +-
 tests/kms_cursor_legacy.c                     |  80 +++----
 tests/kms_debugfs.c                           |   5 +-
 tests/kms_display_modes.c                     |  32 +--
 tests/kms_dither.c                            |  11 +-
 tests/kms_feature_discovery.c                 |   6 +-
 tests/kms_flip_event_leak.c                   |   5 +-
 tests/kms_hdr.c                               |  17 +-
 tests/kms_invalid_mode.c                      |   5 +-
 tests/kms_lease.c                             |  45 ++--
 tests/kms_multipipe_modeset.c                 |  16 +-
 tests/kms_panel_fitting.c                     |   6 +-
 tests/kms_pipe_crc_basic.c                    |  22 +-
 tests/kms_plane.c                             |  32 +--
 tests/kms_plane_alpha_blend.c                 |  20 +-
 tests/kms_plane_cursor.c                      |  15 +-
 tests/kms_plane_lowres.c                      |   5 +-
 tests/kms_plane_multiple.c                    |  26 ++-
 tests/kms_plane_scaling.c                     |  40 ++--
 tests/kms_prime.c                             |   3 +-
 tests/kms_properties.c                        |  30 ++-
 tests/kms_rmfb.c                              |   7 +-
 tests/kms_rotation_crc.c                      |  16 +-
 tests/kms_scaling_modes.c                     |   5 +-
 tests/kms_sequence.c                          |  11 +-
 tests/kms_tiled_display.c                     |  12 +-
 tests/kms_universal_plane.c                   |  51 ++---
 tests/kms_vblank.c                            |  19 +-
 tests/kms_vrr.c                               |   7 +-
 tests/kms_writeback.c                         |   5 +-
 tests/nouveau_crc.c                           |   5 +-
 tests/vmwgfx/vmw_prime.c                      |   8 +-
 tools/amd_hdmi_compliance.c                   |   7 +-
 tools/intel_pm_rpm.c                          |   2 +-
 110 files changed, 999 insertions(+), 794 deletions(-)

-- 
2.51.2

