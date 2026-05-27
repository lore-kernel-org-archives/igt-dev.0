Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93753CD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 08:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1AA10E167;
	Wed, 27 May 2026 08:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SY0UVj/e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E212B10E167
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 08:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779871848; x=1811407848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MOlS6X/0LskorM3S9sMbZB8unF2FygrlWyKwZXRn18Q=;
 b=SY0UVj/eeBZpu/+eQJydJqMu5hr1/G7eJZD9sd6Fmy8fvWNgdGZC0CVQ
 Afm9V98txKq7WNzQ3y54F0l+60SayCkaZv/i3nfCFMeUp5ZBxfjH9IqX6
 G6/knmLApn+DwoEOJlo6WjwThFQgz4joz2r8L59PEBY/FH0bX0lvpAmRT
 2gMorvUMYToTHl+A4bvw3vp2kPaVq8h/TLHiAHAGhzRGS+Sc3ROGVYo3J
 HdG4e8oLCRK+olUq3BKYj/vlqoh0vWkdMGBQDgH8LsHKQoPSyjNd7FvYL
 SRO78GXezRBwjxrOeS6jFsPQZ+tMtJgj+I1E8v6zaU3pXfhp5P+U+dKUc g==;
X-CSE-ConnectionGUID: Qo4HPduOSI2An221AVAokA==
X-CSE-MsgGUID: 1AUc1gHET0ycKQilC8TCyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91268705"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="91268705"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 01:50:46 -0700
X-CSE-ConnectionGUID: S4YClI+hShO85eYxntQrEQ==
X-CSE-MsgGUID: SVfL4F2MRiST5MKEIrAbJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="244003645"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 01:50:44 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v8 0/7] Enable and Add new tests for DC3CO
Date: Wed, 27 May 2026 14:19:08 +0530
Message-ID: <20260527084915.1916365-1-jeevan.b@intel.com>
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
v8: Update commit message and test description.

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add dc3co framedrop validation test
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 314 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 330 insertions(+), 18 deletions(-)

-- 
2.43.0

