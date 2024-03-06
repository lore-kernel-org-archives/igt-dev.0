Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C278C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 13:32:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83B41131C2;
	Wed,  6 Mar 2024 13:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQRTfIto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B71131BE
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709731962; x=1741267962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s/q1H/RDMWob4m/elYi4fHF12KA5JmOg6LR3WZ38Xec=;
 b=lQRTfItot+UIDvzC3lcHCqSXnX39oqyQ6tX/JeySvdpLY9wDquFd3DpX
 kjsWxlGbrvEPjvUJ4Bn7BHNrFXX0kHMrdKlilh62l1pMTLolnDBG72jNk
 ayono2O6ZhMazfHOQ7+VkCdsY5ySFhnGRrHiDRRzaZXoACSZ8vkj4iFkI
 oNsevhJLrJe6AmQj5OHEtu/Kcr3QZSmE4RVHGgt3T1hhwMxQIXY6tga67
 BrJ9JYvP/MfGEtCrYmL0Rm8DjAAHPiunvvykiOJJ48YbQEqJBdMvhllBd
 o2SSMJ8LvFPz1BLaVDG1FJZ/UXIeq1IhUpcoh/EqbqbURB9tiqIokZSui w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4512381"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4512381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9632675"
Received: from unknown (HELO localhost) ([10.245.244.145])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:28 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v11 6/6] tests/intel/gem_exec_gttfill: simplify multiGPU
 subtest
Date: Wed,  6 Mar 2024 14:31:58 +0100
Message-ID: <20240306133158.45187-7-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
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
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_gttfill.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index b1063437b..9fbc86d99 100644
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
@@ -251,7 +251,7 @@ igt_main
 {
 	const struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
-	int i915 = -1, gpu_count;
+	int i915 = -1;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -285,17 +285,11 @@ igt_main
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
@@ -303,7 +297,6 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
-- 
2.42.0

