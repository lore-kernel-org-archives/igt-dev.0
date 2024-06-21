Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C36C2BB85
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E299910EBB9;
	Fri, 21 Jun 2024 23:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy+jQMEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549D810E114
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3baQEWZNv8vYlnvmRLw+eZ1kQx6LCCKZNxmxGq8dF6I=;
 b=Oy+jQMELwMIb8MeFszLyFe69bKNeyCt/w4XK4/chdrhUqi/vFh8bABcm
 85Kfs0Hme0dTV7Z+t9Ng2AI8aPcqm4gVN5LV25oJjLbNRuZlMgmrb1JUJ
 MU4lmTGw0vjE7VtdR10AOr17/nQxRy3+IplMidSOUwCVuSTOZM37ywDR3
 ym4D63LrbH0QZdOqoh6/AdFdGArsWk02ymdg7VOvi1gWD95f1nLuSb1li
 6faQs7lPSHyiFfPQSuxpyYZWb79rvWTtPN42sj5vE4pGZl9okHfwIn1wS
 KgfWqSW1zsGuEyUHIertcppSTGjdne3KKwZ+SOJbSMLv011n6ceePb5A5 A==;
X-CSE-ConnectionGUID: Pxlol831RH+h/X90jtD84g==
X-CSE-MsgGUID: ebXI66zjQQ+c/1r7aNWAlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204931"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: du2ekc4xTaSuBdpaGOtrPQ==
X-CSE-MsgGUID: OD7weytXQ6qmu7SP5jhtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597325"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 4/8] tests/intel/xe_drm_fdinfo: Add single engine tests
Date: Sat, 22 Jun 2024 07:00:58 +0800
Message-Id: <20240621230102.238397-5-umesh.nerlige.ramappa@intel.com>
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

Add simple tests that submit work to one engine and measure utilization
per class.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 109 ++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 27459b7f1..852931d71 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -25,6 +25,15 @@
  * SUBTEST: basic
  * Description: Check if basic fdinfo content is present
  *
+ * SUBTEST: drm-idle
+ * Description: Check that engines show no load when idle
+ *
+ * SUBTEST: drm-busy-idle
+ * Description: Check that engines show load when idle after busy
+ *
+ * SUBTEST: drm-busy-idle-isolation
+ * Description: Check that engine load does not spill over to other drm clients
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -39,11 +48,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 #define BO_SIZE (65536)
 
+/* flag masks */
+#define TEST_BUSY		(1 << 0)
+#define TEST_TRAILING_IDLE	(1 << 1)
+#define TEST_ISOLATION		(1 << 2)
+
 struct pceu_cycles {
 	uint64_t cycles;
 	uint64_t total_cycles;
 };
 
+const unsigned long batch_duration_ns = 500e6;
+
 static const char *engine_map[] = {
 	"rcs",
 	"bcs",
@@ -76,6 +92,27 @@ static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
 		pceu[class].total_cycles = info.total_cycles[class];
 	}
 }
+
+/*
+ * Helper for cases where we assert on time spent sleeping (directly or
+ * indirectly), so make it more robust by ensuring the system sleep time
+ * is within test tolerance to start with.
+ */
+static unsigned int measured_usleep(unsigned int usec)
+{
+	struct timespec ts = { };
+	unsigned int slept;
+
+	slept = igt_nsec_elapsed(&ts);
+	igt_assert(slept == 0);
+	do {
+		usleep(usec - slept);
+		slept = igt_nsec_elapsed(&ts) / 1000;
+	} while (slept < usec);
+
+	return igt_nsec_elapsed(&ts);
+}
+
 /* Subtests */
 static void test_active(int fd, struct drm_xe_engine *engine)
 {
@@ -451,6 +488,66 @@ xe_spin_ctx_destroy(int fd, struct xe_spin_ctx *ctx)
 	free(ctx);
 }
 
+static void
+check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
+	      int class, int width, unsigned int flags)
+{
+	double percent;
+
+	igt_debug("%s: sample 1: cycles %lu, total_cycles %lu\n",
+		  engine_map[class], s1[class].cycles, s1[class].total_cycles);
+	igt_debug("%s: sample 2: cycles %lu, total_cycles %lu\n",
+		  engine_map[class], s2[class].cycles, s2[class].total_cycles);
+
+	percent = ((s2[class].cycles - s1[class].cycles) * 100) /
+		  ((s2[class].total_cycles + 1) - s1[class].total_cycles);
+
+	/* for parallel engines scale the busyness with width */
+	percent = percent / width;
+
+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
+
+	if (flags & TEST_BUSY)
+		igt_assert(percent >= 95 && percent <= 105);
+	else
+		igt_assert(!percent);
+}
+
+static void
+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+       unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct xe_spin_ctx *ctx = NULL;
+	int local_fd = fd;
+	uint32_t vm;
+
+	if (flags & TEST_ISOLATION)
+		local_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(local_fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = xe_spin_ctx_init(local_fd, hwe, vm, width, count);
+		xe_spin_sync_start(local_fd, ctx);
+	}
+
+	read_engine_cycles(local_fd, pceu1);
+	measured_usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		xe_spin_sync_end(local_fd, ctx);
+	read_engine_cycles(local_fd, pceu2);
+
+	check_results(pceu1, pceu2, hwe->engine_class, width, flags);
+
+	xe_spin_sync_end(local_fd, ctx);
+	xe_spin_ctx_destroy(local_fd, ctx);
+	xe_vm_destroy(local_fd, vm);
+
+	if (flags & TEST_ISOLATION)
+		close(local_fd);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -485,6 +582,18 @@ igt_main
 	igt_subtest("basic")
 		basic(xe, num_classes);
 
+	igt_subtest("drm-idle")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, 1, 1, 0);
+
+	igt_subtest("drm-busy-idle")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-busy-idle-isolation")
+		xe_for_each_engine(xe, hwe)
+			single(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.34.1

