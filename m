Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097E2EC1EB5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B118C10E89C;
	Thu,  5 Feb 2026 13:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDIj32Tb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44F10E89C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298223; x=1801834223;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+fbLYdxSuLrXRYkN1i0rokn1v0wwzpWLVxhk2vvm3k=;
 b=IDIj32TbShcZU7sNTwca2zDs6A6/IjA6zcCsnhKo+MUBblpN+AtZHlWL
 cq9JC0YmAcvqMixBOytS70MIipczVbXaBPolqT2d/fGbbUbg7GDyPqYYi
 24SKXAQLzRf/o2UDyGjn4VNmOWg35YYal5F/pWsE5I9adZwBAeTdLFHNl
 RqmXG7jCO5WKzgkafnbxjLkmYG5b2fGH2r7GnfKNz2gswbkoI9gSDVnfI
 HKf0S0woEvX2Mf9ndLWTrKMK1quGYCWVs0s3/kWiCQldyeUrvelH0iSJk
 EiBV3Zu/bfxHnLd14gngm2V3fAdwCfJC0QN+jCA92tbemsUTaBEjsVXhW w==;
X-CSE-ConnectionGUID: IUIT4gHaTKaa/WOtWyHaAQ==
X-CSE-MsgGUID: PRvDwuVVRBWQP8iL7tQMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71390473"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71390473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:22 -0800
X-CSE-ConnectionGUID: Sx5dWnUJQMWlTYgOs0ywQg==
X-CSE-MsgGUID: IcSfFE1uQFKPvqlty0wo2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215020951"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:21 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/12] tests/kms: Convert remaining for_each_pipe() to
 for_each_crtc()
Date: Thu,  5 Feb 2026 15:30:07 +0200
Message-ID: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert the remaining for_each_pipe()s to for_each_crtc().

I had a lot of performance issues with coccinelle with this one,
so had to resort to some manual fixups here and there.

Ville Syrjälä (12):
  tests/intel/kms_frontbuffer_tracking: Convert to for_each_crtc()
  tests/intel/kms_legacy_colorkey: Convert to for_each_crtc()
  tests/kms: Convert problematic tests to use for_each_crtc()
  tests/kms: Use for_each_crtc() for inner loops
  tests/kms: Clean up some for_each_pipe() local 'crtc' variables
  tests/kms: Convert to for_each_crtc(), part 1
  tests/kms: Convert to for_each_crtc(), part 2
  tests/kms: Convert to for_each_crtc(), part 3
  tests/kms: Convert to for_each_crtc(), part 4
  tests/kms: Convert to for_each_crtc(), part 5
  tests/kms: Convert to for_each_crtc(), part 6
  lib/kms: Nuke for_each_pipe()

 benchmarks/kms_fb_stress.c                    |   8 +-
 lib/igt_kms.c                                 |  58 +++---
 lib/igt_kms.h                                 |  15 --
 tests/amdgpu/amd_dp_dsc.c                     | 191 ++++++++++--------
 tests/amdgpu/amd_freesync_video_mode.c        |  15 +-
 tests/amdgpu/amd_hotplug.c                    |  68 ++++---
 tests/amdgpu/amd_ilr.c                        |   8 +-
 tests/amdgpu/amd_link_settings.c              |   8 +-
 tests/amdgpu/amd_mode_switch.c                |  12 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  33 ++-
 tests/amdgpu/amd_plane.c                      |  37 ++--
 tests/amdgpu/amd_subvp.c                      |  32 +--
 tests/amdgpu/amd_vrr_range.c                  |   8 +-
 tests/chamelium/kms_chamelium_color.c         |  15 +-
 tests/chamelium/kms_chamelium_helper.c        |   8 +-
 tests/chamelium/kms_chamelium_hpd.c           |   6 +-
 .../kms_chamelium_sharpness_filter.c          |   6 +-
 tests/intel/kms_busy.c                        |   6 +-
 tests/intel/kms_cdclk.c                       |   6 +-
 tests/intel/kms_dirtyfb.c                     |  11 +-
 tests/intel/kms_dp_link_training.c            |   6 +-
 tests/intel/kms_dp_linktrain_fallback.c       |  13 +-
 tests/intel/kms_fbc_dirty_rect.c              |  25 ++-
 tests/intel/kms_flip_scaled_crc.c             |  32 ++-
 tests/intel/kms_frontbuffer_tracking.c        |  18 +-
 tests/intel/kms_joiner.c                      |   7 +-
 tests/intel/kms_legacy_colorkey.c             |  13 +-
 tests/intel/kms_pm_backlight.c                |   6 +-
 tests/intel/kms_pm_lpsp.c                     |  14 +-
 tests/intel/kms_psr.c                         |   8 +-
 tests/intel/kms_sharpness_filter.c            |   6 +-
 tests/kms_atomic_transition.c                 |  63 +++---
 tests/kms_bw.c                                |  29 +--
 tests/kms_colorop.c                           |  15 +-
 tests/kms_content_protection.c                |  25 ++-
 tests/kms_cursor_crc.c                        |   6 +-
 tests/kms_cursor_edge_walk.c                  |   5 +-
 tests/kms_cursor_legacy.c                     |  28 +--
 tests/kms_debugfs.c                           |  19 +-
 tests/kms_display_modes.c                     |  29 +--
 tests/kms_dither.c                            |  12 +-
 tests/kms_feature_discovery.c                 |  10 +-
 tests/kms_hdr.c                               |  33 +--
 tests/kms_lease.c                             |   9 +-
 tests/kms_plane_alpha_blend.c                 |   6 +-
 tests/kms_plane_lowres.c                      |  12 +-
 tests/kms_plane_multiple.c                    |  29 ++-
 tests/kms_properties.c                        |  48 +++--
 tests/kms_tiled_display.c                     |  10 +-
 tests/kms_vblank.c                            |   6 +-
 tests/kms_vrr.c                               |  12 +-
 tests/kms_writeback.c                         |   8 +-
 52 files changed, 592 insertions(+), 521 deletions(-)

-- 
2.52.0

