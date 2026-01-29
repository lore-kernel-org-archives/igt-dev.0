Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F13D6100B
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 11:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237910E324;
	Thu, 29 Jan 2026 11:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgTa8SBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D383610E324
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769686577; x=1801222577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMRknx7GdrO9JKBFKNsRiB1j7dCMrBtF37wwPcXo7A0=;
 b=dgTa8SBumMMPUWtpq+KgcYBwnFE4Z0OnEdfAP90qtKUIshlra0MsTnys
 7DDhJyFC/Kc6DxoSL0JYdGIQ4XYIQW2Nf9hxiNpwB2Wv857rwNTN8xEDo
 OmfoLBa7QbdtAVbEu5lkih2Bj0EdtMsNNqf25iak1Nyjhg9dhYMgA/uzh
 Hk8zflxMfSI1WlbX6RRXFxZ/SwoD7aazukiBGW4AsmQ0L8onPBW4FnITo
 0ogRdt7locfKVKXXncvjX4TAqf36fzGlli/MBKcMHiPpoSOdBnjCCSmv2
 kr2He78ErNtnBxTnbMPHrezDnXlm/FYh1RpaR2WrAJ+17T3TKosU10eRq w==;
X-CSE-ConnectionGUID: 0E9k7jifSJKxcS2qJNkZ/g==
X-CSE-MsgGUID: xYgNRwVHSO6j7YUyafhFLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88497418"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="88497418"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 03:36:16 -0800
X-CSE-ConnectionGUID: c2cXJYvVQ0mgLtxKJsmJWQ==
X-CSE-MsgGUID: hh6FieVqQOit5cLeXWVmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213429581"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:36:15 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update NVL display blocklist
Date: Thu, 29 Jan 2026 17:14:40 +0530
Message-Id: <20260129114440.155214-1-swati2.sharma@intel.com>
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

Add deep-pkgc test to xe.nvl.display blocklist as valid skip.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index 41d9eed3e..749514129 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -130,3 +130,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*
 ##############################################################################
 igt@kms_pm_rpm@package-g7
 ##############################################################################
+# Valid skip: Deep-pkgc IGT not applicable
+##############################################################################
+igt@kms_pm_dc@deep-pkgc
+##############################################################################
-- 
2.25.1

