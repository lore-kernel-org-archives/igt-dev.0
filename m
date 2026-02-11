Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2514ECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6936010E633;
	Wed, 11 Feb 2026 16:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ox8RFtEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDF410E62E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827649; x=1802363649;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RCHKIGBRaD93fKZprjGvAg/QwvFNgNbzv6GGhWVVKkQ=;
 b=Ox8RFtEvxEHUU9W40L03zCJvttnzIm1p+SLqFxScPCEYeVO7NPeKH0kG
 sevs7hEBnXQXEc925A8mTZQw00tDTpJghmc3RFV8ooMuECXoQHv4zuIc7
 9cDaxZ1CagWha/2Sl/OCXOceXqfiAXvEzprXkIWehd+avj7nydcnjQRz5
 +dnnRMjbh16OktFFAgtha2C98ASe6SoWTETDUatwqoLM2S5DelMmMMW4C
 iFiGm5evBAH9733HN+h74i0AL9DYHWkNTlmyye/aYMVWkPDLWriC4T4md
 XdVttzO2rGD+ZUtKxsnUT8MLV7p7iXWyWDpI5qEu1syvgbpS2tVuzgyqR A==;
X-CSE-ConnectionGUID: wmPBVZf7QQSosxczWi5+jQ==
X-CSE-MsgGUID: phUFCG7xTv2h7bOEPISR9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082134"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:09 -0800
X-CSE-ConnectionGUID: sf+kc80jRTaehkNYq6aYkA==
X-CSE-MsgGUID: 8kqIGhcdRqaRlt+OwhY+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405334"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:08 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/17] tests/kms: Use igt_crtc_t instead of enum pipe
Date: Wed, 11 Feb 2026 18:33:47 +0200
Message-ID: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Convert a bunch of tests to use 'igt_crtc_t' instead of
'enum pipe'.

Afterwards there are still quite a few unconverted tests
left that will need stringer cocci magic or manual conversion...

Ville Syrjälä (17):
  tests/kms_plane_alpha_blend: Use igt_crtc_t instead of enum pipe
  tests/kms: Remove unused 'pipe' function parameters
  tests/kms: Remove const qualifier from 'pipe' function parameters
  tests/intel/kms_busy: Use 'enum pipe' instead of 'int'
  tests/kms_atomic_interruptible: s/crtc/drm_crtc/
  tests/intel/kms_psr2_su: Use igt_crtc_t instead of enum pipe
  tests/intel/kms_dsc*: Use igt_crtc_t instead of enum pipe
  tests/kms_cursor_legacy: Use igt_crtc_t instead of enum pipe
  tests/kms_color*: Use igt_crtc_t instead of enum pipe
  tests/kms_atomic_transition: Use igt_crtc_t instead of enum pipe
  tests/kms_plane: Use igt_crtc_t instead of enum pipe
  tests/intel/kms_pipe_b_c_ivb: Use igt_crtc_t instead of enum pipe
  tests/kms_vrr: Use igt_crtc_t instead of enum pipe
  tests/kms_display_modes: Use igt_crtc_t instead of enum pipe
  tests/kms_rotation_crc: Use igt_crtc_t instead of enum pipe
  tests/kms_properties: Use igt_crtc_t instead of enum pipe
  tests/kms: Use igt_crtc_t instead of enum pipe

 tests/amdgpu/amd_freesync_video_mode.c |  31 ++-
 tests/chamelium/kms_chamelium_color.c  |  49 ++--
 tests/intel/kms_busy.c                 |  80 +++---
 tests/intel/kms_dsc.c                  |  15 +-
 tests/intel/kms_dsc_helper.c           |   8 +-
 tests/intel/kms_dsc_helper.h           |   3 +-
 tests/intel/kms_fence_pin_leak.c       |   7 +-
 tests/intel/kms_flip_scaled_crc.c      |  36 ++-
 tests/intel/kms_flip_tiling.c          |   4 +-
 tests/intel/kms_pipe_b_c_ivb.c         | 102 +++++---
 tests/intel/kms_pm_rpm.c               |   4 +-
 tests/intel/kms_psr2_su.c              |  24 +-
 tests/kms_atomic.c                     | 151 +++++++----
 tests/kms_atomic_interruptible.c       |  61 +++--
 tests/kms_atomic_transition.c          | 147 ++++++-----
 tests/kms_color.c                      |  46 ++--
 tests/kms_color_helper.c               |  23 +-
 tests/kms_color_helper.h               |   8 +-
 tests/kms_color_pipeline.c             |  10 +-
 tests/kms_concurrent.c                 |   8 +-
 tests/kms_content_protection.c         |   4 +-
 tests/kms_cursor_legacy.c              | 344 ++++++++++++-------------
 tests/kms_display_modes.c              |  30 +--
 tests/kms_dither.c                     |  25 +-
 tests/kms_flip_event_leak.c            |   4 +-
 tests/kms_panel_fitting.c              |  40 +--
 tests/kms_pipe_crc_basic.c             |  59 +++--
 tests/kms_plane.c                      | 185 +++++++------
 tests/kms_plane_alpha_blend.c          |  61 +++--
 tests/kms_plane_scaling.c              |  10 +-
 tests/kms_properties.c                 |  91 ++++---
 tests/kms_rmfb.c                       |   8 +-
 tests/kms_rotation_crc.c               |  42 +--
 tests/kms_scaling_modes.c              |   8 +-
 tests/kms_universal_plane.c            |  81 +++---
 tests/kms_vrr.c                        |  98 +++----
 36 files changed, 1052 insertions(+), 855 deletions(-)

-- 
2.52.0

