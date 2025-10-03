Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B20CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D150B10E10C;
	Fri,  3 Oct 2025 12:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FOFqXqsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164810E10C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493945; x=1791029945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gkhstu4CzIt09N4TLMf0u01wHz8tcPKwKJEBUnUaEvM=;
 b=FOFqXqsbVBahSD6OAXUGf5aZCTZLjF7qqdkECutAVuV2QaT+XEg5sZJM
 8RT9YI8oMk1vDtafeJK+I1VTf1mCZjORwnyDZoi9Xh6VmyOe+v/l7UiPW
 xQk+g4O4YoWriXZLo9ImD1qEnkevoJ3ztJyeFRseF2N8wMUTwj1ZMt2Xm
 SxybIewpyPk12T43mEcQWi0HENT5JNHbMJLsufCWtibqKBKdZeQ45M1ft
 c3K109Z3rimbuemx0qq1zDZQEtkjE2mXS4hjqBa3TW7YEbLsdCgZJKh95
 e9wSFL4g4vVA7ZqmZAwyjMfrAKYuTSfHHOtomlG5ZFi/UlesH67HSZ32t A==;
X-CSE-ConnectionGUID: +rb7cuCOQeiRLSubKRrGpg==
X-CSE-MsgGUID: aOexppexTTWsbsMy1F7RMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399218"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:04 -0700
X-CSE-ConnectionGUID: TfzfvdIZT/+ASF7vhx5jRA==
X-CSE-MsgGUID: hLQ3tJdLQROzaAQZscFe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300092"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:03 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 0/9] Add plane color pipeline tests for Intel hardware
Date: Fri,  3 Oct 2025 17:55:41 +0530
Message-Id: <20251003122550.729242-1-swati2.sharma@intel.com>
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
It contains all the changes in the series(v10) currently under review below

https://patchwork.freedesktop.org/series/123448/

This patch lays the ground work for incremental changes and Intel
specific pipeline changes followed in subsequent patches [2-9].

v2: -dropped CTM 3x3 colorop and used CTM 3x4 colorop instead
    -added new plane test with 1D LUT and CTM 3x4 colorops
v3: -rebase on v10

Bhanuprakash Modem (3):
  lib/colorops: Add support for 1D LUT multi-segmented
  tests/kms_color_helper: Add helpers to clear colorops data
  tests/kms_color: Add Intel plane pipeline tests with LUT1D (MULTSEG)
    and CTM

Harry Wentland (1):
  tests/kms_colorop: Color pipeline igt base work

Swati Sharma (5):
  drm-uapi: Add Color lut range attributes
  drm-uapi: Add 1D LUT multi-segmented color op
  lib/kms: Add support for COLOROP_HW_CAPS property
  tests/kms_color: Move color pipeline helpers into kms_color_helper
  tests/kms_color: Add Intel plane pipeline tests with LUT1D and CTM

 include/drm-uapi/amdgpu_drm.h |    9 -
 include/drm-uapi/drm.h        |   15 +
 include/drm-uapi/drm_mode.h   |  185 ++
 lib/drmtest.c                 |    5 +
 lib/drmtest.h                 |    1 +
 lib/igt_color.c               |  697 +++++
 lib/igt_color.h               |  152 +
 lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
 lib/igt_fb.c                  |   33 +-
 lib/igt_fb.h                  |    3 +
 lib/igt_kms.c                 |  379 ++-
 lib/igt_kms.h                 |   99 +
 lib/meson.build               |    1 +
 scripts/convert_3dlut.py      |   94 +
 tests/kms_color.c             |  348 ++-
 tests/kms_color_helper.c      |  383 +++
 tests/kms_color_helper.h      |   85 +-
 tests/kms_colorop.c           |  523 ++++
 tests/kms_colorop.h           |  193 ++
 tests/kms_properties.c        |   92 +-
 tests/kms_writeback.c         |   19 +-
 tests/meson.build             |    2 +
 22 files changed, 8215 insertions(+), 49 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 lib/igt_color_lut.h
 create mode 100755 scripts/convert_3dlut.py
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

-- 
2.25.1

