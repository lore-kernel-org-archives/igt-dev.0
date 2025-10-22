Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EFECCD1AB
	for <igt-dev@archiver.kernel.org>; Wed, 22 Oct 2025 15:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194110E836;
	Wed, 22 Oct 2025 15:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7K5jI5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B510E824
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Oct 2025 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761148744; x=1792684744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GbmJzeV3X4DpxMudp42isQDGIZ+8twDNUJmIdWKW+Qg=;
 b=S7K5jI5AH9n6wFYVzjV454HHBUoSnIOCgNzxSa+Qe0Hftfoko0bMl3Kv
 77Bca5rzXut0H6obMCr3glJYj4BLtQleyF4R7pWrgM1qCoiGlcOBvtqyT
 TbGP25u0RGwFg2vbgeDD5Y6LTwjREa31G8VvwqMoUXQ8z1HHQkPq5c27X
 ZzeMum+L9LXYbTZK1Zht6I/i+jucZnutvZ4wy5T1USScuOJlmfEVZHaZw
 zc7RM0bILjv1e/UoT1alzdl8+61ew7AyJRRO6b930ZD8QdJTQYo3bauJr
 TuYs4nYbws4fbc+cXQPAzq1Nii8zx+v4p2ENhDlmhk42Cldy+G58PbxVI w==;
X-CSE-ConnectionGUID: TLq5jh4EQE6F67CuiU4TEg==
X-CSE-MsgGUID: gtzfReD5RTOvquVKNqDw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80930405"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="80930405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:58:46 -0700
X-CSE-ConnectionGUID: QYlGuJoiT26KlefH1fsAXw==
X-CSE-MsgGUID: 5fwl6sYaSz6e4OvKibaPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189033883"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:58:43 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_sriov_provisioning: Drop sched_if_idle reads
Date: Wed, 22 Oct 2025 17:58:39 +0200
Message-ID: <20251022155839.288289-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Reflect kernel change making sched_if_idle debugfs attribute write-only.
Remove related getters, checks, and update default attributes and tests.

Link: https://lore.kernel.org/intel-xe/20251021210549.2114-1-michal.wajdeczko@intel.com/

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 41 +---------------------------------
 lib/xe/xe_sriov_provisioning.h |  2 --
 tests/intel/xe_pmu.c           |  9 ++++----
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index ff9d1f7d2..28ce3d95b 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -570,42 +570,6 @@ void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
 	igt_fail_on(__xe_sriov_set_engine_reset(pf, gt_num, value));
 }
 
-/**
- * __xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
- * @pf: PF device file descriptor
- * @gt_num: GT number
- * @value: Pointer to store the read scheduling if idle policy status
- *
- * Reads the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value)
-{
-	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "sched_if_idle", value);
-}
-
-/**
- * xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
- * @pf: PF device file descriptor
- * @gt_num: GT number
- *
- * A throwing version of __xe_sriov_get_sched_if_idle().
- * Instead of returning an error code, it returns the scheduling if idle policy status
- * and asserts in case of an error.
- *
- * Return: The scheduling if idle status for the given GT.
- *         Asserts in case of failure.
- */
-bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num)
-{
-	bool value;
-
-	igt_fail_on(__xe_sriov_get_sched_if_idle(pf, gt_num, &value));
-
-	return value;
-}
-
 /**
  * __xe_sriov_set_sched_if_idle - Set the scheduling if idle policy status for a given GT
  * @pf: PF device file descriptor
@@ -731,7 +695,6 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
  * Default scheduling attributes are as follows for each VF and PF:
  * - exec_quantum_ms equals zero (meaning infinity)
  * - preempt_timeout_us equals zero (meaning infinity)
- * - sched_if_idle equals false
  * - reset_engine equals false
  * - sched_priority equals XE_SRIOV_SCHED_PRIORITY_LOW
  */
@@ -739,13 +702,11 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
 {
 	unsigned int totalvfs = igt_sriov_get_total_vfs(pf);
 	enum xe_sriov_sched_priority sched_priority;
-	bool sched_if_idle, reset_engine;
+	bool reset_engine;
 	uint32_t eq, pt;
 	unsigned int gt;
 
 	xe_for_each_gt(pf, gt) {
-		igt_skip_on(__xe_sriov_get_sched_if_idle(pf, gt, &sched_if_idle));
-		igt_require_f(!sched_if_idle, "sched_if_idle != false on gt%u\n", gt);
 		igt_skip_on(__xe_sriov_get_engine_reset(pf, gt, &reset_engine));
 		igt_require_f(!reset_engine, "reset_engine != false on gt%u\n", gt);
 
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index e1a9d0a63..8ee567bc8 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -134,8 +134,6 @@ int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value);
 bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num);
 int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
 void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
-int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value);
-bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num);
 int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
 void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
 int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba..c630fd047 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -692,13 +692,13 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
 	}
 }
 
-static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
+			       int function, bool sched_if_idle)
 {
 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
 	double busy_percent, exec_quantum_ratio;
 	struct xe_cork *cork = NULL;
 	int pmu_fd[2], fn_fd;
-	bool sched_if_idle;
 	uint32_t vm;
 
 	if (function > 0) {
@@ -748,7 +748,6 @@ static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci,
 	if (function > 0)
 		close(fn_fd);
 
-	sched_if_idle = xe_sriov_get_sched_if_idle(fd, eci->gt_id);
 	if (sched_if_idle)
 		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
 	else
@@ -1188,13 +1187,13 @@ igt_main
 		igt_describe("Validate per-function engine activity");
 		test_each_engine("fn-engine-activity-load", fd, eci)
 			for (int fn = 0; fn < num_fns; fn++)
-				engine_activity_fn(fd, eci, fn);
+				engine_activity_fn(fd, eci, fn, false);
 
 		igt_describe("Validate per-function engine activity when sched-if-idle is set");
 		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
 			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
 			for (int fn = 0; fn < num_fns; fn++)
-				engine_activity_fn(fd, eci, fn);
+				engine_activity_fn(fd, eci, fn, true);
 		}
 
 		igt_fixture
-- 
2.43.0

