Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6DC5478A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A9810E19D;
	Wed, 21 Feb 2024 16:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmW68BqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370D10E187
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708534064; x=1740070064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y1qcAWLuYgIknlBSbInXVwqhoR9ZocvV438pb/Us19M=;
 b=jmW68BqQgUqlCYEqzRxHhQKYvvABsEKHTiI54P8RitFQ1iixiFvbMSK7
 IZMm8K0CYF/kGNJS2hp1Kxr1ETzspy78GL1FuzBWN66++GoaxMDK0t35y
 xEiRyksxaqx7i7v5oCkLHWl8zQ+kE1CJ9tLiiXS67nDN8KyYbbK4lyF6I
 F63ZkJzVzJLdMb1T5lp28DZ/tkREgTYu2CU3N/JKuSBx4wtoI3WWX9vYZ
 LV3lXrneAEwdc0pcGO3ifrUnL9YgQkCXFU9qZ0krIok8EPL4SuLg8KX1e
 AlFtjBo1iVT8aM65RH9DELjYxQ8prte1/z8d9XISj6RKQJH4+n7l7mc9f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2568770"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2568770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9886425"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:47:11 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t v10 6/6] tests/intel/gem_exec_gttfill: simplify multiGPU
 subtest
Date: Wed, 21 Feb 2024 17:46:37 +0100
Message-ID: <20240221164637.116048-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
References: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
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

v10: remove igt_require_multigpu() as it checks filters but we
  want to use legacy opens (Kamil), correct Cc name (Zbigniew)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_gttfill.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 28c251915..88ce5a27a 100644
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
@@ -296,17 +296,11 @@ igt_main
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
+		igt_multi_fork_foreach_gpu(g_fd, DRIVER_INTEL) {
 			// prepare
-			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
-			igt_assert(g_fd >= 0);
 			ctx = intel_ctx_create_all_physical(g_fd);
 			igt_fork_hang_detector(g_fd);
 			// subtest
@@ -314,7 +308,6 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
-- 
2.42.0

