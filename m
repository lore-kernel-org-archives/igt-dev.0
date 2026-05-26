Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0002ECD5BB4
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 06:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A402A10E49A;
	Tue, 26 May 2026 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhxMFCyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA6A10E4A2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 06:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779777762; x=1811313762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cg6lXpqFxDdAnPzeagc/9PoGvHvRKwb+f8yyFoh9lGI=;
 b=DhxMFCyZbL5cnEh44kn8bYAgAKCYT8mespBGVwXXtgPEouCxO+VcoVNt
 UU1rPuB4MDBaaFtbgOoCZQneRpW89RmysiasodrJz2cRG3mlOUUYFIjoz
 Gzg/jhvlOn0KgShp0MhPcz7yjL0ccCsVgOzN6OWprN9d3eba1NgidlUCS
 UG3Yp00+vDAbR4iZJc6VeYfOGd667Ti5MwHxy2T6yYnpOv8LpKwy/DkVx
 RM93ClSNhKmHkoPcdkjhvD9qLCuAFK390Bhs4dmrW5Imw2a7IFBg36ScS
 FVgdXf1vtQGDezQs6BwShMnOt55vrpYKemY0Q5b7z0hiikUZwtz9NtyAj A==;
X-CSE-ConnectionGUID: 1RRphWrbQzmyUQbiUha/CA==
X-CSE-MsgGUID: xb64GKEbTPGOkZRGPQ/bbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80617980"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80617980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:41 -0700
X-CSE-ConnectionGUID: uvQ/rYxmSeq90U6gc9vknA==
X-CSE-MsgGUID: n5ZmzBFAS2Oi3esKHKGLeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265689283"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 23:42:38 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v7 0/7] Enable and Add new tests for DC3CO
Date: Tue, 26 May 2026 12:10:57 +0530
Message-ID: <20260526064105.1818876-1-jeevan.b@intel.com>
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
v6: Addressed review comments.
v7: Fix framedrop test logic and dynamic block.

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 314 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 330 insertions(+), 18 deletions(-)

-- 
2.43.0

