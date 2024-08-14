Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61851C52D7F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 17:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF7410E4FE;
	Wed, 14 Aug 2024 17:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXrNB6ER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5233E10E4FF
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723657829; x=1755193829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=buA6O77QUdp8YUMsq1R/HEA34QtFc3fsSq1k5JsepuU=;
 b=dXrNB6ERHnhCEr5C28vBQUWKmkY9tz6gQW/PWo53TTlYppIaq9jIBnQd
 4tbs9757pnQNX+RTka5u/J6q0kOW+LQNgWq8AVvOf0lO9/nlxYrTwVMvT
 loyFX/woDZp07+4qTO9wF4cetAjpt6HfOzMsf4FTKdxsmHSmBB7v/Jhyf
 ABqKKzJF09yt+farM+s4qX+s1lOs4DeTSJIZj0rSLbXzuBhihTO6GsYmi
 fHLenLg7vLUqXYb7RoQlPu91xTyIgpsp1VBi69+wUPwIoLFLoV3qDO5Ao
 Tk+kT7V5g8foVlp1rU/SQDtNIri21gDLYcW2fMOwUsW7bLQBopX80A3vf Q==;
X-CSE-ConnectionGUID: YnvCDJzjTQauaV6v37FNCw==
X-CSE-MsgGUID: HwC+mk5mSsmadFhNoI8GHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25757457"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="25757457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:50:28 -0700
X-CSE-ConnectionGUID: f7D++lYXQnumXZeEDc82mQ==
X-CSE-MsgGUID: 1WDglYzVTh+YT6xj4ttATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63750648"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:50:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/xe: Abstract virtual/parallel setup
Date: Wed, 14 Aug 2024 10:50:13 -0700
Message-ID: <20240814175013.3679997-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814175013.3679997-1-lucas.demarchi@intel.com>
References: <20240814175013.3679997-1-lucas.demarchi@intel.com>
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

Add 2 new functions, xe_gt_count_engines_by_class and
xe_gt_fill_engines_by_class, that can be user as helpers to setup
parallel/virtual exec queue. All the tests were basically looping
and filtering engines that matched gt and class.

Place these new functions in xe_util.c as currently we lack a better
placement. xe_query.c and xe_gt.c could probably be other candidates,
but they all mix all kind of namespaces too.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_util.c               | 47 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h               |  7 +++++
 tests/intel/xe_exec_balancer.c | 31 +++++-----------------
 tests/intel/xe_exec_reset.c    | 11 +++-----
 tests/intel/xe_exec_threads.c  | 30 +++++-----------------
 5 files changed, 70 insertions(+), 56 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 050162b5e..9482819c2 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -255,3 +255,50 @@ bool xe_is_gt_in_c6(int fd, int gt)
 
 	return strcmp(gt_c_state, "gt-c6") == 0;
 }
+
+/**
+ * xe_gt_fill_engines_by_class:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ * @class: engine class to use to filter engines
+ * @eci: output argument to copy engines to
+ *
+ * Fill out @drm_xe_engine_class_instance with all the engines in @gt that have
+ * a certain @class.
+ *
+ * Return: number of engines that match the gt and clas
+ */
+int xe_gt_fill_engines_by_class(int fd, int gt, int class,
+				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE])
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int n = 0;
+
+	xe_for_each_engine(fd, hwe)
+		if (hwe->engine_class == class && hwe->gt_id == gt)
+			eci[n++] = *hwe;
+
+	return n;
+}
+
+/**
+ * xe_gt_count_engines_by_class:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ * @class: engine class to use to filter engines
+ *
+ * Count number of engines in @gt that have a certain @class.
+ *
+ * Return: number of engines that match the gt and clas
+ */
+int xe_gt_count_engines_by_class(int fd, int gt, int class)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int n = 0;
+
+	xe_for_each_engine(fd, hwe)
+		if (hwe->engine_class == class && hwe->gt_id == gt)
+			n++;
+
+	return n;
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 6480ea01a..b9fbfc5cd 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -12,6 +12,8 @@
 #include <stdint.h>
 #include <xe_drm.h>
 
+#include "xe_query.h"
+
 #define XE_IS_SYSMEM_MEMORY_REGION(fd, region) \
 	(xe_region_class(fd, region) == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_VRAM_MEMORY_REGION(fd, region) \
@@ -47,4 +49,9 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 
 bool xe_is_gt_in_c6(int fd, int gt);
 
+int xe_gt_fill_engines_by_class(int fd, int gt, int class,
+				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
+int xe_gt_count_engines_by_class(int fd, int gt, int class);
+
+
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 53ea245a0..36dc56707 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -22,6 +22,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_util.h"
 #include <string.h>
 
 /**
@@ -52,16 +53,10 @@ static void test_all_active(int fd, int gt, int class)
 		struct xe_spin spin;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	int i, num_placements = 0;
+	int i, num_placements;
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-
-		eci[num_placements++] = *hwe;
-	}
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
 		return;
 
@@ -184,18 +179,12 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_placements;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-
-		eci[num_placements++] = *hwe;
-	}
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
 		return;
 
@@ -403,19 +392,13 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_placements;
 	int map_fd = -1;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-
-		eci[num_placements++] = *hwe;
-	}
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
 		return;
 
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index bcda78609..efb7f9e89 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -20,6 +20,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_util.h"
 #include <string.h>
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
@@ -162,21 +163,15 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
-	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	int i, j, b, num_placements = 0, bad_batches = 1;
+	int i, j, b, num_placements, bad_batches = 1;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-
-		eci[num_placements++] = *hwe;
-	}
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	if (num_placements < 2)
 		return;
 
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 06452862e..6fdafdff5 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -22,6 +22,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_util.h"
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
@@ -64,9 +65,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t pad;
 		uint32_t data;
 	} *data;
-	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_engine_class_instance eci[XE_MAX_ENGINE_INSTANCE];
-	int i, j, b, num_placements = 0;
+	int i, j, b, num_placements;
 	bool owns_vm = false, owns_fd = false;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
@@ -81,12 +81,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		owns_vm = true;
 	}
 
-	xe_for_each_engine(fd, hwe) {
-		if (hwe->engine_class != class || hwe->gt_id != gt)
-			continue;
-
-		eci[num_placements++] = *hwe;
-	}
+	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
 	igt_assert_lt(1, num_placements);
 
 	bo_size = sizeof(*data) * n_execs;
@@ -963,14 +958,7 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_placements = 0;
-
-				xe_for_each_engine(fd, hwe) {
-					if (hwe->engine_class != class ||
-					    hwe->gt_id != gt)
-						continue;
-					++num_placements;
-				}
+				int num_placements = xe_gt_count_engines_by_class(fd, gt, class);
 
 				if (num_placements > 1)
 					n_engines += 2;
@@ -1021,16 +1009,10 @@ static void threads(int fd, int flags)
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
 			xe_for_each_engine_class(class) {
-				int num_placements = 0;
+				int num_placements;
 				int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
 
-				xe_for_each_engine(fd, hwe) {
-					if (hwe->engine_class != class ||
-					    hwe->gt_id != gt)
-						continue;
-					++num_placements;
-				}
-
+				num_placements = xe_gt_count_engines_by_class(fd, gt, class);
 				if (num_placements <= 1)
 					continue;
 
-- 
2.43.0

