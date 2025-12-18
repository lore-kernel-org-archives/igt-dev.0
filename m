Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51056D6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0885B10E3E0;
	Thu, 18 Dec 2025 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HmYDCfT7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045E10E3E0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 19:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766086681; x=1797622681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=He4RcsnxPZ5Tn8DKoR6PqI/vXXcjYsceWT79vYYU51A=;
 b=HmYDCfT7QO6iz8oV6H3LvSFeEiVxx1gTPeaq7riKeMYVf2vpXKL6Wbjt
 3wNB33u3hh83NNCh0ZjPCHqkfNFMNjt8H+a3kuQvs0ywAtKZ0YGdzrPzV
 odmJAUHIr5Z/t8vG875Mnfat8wYP2OMyKi4TSTS4uJ0O36tlDAZDCC1ZH
 k0Qp/MGS1BqFQa0ivO9Kkcx2R4eVDs+VB1GV5a0ju4wN/eUFJMTU7EaGX
 SzHOQHtUIGUDsMyFGbH2hR3aA8HhZUihbFsU/EeNMh8SCtx54iAK6xEVa
 jMo2QpxK0D/sYd2+OH7uUgeqLEVmEFSdVxKOXstR6JOQfb1iAvpVBquAI A==;
X-CSE-ConnectionGUID: sjYNoUATR+mtjc5psyhrnQ==
X-CSE-MsgGUID: j3ursEZPSCOWpRGTKyELVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67244709"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67244709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 11:38:00 -0800
X-CSE-ConnectionGUID: 7eqqjam8SpW+JcpEQzU4fg==
X-CSE-MsgGUID: N65FatafQlebKpkSc3qzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198680594"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 11:37:58 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v6 0/8] Add plane color pipeline tests for Intel hardware
Date: Fri, 19 Dec 2025 01:14:54 +0530
Message-Id: <20251218194502.1306975-1-swati2.sharma@intel.com>
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
 tests/kms_color.c          |  279 +-
 tests/kms_color_helper.h   |    1 +
 tests/kms_colorop.c        |  206 +-
 tests/kms_colorop.h        |  266 -
 tests/kms_colorop_helper.c |  432 ++
 tests/kms_colorop_helper.h |  108 +
 tests/meson.build          |    3 +-
 12 files changed, 10738 insertions(+), 5427 deletions(-)
 create mode 100644 lib/igt_color_lut.c
 delete mode 100644 tests/kms_colorop.h
 create mode 100644 tests/kms_colorop_helper.c
 create mode 100644 tests/kms_colorop_helper.h

-- 
2.25.1

