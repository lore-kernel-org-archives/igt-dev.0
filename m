Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE4C2BBCA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F2C10EB2A;
	Fri, 21 Jun 2024 23:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhlGPKGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C03110EB2A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EXbsUO3y+Us47vJtggLmFppTbYv2zKKmU8F8d1+r1uU=;
 b=VhlGPKGS6cp3LdWJqLtBpOl6aWttnwbDXQ0lHS8BsSOpT3p/xMdGW2lj
 HWDJekqu9O4ej6t/0+lW6B3euDWosm5IiqXUnkK+BCznFttGTshS9fXMB
 mjQppJeLbxgpBgGkfGJuXZRguFHRj/hcM+Ut9sXNkpBHg6I1TfBfT51Ew
 2TCIOY4RIUJt25mnCJvvFzHEUysg7A4RIlJXC9dAfWkBD21KX1imLKtxL
 3WazNoVGfuEBm7XITJqU5bNDuD4SrbxR8kake79v0WfePJKl87QI+ymrC
 1fDhv/L841aLadCRvG1ImMq6LO9H1OeKSYbpjsLsOyefJ043Dub4nIUYn Q==;
X-CSE-ConnectionGUID: pCcamvX1QRazB0meFhg8mw==
X-CSE-MsgGUID: 6yfzwtYZRYeU8VfXq+YXAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204935"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204935"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: kOYEGfdURFWcW2TOP87qkQ==
X-CSE-MsgGUID: EB579frBSXKd1ERNco4kGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597338"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Add tests for parallel
 engines
Date: Sat, 22 Jun 2024 07:01:02 +0800
Message-Id: <20240621230102.238397-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 96b246364..fe492eca4 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -55,6 +55,18 @@
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
@@ -73,6 +85,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 #define TEST_BUSY		(1 << 0)
 #define TEST_TRAILING_IDLE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
+#define EXEC_PARALLEL		(1 << 16)
 
 struct pceu_cycles {
 	uint64_t cycles;
@@ -745,8 +758,8 @@ multi_all_busy_check_all(int fd, unsigned int flags)
 		xe_for_each_multi_engine(local_fd, hwe, count) {
 			class = hwe->engine_class;
 			ctx[class] = xe_spin_ctx_init(local_fd, hwe, vm,
-						      1,
-						      count);
+						      flags & EXEC_PARALLEL ? count : 1,
+						      flags & EXEC_PARALLEL ? 1 : count);
 			xe_spin_sync_start(local_fd, ctx[class]);
 		}
 	}
@@ -763,7 +776,7 @@ multi_all_busy_check_all(int fd, unsigned int flags)
 	xe_for_each_multi_engine(local_fd, hwe, count) {
 		class = hwe->engine_class;
 		check_results(pceu1, pceu2, class,
-			      1,
+			      flags & EXEC_PARALLEL ? count : 1,
 			      flags);
 		xe_spin_sync_end(local_fd, ctx[class]);
 		xe_spin_ctx_destroy(local_fd, ctx[class]);
@@ -847,6 +860,21 @@ igt_main
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
2.34.1

