Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165CCFDEE31
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 17:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93AA10E36B;
	Thu, 23 Apr 2026 17:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvnJAZKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA2A10E36B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776965758; x=1808501758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWq2w88qR38JWcA90DrN8d4MAg9XVyitbwnNO6MavaI=;
 b=DvnJAZKOza3yFaV9AgScV4nee5HjZDh6Hh8jU/vfqjW2vIlGANqb++fR
 6mKRAOkw1JdzNWJNdzT2fA3qaTvE1/GDNlVSL+JUOGABRNn8suON3c4LY
 cZV8TXEZKEx9GHb5ebipM7C1zEhFty7cb5zBll5CHjzxNYKBOGIeD26h8
 DgGVFCFxWfnDTgI8fCtmQhoePSpDGjZ63dmNIhP/Bl8lS1A+7Sc0vqctz
 xTcNNIEVLWDHH5IFS4dvNMitRmjJkW66YaP1wIZDbTO+Mdla/otlQb3LS
 lnWmVVautV7MAATJdofhKsafMQ+Evie0jfkDspc1NzgyzcED0/fjK9lt9 Q==;
X-CSE-ConnectionGUID: +xC0wlKnQhC/b15/ZL2sQA==
X-CSE-MsgGUID: 00iJAmJKSAyC2MjFz5P3Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="78134672"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="78134672"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:35:58 -0700
X-CSE-ConnectionGUID: U0u9AA1+S0iBWNH66AHr1g==
X-CSE-MsgGUID: sf84OFC1Rte6SKS7pOnSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="229527283"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 10:35:55 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com,
 jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v3 0/6] Enable and Add new tests for DC3CO
Date: Thu, 23 Apr 2026 23:03:57 +0530
Message-ID: <20260423173403.123706-1-jeevan.b@intel.com>
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

Jeevan B (6):
  tests: s/check_dc_counter/assert_dc_counter
  tests/intel/kms_pm_dc: Replace require with proper assertion
  tests/intel/kms_pm_dc: Enable DC3CO test for PSR2/PR modes
  tests/kms_vrr: Add new test for DC3CO validation with LOBF
  tests/intel/kms_pm_dc: Add new test for dc3co framedrop validation
  RFC: tests/intel/kms_pm_dc: Add new test for DC3CO recovery after DC6

 tests/intel/kms_pm_dc.c | 237 ++++++++++++++++++++++++++++++++++++----
 tests/kms_vrr.c         |  33 ++++++
 2 files changed, 250 insertions(+), 20 deletions(-)

-- 
2.43.0

