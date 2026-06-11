Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D811CD98C7
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 20:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CFC10E865;
	Thu, 11 Jun 2026 20:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTL5mR2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE93C10E865
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 20:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781210540; x=1812746540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3CcrzaDOBKIkQE/b6JmwiJLrP1KOJp2Rf+TXRShiev4=;
 b=cTL5mR2P5qGljdnUU5RBuJKoCQYC/v8vqnJKVN8AIwKw0cE4ai3CgIx6
 u/MPHtaVOtsoyG9XR2gkGhTgJJmmUzVRx1VEBh7aS1u6Qt0x0ifr5VX05
 M1IRNM3OUNFqe7gEStwFeWOd559jMvHJiwhSruFYt2tMdBKpz2TyOy/gV
 3U1lmbKlFUeVXueE3Qvq6uDpWnoBpagnU+PKky2FzhW+8KzzX7nP09l5t
 xxub0NOC751uRgrXA0qxJGGqQKYPbt9kmW5Q/YQqw422/5aG00OqcsoZ/
 FOKx8KO0OWbVsMHybONBwo+d++4HA9I4VoJBm7Hu8rSVWoZLuLMbo3MLk g==;
X-CSE-ConnectionGUID: Cn6I79bCSJ+A8wdeiZ90DA==
X-CSE-MsgGUID: nucfjLI/Q1Kc4aQ0K96dhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99616189"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="99616189"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 13:42:19 -0700
X-CSE-ConnectionGUID: 08ao1kbYTN2RSaTKCIUfZw==
X-CSE-MsgGUID: nH+KWqKrTcWE7/DQYAExVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="244168243"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 11 Jun 2026 13:42:18 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Date: Thu, 11 Jun 2026 20:41:54 +0000
Message-Id: <20260611204154.2000148-1-shuicheng.lin@intel.com>
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

Suggested-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_query.c                 | 16 ++++++++++++++++
 lib/xe/xe_query.h                 |  1 +
 tests/intel/xe_exec_fault_mode.c  |  1 +
 tests/intel/xe_exec_multi_queue.c |  1 +
 tests/intel/xe_exec_reset.c       | 22 ++++++++++++++++++++--
 tests/intel/xe_exec_threads.c     |  1 +
 6 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3286a3b37..27e471840 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -346,6 +346,22 @@ bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class)
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
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 3e92dfbd9..58509db14 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -445,6 +445,7 @@ test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 
 	if (flags & MULTI_QUEUE) {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
 	} else {
diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index d9d648b02..3d9e168b2 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -1094,6 +1094,7 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 	}
 
 	igt_subtest_f("sanity")
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 19643b887..20be33736 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -1103,6 +1103,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-cat-error") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    CAT_ERROR | MULTI_QUEUE,
@@ -1112,6 +1113,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-cat-error-on-secondary") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    CAT_ERROR | MULTI_QUEUE |
@@ -1122,6 +1124,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-gt-reset") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
@@ -1132,6 +1135,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-cancel") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    MULTI_QUEUE,
@@ -1141,6 +1145,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-cancel-on-secondary") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    MULTI_QUEUE | SECONDARY_QUEUE,
@@ -1150,6 +1155,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-close-fd") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(-1, hwe, 16, 256,
 					    CLOSE_FD | MULTI_QUEUE,
@@ -1159,6 +1165,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-close-execqueues") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(-1, hwe, 16, 256,
 					    CLOSE_EXEC_QUEUES | CLOSE_FD |
@@ -1169,6 +1176,7 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-cat-error") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
 					  CAT_ERROR | MULTI_QUEUE);
@@ -1176,6 +1184,7 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
 					  CAT_ERROR | MULTI_QUEUE |
@@ -1184,6 +1193,7 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-gt-reset") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
@@ -1192,6 +1202,7 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-close-fd") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256,
 					  CLOSE_FD | MULTI_QUEUE);
@@ -1199,21 +1210,27 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-close-execqueues") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256,
 					  CLOSE_EXEC_QUEUES | CLOSE_FD |
 					  MULTI_QUEUE);
 	}
 
-	igt_subtest("multi-queue-long-spin-many-queue-switch")
+	igt_subtest("multi-queue-long-spin-many-queue-switch") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
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
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		igt_require(xe_has_multi_queue_engine(fd));
 		xe_for_each_multi_queue_engine(fd, hwe) {
 			xe_legacy_test_mode(fd, hwe, 4, 8,
 					    LONG_SPIN | MULTI_QUEUE |
@@ -1221,6 +1238,7 @@ int igt_main()
 					    LEGACY_MODE_ADDR, false);
 			break;
 		}
+	}
 
 	igt_fixture()
 		drm_close_driver(fd);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2f44d5555..cf8fec6c6 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1723,6 +1723,7 @@ int igt_main()
 			if (s->flags & MULTI_QUEUE) {
 				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
 						"multi_queue is supported on graphics version 35 and above");
+				igt_require(xe_has_multi_queue_engine(fd));
 				/* Balancer can't be set with multi-queue at the same time */
 				igt_assert(!(s->flags & BALANCER));
 			}
-- 
2.43.0

