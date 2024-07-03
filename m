Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA648C38150
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C5710E71A;
	Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBPl7d/Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B423210E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966339; x=1751502339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VvFsgnQZ4jHSWjVRicCcjlyTT5GdsnDpiRdb9qV6vJo=;
 b=TBPl7d/QHccjpQqY9x2ay0yZK75sa4fh0mEYDPFQcDSxuFy69IPMtD9g
 Sy3zIZY/ZgJhsq03kAYG1zRER4RN+82S1XWaJQQixviJHICoAT5owRuBv
 Tp3EAQncNnwcSDuBNs1sGOODssDqqk4bgT0vIxcCdwCydEJfm5FIDHlE0
 BMTGz6NxQinUWXGVzMyrn51VO+Fo80E+R5QG4MVc8CKQL3Wn0eFJCUK8z
 /GiXumolqLUwKJ1YTGI6GNgT0OsYUAOsCMv4p/sF5DsMWGj6eD1my8pC0
 meAMSpb8WHpbz30kue0qpLuCeW+3VrmmtTpGaEsMbVHbVO40/bpKXoRBE w==;
X-CSE-ConnectionGUID: mH2iiMfBToGeXVPdIDSAxQ==
X-CSE-MsgGUID: /I+bvTDOQyyfEZpKBIARXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074288"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074288"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: FysG7gafTzCCU0XU1w0slw==
X-CSE-MsgGUID: LOMiTQ6lRLeMd1xQX+QbOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072888"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 09/10] tests/intel/xe_drm_fdinfo: Add tests for
 parallel engines
Date: Tue,  2 Jul 2024 17:25:31 -0700
Message-Id: <20240703002532.3156277-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Add tests to verify utilization on parallel engines.

v2:
- s/measured_usleep/usleep
- remove xe_ prefix from helpers/structures

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 5a3cd776c..f1e06991c 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -58,6 +58,18 @@
  * SUBTEST: drm-virtual-busy-idle-isolation
  * Description: Check that virtual engine load does not spill over to other drm clients
  *
+ * SUBTEST: drm-parallel-idle
+ * Description: Check that parallel engines show no load when idle
+ *
+ * SUBTEST: drm-parallel-busy-idle
+ * Description: Check that parallel engines show load when idle after busy
+ *
+ * SUBTEST: drm-parallel-all-busy-idle-check-all
+ * Description: Check that all parallel engines show busy when loaded
+ *
+ * SUBTEST: drm-parallel-busy-idle-isolation
+ * Description: Check that parallel engine load does not spill over to other drm clients
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -76,6 +88,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 #define TEST_BUSY		(1 << 0)
 #define TEST_TRAILING_IDLE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
+#define EXEC_PARALLEL		(1 << 16)
 
 struct pceu_cycles {
 	uint64_t cycles;
@@ -723,8 +736,8 @@ multi_all_busy_check_all(int fd, unsigned int flags)
 		xe_for_each_multi_engine(fd, hwe, count) {
 			class = hwe->engine_class;
 			ctx[class] = spin_ctx_init(fd, hwe, vm,
-						      1,
-						      count);
+						   flags & EXEC_PARALLEL ? count : 1,
+						   flags & EXEC_PARALLEL ? 1 : count);
 			spin_sync_start(fd, ctx[class]);
 		}
 	}
@@ -741,7 +754,7 @@ multi_all_busy_check_all(int fd, unsigned int flags)
 	xe_for_each_multi_engine(fd, hwe, count) {
 		class = hwe->engine_class;
 		check_results(pceu1, pceu2, class,
-			      1,
+			      flags & EXEC_PARALLEL ? count : 1,
 			      flags);
 		spin_sync_end(fd, ctx[class]);
 		spin_ctx_destroy(fd, ctx[class]);
@@ -809,6 +822,21 @@ igt_main
 		xe_for_each_multi_engine(xe, hwe, count)
 			single(xe, hwe, 1, count, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
 
+	igt_subtest("drm-parallel-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, count, 1, 0);
+
+	igt_subtest("drm-parallel-busy-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, count, 1, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-parallel-all-busy-idle-check-all")
+		multi_all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE | EXEC_PARALLEL);
+
+	igt_subtest("drm-parallel-busy-idle-isolation")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, count, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.38.1

