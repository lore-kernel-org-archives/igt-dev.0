Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B25D591AD
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 18:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CFD10E54D;
	Mon, 18 Nov 2024 18:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXmQcgT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724510E13E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731953114; x=1763489114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VevrOWaQrMx8H6OHs50btEJcJFUq+vdlnq8HkvViyek=;
 b=kXmQcgT6NZOjND7pNhE0GTlXxpdoZjG/PxkgRwKMBx5KRpIHJ5YvQfsF
 q7xuSs1ckjAdMHpgmZIGCgbt2ZU+zJAISi9OJdKcaSKLIOf9b5Y6g0FBS
 CAweLPtGz4MmrtirdPhkAMFXkgnmehRqFULm9Wg5WPE4762MHFNYE3zOv
 HBD9llou9rgOGEA+X4oorc8ePepFs/6rAPn8mU6/ucELxgU5iJWqfhSbJ
 Og+R5z2tcgXKsyB8DhUphZWH+SlkFs3YPUr4k07WTY3Sn5Bh4EAmmtOoi
 tk9bFBbNsLcSTmf8oBPD6/I6KPzY6kA5ao4l16+0CZawRlN+WYFaaakhj g==;
X-CSE-ConnectionGUID: 021k8UUGSr6OdE2kJGT6Vg==
X-CSE-MsgGUID: /sOgD3flQJi1L//25B7rcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35597462"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="35597462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:14 -0800
X-CSE-ConnectionGUID: Eh+bB6eeTveMQz5H2+miQg==
X-CSE-MsgGUID: 59HdTNiuSq6uUHJr8BCI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89723623"
Received: from dut4411lnl.fm.intel.com ([10.105.10.34])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 10:05:12 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v7 4/4] tests/intel/xe_sysfs_scheduler: Assert sysfs params
 are restored
Date: Mon, 18 Nov 2024 18:05:11 +0000
Message-ID: <20241118180511.64212-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241118180511.64212-1-jonathan.cavitt@intel.com>
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_scheduler tests modify various sysfs parameters.  At the
end of the test, the sysfs parameters are restored, but we do not
currently assert that the restoration process completes successfully.
Assert the restoration is successful.

Additionally, when the tests fail, it is possible that the various
modified sysfs parameters may be left in modified states, which can
cause future tests to behave unpredictably.  At the end of the test,
attempt to restore all modified sysfs parameters to their original
values, aborting all tests if this is unsuccessful.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 82 ++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 947dbdbc9b..9e04b5c418 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -107,10 +107,19 @@ static void test_min_max(int xe, int engine, const char **property,
 
 	/* Reset property, max, min to original values */
 	igt_sysfs_printf(engine, property[0], "%d", store);
+	igt_sysfs_scanf(engine, property[0], "%u", &set);
+	igt_assert_eq(set, store);
+
 	igt_sysfs_printf(engine, property[1], "%d", default_min);
+	igt_sysfs_scanf(engine, property[1], "%u", &set);
+	igt_assert_eq(set, default_min);
+
 	igt_sysfs_printf(engine, property[2], "%d", default_max);
+	igt_sysfs_scanf(engine, property[2], "%u", &set);
+	igt_assert_eq(set, default_max);
 }
 
+#define MAX_GTS 8
 igt_main
 {
 	static const struct {
@@ -126,10 +135,14 @@ igt_main
 				      {"timeslice_duration_us", "timeslice_duration_min", "timeslice_duration_max"},
 				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
 	};
+
+	unsigned int store[MAX_GTS][3][3];
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int xe = -1;
 	int sys_fd;
 	int gt;
+	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
@@ -138,28 +151,77 @@ igt_main
 		sys_fd = igt_sysfs_open(xe);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(xe, gt) {
+			int *list, size;
+			igt_require(gt_count < MAX_GTS);
+
+			gt_fd[gt_count] = xe_sysfs_gt_open(xe, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+
+			list = igt_sysfs_get_engine_list(engines_fd[gt_count], &size);
+			igt_require(size > 0);
+
+			for (int i = 0; i < size; i++) {
+				for (int j = 0; j < count; j++) {
+					const char **pl = property[j];
+					for (int k = 0; k < 3; k++) {
+						unsigned int *loc = &store[i][j][k];
+
+						igt_require(igt_sysfs_scanf(list[i], pl[k],
+									    "%u", loc) == 1);
+					}
+				}
+			}
+
+			igt_sysfs_free_engine_list(list, size);
+			gt_count++;
+		}
 	}
 
 	for (int i = 0; i < count; i++) {
 		for (typeof(*tests) *t = tests; t->name; t++) {
 			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				int j = 0;
 				xe_for_each_gt(xe, gt) {
-					int engines_fd = -1;
-					int gt_fd = -1;
+					int e = engines_fd[j];
 
-					gt_fd = xe_sysfs_gt_open(xe, gt);
-					igt_require(gt_fd != -1);
-					engines_fd = openat(gt_fd, "engines", O_RDONLY);
-					igt_require(engines_fd != -1);
-
-					igt_sysfs_engines(xe, engines_fd, 0, 0, property[i], t->fn);
-					close(engines_fd);
-					close(gt_fd);
+					igt_sysfs_engines(xe, e, 0, 0, property[i], t->fn);
+					j++;
 				}
 			}
 		}
 	}
+
 	igt_fixture {
+		for (int gtn = gt_count - 1; gtn >= 0; gtn--) {
+			int *list, size;
+			list = igt_sysfs_get_engine_list(engines_fd[gtn], &size);
+
+			for (int i = size - 1; i >= 0; i--) {
+				int e = list[i];
+				for (int j = count - 1; j >= 0; j--) {
+					const char **pl = property[j];
+					for (int k = 2; k >= 0; k--) {
+						unsigned int read = UINT_MAX;
+						unsigned int val = store[i][j][k];
+
+						igt_assert_lte(0, igt_sysfs_printf(e, pl[k],
+									           "%u", val));
+						igt_sysfs_scanf(e, pl[k], "%u", &read);
+						igt_abort_on_f(read != val,
+							       "%s not restored!\n", pl[k]);
+					}
+				}
+			}
+
+			igt_sysfs_free_engine_list(list, size);
+			close(engines_fd[gtn]);
+			close(gt_fd[gtn]);
+		}
+				
 		xe_device_put(xe);
 		close(xe);
 	}
-- 
2.43.0

