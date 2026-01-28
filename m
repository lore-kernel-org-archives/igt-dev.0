Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8022BD46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AC510E752;
	Wed, 28 Jan 2026 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVo3psJy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3BC10E752
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623760; x=1801159760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YvjHdZuv03k6fJDMkcIz5oSOOIVcOl+waCfjJ7aVZG4=;
 b=VVo3psJyb5jONmqBmi4RYK6qPMp4Y6gHnEudYrHXSEHKc0/cGRHIpoqz
 pX/BQmLsxv83nqe7EsU9WEjZ4Xg2XoTSlXFp+q6tcSNDFXZGpsrfHOtGy
 ZvcLueRjErPwHYHtGEA8KkpIy4ZD9Fk2kQIeucEutaEfjK8lqiFeuO+aR
 30PxukEXS1V2XKS/qtlC+HsuTmQI0BbzwYxDVQUX/2+bWh9YRfro0/06U
 uznTLr0xlFoolO1HGbFxRGKf2cjKvmmN783aTJLII4v+wx3/2F53PBSpb
 aDJVHjByc1XlvRc19g3gxd6ZX+F+PqFs8wIjEK/ixo+wRGbtVy+ZiEA25 Q==;
X-CSE-ConnectionGUID: PXLaoWZ9TFSlYoby8TWCqg==
X-CSE-MsgGUID: 1Yt734zuQhiXOGMBRWlUiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70563967"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70563967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:20 -0800
X-CSE-ConnectionGUID: lAIIOz1DQsq43aEO61jFjA==
X-CSE-MsgGUID: U7gEKXQqSlm0JAQVBhoVSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208706856"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:09:17 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3 i-g-t 09/10] tests/intel/xe_pmu: Prefer SR-IOV admin sysfs
 accessors
Date: Wed, 28 Jan 2026 19:08:15 +0100
Message-ID: <20260128180819.1373376-10-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Switch xe_pmu scheduling configuration to the SR-IOV admin sysfs
setters for exec_quantum_ms, preempt_timeout_us and sched_priority,
skipping the test if sriov_admin is not available.

Also adopts the “Tie preempt timeout to exec quantum” change using the
new sriov_admin interface.
Link: https://lore.kernel.org/igt-dev/20251107151251.6323-2-jonathan.cavitt@intel.com/

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
v2:
- Adjust to renamed __xe_sriov_admin_* helpers

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_pmu.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 33852270a..fb4b871e7 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -102,6 +102,7 @@
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
+#include "xe/xe_sriov_admin.h"
 #include "xe/xe_sriov_provisioning.h"
 
 #define SLEEP_DURATION 2 /* in seconds */
@@ -702,7 +703,7 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 }
 
 static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
-			       int function, bool sched_if_idle)
+			       int function, enum xe_sriov_sched_priority prio)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
 	double busy_percent, exec_quantum_ratio;
@@ -710,6 +711,9 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	int pmu_fd[2], fn_fd;
 	uint32_t vm;
 
+	if (prio != xe_sriov_admin_get_sched_priority(fd, 0, NULL))
+		xe_sriov_admin_bulk_set_sched_priority(fd, prio);
+
 	if (function > 0) {
 		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
 		igt_assert_fd(fn_fd);
@@ -757,7 +761,7 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	if (function > 0)
 		close(fn_fd);
 
-	if (sched_if_idle)
+	if (prio == XE_SRIOV_SCHED_PRIORITY_NORMAL)
 		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
 	else
 		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
@@ -982,10 +986,12 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 
 static unsigned int enable_and_provision_vfs(int fd)
 {
-	unsigned int gt, num_vfs;
-	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
+	unsigned int num_vfs, vf;
+	uint32_t pf_exec_quantum_ms = 64, vf_exec_quantum_ms = 32;
+	uint32_t pf_preempt_timeout_us = 64000, vf_preempt_timeout_us = 32000;
 
 	igt_require(igt_sriov_is_pf(fd));
+	igt_require(xe_sriov_admin_is_present(fd));
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
 	xe_sriov_require_default_scheduling_attributes(fd);
 	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
@@ -997,37 +1003,33 @@ static unsigned int enable_and_provision_vfs(int fd)
 	igt_require(num_vfs == 2);
 
 	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
-	xe_for_each_gt(fd, gt) {
-		xe_sriov_set_sched_if_idle(fd, gt, 0);
-		for (int fn = 0; fn <= num_vfs; fn++)
-			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
-						     pf_exec_quantum);
-	}
+	xe_sriov_admin_bulk_set_exec_quantum_ms(fd, vf_exec_quantum_ms);
+	xe_sriov_admin_bulk_set_preempt_timeout_us(fd, vf_preempt_timeout_us);
+	xe_sriov_admin_bulk_set_sched_priority(fd, XE_SRIOV_SCHED_PRIORITY_LOW);
+	xe_sriov_admin_set_exec_quantum_ms(fd, 0, pf_exec_quantum_ms);
+	xe_sriov_admin_set_preempt_timeout_us(fd, 0,
+					      pf_preempt_timeout_us);
 
 	/* probe VFs */
 	igt_sriov_enable_driver_autoprobe(fd);
 	for (vf = 1; vf <= num_vfs; vf++)
 		igt_sriov_bind_vf_drm_driver(fd, vf);
 
-	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
+	total_exec_quantum = pf_exec_quantum_ms + (num_vfs * vf_exec_quantum_ms);
 
 	return num_vfs;
 }
 
 static void unprovision_and_disable_vfs(int fd)
 {
-	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
-
-	xe_for_each_gt(fd, gt) {
-		xe_sriov_set_sched_if_idle(fd, gt, 0);
-		for (int fn = 0; fn <= num_vfs; fn++)
-			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
-	}
+	int ret;
 
+	ret = __xe_sriov_admin_bulk_restore_defaults(fd);
 	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
 	/* abort to avoid execution of next tests with enabled VFs */
 	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
 		       "Failed to disable VF(s)");
+	igt_abort_on_f(ret, "Failed to restore scheduling params\n");
 	autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
 		    igt_sriov_disable_driver_autoprobe(fd);
 
@@ -1197,13 +1199,12 @@ int igt_main()
 		igt_describe("Validate per-function engine activity");
 		test_each_engine("fn-engine-activity-load", fd, eci)
 			for (int fn = 0; fn < num_fns; fn++)
-				engine_activity_fn(fd, eci, fn, false);
+				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
 
 		igt_describe("Validate per-function engine activity when sched-if-idle is set");
 		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
-			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
 			for (int fn = 0; fn < num_fns; fn++)
-				engine_activity_fn(fd, eci, fn, true);
+				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
 		}
 
 		igt_fixture()
-- 
2.43.0

