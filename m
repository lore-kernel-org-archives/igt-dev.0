Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A3D39410
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:47:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF910F22E;
	Thu,  2 Apr 2026 11:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9DahtG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2103310F226
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775130459; x=1806666459;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGfGUXm2cH/1K/O+ckej8/8HRI7LHPaAnVlGkNvDQek=;
 b=h9DahtG9iPnwHTT9wlVgQnqHHS2u0QUlVQ1wLgPtIRX6x7W60Fs++0CR
 zdnw+SuHTZf5IckaAWliJN0zhir24eotFxdiv7gcgnET95hBb3uwf+7UM
 rYZaaeGCkjCwF6fO+NBtakiJNYA2kywnOL9z57BTvzNoJ+RpvolKgZTlu
 w4OS1HnxnK+XEikq6wNnqfMzAXkCb7uuUGboryufDcfxE67BexUECwZGe
 MQicp1O8gfrXTb1hvIX/2st1uyooWYQNjjRfPvOhFQ+vFMmow+gtqOGuS
 Iiowp1i14/Wa1Sx94N9la5QGBkCVxIy5qaPmPzhWKEqVh0H/11K6KAi5K Q==;
X-CSE-ConnectionGUID: E5OqU+VhTK66BtwsCnfzow==
X-CSE-MsgGUID: sU2CZyh6TqCAmXZahUyNLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98799761"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="98799761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:47:38 -0700
X-CSE-ConnectionGUID: ZoYFhiOqR7iUR+r8EfXoKg==
X-CSE-MsgGUID: Ka8D8AhuSKq14Jngd9yLpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="257442082"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa002.jf.intel.com with ESMTP; 02 Apr 2026 04:47:36 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] intel-ci: Unblock svm tests from Core blocklists
Date: Thu,  2 Apr 2026 17:17:35 +0530
Message-Id: <20260402114735.695994-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove xe_exec_system_allocator test entries from BMG, LNL, NVL,
and PTL core blocklists. The system allocator/SVM feature is now
supported on these platforms and hugepage CI settings are no longer
a blocker.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 5 -----
 tests/intel-ci/xe.lnl.core.blocklist.txt | 5 -----
 tests/intel-ci/xe.nvl.core.blocklist.txt | 4 ----
 tests/intel-ci/xe.ptl.core.blocklist.txt | 4 ----
 4 files changed, 18 deletions(-)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index 3a127f780..628bc3d3b 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -76,8 +76,3 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
-# Hugepages tests needs extra setting in CI
-# echo 128 >  /proc/sys/vm/nr_hugepages
-##################################################################
-igt@xe_exec_system_allocator@.*huge.*
-##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 56b3ef088..60bcefa56 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -92,8 +92,3 @@ igt@xe_module_load@force-load
 #################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
-# Hugepages tests needs extra setting in CI
-# echo 128 >  /proc/sys/vm/nr_hugepages
-##################################################################
-igt@xe_exec_system_allocator@.*huge.*
-##################################################################
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 0f9750961..ea47d3b85 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -58,15 +58,11 @@ igt@xe_compute@eu-busy-10s
 #   - xe_pxp@.*: PXP (Protected Xe Path) content protection
 #     requires a TEE (Trusted Execution Environment) and
 #     associated firmware, which NVL does not support.
-#   - xe_exec_system_allocator@.*: System allocator execution
-#     tests depend on hardware features (e.g., SVM/USM page
-#     fault handling) not enabled on NVL yet.
 ##################################################################
 igt@xe_huc_copy@huc_copy
 igt@xe_exec_balancer@.*
 igt@xe_oa@oa-tlb-invalidate
 igt@xe_pxp@.*
-igt@xe_exec_system_allocator@.*
 ##################################################################
 # Valid skip: test applicable only for i2c capable systems
 ##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index bb8587656..abaa1284f 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -71,10 +71,6 @@ igt@xe_pm_residency@toggle-gt-c6
 igt@xe_pxp@.*
 igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
-# System allocator feature is not POR for PTL
-##################################################################
-igt@xe_exec_system_allocator@.*
-##################################################################
 # survivability feature not applicable for PTL
 ##################################################################
 igt@xe_survivability@.*
-- 
2.34.1

