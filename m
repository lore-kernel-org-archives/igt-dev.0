Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068A3CE8D60
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B488B10EAD9;
	Fri, 14 Nov 2025 17:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTxfg6HE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AC810EAD9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140942; x=1794676942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GoDFN8a/epEvA3kxAhe4GeXFAyYXe2+nZ8qxkUnDTbI=;
 b=fTxfg6HE6WSywUv/Vx8jJhTT5ta4CiDu14pBNEchQf3i1W5oHTwMO5hr
 9PY+7QPzKcz5Z6yj6ayIKjljol8VkiMrVt1HQx0yBQrmUA4YRri775E8T
 kEhPuKZV6VGC4hEZyODgbqnzdrjeG4gveHYvJjO/DM3PpfpagtQNB6gVv
 Ng99hq8ezALKtruioXiNfRg8bdw0Io3DbeYso28UL298nhZK538NEu3Bx
 fbZrFKgFk1z+lsjeqg7KfTK2c2O/CPgP/XDmyMvcTwCz48uWqUnuvSJsi
 /gs3006T3ocjFv2EWuPYswZkTCK756DpUq78/8pDBt9t5+CRXsWoCdpy5 w==;
X-CSE-ConnectionGUID: qAk4XSCCQHKVnyHqVa+EKw==
X-CSE-MsgGUID: jAsePwdTQ8K+htc6xfwhFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871430"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:21 -0800
X-CSE-ConnectionGUID: ElrWlNl4TqOCbpxOJ8QEhQ==
X-CSE-MsgGUID: Fy+BzDmlSYOF2bx60a6OsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981339"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 00/23] Add plane color pipeline tests for Intel hardware
Date: Fri, 14 Nov 2025 22:58:45 +0530
Message-Id: <20251114172908.1027816-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Patch [1/23] is the squashed patch based on the series sent out by Alex Hung.
It contains all the changes in the series(v10) currently under review below

https://patchwork.freedesktop.org/series/123448/

This patch lays the ground work for incremental changes and Intel
specific pipeline changes followed in subsequent patches [2-9].

v2: -dropped CTM 3x3 colorop and used CTM 3x4 colorop instead
    -added new plane test with 1D LUT and CTM 3x4 colorops
v3: -rebase on v10
v4: -splits the series into smaller, modular patches for
     easier review
    -introduces safe skips on platforms lacking KMD support
    -add 3D-LUT subtest

Bhanuprakash Modem (1):
  tests/kms_color_helper: Add helpers to clear colorops data

Harry Wentland (1):
  tests/kms_colorop: Color pipeline igt base work

Swati Sharma (21):
  tests/kms_color: Move color pipeline helpers into kms_color_helper
  tests/kms_color_helper: Add enum for LUT1D types
  tests/kms_color_helper: Add helper to convert coefficients to
    drm_color_lut32
  tests/kms_color: Add helper to prepare LUT data for colorops
  tests/kms_color: Add helper to clear LUT data from colorops
  tests/kms_color: Add helper to check if pipeline contains only CTM
    colorop
  tests/kms_color: Add test_plane_colorops() helper to validate plane
    color operations
  tests/kms_color: Add helper for plane color pipeline tests
  tests/kms_color: Add Intel plane pipeline tests with LUT1D and CTM
  tests/kms_color_helper: Skip custom 1D LUT fill on Intel devices
  tests/kms_color: Add 3D LUT subtest for green-only output with RGB
    traversal
  drm-uapi: Add Color LUT range attributes
  drm-uapi: Add 1D LUT multi-segmented color op
  lib/kms: Add support for COLOROP_HW_CAPS property
  lib/color: Add multisegment 1D LUT type and info structures
  lib/igt_color: Add helper to set multisegment 1D LUT
  tests/kms_color_helper: Add support for DRM_COLOROP_1D_LUT_MULTSEG
  tests/kms_color_helper: Add LUT segment data utilities for multiseg
    tests
  tests/kms_color: Add Intel plane pipeline tests with LUT1D (MULTSEG)
    and CTM
  lib/kms: Skip when plane has invalid color pipeline
  tests/kms_color: Skip multisegment LUT1D setup when colorop is missing

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  185 +
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  697 +++
 lib/igt_color.h               |  152 +
 lib/igt_color_lut.h           | 9862 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   33 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  379 +-
 lib/igt_kms.h                 |   99 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_color.c             |  376 +-
 tests/kms_color_helper.c      |  368 ++
 tests/kms_color_helper.h      |   85 +-
 tests/kms_colorop.c           |  523 ++
 tests/kms_colorop.h           |  193 +
 tests/kms_properties.c        |   92 +-
 tests/kms_writeback.c         |   19 +-
 tests/meson.build             |    2 +
 22 files changed, 13141 insertions(+), 52 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.25.1

