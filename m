Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E435BC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7811A10E9A6;
	Thu, 15 Feb 2024 16:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECRM0Eyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B69810E9A6
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708013455; x=1739549455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JCSouLOJy84/fFbK8u70RoEDc3sstwEAj/PVqh8gtRM=;
 b=ECRM0EywB8RlOEb9GixjWIhphbtwvmWSPiedF38Uv3G6zKjwFl6SOsMp
 vY/ooF7o8LWrVAAX/yqkAuR0C7CwNsg6ctO9icCc+NnFR79n5N+xfuh3R
 Sl6FfY0JAlb2y0mov6xuq+90CksJ4+D5QDZGacz9qaSH/j71axVA7WPAG
 7IudcCH+3dLU4BPDD88O5dk5ysQ4arQsUgn7Jbiw/OINWq2//LpQ/mH9H
 EE3t+coA9PFw9/wJjQBjFeQJ55qPcRBUQAE8sJbnal9oDnJdGC2xgZ2x3
 7LWj45H4B5JCeHQZMCcdZuU8ziL73055N1usIQZ7TXNdy14CnFyP/Bu/Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2225759"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2225759"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912186811"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="912186811"
Received: from unknown (HELO localhost) ([10.246.30.107])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:10:53 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=EF=BF=BD=7EEtkoki?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v9 7/7] tests/intel/gem_exec_gttfill: simplify multiGPU
 subtest
Date: Thu, 15 Feb 2024 17:10:14 +0100
Message-ID: <20240215161014.60304-8-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
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

Simplify multi-GPU subtest with the help of new multigpu library.

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: "Dominik Karol Pi�~Etkoki" <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_gttfill.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 28c251915..f99ee54ef 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -24,8 +24,8 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
-#include "igt_device_scan.h"
 #include "igt_rand.h"
+#include "intel_multigpu.h"
 /**
  * TEST: gem exec gttfill
  * Description: Fill the GTT with batches.
@@ -262,7 +262,7 @@ igt_main
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
-	int i915 = -1, gpu_count;
+	int i915 = -1;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -296,17 +296,12 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(i915, ctx);
-		// prepare multigpu tests
-		gpu_count = igt_device_filter_count();
 	}
 
 	igt_subtest("multigpu-basic") { /* run on two or more discrete cards */
-		igt_require(gpu_count > 1);
-		igt_multi_fork(child, gpu_count) {
-			int g_fd;
+		gem_require_multigpu(2);
+		igt_multi_fork_foreach_gpu(g_fd, DRIVER_INTEL) {
 			// prepare
-			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
-			igt_assert(g_fd >= 0);
 			ctx = intel_ctx_create_all_physical(g_fd);
 			igt_fork_hang_detector(g_fd);
 			// subtest
@@ -314,7 +309,6 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
-- 
2.42.0

