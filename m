Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0DCC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 12:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853410E463;
	Wed, 14 Aug 2024 12:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilMlznR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E9310E463
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723638498; x=1755174498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LCwnUeTM0m0l2D1w6pcrsxGKnbo5VAZDp8Cp5W9f7Ho=;
 b=ilMlznR1vva6GUfqjyc9vyKwaIEAFgq8v0b/R4UCo4jyC4kMOSDlbnFI
 GqkqIfhNVdFl6syz1mIGwEPRnzQtdd8KC0bB8x3MJQjidZs0UK1hmWBEw
 RVh6FxKLw6ukQ2s3DBDsF3BtPG8KN/6IidajfTMa+MjYa8JjYZTkB9RhJ
 FFc0ucHdWFACHI914upwSp1GBiYMbMnKjXzObFMisIsh17fHPWc0NvmBZ
 pWH6plNsXtwOR1JZtfHITmGHOgJmAwyV9YVuMQ5ZB+vEsmLrbuAZheJPO
 i6FITka8irS1Hl3zVLfUnY4tjl5MXzP8OSTWZRCFWdgn888DYLvxJqfqU A==;
X-CSE-ConnectionGUID: W67YhjcLQvWkmpAH914tqA==
X-CSE-MsgGUID: KO9xqpZQQTKoKq50JGhgeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="33256525"
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="33256525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 05:28:17 -0700
X-CSE-ConnectionGUID: zr/iWsULT9SiVt5w9yvKeA==
X-CSE-MsgGUID: moL5kgE2S6uQRtw1y8Cu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,145,1719903600"; d="scan'208";a="59758310"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa008.jf.intel.com with ESMTP; 14 Aug 2024 05:28:15 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, himanshu.girotra@intel.com,
 riana.tauro@intel.com
Subject: [PATCH i-g-t, v6 2/2] HAX/DO_NOT_MERGE: xe-fast-feedback: test
 xe_sysfs_preempt_timeout
Date: Wed, 14 Aug 2024 17:58:29 +0530
Message-Id: <20240814122829.3878605-3-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814122829.3878605-1-nakshtra.goyal@intel.com>
References: <20240814122829.3878605-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Adding this to check Bat runs directly to check test success before full
run

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..4ba90e2dd 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

