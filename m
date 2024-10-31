Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F89AD767E2
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 16:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8267410E8DF;
	Thu, 31 Oct 2024 16:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auAh6FVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349110E414
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730392283; x=1761928283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCgzTbyXImUHpdiwm8QWn9//dsD9U9JAAuOaMncnYRw=;
 b=auAh6FVEQ94rki7T2zxikyXErvDD8PnUQZeUWBCEVxVvD9KgbF4XseuT
 CUEY9vz7CqwHELb9dwAjaen7SOwr+KWepdBLgPHyFehnd8PBHK/CTr2SI
 MZNIiiuNOYTVmuuea382beQN9npg8huBVUhODJfX96CeCEimtemyBF9cw
 dF29j1z0DSnEcc+YFPHKXOPDiT7HuWlrtoWkH9eTa7Ytw4eNLf69Oae5k
 M84tz85nKRyVq+6PAsPK21If2A1zfaJZotYyqX+TFmvP5sHpWEnYS1oZ+
 V+dA03CTZjb9qyIVbrS1ABjc9zmQdnlqo8DcepPNAWUu+FV3jBV2r7h83 A==;
X-CSE-ConnectionGUID: hkzD6qAVQ8W7SWd7OvFpaQ==
X-CSE-MsgGUID: yL6jih1XQkSfSUfEUvchyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17782503"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17782503"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:31:23 -0700
X-CSE-ConnectionGUID: xt3mjs0zQBix4nX7W2d81g==
X-CSE-MsgGUID: l24JerZ3R4SzNlA9DAYxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82804808"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 09:31:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v2 1/2] tests/intel/sysfs: Restore sysfs values on test failure
Date: Thu, 31 Oct 2024 16:31:21 +0000
Message-ID: <20241031163122.37356-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241031163122.37356-1-jonathan.cavitt@intel.com>
References: <20241031163122.37356-1-jonathan.cavitt@intel.com>
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

Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_sysfs_preempt_timeout.c    | 34 ++++++++++++++++-------
 tests/intel/xe_sysfs_timeslice_duration.c | 33 ++++++++++++++++------
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 7fa0dfcdf7..1b9c26bfdc 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -183,8 +183,10 @@ igt_main
 				       "preempt_timeout_min",
 				       "preempt_timeout_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[8], gt_fd[8];
+	unsigned int pts[8];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -192,26 +194,38 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
+						   "preempt_timeout_us",
+						   "%u", &pts[gt_count]) == 1);
+			gt_count++;
+		}
+
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
+					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
+										    t->fn);
+					j++;
 				}
 			}
 		}
 	}
 	igt_fixture {
+		for (int i = gt_count - 1; i >= 0; i--) {
+			set_preempt_timeout(engines_fd[i], pts[i]);
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index cf95a3ac1c..914575a282 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -155,8 +155,10 @@ igt_main
 				       "timeslice_duration_min",
 				       "timeslice_duration_max"}, };
 	int count = sizeof(property) / sizeof(property[0]);
+	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
-	int engines_fd = -1, gt_fd = -1;
+	int engines_fd[8], gt_fd[8];
+	unsigned int tds[8];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -164,25 +166,38 @@ igt_main
 		sys_fd = igt_sysfs_open(fd);
 		igt_require(sys_fd != -1);
 		close(sys_fd);
+
+		xe_for_each_gt(fd, gt) {
+			gt_fd[gt_count] = xe_sysfs_gt_open(fd, gt);
+			igt_require(gt_fd[gt_count] != -1);
+			engines_fd[gt_count] = openat(gt_fd[gt_count],
+					                  "engines", O_RDONLY);
+			igt_require(engines_fd[gt_count] != -1);
+			igt_assert(igt_sysfs_scanf(engines_fd[gt_count],
+						   "timeslice_duration_us",
+						   "%u", &tds[gt_count]) == 1);
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
+					igt_sysfs_engines(fd, engines_fd[j], gt, 1, property[i],
+										    t->fn);
+					j++;
 				}
 			}
 		}
 	}
 	igt_fixture {
+		for (int i = gt_count - 1; i >= 0; i--) {
+			set_timeslice_duration(engines_fd[i], tds[i]);
+			close(engines_fd[i]);
+			close(gt_fd[i]);
+		}
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0

