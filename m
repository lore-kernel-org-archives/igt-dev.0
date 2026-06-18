Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CB2CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70FD10EC4A;
	Thu, 18 Jun 2026 06:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOt0rPeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE0410EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764155; x=1813300155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1MXqaKjhUkVEgzCBi65qqjev8hy5oIwnBNehu+TSe6o=;
 b=YOt0rPeLs6xII2qHMwm1MgX12PurMXQT8CbcUgxuz2jaxFl9WaWk+qle
 ah7aml50MXUCtZOXkkMN6G1bRothkmgZpDygeBqZAcyBMNE6Twr7AWyie
 Z4fX3tMn1z0rQWvDFg5Rr8VXHkY8k07Nr7SVnGY+K6y1QIDWIW95Gz9zb
 AoEQ5rwQCiEqXuyaMMnLl0rCV7xoMEMnJdCd5GjxwiLZ0rw2gjYByjpMy
 3H/LTIjcQalc6tHjlYx4i72So6MUQPvpnzjzGNENgdRRfUT4HiNDUEKDU
 FWWIi2PaqlHfBgfT5GyFyM8SwN3u8e3SvVFeHDTsFu3mUU4kw58cH2bjr w==;
X-CSE-ConnectionGUID: RvMSjwtHTKaqJwqgVT0YyA==
X-CSE-MsgGUID: d1XUXhgrSTe8vPmr4yRKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485865"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:29:15 -0700
X-CSE-ConnectionGUID: roZPjAzTRC64lWvgaRw7uw==
X-CSE-MsgGUID: XoeuEdrAR4Cwiv3SBo28Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245342986"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:29:13 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v10 0/7] Enable and Add new tests for DC3CO
Date: Thu, 18 Jun 2026 11:58:57 +0530
Message-ID: <20260618062904.2789476-1-jeevan.b@intel.com>
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
v10: Remove TGL check for PSR2. 

Jeevan B (7):
  tests/intel/kms_pm_dc: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add dc3co framedrop validation test
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 310 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 326 insertions(+), 18 deletions(-)

-- 
2.43.0

