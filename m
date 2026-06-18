Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F034CD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A81110EC4A;
	Thu, 18 Jun 2026 06:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfA2RqEG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D57810EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764078; x=1813300078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1MXqaKjhUkVEgzCBi65qqjev8hy5oIwnBNehu+TSe6o=;
 b=MfA2RqEGa6XRaymLnrOwD/3T0hQe/zEh0XujokAeoA1EbFpG+3yf6ePA
 Y77AI6X6LUSwclXPpDF4yJJjCnYtdPKdiEYmeSnuV8ywNqsXmMIpgPgSl
 z1HHWV74nhtiIjLlfQ/NtPi6lola2Jom1UdH+PdDZYacDwSzxJVhatwW3
 MEyhvR9CFZ0F6NPkhD2t61aQ3EaQolM/EjccYd+delEsgYgihyzRmFCiH
 L66j4wwOcENAQYnXrsftUDdjEGgI4ANnPZMm0Nipwxtc816InbtV7kQHR
 oyQrzswtF1Rcg6Su+VZP6/wYvWDt5NJy09nV+a9Z/VUYUsgrFemsNia5v g==;
X-CSE-ConnectionGUID: AvcS+Yg9Tui7mkIrRQSwzA==
X-CSE-MsgGUID: ZBiE29/rT5uitXkdOqHWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82358314"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82358314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:27:58 -0700
X-CSE-ConnectionGUID: LMu0IU4VSaarhRyUKJD+fA==
X-CSE-MsgGUID: X/m45HO4TpyfLABUCGl42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="253381024"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:27:56 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v10 0/7] Enable and Add new tests for DC3CO
Date: Thu, 18 Jun 2026 11:57:42 +0530
Message-ID: <20260618062749.2789015-1-jeevan.b@intel.com>
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

