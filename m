Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B161CD37B6
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CCA10EC91;
	Wed, 13 May 2026 06:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVkukodU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35AC10ECAD
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653067; x=1810189067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KYFLDSHO7jx6QjvwZflhT0d5u+erGhW8XGPNXTUmZns=;
 b=ZVkukodUy1xci5iJkyRjMsPtHTzIAo7pRnO/YavNSCChvsd6fbYBg1HS
 udU1vGzbIH3GNsyyeSEIpsdKmutHxeSCV4EeOWVr2J/lxPjGgilVryETC
 IPKMRWid2aBwdYLBkj0mqp8qRqoH4fatSmDKfnvohQaTHD0twmcJmQa5j
 MZYi/TVhPcuFI35a+p/cDdA26VXOqDZpXtnorD1pqL77b23yHcO6D/RBw
 ZK29QN+44Tjcrp0SqPxMvlPgZ0HGPTwbOpPGB+bX21ghZbMfUCYMXOQOU
 b0tM4sM4pxZopuA6QVCOxErmf7Wdnbz5ZKdE+7z9SP6ns7BCKlLNzeHa0 A==;
X-CSE-ConnectionGUID: uxnfaeO3RUOCo/xRAi7/DA==
X-CSE-MsgGUID: plK4M5qbTIq+99Qf/cDbNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79685119"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79685119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:17:46 -0700
X-CSE-ConnectionGUID: 4DqcyfzhSnOHmZPgQVuwTg==
X-CSE-MsgGUID: 1ScFbj6uQdygdB+dtC+pxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="235320942"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 23:17:44 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v5 0/7] Enable and Add new tests for DC3CO
Date: Wed, 13 May 2026 11:45:58 +0530
Message-ID: <20260513061605.645695-1-jeevan.b@intel.com>
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

Enable DC3CO tests for PSR/PR for display versions >= 35, add a new
test for DC3CO to validate frame drops, and test DC3CO with LOBF.

v3: Adds a test to verify DC3CO continues to function properly
    after a DC6 power cycle and rename function name in first patch.
v4: Add a new test to verify DC3CO continues to funct
v5: Addressed review comments, clarified platform support wording.
    Simplified PSR mode handling and fixed output-aware PSR checks.
    Cleaned up and aligned new DC3CO test flows and guards.

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 302 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 319 insertions(+), 17 deletions(-)

-- 
2.43.0

