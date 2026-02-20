Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92309C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2409B10E7C3;
	Fri, 20 Feb 2026 14:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANI19S86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A8E10E7C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596119; x=1803132119;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NTij71XYsF76lW6yDG9qvcG2a1ks8xovnvou4z5ujCU=;
 b=ANI19S86918DWeidDKRD7gR86q4FBXXhy5IwImmW6ghFCVhhtnxdTTw0
 mRww+vQfW7tyFGgifxBXVafjgq6G/oyBfAj5rWpWSvaOGsjvtgw9QSVtV
 3+2OoKvNXk88uYEraDLlFB9WZhK90yi1sdI8+AkRc4skm6VcfmUbfK/7J
 vX+LwPvy7s2uQZqmnSxyv4d5FMDKL+fP2qYQ73DMs3HmRZ2yNQasZkhSE
 E/WBEEZaQkyZm5Y28RpJ0p2Dl+dlDWDkWXiJiX89VrW1dfA6qIBI2P9Ng
 AfcNL14LELQFw4yzdBfJxtmc7OHO8gHsGFQ70wZLffLHw5hJVuXVQoM7O Q==;
X-CSE-ConnectionGUID: L5zKyv9BR4iehcwMSTzUEA==
X-CSE-MsgGUID: /Uht/F4CQXua72FGZGNmlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83006986"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="83006986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:01:59 -0800
X-CSE-ConnectionGUID: iA9CwMmwRXGS4qsOheypLw==
X-CSE-MsgGUID: mlB0Cau/Sua3Apoki4NpWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214973614"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:01:57 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/21] tests/kms: More igt_crtc_t conversions
Date: Fri, 20 Feb 2026 16:01:32 +0200
Message-ID: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Convert more tests to track/pass around igt_crtc_t instead of
enum pipe.

This gets rid of most 'enum pipe' typed variables under tests/.
The remaining ones are:
* active_pipes[] array
  - kms_vblank
  - kms_plane_alpha_blend
  - kms_pipe_crc_basic
  - kms_cursor_edge_walk
  - kms_cursor_crc
* uninitialized on stack enum pipe passed to
  intel_fbc_supported_on_chipset()
  - kms_psr
* incorrect pipe usage for igt_debugfs_crtc_dir()
  - kms_frontbuffer_tracking
* the big mess that still needs to be sorted:
  - kms_joiner*

Additionally a lot of crtc->pipe usage still remains:
- some will disappear once all external igt_kms functions get
  converted to igt_crtc_t. I still plan to send at least one
  cocci series for that
- some need to be converted to crtc->crtc_index for correctness
- some are used for local array indexing which probably should also
  be converted to crtc_index (or some other sensible thing)
- what should remain in the end are the actual crtc->pipe vs. PIPE_?
  comparisons used for hardware specific quirks and whatnot

Ville Syrjälä (21):
  tests/intel/kms_flip_scaled_crc: Remove unused 'enum pipe pipe'
  tests/kms_concurrent: Actually run the test over all connected crtcs
  tests/amdgpu/amd_abm: Don't use uninitialized 'pipe'
  tests/kms: Use 'enum pipe' over int'
  lib/kms: Add igt_crtc_for_crtc_id()
  tests/kms_lease: Use igt_crtc_t instead of enum pipe
  tests/kms_lease: Pass lease_t to prepare_crtc()
  tests/intel/kms_frontbuffer_tracking: Use igt_crtc_t instead of enum
    pipe
  tests/kms_plane_scaling: Use igt_crtc_t instead of enum pipe
  tests/drm_read: Use igt_crtc_t instead of enum pipe
  tests/intel/kms_psr2_sf: Convert pipes[] to crtcs[]
  tests/kms_vblank: Use igt_crtc_t instead of enum pipe
  tests/kms_plane_multiple: Use igt_crtc_t instead of enum pipe
  tests/kms_tiled_display: Use igt_crtc_t instead of enum pipe
  tests/intel/kms_psr: Use igt_crtc_t instead of enum pipe
  tests/kms_prime: Use igt_crtc_t instead of enum pipe
  tests/chamelium: Use igt_crtc_t instead of enum pipe
  tests/kms: Use igt_crtc_t instead of enum pipe, part 1
  tests/kms: Use igt_crtc_t instead of enum pipe, part 2
  tests/kms: Use igt_crtc_t instead of enum pipe, part 3
  tests/kms: Use igt_crtc_t instead of enum pipe, part 4

 lib/igt_kms.c                                 |  12 ++
 lib/igt_kms.h                                 |   1 +
 tests/amdgpu/amd_abm.c                        |  34 +++---
 tests/amdgpu/amd_bypass.c                     |   7 +-
 tests/amdgpu/amd_color.c                      |   7 +-
 tests/amdgpu/amd_cursor_overlay.c             |  28 ++---
 tests/amdgpu/amd_dp_dsc.c                     |  12 +-
 tests/amdgpu/amd_hotplug.c                    |   4 +-
 tests/amdgpu/amd_ilr.c                        |   8 +-
 tests/amdgpu/amd_link_settings.c              |   8 +-
 tests/amdgpu/amd_mall.c                       |   4 +-
 tests/amdgpu/amd_max_bpc.c                    |   6 +-
 tests/amdgpu/amd_mem_leak.c                   |   4 +-
 tests/amdgpu/amd_odm.c                        |   4 +-
 tests/amdgpu/amd_plane.c                      |  14 +--
 tests/amdgpu/amd_psr.c                        |  23 ++--
 tests/amdgpu/amd_replay.c                     |   7 +-
 tests/amdgpu/amd_subvp.c                      |   4 +-
 tests/chamelium/kms_chamelium_edid.c          |  13 +-
 tests/chamelium/kms_chamelium_helper.c        |  10 +-
 tests/chamelium/kms_chamelium_helper.h        |   2 +-
 tests/chamelium/kms_chamelium_hpd.c           |   8 +-
 .../kms_chamelium_sharpness_filter.c          |  35 +++---
 tests/drm_read.c                              |  36 +++---
 tests/intel/kms_big_fb.c                      |  28 ++---
 tests/intel/kms_ccs.c                         |   8 +-
 tests/intel/kms_cdclk.c                       |  16 ++-
 tests/intel/kms_dirtyfb.c                     |  25 ++--
 tests/intel/kms_dp_linktrain_fallback.c       |  11 +-
 tests/intel/kms_fb_coherency.c                |   8 +-
 tests/intel/kms_fbc_dirty_rect.c              |  17 ++-
 tests/intel/kms_flip_scaled_crc.c             |   1 -
 tests/intel/kms_flip_tiling.c                 |  12 +-
 tests/intel/kms_frontbuffer_tracking.c        |  99 +++++++--------
 tests/intel/kms_mmap_write_crc.c              |   8 +-
 tests/intel/kms_pipe_stress.c                 |  65 +++++-----
 tests/intel/kms_pm_lpsp.c                     |   7 +-
 tests/intel/kms_psr.c                         |  10 +-
 tests/intel/kms_psr2_sf.c                     |  93 +++++++-------
 tests/intel/kms_pwrite_crc.c                  |   8 +-
 tests/intel/kms_sharpness_filter.c            |  25 ++--
 tests/intel/perf_pmu.c                        |  10 +-
 tests/intel/prime_mmap_kms.c                  |   6 +-
 tests/kms_async_flips.c                       |  13 +-
 tests/kms_bw.c                                |   2 -
 tests/kms_concurrent.c                        |  45 +++----
 tests/kms_content_protection.c                |   5 +-
 tests/kms_cursor_crc.c                        |  66 +++++-----
 tests/kms_cursor_edge_walk.c                  |  13 +-
 tests/kms_hdr.c                               |  32 ++---
 tests/kms_invalid_mode.c                      |   7 +-
 tests/kms_lease.c                             |  35 +++---
 tests/kms_plane_cursor.c                      |  20 ++-
 tests/kms_plane_lowres.c                      |  11 +-
 tests/kms_plane_multiple.c                    |  88 ++++++++------
 tests/kms_plane_scaling.c                     | 114 +++++++++---------
 tests/kms_prime.c                             |  14 +--
 tests/kms_sequence.c                          |  12 +-
 tests/kms_tiled_display.c                     |  14 +--
 tests/kms_vblank.c                            |  55 +++++----
 tests/nouveau_crc.c                           |  31 +++--
 tests/vmwgfx/vmw_prime.c                      |  10 +-
 tools/amd_hdmi_compliance.c                   |   4 +-
 tools/intel_hdcp.c                            |   4 +-
 64 files changed, 652 insertions(+), 691 deletions(-)

-- 
2.52.0

