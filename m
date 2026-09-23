Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B561C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 04:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D5B10E06A;
	Wed, 23 Sep 2026 04:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODNGHlOV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50110E06A
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 04:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790139194; x=1821675194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rCyqpk/dbSJsHQRq2HL5R32k21o3GlpUCgCjDlQ59O4=;
 b=ODNGHlOVJE+5iKUTgKawnYkUJOjk9i7slCtLGOCrmn2wMFqb1ynLn0ia
 hDIE9lNBDZLdc5KN5c/uhdyGZnG5GIXeglBNHJtzBMnFk1e+m3JoEHzFz
 6x0R6bsbVuKPh3uThugL3nT8X4VgJtfZNuAEJCTjPyGRGWW9IP9/Yi7ZQ
 xcHI49iJgwBvC2KRIBjzX03Q898le71GsAnSjhftUr1ksiKHbhtCeppI+
 jhoTnjm3XDBTIBlDfV77zUebkZDFEDlyUy0rqr3CaxIYtBlyL3C5DsJ0O
 qP3zfw7bfBy2bOfarqM8Xvrm7GU3S+co/p8q8gpTjBewv4Jy/RUhaJHdJ w==;
X-CSE-ConnectionGUID: SoAzNMaXQXSkchADfgbVeA==
X-CSE-MsgGUID: EntMbJd0RrmfXyhDSD0vig==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116325882"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="116325882"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 21:53:14 -0700
X-CSE-ConnectionGUID: G96VwP7XTCqnHqU1iJMosg==
X-CSE-MsgGUID: CQAIhv57S2GXGeuk+qnolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="272640815"
Received: from dut1114bmgfrd.igk.intel.com ([10.211.177.214])
 by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2026 21:53:12 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v3] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Date: Wed, 23 Sep 2026 04:53:08 +0000
Message-ID: <20260923045308.13972-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

The multi-queue subtests require xe_has_multi_queue_engine(fd).
On BMG, LNL, PTL and WCL platforms these tests are expected to skip because
multi-queue engine support is not available.

Add blocklist entries to suppress expected CI failures.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 12 +++++-------
 tests/intel-ci/xe.lnl.core.blocklist.txt | 12 +++++-------
 tests/intel-ci/xe.ptl.core.blocklist.txt | 10 +++++-----
 3 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index cd38d16f8..f83b544cb 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -39,13 +39,6 @@ igt@xe_compute@ccs-mode-basic
 ##################################################################
 igt@xe_vm@.*export.*
 ##################################################################
-# Tests not applicable for the platform
-##################################################################
-igt@xe_exec_multi_queue@.*
-igt@xe_evict@.*multi(-)?queue.*
-igt@.*@.*-multi_queue
-igt@.*@.*multi-queue.*
-##################################################################
 # Expected skips, Kernel support not available
 ##################################################################
 igt@xe_eudebug@.*
@@ -80,3 +73,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
+# Expected skip on BMG due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index c830ac3c8..88115ec22 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -81,13 +81,6 @@ igt@xe_compute@ccs-mode-compute-kernel
 ##################################################################
 igt@xe_vm@.*export.*
 ##################################################################
-# Tests not applicable for the platform
-##################################################################
-igt@xe_evict@.*multiqueue.*
-igt@xe_exec_multi_queue@.*
-igt@.*@.*-multi_queue
-igt@.*@.*multi-queue.*
-##################################################################
 # Kernel support not available
 ##################################################################
 igt@xe_eudebug@.*
@@ -108,3 +101,8 @@ igt@xe_module_load@force-load
 #################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
+# Expected skip on LNL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 362711406..35def6ffe 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -65,11 +65,6 @@ igt@xe_pm@d3hot-i2c
 igt@xe_compute@ccs-mode-basic
 igt@xe_compute@ccs-mode-compute-kernel
 #################################################################
-# Tests not applicable for the platform
-##################################################################
-igt@xe_exec_multi_queue@.*
-igt@.*@.*multi-queue.*
-##################################################################
 # Expected skips as the tests are not supported on PTL
 ##################################################################
 igt@xe_access_counter@.*
@@ -91,3 +86,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@.*survivability.*
 #################################################################
+# Expected skip on PTL/WCL due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
-- 
2.43.0

