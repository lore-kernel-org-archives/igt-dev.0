Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2BBD46977
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F226610E99F;
	Thu, 22 Jan 2026 12:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5f+wjPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A0510E9A3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086781; x=1800622781;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcwpQqhBmzt8L12K8pDuMnohZcz6A13fLAKfA5pd+mk=;
 b=C5f+wjPT0IhpHUlL6rMWMcYd/oTF9GT/aLySlfHzIDikwRpTkm7jpL+3
 Pcx48ZZz1DjIVrEzx1Vo+wOYHu9K8bXLzol9KEvDyXcgGMmruJIE0gsW7
 ngHkpRc3scVeybFzgwFGad//lQffLeIomljG6IUNs8sdJCb0kI1xiCuUJ
 Sdpy3qusoSKTdJjnO4DmWJ2TEkN2e/Lg8DLjbOJs5MkYPHVZiGVVxJmQs
 fKFQPdSjFzHwGGB+73aP8lEApOXCgenaC4Ws2uLhUGFlPQq/yeHNBvmO6
 xdPSLQIzAfo2YAM7Aupfxey9p4lEmSIQdBzrKG7Sc11aLE6s/NMkGqCc3 Q==;
X-CSE-ConnectionGUID: MSxeY9+UQyqUK++cxpoCRw==
X-CSE-MsgGUID: kIwKfdQQREaRTVTmsy6F7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045318"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:41 -0800
X-CSE-ConnectionGUID: PzpUTP5DRWe9a73ZT0SvXQ==
X-CSE-MsgGUID: KaMK/eMNSKq3ebPRsCn3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987010"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:39 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 00/10] lib/kms: More pipe->crtc renaming
Date: Thu, 22 Jan 2026 14:59:26 +0200
Message-ID: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

To get more clarity on where we still use pipes (as opposed
to crtcs) start renaming variables/struct members to use the
'crtc' name where appropriate.

Ville Syrjälä (10):
  tests/kms_content_protection: Convert igt_pipe_is_free() to
    igt_crtc_is_free()
  lib/kms: Hide output->pending_pipe from tests
  lib/kms:
    s/igt_output_get_driving_pipe()/igt_output_get_driving_crtc()/
  lib/kms: s/n_pipes/n_crtcs/
  lib/kms: Rename display->pipes[] to display->crtcs[]
  lib/kms: Rename plane->pipe to plane->crtc
  lib/kms: Rename old_pipe to old_crtc
  lib/kms: Rename 'pipe' variables to 'crtc'
  lib/kms: Rename 'pipe[]' variables to 'crtc[]'
  lib/kms: Use igt_crtc_name() where appropriate

 lib/igt_kms.c                                 | 619 +++++++++---------
 lib/igt_kms.h                                 |  76 ++-
 tests/amdgpu/amd_abm.c                        |   8 +-
 tests/amdgpu/amd_assr.c                       |   8 +-
 tests/amdgpu/amd_bypass.c                     |  16 +-
 tests/amdgpu/amd_color.c                      |  30 +-
 tests/amdgpu/amd_cursor_overlay.c             |  20 +-
 tests/amdgpu/amd_dp_dsc.c                     |  10 +-
 tests/amdgpu/amd_hotplug.c                    |  19 +-
 tests/amdgpu/amd_ilr.c                        |  10 +-
 tests/amdgpu/amd_link_settings.c              |   6 +-
 tests/amdgpu/amd_mall.c                       |  10 +-
 tests/amdgpu/amd_max_bpc.c                    |  10 +-
 tests/amdgpu/amd_mem_leak.c                   |   8 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  10 +-
 tests/amdgpu/amd_odm.c                        |   9 +-
 tests/amdgpu/amd_plane.c                      |  29 +-
 tests/amdgpu/amd_psr.c                        |  14 +-
 tests/amdgpu/amd_replay.c                     |   8 +-
 tests/amdgpu/amd_subvp.c                      |   8 +-
 tests/chamelium/kms_chamelium_color.c         |  62 +-
 tests/chamelium/kms_chamelium_helper.c        |  12 +-
 .../kms_chamelium_sharpness_filter.c          |   8 +-
 tests/intel/gem_eio.c                         |   2 +-
 tests/intel/gem_exec_reloc.c                  |   2 +-
 tests/intel/gem_pxp.c                         |  18 +-
 tests/intel/kms_big_fb.c                      |   8 +-
 tests/intel/kms_busy.c                        |   2 +-
 tests/intel/kms_cdclk.c                       |   6 +-
 tests/intel/kms_flip_scaled_crc.c             |  10 +-
 tests/intel/kms_pm_lpsp.c                     |   2 +-
 tests/intel/kms_sharpness_filter.c            |  15 +-
 tests/intel/xe_pxp.c                          |  28 +-
 tests/kms_atomic.c                            | 247 ++++---
 tests/kms_atomic_interruptible.c              |  18 +-
 tests/kms_atomic_transition.c                 |  39 +-
 tests/kms_bw.c                                |  12 +-
 tests/kms_color.c                             | 149 ++---
 tests/kms_color_helper.c                      |  78 +--
 tests/kms_color_pipeline.c                    |  24 +-
 tests/kms_concurrent.c                        |  19 +-
 tests/kms_content_protection.c                |   9 +-
 tests/kms_cursor_legacy.c                     |  18 +-
 tests/kms_debugfs.c                           |   2 +-
 tests/kms_dither.c                            |   8 +-
 tests/kms_feature_discovery.c                 |   2 +-
 tests/kms_hdr.c                               |  12 +-
 tests/kms_multipipe_modeset.c                 |  16 +-
 tests/kms_plane.c                             |  12 +-
 tests/kms_plane_cursor.c                      |  15 +-
 tests/kms_plane_multiple.c                    |  30 +-
 tests/kms_plane_scaling.c                     |  15 +-
 tests/kms_sequence.c                          |   2 +-
 tools/amd_hdmi_compliance.c                   |   8 +-
 54 files changed, 980 insertions(+), 858 deletions(-)

-- 
2.52.0

