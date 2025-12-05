Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27AFD3748D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACF610EBA4;
	Fri,  5 Dec 2025 19:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C19UKBYu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441BB10EBA4
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963974; x=1796499974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fNbS3eLHAfi3zmIV1A1U565llBYztuBH4qe+EOVlhjU=;
 b=C19UKBYuID2KJ/IcTq9JEtf5/pgEAQh0l0vf68g9xK1XY17Cmm4GHqub
 iy8twDen5xBjKV7pZqJng9zLJmHd4yZIB4DhrSNj4ct0bYYA+NgHbOkKk
 T/IAOwMP58bk/TP2hKAiUGj2gnErek/9sa8FBQQDgiA01EueQuIVXxsD7
 9DGoaWFtvVy1kTts46/ueidSzIJ9bblKAOQ+5IjEKqCEKU7MHDS9wLV5k
 qP79iIgV3YEgUN5HEizcEizRDou877mDuNQfQmJS2VASsK8fqwEyU7vLQ
 wX0f5niG1QiyP3nZG4LoNOMVyGKUJ0gJ7VTQMGhmLyCJpWaEqz1M6Tfc9 A==;
X-CSE-ConnectionGUID: xVf+XGcdScisfMKRtZk3Mw==
X-CSE-MsgGUID: 7wyhP5jJQXGK/tq29xU4Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606644"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:14 -0800
X-CSE-ConnectionGUID: lPFIK1BnTwaioWPaChCWig==
X-CSE-MsgGUID: WVZgdq61Qzi6ufLWWbxfhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624860"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:12 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 00/13] Add plane color pipeline tests for Intel hardware
Date: Sat,  6 Dec 2025 01:22:59 +0530
Message-Id: <20251205195312.1234330-1-swati2.sharma@intel.com>
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

This series add plane color pipeline tests for Intel hardware.

v2: -dropped CTM 3x3 colorop and used CTM 3x4 colorop instead
    -added new plane test with 1D LUT and CTM 3x4 colorops
v3: -rebase on v10
v4: -splits the series into smaller, modular patches for
     easier review
    -introduces safe skips on platforms lacking KMD support
    -add 3D-LUT subtest
v5: -rebase on top on AMD's colorop changes
    -refactor color pipeline helpers

Swati Sharma (13):
  lib: refactor color pipeline helpers
  tests/kms_colorop_helper: Add helpers to clear colorops data
  tests/kms_colorop_helper: Add enum for LUT1D types
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
  tests/kms_colorop_helper: Skip custom 1D LUT fill on Intel devices
  tests/kms_color: Add 3D LUT subtest for green-only output with RGB
    traversal
  lib/kms: Skip when plane has invalid color pipeline

 lib/igt_color.c            |   40 +
 lib/igt_color.h            |   50 +-
 lib/igt_color_lut.c        | 9840 ++++++++++++++++++++++++++++++++++++
 lib/igt_color_lut.h        | 4917 +-----------------
 lib/igt_kms.c              |    4 +-
 lib/meson.build            |    1 +
 tests/kms_color.c          |  312 +-
 tests/kms_color_helper.c   |   47 +
 tests/kms_color_helper.h   |    5 +
 tests/kms_colorop.c        |  206 +-
 tests/kms_colorop.h        |  266 -
 tests/kms_colorop_helper.c |  435 ++
 tests/kms_colorop_helper.h |  125 +
 tests/meson.build          |    3 +-
 14 files changed, 10813 insertions(+), 5438 deletions(-)
 create mode 100644 lib/igt_color_lut.c
 delete mode 100644 tests/kms_colorop.h
 create mode 100644 tests/kms_colorop_helper.c
 create mode 100644 tests/kms_colorop_helper.h

-- 
2.25.1

