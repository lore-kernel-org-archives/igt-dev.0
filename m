Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64E3C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5610F042;
	Wed, 20 Mar 2024 15:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jxnry2Pd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E617710F042
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950245; x=1742486245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dAMExeNRZX948M4tdz/QQ7EytFo7YO+qvXsn3O2fAWE=;
 b=Jxnry2PdrxYKhP69acAeqJMJpEiosqbSP4SbmTlhF7DvAg4s+oFS0aDA
 D4uJIqdUgG50LId58dQmLkTjaiU5kt7qyYOkKocBZdtpPnpIUwuTGPrhF
 XWHJ6k9hJqNMD2QyvnbPMQFNvWexAXd4aYxWEAkCFE3j212KZi4z9OooC
 PoL4kNeZHBihtVVvkZM6Yfxe1eIXbp6ie2f8NkTBYuwM9xHcnXnXPV6Rh
 ZQm4ONGKrAFjZ6aMuQOl2RD4vaGiyM4HwFmwt+oapdlzpx7Hgj37UNth8
 ZIM919cfZ1jykvirO+rdmhZyFRMmCWz6GAh1cfEWNR+0M8xSu9TzsKlWO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6007878"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6007878"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18783028"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:23 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v14 5/5] tests/intel/gem_exec_gttfill: simplify multiGPU
 subtest
Date: Wed, 20 Mar 2024 16:56:59 +0100
Message-ID: <20240320155659.33518-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
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
v14: add missing igt_require_gem() in multigpu-basic (Janusz)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_gttfill.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index b1063437b..d79a6ffd5 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -24,8 +24,8 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
-#include "igt_device_scan.h"
 #include "igt_rand.h"
+#include "igt_multigpu.h"
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
@@ -285,17 +285,12 @@ igt_main
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
+		igt_multi_fork_foreach_gpu(g_fd, gpu_idx, DRIVER_INTEL) {
 			// prepare
-			g_fd = __drm_open_driver_another(child, DRIVER_INTEL);
-			igt_assert(g_fd >= 0);
+			igt_require_gem(g_fd);
 			ctx = intel_ctx_create_all_physical(g_fd);
 			igt_fork_hang_detector(g_fd);
 			// subtest
@@ -303,7 +298,6 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
-- 
2.42.0

