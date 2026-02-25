Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95814FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4960910E76F;
	Wed, 25 Feb 2026 12:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkKRGmDp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E762310E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023872; x=1803559872;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x4PIWvsD3STtctH6niCrp2PnVAMkM4aASbU40XvHHb4=;
 b=HkKRGmDpkiyjdYVCFVWXwmx6yHZeX66Ezk/7dOpyfJEvgMXFAINETmPx
 3MaMR4xeb5rmV/Vh0skl7rof7IhadqZQbLg/MsYovzJghjQ7OEdsPWDk4
 viM9tbpPge0M228UUXUUDiYRq5yqwTMT+h15vTzHc1ry0WkQyvSE/pNwn
 SmYIErY+sp9x8iT25/7BCMAZ1OV+wbfV/yqGQYD/EGCbvYmL1jQ8aoJkz
 Z2w5XY3jbaDB9BN5QEJ9GM8YwFdnq64HIiMYYlbyc1AlKHfZFiohVVGtj
 AwtZs6G1Oe+r8iOrM+tPUoZ4uzU+EJUf9S9CN0PS7SjDLxgdIacH3aJA4 A==;
X-CSE-ConnectionGUID: tMyYftSaQS6wNvpQfxShRg==
X-CSE-MsgGUID: NfPNlaoeT3G8ojCjBR9IQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98527373"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="98527373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:11 -0800
X-CSE-ConnectionGUID: ACO+QOrsQY2eEk6QtLKRUA==
X-CSE-MsgGUID: kJMfe+ddTnWrHK0EpuDJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="214344520"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/19] lib/kms: Clean up more of igt_kms API
Date: Wed, 25 Feb 2026 14:50:49 +0200
Message-ID: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Adjust more of the igt_kms API to pass around igt_crtc_t*
instead of enum pipe.

I also wanted to have a better idea where in the tests we're
still using igt_crtc_for_pipe(), so there's some cleanup
around that. And then I added some new functions into igt_kms
to replace some of those with more sensible things.

This was supposed to be the last treewide series I'd do, but
it naturally became too big. So I cut it roughly in the middle,
and this is the first part. The second part is already done,
but I'll hang on to it until this gets in.

Ville Syrjälä (19):
  tests/kms_plane_multiple: Clean up n_planes stuff
  tests/kms_async_flips: Remove redundant data.crtc_id
  tests/kms_lease: Consolidate igt_crtc_for_pipe() calls
  tests/kms: Consolidate igt_crtc_for_pipe() calls
  lib/kms: Introduce igt_first_crtc_with_single_output()
  tests/kms: Use igt_first_crtc_with_single_output()
  lib/kms: Introduce and use igt_first_crtc()
  tests/kms: Stop using igt_require_pipe()
  lib/kms: Replace get_num_scalers() with igt_crtc_num_scalers()
  lib/kms: Pass igt_crtc_t* to igt_max_bpc_constraint()
  lib/kms: Introduce for_each_plane_on_crtc()
  tests/kms: Use for_each_plane_on_crtc()
  lib/kms: Nuke for_each_plane_on_pipe()
  tests/kms: Switch to for_each_valid_output_on_crtc_local()
  tests/kms: Replace igt_pipe_connector_valid() with
    igt_crtc_connector_valid()
  lib/kms: Intreoduce for_each_valid_output_on_crtc()
  tests/intel/kms_frontbuffer_tracking: Use
    for_each_valid_output_on_crtc()
  tests/kms: Use for_each_valid_output_on_crtc()
  lib/kms: Nuke for_each_valid_output_on_pipe()

 lib/igt_kms.c                                 | 83 +++++++++++++------
 lib/igt_kms.h                                 | 60 ++++----------
 tests/amdgpu/amd_abm.c                        | 20 +++--
 tests/amdgpu/amd_assr.c                       |  2 +-
 tests/amdgpu/amd_bypass.c                     |  2 +-
 tests/amdgpu/amd_color.c                      |  2 +-
 tests/amdgpu/amd_cursor_overlay.c             |  2 +-
 tests/amdgpu/amd_freesync_video_mode.c        |  2 +-
 tests/amdgpu/amd_ilr.c                        |  2 +-
 tests/amdgpu/amd_link_settings.c              |  2 +-
 tests/amdgpu/amd_mall.c                       |  2 +-
 tests/amdgpu/amd_max_bpc.c                    |  2 +-
 tests/amdgpu/amd_mem_leak.c                   |  2 +-
 tests/amdgpu/amd_mode_switch.c                |  5 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  7 +-
 tests/amdgpu/amd_odm.c                        |  6 +-
 tests/amdgpu/amd_psr.c                        |  2 +-
 tests/amdgpu/amd_replay.c                     |  2 +-
 tests/chamelium/kms_chamelium_color.c         |  8 +-
 .../kms_chamelium_sharpness_filter.c          |  6 +-
 tests/intel/gem_eio.c                         | 11 ++-
 tests/intel/gem_exec_reloc.c                  |  9 +-
 tests/intel/gem_pxp.c                         |  4 +-
 tests/intel/kms_big_fb.c                      |  3 +-
 tests/intel/kms_busy.c                        |  3 +-
 tests/intel/kms_ccs.c                         |  3 +-
 tests/intel/kms_cdclk.c                       | 14 ++--
 tests/intel/kms_dirtyfb.c                     |  4 +-
 tests/intel/kms_dp_linktrain_fallback.c       |  2 +-
 tests/intel/kms_fbc_dirty_rect.c              | 15 ++--
 tests/intel/kms_flip_scaled_crc.c             |  8 +-
 tests/intel/kms_frontbuffer_tracking.c        |  5 +-
 tests/intel/kms_legacy_colorkey.c             |  5 +-
 tests/intel/kms_pipe_stress.c                 | 30 ++++---
 tests/intel/kms_pm_lpsp.c                     |  2 +-
 tests/intel/xe_pxp.c                          |  6 +-
 tests/kms_async_flips.c                       | 29 +++----
 tests/kms_atomic.c                            |  3 +-
 tests/kms_atomic_transition.c                 | 36 +++++---
 tests/kms_bw.c                                |  5 +-
 tests/kms_color.c                             | 11 +--
 tests/kms_colorop.c                           |  3 +-
 tests/kms_content_protection.c                |  2 +-
 tests/kms_cursor_legacy.c                     |  6 +-
 tests/kms_debugfs.c                           |  7 +-
 tests/kms_display_modes.c                     | 11 +--
 tests/kms_dither.c                            |  4 +-
 tests/kms_feature_discovery.c                 |  4 +-
 tests/kms_hdr.c                               |  6 +-
 tests/kms_lease.c                             | 31 ++++---
 tests/kms_plane.c                             |  9 +-
 tests/kms_plane_alpha_blend.c                 |  8 +-
 tests/kms_plane_lowres.c                      |  6 +-
 tests/kms_plane_multiple.c                    | 25 +++---
 tests/kms_plane_scaling.c                     | 78 +++++++++--------
 tests/kms_properties.c                        | 16 ++--
 tests/kms_rmfb.c                              |  6 +-
 tests/kms_rotation_crc.c                      | 19 +++--
 tests/kms_tiled_display.c                     |  2 +-
 tools/amd_hdmi_compliance.c                   |  2 +-
 60 files changed, 378 insertions(+), 294 deletions(-)

-- 
2.52.0

