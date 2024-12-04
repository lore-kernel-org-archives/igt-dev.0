Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F723E77171
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 22:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030410E5B4;
	Wed,  4 Dec 2024 22:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQW1dexe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841410E5BC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733351029; x=1764887029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tfNl66JJhEXZzhFFfP981BbPOxLXoxiY1S/+S+tPirc=;
 b=EQW1dexektUIjbqRh7HHeC2uVnLsuSMO5P5foi8EdL7awPkpWdJ3LAqJ
 j5AJ4N44Yw7Lrvm9O3BA/eeaWsrdnsbXT8W3KLu15CO/t+YZFnlvuM4PS
 VmXxR/uNG7W2eOlRVXXhgEcGqI7V66i/jzIgauyzXYRJNQiw2NHteEWfI
 Pyw5p0XXjlgsAQl8UlGWnY/i/WzVNDMFjudPLXEzHF8apTnxPgcSnjl4B
 TzCsnPEoaiwkgNFr55yzTHD/4k4Vkjsn3TAdVuMAkvt38RZALE/KDqAvE
 fBjrAwL170uRULRmZbLeC7TmCUOH5vkdk9PrWDwOIfhFv7w8YZAN4pK+X w==;
X-CSE-ConnectionGUID: VPgpRlMKRa2nK6WbNjaf4w==
X-CSE-MsgGUID: tZIPcgKnTqeEp6DVQ9r99A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37415824"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="37415824"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:23:48 -0800
X-CSE-ConnectionGUID: TFQHYANKT/C8XZm9bqYWfQ==
X-CSE-MsgGUID: EHp4YVAzTm2DIq3roxFHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="94084693"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:23:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v10 2/4] tests/intel/xe_sysfs*: Restore values on test failure
Date: Wed,  4 Dec 2024 22:23:45 +0000
Message-ID: <20241204222347.108788-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204222347.108788-1-jonathan.cavitt@intel.com>
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
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

The tests xe_sysfs_preempt_timeout and xe_sysfs_timeslice_duration
modify the values of preempt_timeout_us and timeslice_duration_us,
respectively.  However, on a test failure, it is possible that these
values may remain in their modified states, resulting in the values
being used in future tests and causing unexpected behavior.

Save the respective modified values before starting the test and attempt
to restore the values on test exit.

v2:
- Fix some formatting issues (Kamil)
- Abort if value restore fails (Kamil)
- Directly call igt_sysfs_printf on exit to avoid duplicating on helper
  (Kamil)

v3:
- Do not compare potentially unassigned variable (Kamil)
- Whitespace and commit name fixes (Kamil)

v4:
- Fix igt_sysfs_scanf/printf usage in tests (Kamil)

v5:
- Store engine lists (Kamil)

Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c    | 65 +++++++++++++++++++----
 tests/intel/xe_sysfs_timeslice_duration.c | 64 ++++++++++++++++++----
 2 files changed, 110 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 7fa0dfcdf7..139f68d22b 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -170,6 +170,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	set_preempt_timeout(engine, saved);
 }
 
+#define	MAX_GTS	8
 igt_main
 {
 	static const struct {
@@ -183,8 +184,11 @@ igt_main
 				       "preempt_timeout_min",
 				       "preempt_timeout_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
+	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
+	int *engine_list[MAX_GTS];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -192,26 +196,67 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			int *list, i = 0;
+
+			igt_require(gt_count < MAX_GTS);
+
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+
+			list = igt_sysfs_get_engine_list(engines_fd[gt_count]);
+
+			while (list[i] != -1) {
+				igt_require(igt_sysfs_scanf(list[i], "preempt_timeout_us", "%u",
+							    &pts[gt_count][i]) == 1);
+				i++;
+			}
+
+			igt_require(i > 0);
+			engine_list[gt_count] = list;
+			gt_count++;
+		}
 	}
 
 	for (int i = 0; i < count; i++) {
 		for (typeof(*tests) *t = tests; t->name; t++) {
 			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				int j = 0;
 				xe_for_each_gt(fd, gt) {
-					gt_fd = xe_sysfs_gt_open(fd, gt);
-					igt_require(gt_fd != -1);
-					engines_fd = openat(gt_fd, "engines", O_RDONLY);
-					igt_require(engines_fd != -1);
-
-					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
-									  t->fn);
-					close(engines_fd);
-					close(gt_fd);
+					int e = engines_fd[j];
+
+					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
+					j++;
 				}
 			}
 		}
 	}
 	igt_fixture {
+		for (int i = 0; i < gt_count; i++) {
+			int *list, j = 0;
+
+			list = engine_list[i];
+
+			while (list[j] != -1) {
+				unsigned int store = UINT_MAX;
+
+				igt_sysfs_printf(list[j], "preempt_timeout_us",
+						 "%u", pts[i][j]);
+				igt_sysfs_scanf(list[j], "preempt_timeout_us",
+						"%u", &store);
+				igt_abort_on_f(store != pts[i][j],
+					       "preempt_timeout_us not restored!\n");
+				j++;
+			}
+
+			igt_sysfs_free_engine_list(list);
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
+
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index cf95a3ac1c..899093a9df 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -142,6 +142,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	set_timeslice_duration(engine, saved);
 }
 
+#define	MAX_GTS	8
 igt_main
 {
 	static const struct {
@@ -155,8 +156,11 @@ igt_main
 				       "timeslice_duration_min",
 				       "timeslice_duration_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
+	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
+	int *engine_list[MAX_GTS];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -164,25 +168,67 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			int *list, i = 0;
+
+			igt_require(gt_count < MAX_GTS);
+
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+
+			list = igt_sysfs_get_engine_list(engines_fd[gt_count]);
+
+			while (list[i] != -1) {
+				igt_require(igt_sysfs_scanf(list[i], "timeslice_duration_us", "%u",
+							    &tds[gt_count][i]) == 1);
+				i++;
+			}
+
+			igt_require(i > 0);
+			engine_list[gt_count] = list;
+			gt_count++;
+		}
 	}
 
 	for (int i = 0; i < count; i++) {
 		for (typeof(*tests) *t = tests; t->name; t++) {
 			igt_subtest_with_dynamic_f("%s-%s", property[i][0], t->name) {
+				int j = 0;
 				xe_for_each_gt(fd, gt) {
-					gt_fd = xe_sysfs_gt_open(fd, gt);
-					igt_require(gt_fd != -1);
-					engines_fd = openat(gt_fd, "engines", O_RDONLY);
-					igt_require(engines_fd != -1);
-					igt_sysfs_engines(fd, engines_fd, gt, 1, property[i],
-										 t->fn);
-					close(engines_fd);
-					close(gt_fd);
+					int e = engines_fd[j];
+
+					igt_sysfs_engines(fd, e, gt, 1, property[i], t->fn);
+					j++;
 				}
 			}
 		}
 	}
 	igt_fixture {
+		for (int i = 0; i < gt_count; i++) {
+			int *list, j = 0;
+
+			list = engine_list[i];
+
+			while (list[j] != -1) {
+				unsigned int store = UINT_MAX;
+
+				igt_sysfs_printf(list[j], "timeslice_duration_us",
+						"%u", tds[i][j]);
+				igt_sysfs_scanf(list[j], "timeslice_duration_us",
+						"%u", &store);
+				igt_abort_on_f(store != tds[i][j],
+					       "timeslice_duration_us not restored!\n");
+				j++;
+			}
+
+			igt_sysfs_free_engine_list(list);
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
+
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0

