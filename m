Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FA6D5D695
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046F10E23F;
	Thu,  7 Nov 2024 22:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLGyCeOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627E410E17D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019976; x=1762555976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zSpfBWd7b5yZ4Z7y2qsQsXQapnjM0sBd1RiveJE84aA=;
 b=gLGyCeOKQt/PYchX0eibZmkr30gLaf4XfV9ZaCj4h4OBRbW/IfzTrlDP
 bUv509f+j3UPL2wOOfCO7/CBlV29dcNJyU0AcfgGb1dhYgryjC3+ovpIU
 BNd3kvkeO2/DworbaD3tNuqHkGY2Rc+62R5ZrTMQw9wfneMIFH0P4skg4
 42HyNQAvpbWYjdeN6aK4arXwoe886NvSHp9zEBCp6msJziH7zRvrH+9i/
 5OuZo2jtGi257bKefs05DsuCclnxtZ06RIYlHdGx7OIYomNlUr8Eg5dDR
 zWZQ0QkcSaz2vMKFIvgWlQ7kekVXlwc2J0UqJYJ+3bXoDuppRYSWcZQeV Q==;
X-CSE-ConnectionGUID: R3nRT4FMSxWfLoWrZKRGYg==
X-CSE-MsgGUID: uO3EAPIETXK6J8dz/Q4bew==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31114837"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31114837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:56 -0800
X-CSE-ConnectionGUID: Tfu7nchcQiONfhgYgJgh+A==
X-CSE-MsgGUID: R3xGpLPiQFaE0CmKQQot+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85675166"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:55 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v5 2/3] tests/intel/xe_sysfs*: Restore values on test failure
Date: Thu,  7 Nov 2024 22:52:53 +0000
Message-ID: <20241107225254.302010-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107225254.302010-1-jonathan.cavitt@intel.com>
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
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

Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c    | 55 ++++++++++++++++++-----
 tests/intel/xe_sysfs_timeslice_duration.c | 54 ++++++++++++++++++----
 2 files changed, 90 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 7fa0dfcdf7..209cc4ff94 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -170,6 +170,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	set_preempt_timeout(engine, saved);
 }
 
+#define	MAX_GTS	8
 igt_main
 {
 	static const struct {
@@ -183,8 +184,10 @@ igt_main
 				       "preempt_timeout_min",
 				       "preempt_timeout_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
+	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -192,26 +195,58 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			int engine = 0, e_count = 0;
+			igt_require(gt_count < MAX_GTS);
+
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+
+			while (igt_sysfs_get_next_engine(engines_fd[gt_count], &engine))
+				igt_require(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u",
+							    &pts[gt_count][e_count++]) == 1);
+
+			igt_require(e_count > 0);
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
+		for (int i = gt_count - 1; i >= 0; i--) {
+			int engine = 0, e_count = 0;
+
+			while (igt_sysfs_get_next_engine(engines_fd[i], &engine)) {
+				unsigned int store = UINT_MAX;
+
+				igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us",
+								   "%u", pts[i][e_count]));
+				igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &store);
+				igt_abort_on_f(store != pts[i][e_count],
+					       "preempt_timeout_us not restored!\n");
+
+				e_count++;
+			}
+
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
+
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index cf95a3ac1c..6518086225 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -142,6 +142,7 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	set_timeslice_duration(engine, saved);
 }
 
+#define	MAX_GTS	8
 igt_main
 {
 	static const struct {
@@ -155,8 +156,10 @@ igt_main
 				       "timeslice_duration_min",
 				       "timeslice_duration_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
+	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -164,25 +167,58 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			int engine = 0, e_count = 0;
+			igt_require(gt_count < MAX_GTS);
+
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+
+			while (igt_sysfs_get_next_engine(engines_fd[gt_count], &engine))
+				igt_require(igt_sysfs_scanf(engine, "timeslice_duration_us", "%u",
+							    &tds[gt_count][e_count++]) == 1);
+
+			igt_require(e_count > 0);
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
+		for (int i = gt_count - 1; i >= 0; i--) {
+			int engine = 0, e_count = 0;
+
+			while (igt_sysfs_get_next_engine(engines_fd[i], &engine)) {
+				unsigned int store = UINT_MAX;
+
+				igt_assert_lte(0, igt_sysfs_printf(engine, "timeslice_duration_us",
+								   "%u", tds[i][e_count]));
+				igt_sysfs_scanf(engine, "timeslice_duration_us", "%u", &store);
+				igt_abort_on_f(store != tds[i][e_count],
+					       "timeslice_duration_us not restored!\n");
+
+				e_count++;
+			}
+
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
+
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0

