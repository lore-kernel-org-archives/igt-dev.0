Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD8BCAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 03:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738210E40E;
	Wed, 17 Sep 2025 03:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ab0yA1KH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2D810E405
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080304; x=1789616304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZTwa0gH4hYZ1diod6u3M1coXY5wZQIia92i5xXvXsDc=;
 b=Ab0yA1KHG75OI+EJRD9h4m7IEPwHzgcrw9hhRsZorbJNx6R0o5/3ewp+
 DdA5dW0+7pihyqqdc8i41fCyNufzX8X+QO5KxJEWeeacwrdqV+lFYuC0e
 X9bhB7LaDNsKXPffL4J22+prbnMre4zyzlsZDUVEK0K83kHHBBvyPVVte
 CSar7dM106bFRSx6DiSeeMRwLGoBdNYMaepmN2mjesTTa520LqYFquhm2
 Omwxvtw0RLOrd+lzJn2nUzPwm/SxF3BC2Tarvu+gSo6n+Um+7Ik2aO7R2
 IJ/uRUXq5Dyz2o2V6j4VIHsdvI0ZTRb0OZIcOo4mc/Migs5Y0C3FDHi86 Q==;
X-CSE-ConnectionGUID: 8jCWf0rxSZGbweWC/qyFKg==
X-CSE-MsgGUID: eAk1LqSeQgiZf55tHoHIZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060317"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060317"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:23 -0700
X-CSE-ConnectionGUID: iCgaR1cbQraGFuY0/L4x7w==
X-CSE-MsgGUID: C1IgpoZqSmqk2wWdM2rY7A==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/3] tests/intel/xe_exec_reset: Add timeslice preempt test
Date: Tue, 16 Sep 2025 20:38:17 -0700
Message-Id: <20250917033818.3977464-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917033818.3977464-1-matthew.brost@intel.com>
References: <20250917033818.3977464-1-matthew.brost@intel.com>
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

Add tests in which submit multiple preemptable spinners to same hardware
engine ensuring a cumulative longer timeout and validating the restart
paths in the DRM scheduler TDR (Timeout Detection and Recovery).

v3:
 - Spell out TDR (Kamal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_legacy.c          |  5 +++--
 tests/intel/xe_exec_reset.c | 25 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 669ecff7aa..9d2da7f413 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -12,6 +12,7 @@
 
 /* Batch buffer element count, in number of dwords(u32) */
 #define BATCH_DW_COUNT			16
+#define CANCEL				(0x1 << 7)
 #define PREEMPT				(0x1 << 6)
 #define CAT_ERROR			(0x1 << 5)
 #define CLOSE_EXEC_QUEUES		(0x1 << 2)
@@ -100,7 +101,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i) {
+		if (!i || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -155,7 +156,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	if (!use_capture_mode && !(flags & GT_RESET)) {
+	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 72b85d3e7b..88e9df6fbb 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -117,6 +117,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
 #define PREEMPT				(0x1 << 6)
+#define CANCEL				(0x1 << 7)
 
 /**
  * SUBTEST: %s-cat-error
@@ -302,6 +303,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: cancel-preempt
  * Description: Test job cancel with a preemptable job
  *
+ * SUBTEST: cancel-timeslice-preempt
+ * Description: Test job cancel with 2 preemptable jobs
+ *
+ * SUBTEST: cancel-timeslice-many-preempt
+ * Description: Test job cancel with many preemptable jobs
+ *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
@@ -396,7 +403,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i) {
+		if (!i || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -451,7 +458,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & GT_RESET)) {
+	if (!(flags & (GT_RESET | CANCEL))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
@@ -680,6 +687,20 @@ igt_main
 			break;
 		}
 
+	igt_subtest("cancel-timeslice-preempt")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 2, 2, CANCEL | PREEMPT,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("cancel-timeslice-many-preempt")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 4, CANCEL | PREEMPT,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
-- 
2.34.1

