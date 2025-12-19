Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E895DD767DB
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 11:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1610EBA1;
	Fri, 19 Dec 2025 11:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IEQOpJJ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418B10E453
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766143140; x=1797679140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fGCnA+JiufvwBQBy2PTNpZm26G51/x0aaGAlytGUb1s=;
 b=IEQOpJJ5aFMBKsZsfmiaqSyxVfV8cozjGhmYOLOsxjcvRHhgu6CxYuGc
 j6A9hKc/+4rM1kpOSDfMXF5PW1fwmu7Za7GLBiJu0YLby2Mwp30Cg5aDS
 ItAg0jhrCusUy0q/NotPtft2or91/fiZLcGNV+cyU0QT7T+wzPiBaAP6W
 RieQ4apk8xsnsBrC9OCyl/WR7isL+2Af2rfbyjvCoMh6O0ILSHqIJMwei
 YDSPf2JWLwmQVS3+/a83MpGdRUY4fsuMI+Y8K1mxv3p1se92Q4Hc+yKXb
 12xd7BBV+6MU5YMKYH1AhCLSchHTRrpWxetl+LTMlD8f5iXzHTV4KRbxU A==;
X-CSE-ConnectionGUID: yg3Cf9LgSiu8LrW3sLyiew==
X-CSE-MsgGUID: AsvUYcwlRkuKQCJ7XwnLnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78816163"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78816163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:19:00 -0800
X-CSE-ConnectionGUID: 0MuLvnFxRqWX+B4N1Dzjkw==
X-CSE-MsgGUID: OzvIlXlzQEibWbYItMfcKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203235420"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:18:59 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v7 0/8] Add plane color pipeline tests for Intel hardware
Date: Fri, 19 Dec 2025 16:55:58 +0530
Message-Id: <20251219112606.1330425-1-swati2.sharma@intel.com>
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
v6: -reused frame work by defining igt_color_tf for
     linear and max
    -improved commit messages
v7: -rebase

Swati Sharma (8):
  lib: refactor color pipeline helpers
  tests/kms_colorop_helper: Add helpers to clear colorops data
  tests/kms_color: Add helper to check if pipeline contains CTM colorop
  tests/kms_color: Add test_plane_colorops() helper to validate plane
    color operations
  tests/kms_color: Add helper for plane color pipeline tests
  tests/kms_color: Add Intel plane pipeline tests with LUT1D and CTM
  tests/kms_colorop_helper: Cast pixel values to double
  tests/kms_color: Add 3D LUT subtest for green-only output with RGB
    traversal

 lib/igt_color.c            |   59 +
 lib/igt_color.h            |   54 +-
 lib/igt_color_lut.c        | 9839 ++++++++++++++++++++++++++++++++++++
 lib/igt_color_lut.h        | 4917 +-----------------
 lib/meson.build            |    1 +
 tests/kms_color.c          |  277 +-
 tests/kms_color_helper.h   |    1 +
 tests/kms_colorop.c        |  206 +-
 tests/kms_colorop.h        |  266 -
 tests/kms_colorop_helper.c |  432 ++
 tests/kms_colorop_helper.h |  108 +
 tests/meson.build          |    3 +-
 12 files changed, 10736 insertions(+), 5427 deletions(-)
 create mode 100644 lib/igt_color_lut.c
 delete mode 100644 tests/kms_colorop.h
 create mode 100644 tests/kms_colorop_helper.c
 create mode 100644 tests/kms_colorop_helper.h

-- 
2.25.1

