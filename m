Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20039C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 00:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FD610E22F;
	Mon, 26 May 2025 00:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qy8nzMAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC3710E0EC
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748218408; x=1779754408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPoyUlgnkbFwqQ3fVVkwgsdYNs3H1ivKcviSv0TuHUc=;
 b=Qy8nzMAbG//a2PRMcCOVHoIZN7ZY30Qx1sfatkg6r0jMriDv5EhzpORp
 1cmKkksa3rZ9oOfUhFgJqkq9fX064eoxj1DpwGECM2U69ZzA4XwoBhGhg
 nJwFIJIiOKRs8D+zTG4pff7v3kVyLYOAH4EuzJMZRGvDSoCFN2oXg1Axh
 ETvZOQ8xSo6S65T7P4jwq4Les9MWJfSucI3hA6wqJpRNe1W6rQSxOtBVx
 OoM47AilfsN28IPFw2++HbucRUXx5K4aDLOHOgfqgb8PC8P8h65XuG6yf
 UK0ZQP5Uu5HT9D1mK189vKCHeaZEeOiZZe6q/9ZdbZp1NeZfcI/XZN/cw w==;
X-CSE-ConnectionGUID: 4TjYa37DS5Wm59X7px7jyA==
X-CSE-MsgGUID: ZRX/jsIkTGO+6t5MMrVKIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50296221"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; d="scan'208";a="50296221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 17:13:25 -0700
X-CSE-ConnectionGUID: mf8bHIABRZmGpnV4V8LavQ==
X-CSE-MsgGUID: Xc2506MwQNqVjnfvYAxluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; d="scan'208";a="142029300"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2025 17:13:24 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_eudebug_online: Add pagefault stress tests
Date: Mon, 26 May 2025 00:13:04 +0000
Message-Id: <20250526001304.2899977-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526001304.2899977-1-jan.maslak@intel.com>
References: <20250526001304.2899977-1-jan.maslak@intel.com>
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

Add a stress variant of the already existing
xe_eudebug_online@pagefault-[read|write] tests that increases
number of threads in the shader and number of threads in
threadgroup to their maximum available amounts.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 3d138bdc3..ad62dd929 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -39,6 +39,7 @@
 #define SHADER_PAGEFAULT_READ		(1 << 14)
 #define SHADER_PAGEFAULT_WRITE		(1 << 15)
 #define FAULTABLE_VM			(1 << 16)
+#define PAGEFAULT_STRESS_TEST		(1 << 17)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -126,6 +127,9 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
 
 static int get_number_of_threads(uint64_t flags)
 {
+	if (flags & (PAGEFAULT_STRESS_TEST))
+		return 65535; /* 64K - 1 */
+
 	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
 		return 16;
 
@@ -1068,6 +1072,10 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct intel_buf *buf;
 	uint32_t *ptr;
 	int fd, vm_flags;
+	uint32_t num_threads_in_tg = 1;
+
+	if (c->flags & PAGEFAULT_STRESS_TEST)
+		num_threads_in_tg = 64;
 
 	metadata[0] = calloc(2, sizeof(**metadata));
 	metadata[1] = calloc(2, sizeof(**metadata));
@@ -1115,7 +1123,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	sip = get_sip(fd, c->flags);
 
 	igt_nsec_elapsed(&ts);
-	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, num_threads_in_tg, shader, sip, 0, 0);
 
 	gpgpu_shader_destroy(sip);
 	gpgpu_shader_destroy(shader);
@@ -1629,6 +1637,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode that
  *     triggers a write pagefault.
+ *
+ * SUBTEST: pagefault-read-stress
+ * Functionality: page faults
+ * Description:
+ *     Check whether KMD sends read pagefault event for workload in debug mode
+ *     with many threads.
+ *
+ * SUBTEST: pagefault-write-stress
+ * Functionality: page faults
+ * Description:
+ *     Check whether KMD sends write pagefault event for workload in debug mode
+ *     with many threads.
  */
 static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
 				  int flags)
@@ -2664,6 +2684,11 @@ igt_main
 	test_gt_render_or_compute("pagefault-write", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
 
+	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
+	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

