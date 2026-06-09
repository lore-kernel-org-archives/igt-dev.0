Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6BDCD8C85
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8C610E075;
	Tue,  9 Jun 2026 03:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBoKdIbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A7D10E075
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780976821; x=1812512821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V1/KgLf20b/oj5i/bz8nR4rox9XQqx00e2p0gF8Gg6s=;
 b=dBoKdIbOkgEdVOQnbQaCbEUopVBTEnr7knGwaa8X2m5DeOTbgKP/C/+7
 P1KAnm6IGzyMw6dfTaY6urpOMwVl1Wki6Gw1ELVQvUMNdHciZ5BdfTLPF
 QH2/WG/1LTcZ7elRqTSAoYDWyXJ8jtJfSC3ajfjf9HDjIflXY/Z1NdAyh
 kd8B7mfovSUyw8hHznDeXnEGn8holB+3N824CFOjx0McoMD2/51d8Fegn
 M6kCFMv5P5q7pvMCeKhns4u0APoEbzQS0itGZcUXoOBm5u+xoSdfZ6YJB
 yE1O1tF1PGJ8To30UHUNnlKSrV3oeG9nu4xzr8Q8JzT9REjGtpOnuVkeV g==;
X-CSE-ConnectionGUID: eqjjHM1XTceblErjLITapQ==
X-CSE-MsgGUID: uHKlgi03RR2byhqwhh6eog==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92050889"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="92050889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:47:00 -0700
X-CSE-ConnectionGUID: ZhL61oXUTiiExLENKnu40w==
X-CSE-MsgGUID: dpmHryodQIWi8L66UgDHZQ==
X-ExtLoop1: 1
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 20:46:58 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v9 0/7] Enable and Add new tests for DC3CO
Date: Tue,  9 Jun 2026 09:16:43 +0530
Message-ID: <20260609034650.2281712-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable DC3CO tests for PSR/PR for display versions >= 35, add a new
test for DC3CO to validate frame drops, and test DC3CO with LOBF.

v3: Adds a test to verify DC3CO continues to function properly
    after a DC6 power cycle and rename function name in first patch.
v4: Add a new test to verify DC3CO continues to funct
v5: Addressed review comments, clarified platform support wording.
    Simplified PSR mode handling and fixed output-aware PSR checks.
    Cleaned up and aligned new DC3CO test flows and guards.
v6: Addressed review comments.
v7: Fix framedrop test logic and dynamic block.
v8: Update commit message and test description.
v9: Replaced hardcoded values with global constants and updated
    logic for framedrop test.

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add dc3co framedrop validation test
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 322 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 338 insertions(+), 18 deletions(-)

-- 
2.43.0

