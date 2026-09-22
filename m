Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A99C982FE
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 05:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72010EB5C;
	Tue, 22 Sep 2026 05:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/sLWvu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107010E5D1
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790054368; x=1821590368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5rKG3qUohFJxFZWL7wjW1VyPqDuq/hQhHWZn2/XWVoA=;
 b=E/sLWvu1im7DVNosuJrb77vZX1OFNcSilD/+xE93jzVErtV8Z9x27Fbk
 ACyTXG+EUExUqfwd1TrJOJR8+fwOOfktxmxoJCwX+BkBGMJjVegRsFF2V
 k8jnUtT3LBkdiIv45cUArgC+u4ktVulK5xAi9VQQ0hudWRKldsdSpax0x
 F2T7bzWOVKgTlp1aaye4iz51VC5GCHk1tteWEFXyZrYdMhyclpDMuNyhT
 hcXYdCX/FUduclXp5Qd11i3ngJsrtVde0R90le4jaNcVF4tm0L/nIJvsy
 efMkoUuc1I8RIffq8dmMOStE71lO25vLXIfCVq7JWOXL3Lb9u63H3OcVz g==;
X-CSE-ConnectionGUID: Jexl8osfQjuYgP3l5oLHtg==
X-CSE-MsgGUID: IZzD2HHCSz29ugqDh/WmKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78179659"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="78179659"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 22:19:27 -0700
X-CSE-ConnectionGUID: j6uMKp1tRAC2+vst2cSvEA==
X-CSE-MsgGUID: zjMnDxopTx+TY8pe6LiwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="272468219"
Received: from dut1131bmgfrd.igk.intel.com ([10.211.178.48])
 by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2026 22:19:25 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Date: Tue, 22 Sep 2026 05:19:21 +0000
Message-ID: <20260922051921.24701-1-shivtej.eknath.patil@intel.com>
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
 tests/intel-ci/xe.bmg.core.blocklist.txt |  8 +++++---
 tests/intel-ci/xe.lnl.core.blocklist.txt |  8 +++++---
 tests/intel-ci/xe.ptl.core.blocklist.txt | 10 +++++-----
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index cd38d16f8..84f401570 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -41,10 +41,7 @@ igt@xe_vm@.*export.*
 ##################################################################
 # Tests not applicable for the platform
 ##################################################################
-igt@xe_exec_multi_queue@.*
 igt@xe_evict@.*multi(-)?queue.*
-igt@.*@.*-multi_queue
-igt@.*@.*multi-queue.*
 ##################################################################
 # Expected skips, Kernel support not available
 ##################################################################
@@ -80,3 +77,8 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 igt@xe_pm@d3hot-i2c
 ##################################################################
+# Expected skip on BMG due to unsupported multi-queue capability
+# Multi-queue is not supported on platforms older than xe3p
+##################################################################
+igt@.*multi.queue.*
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index c830ac3c8..67f8ad8df 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -84,9 +84,6 @@ igt@xe_vm@.*export.*
 # Tests not applicable for the platform
 ##################################################################
 igt@xe_evict@.*multiqueue.*
-igt@xe_exec_multi_queue@.*
-igt@.*@.*-multi_queue
-igt@.*@.*multi-queue.*
 ##################################################################
 # Kernel support not available
 ##################################################################
@@ -108,3 +105,8 @@ igt@xe_module_load@force-load
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

