Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A61CFA475
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEDD10E071;
	Fri, 21 Nov 2025 05:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ii9QGyLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2D010E058
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703651; x=1795239651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=40LUMq+mvO25EfAT+DOqjDmh4K9fv6vXoVVOSFh0M2Q=;
 b=ii9QGyLyri8A/3UikDtkxrGObUV0eJHZPO+2DWVUtDik52imOqtuj5Ym
 UcNzSs5FgEpHmiUx+LpetprJx/CpoFa+SFTPfBcD7Nn7aZQihJ2B/PMXH
 nj1iPyJ65GIj6whosRZcQvtGczcy1WPdS/2NHqp392WtdhsnzP/FqIxi3
 H3z+ll0tBaSkn68TagLtt7kj8Nn4+r2HyHkZWpc1BLxKknDOVvm9Z6fjO
 Es/+WSMpX94xvBTu2rTtB+/jOtdZo435X2a2EUycYdH40P9dd2PW4oKrf
 7aLrXikBR0FTkwMFC77ZjPeKcb/leAUwH40YTTqZJ2spbCY3TXyMPQECJ g==;
X-CSE-ConnectionGUID: Vh5He8QYSAiwU1L0XITl4w==
X-CSE-MsgGUID: lzqxfgFcRbmhDyUh2VSXGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658143"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:49 -0800
X-CSE-ConnectionGUID: Xy54htjIRZ2gvLtechhwNg==
X-CSE-MsgGUID: UxYD1IeOR0u9rSYk2eDz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961779"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:40:47 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 00/12] Add writeback changes for intel-supported
 formats
Date: Fri, 21 Nov 2025 11:28:27 +0530
Message-ID: <20251121055839.3116906-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series introduces validation for writeback functionality
across newly supported formats specific to Intel platforms.
existing functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.
Add negative test cases to validate format and mode.Refactored
existing test cases to improve efficiency.

Sowmiya S (12):
  tests/kms_writeback: Add support for intel-specific formats
  lib/igt_fb: Validate supported formats for crc calculation
  tests/kms_writeback: Validate supported formats
  tests/kms_writeback: Add intel specific check
  tests/kms_writeback: Refactor format handling in commit_and_dump_fb
  tests/kms_writeback: Add utility function for shared logic
  tests/kms_writeback: FB creation within subtest
  tests/kms_writeback: Refactor writeback-fb-id subtest
  tests/kms_writeback: Refactor writeback-check-output subtest
  tests/kms_writeback: Add negative test case for invalid-format
  tests/kms_writeback: Add negative test for invalid-mode
  tests/kms_writeback: Refactored writeback-pixel-format

 lib/igt_fb.c          |   9 +-
 tests/kms_writeback.c | 339 ++++++++++++++++++++++++++++--------------
 2 files changed, 234 insertions(+), 114 deletions(-)

-- 
2.43.0

