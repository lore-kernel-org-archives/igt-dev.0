Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F10C5AC67
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 22:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE310E39B;
	Thu,  6 Aug 2026 22:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxRbBiNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228DA10E39B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 22:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786054405; x=1817590405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9SVervDVyOBiOSv0d4AfjxiHoISkbMkKigj6NcWupGE=;
 b=jxRbBiNGWHGWyb0KI1TLfvmpYWpW5q3rwUn5SZOjaZEBNRNYBdnBPIE3
 qoVEWavLeqB8q9NNZnFjFoDJ3EiP4OqvbjWRodgjoCHgBuMWvFko7QC+B
 t2O/+RDS4SrMcUasdyoMjrh36qrz8w/wZ8aPBolb93vrusgnkny1HOG+B
 3WrAuUMOfesYs7DxF6xdG8PaS4kwHM9JbUcp0VkBCFryt49N4L0qR/XPI
 w8aFPKmCBFzxEZUNV9e4dvVR4Q+S7Mz02kCinFkA66kCwpiWTTvyIok5P
 lCMiM31tTqDqIcO+ttmAIQM/+4lfXIxkig6kiZ9A0yiZ5PghOA8Q12vqS Q==;
X-CSE-ConnectionGUID: X0J5L/6KQ5uy+0+/ennzGg==
X-CSE-MsgGUID: pcMYheWRSNmMq+9TRNGnxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104064285"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="104064285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 15:13:24 -0700
X-CSE-ConnectionGUID: EPW03ld8RralbjcoQ/77vQ==
X-CSE-MsgGUID: RmrQglMERxWyogCrZsShOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="258364177"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 15:13:23 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: skip tiling tests on xe nvl
Date: Fri,  7 Aug 2026 03:52:30 +0530
Message-Id: <20260806222230.42508-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Skip tiled display test patterns due to missing configuration.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index c57766ce2..05c9f7f5c 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -95,6 +95,10 @@ igt@kms_content_protection@mei-interface
 ##############################################################################
 igt@kms_chamelium.*@.*(vga).*
 ##############################################################################
+# Valid skip: Missing configuration
+##############################################################################
+igt@kms_tiled_display@basic-test-pattern(-with-chamelium)?
+##############################################################################
 # Valid skip: Use either of connected/non-connected kms_bw
 ##############################################################################
 igt@kms_bw@linear-tiling-.*-display.*
-- 
2.25.1

