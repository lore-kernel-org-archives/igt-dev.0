Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E1C98306
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 06:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615310E4E3;
	Fri, 25 Sep 2026 06:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQvdKqdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F4F10E4E3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790317333; x=1821853333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q2OrvcCt9jwSi+8ZrcTAxC/YjkBZFbephF62pXpAUUw=;
 b=ZQvdKqdTJ6ozWFbrORxPIqSS2+dAgnBLO+I2L8I+nGWJJ0DKjxYVG4oE
 /xlbS1qQqGmgrfrMMeTc2YtlpA5Ar26atQOwRrkWhLjil01x0p+rRar53
 Ab850g2EQSAKk17d/6svKYTuw54f8fof6uclpFGrw37cbbFCXeTV2fsYg
 0Ue2u/zGeTW+pQbmm3k8IL6J+WtXcaCl6JrKor2txEk5KTwdwBJuWMxZc
 3cV6VOE1Nr+W1xWwKuJed3S3KnmKeGs/pD5oc0003r/+Floy13nXt/q8U
 8Hw4iZCKMhf4RJ74ApwR9lHaAZItqteCnS/7VlSYDMqlkXwsA4jTaTOjT Q==;
X-CSE-ConnectionGUID: IbQMSh6YSoyQ8T9L93m4pg==
X-CSE-MsgGUID: BfQ/rqdpSqmYi/CGGnSD7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89867361"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="89867361"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 23:22:13 -0700
X-CSE-ConnectionGUID: k3kqCBEvSVCj40nQJWhThA==
X-CSE-MsgGUID: gvjYU6LNQL+MNVS+YZAFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274345593"
Received: from live-gta-imageloader.igk.intel.com (HELO
 DUT1114BMGFRD.igk.intel.com) ([10.211.177.214])
 by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 23:22:11 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 ramadevi.gandi@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v4] intel-ci: blocklist multi-queue tests on BMG, LNL,
 PTL and WCL
Date: Fri, 25 Sep 2026 06:22:06 +0000
Message-ID: <20260925062206.13700-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 
On BMG, LNL, PTL and WCL platforms these tests are expected
to skip because multi-queue engine support is not available.

Replace existing multi-queue specific blocklist patterns with
a single generic multi.queue regex to simplify maintenance
and suppress expected CI failures.

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

