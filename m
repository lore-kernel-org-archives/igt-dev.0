Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E29CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 03:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99B910E40D;
	Wed, 17 Sep 2025 03:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWzrvsQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9010E408
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080303; x=1789616303;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p3BkV98TzYmUdLlHd8DjR9cElt8hnDK67co4nDl1rN4=;
 b=RWzrvsQ+dWCycyGEaBztNBfLN9lyYBgo+J9kq/NAPI3yScqutJP8EjvQ
 IkJRR89UX3vuloTjroZp94O+8oVfe+ZIoqJL2V54YpTlNW6QYqVWNtz01
 tg1NtNuVs7+niFTMqDgRAlNDNKzNZekIf2c3m3qgMUIicUCrqnVEr/IOK
 z0JDtfekDULDHpzCpnrKur1/eEEiNZYqAKlQ3/NNsFzkINsqOUxjnC5DF
 76duiE9jhi8+dsOm/WwdtB1t5fDwnHoGFT4uoIhza8oduGzhGT5GBdae9
 U33GA9QZTTKZ+b4gYB0R/vKAKoyW6UAwqMrYmreT6qIiDzbqDWREgR19H Q==;
X-CSE-ConnectionGUID: Qoyb94f7SFe71ntjFz5qnQ==
X-CSE-MsgGUID: A/XHHDD9TRCB1hOmGOfzcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060316"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:23 -0700
X-CSE-ConnectionGUID: LODVp33sScKsX4Iov2yqrw==
X-CSE-MsgGUID: F6iRMXP3TruKujY1UfaJLw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/3] tests/intel/xe_exec_reset: Add job cancel tests
Date: Tue, 16 Sep 2025 20:38:16 -0700
Message-Id: <20250917033818.3977464-2-matthew.brost@intel.com>
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

This test has pulled out when the ability to set the job timeout via
IOCTL was removed from the uAPI while upstreaming Xe. Add this coverage
back in but only run on a single hardware engine given by default jobs
take 5 seconds to timeout.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_legacy.c          |  3 ++-
 tests/intel/xe_exec_reset.c | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 6570cf1e6e..669ecff7aa 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -12,6 +12,7 @@
 
 /* Batch buffer element count, in number of dwords(u32) */
 #define BATCH_DW_COUNT			16
+#define PREEMPT				(0x1 << 6)
 #define CAT_ERROR			(0x1 << 5)
 #define CLOSE_EXEC_QUEUES		(0x1 << 2)
 #define CLOSE_FD			(0x1 << 1)
@@ -56,7 +57,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 pad;
 		u32 data;
 	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
+	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
 	int i, b;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7ae53c6790..72b85d3e7b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -116,6 +116,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define VIRTUAL				(0x1 << 3)
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
+#define PREEMPT				(0x1 << 6)
 
 /**
  * SUBTEST: %s-cat-error
@@ -295,6 +296,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: cat-error
  * Description: Test cat error
  *
+ * SUBTEST: cancel
+ * Description: Test job cancel
+ *
+ * SUBTEST: cancel-preempt
+ * Description: Test job cancel with a preemptable job
+ *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
@@ -350,7 +357,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
-	struct xe_spin_opts spin_opts = { .preempt = false };
+	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
 	int i, b;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
@@ -659,6 +666,20 @@ igt_main
 			xe_legacy_test_mode(fd, hwe, 2, 2, CAT_ERROR,
 					    LEGACY_MODE_ADDR, false);
 
+	igt_subtest("cancel")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 1, 1, 0,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("cancel-preempt")
+		xe_for_each_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 1, 1, PREEMPT,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
 	igt_subtest("gt-reset")
 		xe_for_each_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 2, 2, GT_RESET,
-- 
2.34.1

