Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8074FCD4F48
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2622D10F56A;
	Fri, 15 May 2026 15:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqM+8gd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B496710F56A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778859219; x=1810395219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GlVS/JbXzzwyWhii0lpljTO+T9e3yGCqIR0pRjUJb/4=;
 b=nqM+8gd3q1e/BHKjgQpeakiuI+bX70l4+8xo551tXRbJWtCw68NlMFaJ
 Z23GdwSgv8gm1J+5XepH7g15MpHodIl1XPfTC0qLmzOZV73EEJdCbM/sp
 azAr0Mq5I7VIfXfaE2rJF4uEQnvKLpKOQRapMoeSfD8uPLfNZJiYuwvrD
 dIkR6ugTNuvBuQdtXWtLn7IQ7aqorG/wXtWLxxmjthF34WQsaWrM4e2dM
 PV+hMcmKj9ByAjlsXlqQ/Bq4Fw5DVTxrREvlz7zY3Djc3RDNQpFj2r+Zu
 hozDX8YAH6xpD9Hm8m4RFnSepvqvCX5PMW27Q+8y9QoJeg8ZqZFQuD9hy g==;
X-CSE-ConnectionGUID: Zxac9qWYQj6oN2RkUtyQSg==
X-CSE-MsgGUID: L8GRUp8uRhiHa5ew5K2JjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79671719"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="79671719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:33:39 -0700
X-CSE-ConnectionGUID: Ngwc639xS5+56b87+3DkYw==
X-CSE-MsgGUID: UOFvT04GQoqAFqJlAbwL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="235678003"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:33:37 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v6 0/7] Enable and Add new tests for DC3CO
Date: Fri, 15 May 2026 21:01:52 +0530
Message-ID: <20260515153159.838667-1-jeevan.b@intel.com>
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

Jeevan B (7):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation
  tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6
  tests/intel/kms_pm_dc: Add dc3co-vpb-framegap subtest

 tests/intel/kms_pm_dc.c | 292 +++++++++++++++++++++++++++++++++++++---
 tests/kms_vrr.c         |  34 +++++
 2 files changed, 309 insertions(+), 17 deletions(-)

-- 
2.43.0

