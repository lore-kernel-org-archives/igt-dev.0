Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0025C83F03
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E646310E102;
	Sun,  6 Jul 2025 19:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pfvi4VGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6910E102
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831690; x=1783367690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zGVmpegV1PTCdyMegAmuT2vYM9+ALte+RoOJ3ntCk64=;
 b=Pfvi4VGRcInm9qdI1i2Ow6f9uEyuT00M6psGjqLEWdMFNZSNztFcIkYc
 MhYKuPDP4I4RqABYIuEj1rOq9Mdp0uejj+MTjYRvXQK7HtydfdPHPQnVC
 zJrE0GhJjIT65fVFCiGnG2R2IUQ18/NA3w7mm+BcL2b5iv4lGnFUHFSGR
 Wen+unxbdU66q8yhhvF5Ebn7CDX6bKA7YQSV5pkPDjWNdeqcxgm59H3tH
 Hddd7kp+4LvT6o9k82Ii9hCEChuJmlemC50kzS0eauNS6zMaOBOHorYV0
 SAE+BoHl8E7Iq56oe/cNk2m94/e29nGjZ0X18lYbMf12VRB6IZOAjIQ9/ Q==;
X-CSE-ConnectionGUID: LFMaXpuFTbaP/En1n9Lgjg==
X-CSE-MsgGUID: zzchmTxESpCh1bctbhD4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983006"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:50 -0700
X-CSE-ConnectionGUID: 2DyRJIR5QrGs/Bv2GigozA==
X-CSE-MsgGUID: oOyXuHT/QWqHrXxvW74trg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064758"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:49 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/9] Add plane color pipeline tests for Intel hardware
Date: Mon,  7 Jul 2025 01:31:16 +0530
Message-Id: <20250706200125.35741-1-swati2.sharma@intel.com>
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

Patch [1/9] is the squashed patch based on the series sent out by Alex Hung.
It contains all the changes in the series(v9) currently under review below

https://patchwork.freedesktop.org/series/123448/

This patch lays the ground work for incremental changes and Intel
specific pipeline changes followed in subsequent patches [2-9].

v2: -dropped CTM 3x3 colorop and used CTM 3x4 colorop instead
    -added new plane test with 1D LUT and CTM 3x4 colorops

Bhanuprakash Modem (4):
  lib/colorops: Move few helpers to common place to reuse
  lib/colorops: Add support for 1D LUT multi-segmented
  tests/kms_color_helper: Add helpers to clear colorops data
  tests/kms_color: Add Intel plane pipeline tests with LUT1D (MULTSEG)
    and CTM

Swati Sharma (5):
  tests/kms_colorop: Color pipeline igt base work
  drm-uapi: Add Color lut range attributes
  drm-uapi: Add 1D LUT multi-segmented color op
  lib/kms: Add support for COLOROP_HW_CAPS property
  tests/kms_color: Add Intel plane pipeline tests with LUT1D and CTM

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  183 ++
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  672 +++++
 lib/igt_color.h               |  119 +
 lib/igt_color_lut.c           | 4927 +++++++++++++++++++++++++++++++++
 lib/igt_color_lut.h           |   28 +
 lib/igt_fb.c                  |   34 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  403 ++-
 lib/igt_kms.h                 |  101 +
 lib/meson.build               |    2 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_color.c             |  348 ++-
 tests/kms_color_helper.c      |  401 +++
 tests/kms_color_helper.h      |  110 +
 tests/kms_colorop.c           |  703 +++++
 tests/kms_properties.c        |   94 +-
 tests/kms_writeback.c         |   38 +-
 tests/meson.build             |    2 +
 22 files changed, 8225 insertions(+), 67 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.c
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c

-- 
2.25.1

