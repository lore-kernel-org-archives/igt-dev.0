Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FEACD98CF
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 15:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EC810E526;
	Mon, 15 Jun 2026 15:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRyDfExt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8DF10E42D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781537974; x=1813073974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vF/4BdGe2XqVQJmscijKCscpv0G2tmnJ17UICaaKb6o=;
 b=LRyDfExtji2jRJWXz7qLrWqiQIC+ncoAjBijKp0vI7OnIz2jNL/rnZkU
 Zht4wT6dea+0vPgL9r52cHtvGMezDtQVZzNDpoUep2mdAXxdpQXvBXw9x
 YVc8xrwQSvwBtBm66rL6mBLiqtRqmTsyAPxdG1BoD1YHKoreIf5isWX6l
 uHvI1dqnameohfRUVA+lm902wd9XHq8PM/LHI3hepyPHAQGy89cq+Jme2
 o6PxIIIjDwlUWG4q6nhYXoD0Tsh2fkBaF2UExs8CPDC2pqyT6cZM4bUA+
 UNdjzcRCi8duRCbHfV5wlqw8BviPxway0K8vdIhWq4iLDsuioMQJ+kGeQ g==;
X-CSE-ConnectionGUID: /1S6SAYfQkGVwKbkWT4Uhg==
X-CSE-MsgGUID: /UJZgL01R4WHUMeSuJyrqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82128958"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82128958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 08:39:34 -0700
X-CSE-ConnectionGUID: 6sZXKT2QQkavtn8GMzUjjw==
X-CSE-MsgGUID: H3tImDWZTNmFm+fgdgcfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="277706298"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa002.jf.intel.com with ESMTP; 15 Jun 2026 08:39:30 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v2] tests/intel: Skip multi-queue tests when no engine
 supports it
Date: Mon, 15 Jun 2026 15:39:26 +0000
Message-Id: <20260615153926.2094688-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

When no engine supports multi-queue, xe_for_each_multi_queue_engine()
iterates zero times, causing subtests to report SUCCESS without
executing any test logic.

Add xe_has_multi_queue_engine() helper and use it as an igt_require()
guard in all multi-queue subtests so they properly report SKIP on
hardware without multi-queue support.

v2: combine 2 igt_require into 1.

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/xe/xe_query.c                 | 20 +++++++++++++++++++
 lib/xe/xe_query.h                 |  1 +
 tests/intel/xe_evict.c            |  6 +++---
 tests/intel/xe_exec_fault_mode.c  |  2 +-
 tests/intel/xe_exec_multi_queue.c |  2 +-
 tests/intel/xe_exec_reset.c       | 32 +++++++++++++++++--------------
 tests/intel/xe_exec_threads.c     |  2 +-
 7 files changed, 45 insertions(+), 20 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3286a3b37..f0799f268 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -346,6 +346,26 @@ bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class)
 	}
 }
 
+/**
+ * xe_has_multi_queue_engine:
+ * @fd: xe device fd
+ *
+ * Returns true if any engine supports multi queue, false otherwise.
+ */
+bool xe_has_multi_queue_engine(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	/* Multi-queue is supported only on IP version 35 and above */
+	if (intel_graphics_ver(intel_get_drm_devid(fd)) < IP_VER(35, 0))
+		return false;
+
+	xe_for_each_multi_queue_engine(fd, hwe)
+		return true;
+
+	return false;
+}
+
 static void xe_device_free(struct xe_device *xe_dev)
 {
 	free(xe_dev->config);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 8815c6c66..9f04a7422 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -163,6 +163,7 @@ uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
 bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class);
 bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
+bool xe_has_multi_queue_engine(int fd);
 const char *xe_engine_class_string(uint32_t engine_class);
 const char *xe_engine_class_short_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 82a6cde0a..3f1d6cb9c 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -902,7 +902,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(xe_has_multi_queue_engine(fd));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -922,7 +922,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(xe_has_multi_queue_engine(fd));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
@@ -941,7 +941,7 @@ int igt_main()
 
 			igt_debug("Max working set %d n_execs %d\n", ws, s->n_execs);
 			if (s->flags & MULTI_QUEUE) {
-				igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+				igt_require(xe_has_multi_queue_engine(fd));
 				igt_require(multi_queue_hwe != NULL);
 				igt_assert_f(!(s->flags & MULTI_VM),
 					     "MULTI_QUEUE and MULTI_VM cannot be used together.\n");
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 3e92dfbd9..4649c67de 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -444,7 +444,7 @@ test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	struct drm_xe_engine_class_instance *hwe;
 
 	if (flags & MULTI_QUEUE) {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
 	} else {
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index d9d648b02..82c9aefcd 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -1093,7 +1093,7 @@ int igt_main()
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 	}
 
 	igt_subtest_f("sanity")
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 9f5fde1a7..4634c24d9 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -1105,7 +1105,7 @@ int igt_main()
 			gt_mocs_reset(fd, gt);
 
 	igt_subtest("multi-queue-cat-error") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    CAT_ERROR | MULTI_QUEUE,
@@ -1114,7 +1114,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-cat-error-on-secondary") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    CAT_ERROR | MULTI_QUEUE |
@@ -1124,7 +1124,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-gt-reset") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
@@ -1134,7 +1134,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-cancel") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    MULTI_QUEUE,
@@ -1143,7 +1143,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-cancel-on-secondary") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    MULTI_QUEUE | SECONDARY_QUEUE,
@@ -1152,7 +1152,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-close-fd") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(-1, hwe, 16, 256,
 					    CLOSE_FD | MULTI_QUEUE,
@@ -1161,7 +1161,7 @@ int igt_main()
 	}
 
 	igt_subtest("multi-queue-close-execqueues") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(-1, hwe, 16, 256,
 					    CLOSE_EXEC_QUEUES | CLOSE_FD |
@@ -1171,14 +1171,14 @@ int igt_main()
 	}
 
 	igt_subtest("cm-multi-queue-cat-error") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
 					  CAT_ERROR | MULTI_QUEUE);
 	}
 
 	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
 					  CAT_ERROR | MULTI_QUEUE |
@@ -1186,7 +1186,7 @@ int igt_main()
 	}
 
 	igt_subtest("cm-multi-queue-gt-reset") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
@@ -1194,29 +1194,32 @@ int igt_main()
 	}
 
 	igt_subtest("cm-multi-queue-close-fd") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256,
 					  CLOSE_FD | MULTI_QUEUE);
 	}
 
 	igt_subtest("cm-multi-queue-close-execqueues") {
-		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256,
 					  CLOSE_EXEC_QUEUES | CLOSE_FD |
 					  MULTI_QUEUE);
 	}
 
-	igt_subtest("multi-queue-long-spin-many-queue-switch")
+	igt_subtest("multi-queue-long-spin-many-queue-switch") {
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe) {
 			xe_legacy_test_mode(fd, hwe, 4, 8,
 					    LONG_SPIN | MULTI_QUEUE,
 					    LEGACY_MODE_ADDR, false);
 			break;
 		}
+	}
 
-	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
+	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch") {
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe) {
 			xe_legacy_test_mode(fd, hwe, 4, 8,
 					    LONG_SPIN | MULTI_QUEUE |
@@ -1224,6 +1227,7 @@ int igt_main()
 					    LEGACY_MODE_ADDR, false);
 			break;
 		}
+	}
 
 	igt_fixture()
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2f44d5555..24dae2b52 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1721,7 +1721,7 @@ int igt_main()
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("threads-%s", s->name) {
 			if (s->flags & MULTI_QUEUE) {
-				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
+				igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
 						"multi_queue is supported on graphics version 35 and above");
 				/* Balancer can't be set with multi-queue at the same time */
 				igt_assert(!(s->flags & BALANCER));
-- 
2.43.0

