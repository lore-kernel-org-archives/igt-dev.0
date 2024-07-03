Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463A1C3DA40
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB18910E714;
	Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQu7qJAx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB4C10E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oULEmZvdZLT25dg3JGOMpBgl/nNn4gIEWi95HQCLpTM=;
 b=mQu7qJAxQlUfz2LMJxRJ9Kr6Ro2GrWFcgykiDTK8oYqdFFrXf5dILtdP
 fh2aYJghbtln/KxbVHETRJFk/GXvZNzAXldLjte6EVHgkhssbr8eouWdv
 BBsSufPFOcUgw6bz10ZFi+UFI0LACr7CJg/uyy1JU1NXuL1LT2AYPJ/OZ
 XJlWgZasbyK7pajDb+LtHO041r/joHJb7R1XwpXAZjOMpcdD8Pl4fgThX
 uGvM2LQ7ylmpgy5cNopavc+otgMmLx1zqjTffhWOI9K3weKheKSumBRH6
 n7SJ3Kn2rsF9yrekXiFDEWos1FHkXjFcARw815m7LR22n2mv0ZxFFHivX w==;
X-CSE-ConnectionGUID: r4vSnhr4TcKyistSm9IuZQ==
X-CSE-MsgGUID: M/+hPkD8QLadiNPMBr25MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074284"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:38 -0700
X-CSE-ConnectionGUID: iFytV4/oRUCvfZX1/qbOsA==
X-CSE-MsgGUID: yXsRyIHsRtaVNugNC7nYDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072875"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 05/10] tests/intel/xe_drm_fdinfo: Add single engine
 tests
Date: Tue,  2 Jul 2024 17:25:27 -0700
Message-Id: <20240703002532.3156277-6-umesh.nerlige.ramappa@intel.com>
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

Add simple tests that submit work to one engine and measure utilization
per class.

v2:
- Drop measured_usleep since return value is not used
- s/parallel engines/parallel submission/ in comment
- Use NSEC_PER_SEC for batch_duration_ns
- Percent should not be > 100
- Check utilization for both clients for isolation case

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 97 +++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 037f25e53..410c885e7 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -28,6 +28,15 @@
  * SUBTEST: basic-engine-utilization
  * Description: Check if basic fdinfo content is present for engine utilization
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
@@ -42,11 +51,18 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
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
 
+const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+
 static const char *engine_map[] = {
 	"rcs",
 	"bcs",
@@ -464,8 +480,77 @@ spin_ctx_destroy(int fd, struct spin_ctx *ctx)
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
+	/* for parallel submission scale the busyness with width */
+	percent = percent / width;
+
+	igt_debug("%s: percent: %f\n", engine_map[class], percent);
+
+	if (flags & TEST_BUSY)
+		igt_assert(percent >= 95 && percent <= 100);
+	else
+		igt_assert(!percent);
+}
+
+static void
+single(int fd, struct drm_xe_engine_class_instance *hwe, int width, int count,
+       unsigned int flags)
+{
+	struct pceu_cycles pceu1[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[2][DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+	int new_fd;
+
+	if (flags & TEST_ISOLATION)
+		new_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		ctx = spin_ctx_init(fd, hwe, vm, width, count);
+		spin_sync_start(fd, ctx);
+	}
+
+	read_engine_cycles(fd, pceu1[0]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(new_fd, pceu1[1]);
+
+	usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		spin_sync_end(fd, ctx);
+
+	read_engine_cycles(fd, pceu2[0]);
+	if (flags & TEST_ISOLATION)
+		read_engine_cycles(new_fd, pceu2[1]);
+
+	check_results(pceu1[0], pceu2[0], hwe->engine_class, width, flags);
+
+	if (flags & TEST_ISOLATION) {
+		check_results(pceu1[1], pceu2[1], hwe->engine_class, width, 0);
+		close(new_fd);
+	}
+
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
+	struct drm_xe_engine_class_instance *hwe;
 	int xe;
 
 	igt_fixture {
@@ -484,6 +569,18 @@ igt_main
 	igt_subtest("basic-engine-utilization")
 		basic_engine_utilization(xe);
 
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
2.38.1

