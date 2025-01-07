Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C1CE77199
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D0610E31D;
	Tue,  7 Jan 2025 20:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIozSu8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D77D10E790
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736281685; x=1767817685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W+/tvZoMP7qpqP10aSmCtEAUBgIRAUGP7d+zwrSpDk8=;
 b=VIozSu8RbOOT2TLQyTo95kiKcXdRrpielgWGiScl6Fv48h4QcmH+/mHu
 yBfGiRzB8zzSFCNHOvASAN94vbDAAvUziJQCoA/GfV3oadXpv7I3TuO8b
 5Y9YYYWdbLdLAMvkR/5yzqUY5mNYGoKNYSfttpxgsJ9YQ+6kQhjuZxL/s
 mB54aE4qQJ9ny7OIwoZ2lk20Il1qovuz4LCgwWu6D6ayz4w10n4cYRcev
 /qK9KXMpfN6J6vY8QG/oidrEuHn6g7NSPM5/gJd9xuufD1JvgneHHdSjf
 2gvTlEmOPikEgLryEyCpjdqT3AaiIye4q+NVp/B0c4+6vKWCK9Tv9gffM A==;
X-CSE-ConnectionGUID: EqEGc2N8RwmxzkUFVsUzUQ==
X-CSE-MsgGUID: 7FIYHcnqSeaeO8hrS9aIkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39309009"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="39309009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:05 -0800
X-CSE-ConnectionGUID: Tpv992OVTvq2g8dz4Q2+SQ==
X-CSE-MsgGUID: 62+mK3kPTgmnxa33bGznfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133725677"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:28:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 2/8] lib/xe: Move functions from xe_util to xe_gt
Date: Tue,  7 Jan 2025 12:26:09 -0800
Message-ID: <20250107202615.1306306-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250107202615.1306306-1-lucas.demarchi@intel.com>
References: <20250107202615.1306306-1-lucas.demarchi@intel.com>
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

Some functions are clearly gt-related, so move them to xe_gt.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_gt.c                 | 67 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_gt.h                 |  8 ++++
 lib/xe/xe_util.c               | 67 ----------------------------------
 lib/xe/xe_util.h               |  7 ----
 tests/intel/xe_drm_fdinfo.c    |  3 +-
 tests/intel/xe_exec_balancer.c |  2 +-
 tests/intel/xe_exec_reset.c    |  2 +-
 tests/intel/xe_exec_threads.c  |  2 +-
 tests/intel/xe_gt_freq.c       |  2 +-
 tests/intel/xe_pm_residency.c  |  3 +-
 10 files changed, 83 insertions(+), 80 deletions(-)

diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
index 53554beb0..e1f353b41 100644
--- a/lib/xe/xe_gt.c
+++ b/lib/xe/xe_gt.c
@@ -174,3 +174,70 @@ int xe_gt_stats_get_count(int fd, int gt, const char *stat)
 
 	return count;
 }
+
+/**
+ * xe_is_gt_in_c6:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ *
+ * Check if GT is in C6 state
+ */
+bool xe_is_gt_in_c6(int fd, int gt)
+{
+	char gt_c_state[16];
+	int gt_fd;
+
+	gt_fd = xe_sysfs_gt_open(fd, gt);
+	igt_assert(gt_fd >= 0);
+	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
+	close(gt_fd);
+
+	return strcmp(gt_c_state, "gt-c6") == 0;
+}
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
diff --git a/lib/xe/xe_gt.h b/lib/xe/xe_gt.h
index 756b5f38e..47569cec3 100644
--- a/lib/xe/xe_gt.h
+++ b/lib/xe/xe_gt.h
@@ -8,6 +8,8 @@
 
 #include "lib/igt_gt.h"
 
+#include "xe_query.h"
+
 bool has_xe_gt_reset(int fd);
 void xe_force_gt_reset_all(int fd);
 igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
@@ -15,4 +17,10 @@ igt_hang_t xe_hang_ring(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 void xe_post_hang_ring(int fd, igt_hang_t arg);
 int xe_gt_stats_get_count(int fd, int gt, const char *stat);
 
+bool xe_is_gt_in_c6(int fd, int gt);
+
+int xe_gt_fill_engines_by_class(int fd, int gt, int class,
+				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
+int xe_gt_count_engines_by_class(int fd, int gt, int class);
+
 #endif
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 9482819c2..f0b6bbb2d 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -235,70 +235,3 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 
 	free(bind_ops);
 }
-
-/**
- * xe_is_gt_in_c6:
- * @fd: pointer to xe drm fd
- * @gt: gt number
- *
- * Check if GT is in C6 state
- */
-bool xe_is_gt_in_c6(int fd, int gt)
-{
-	char gt_c_state[16];
-	int gt_fd;
-
-	gt_fd = xe_sysfs_gt_open(fd, gt);
-	igt_assert(gt_fd >= 0);
-	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
-	close(gt_fd);
-
-	return strcmp(gt_c_state, "gt-c6") == 0;
-}
-
-/**
- * xe_gt_fill_engines_by_class:
- * @fd: pointer to xe drm fd
- * @gt: gt number
- * @class: engine class to use to filter engines
- * @eci: output argument to copy engines to
- *
- * Fill out @drm_xe_engine_class_instance with all the engines in @gt that have
- * a certain @class.
- *
- * Return: number of engines that match the gt and clas
- */
-int xe_gt_fill_engines_by_class(int fd, int gt, int class,
-				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE])
-{
-	struct drm_xe_engine_class_instance *hwe;
-	int n = 0;
-
-	xe_for_each_engine(fd, hwe)
-		if (hwe->engine_class == class && hwe->gt_id == gt)
-			eci[n++] = *hwe;
-
-	return n;
-}
-
-/**
- * xe_gt_count_engines_by_class:
- * @fd: pointer to xe drm fd
- * @gt: gt number
- * @class: engine class to use to filter engines
- *
- * Count number of engines in @gt that have a certain @class.
- *
- * Return: number of engines that match the gt and clas
- */
-int xe_gt_count_engines_by_class(int fd, int gt, int class)
-{
-	struct drm_xe_engine_class_instance *hwe;
-	int n = 0;
-
-	xe_for_each_engine(fd, hwe)
-		if (hwe->engine_class == class && hwe->gt_id == gt)
-			n++;
-
-	return n;
-}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index b9fbfc5cd..c544d912f 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -47,11 +47,4 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 			  struct igt_list_head *obj_list,
 			  uint32_t sync_in, uint32_t sync_out);
 
-bool xe_is_gt_in_c6(int fd, int gt);
-
-int xe_gt_fill_engines_by_class(int fd, int gt, int class,
-				struct drm_xe_engine_class_instance eci[static XE_MAX_ENGINE_INSTANCE]);
-int xe_gt_count_engines_by_class(int fd, int gt, int class);
-
-
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 0d1cbfe59..6144caafc 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -8,11 +8,12 @@
 #include "igt_device.h"
 #include "igt_drm_fdinfo.h"
 #include "lib/igt_syncobj.h"
+
 #include "xe_drm.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
-#include "xe/xe_util.h"
 
 /**
  * TEST: xe drm fdinfo
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 1e552e9ef..bc15cc0f8 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -19,10 +19,10 @@
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
-#include "xe/xe_util.h"
 #include <string.h>
 
 /**
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a3eaf8bbf..e2557f345 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -21,8 +21,8 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_spin.h"
-#include "xe/xe_util.h"
 #include <string.h>
 
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 661117bed..be5549c84 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -21,8 +21,8 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_spin.h"
-#include "xe/xe_util.h"
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index de4d111ea..a4791071f 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -17,10 +17,10 @@
 #include "igt_sysfs.h"
 
 #include "xe_drm.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
 #include "xe/xe_query.h"
-#include "xe/xe_util.h"
 
 #include <string.h>
 #include <sys/time.h>
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index d4b26b231..8a9e2c89e 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -21,9 +21,10 @@
 #include "igt_sysfs.h"
 
 #include "lib/igt_syncobj.h"
+
 #include "xe/xe_ioctl.h"
+#include "xe/xe_gt.h"
 #include "xe/xe_query.h"
-#include "xe/xe_util.h"
 
 #define NUM_REPS 16 /* No of Repetitions */
 #define SLEEP_DURATION 3 /* in seconds */
-- 
2.47.0

