Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D09BF46433
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 09:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC4C10E380;
	Mon, 16 Mar 2026 09:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoE2tNSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B710E380
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773653582; x=1805189582;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1bCmj6fRNxtqKx0TEOAs9X/J0M2YQM13cuO19LI1qE4=;
 b=HoE2tNSW83khuTWFtvwJmDbzGa7GSRdoT/S4He3Pv/GZ+xwsK4+XZ5Kj
 YozivakvHciPT1VZJZX+xauH/GT5c3zSftedspfmXsRZrUentqbnOGlgE
 bG8sJhqNsZ6IYDkiPmulVmg0x4Ne9q0bVmVz7BoyGoY0xAUfdfD3efOLU
 X5DyIgn780V0IYi7bHoSTxSlq15izrr6h1CN1fDkTSOSBGeb/9qF0TY9J
 C8300E3kYxeAPCf2fMMJ56CBmc15cQJodKzIZIofO9S0PxMvA7andWZrZ
 MRHuYO27G4WyOwEeuyerx4+KCbC73bUde6HZOUxnh3Bca7q8fNZNQweBn Q==;
X-CSE-ConnectionGUID: koU6ADkwT/eE3dtzgs+9RQ==
X-CSE-MsgGUID: VxcFs8uPQ5qGLnq3LOrp0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74549298"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74549298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:33:02 -0700
X-CSE-ConnectionGUID: CzR81FEqRLuELI4n9EbxiA==
X-CSE-MsgGUID: 4guY5cGjQlKMSkcUpdKYGA==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:32:59 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 1/2] tests/intel/xe_pmu: Check if other processes are
 using the DRM device
Date: Mon, 16 Mar 2026 14:56:28 +0530
Message-Id: <20260316092629.1337527-1-soham.purkait@intel.com>
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

If the test is run with other processes using the DRM device, the GPU
engine activity may be higher than expected. Which may lead to false
positives in the test, even if the engine activity is reported correctly.
To help identify this issue, a check for other processes using the DRM
device is provided and a warning message is printed if any such processes
are found and the very test is skipped.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |  1 +
 2 files changed, 86 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..381cf3ad8 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -95,10 +95,14 @@
  */
 
 #include "igt.h"
+#include "igt_drm_clients.h"
 #include "igt_perf.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
@@ -499,6 +503,74 @@ static void engine_activity_load_all(int fd, int num_engines, unsigned int flags
 		     (double)(x), (double)(tol), (double)(tol), \
 		     (double)(ref), #x, #ref)
 
+static int print_card_fd_user_process_names(int card_fd, bool if_print)
+{
+	struct igt_drm_clients *clients;
+	struct igt_drm_client *c;
+	struct stat st;
+	pid_t *seen_pids = NULL;
+	pid_t self = getpid();
+	unsigned int drm_minor;
+	unsigned int seen = 0;
+	int i;
+	bool found = false;
+
+	igt_assert_f(fstat(card_fd, &st) == 0 &&
+		     S_ISCHR(st.st_mode) &&
+		     major(st.st_rdev) == 226,
+		     "fd %d is not a DRM device node\n", card_fd);
+
+	drm_minor = minor(st.st_rdev);
+
+	clients = igt_drm_clients_init(NULL);
+	igt_assert_f(clients, "Failed to allocate DRM clients context\n");
+
+	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
+
+	if (clients->num_clients)
+		seen_pids = calloc(clients->num_clients, sizeof(*seen_pids));
+
+	igt_for_each_drm_client(clients, c, i) {
+		unsigned int j;
+		bool duplicate = false;
+
+		if (c->status != IGT_DRM_CLIENT_ALIVE)
+			continue;
+
+		if (c->drm_minor != drm_minor)
+			continue;
+
+		for (j = 0; j < seen; j++) {
+			if (seen_pids[j] == (pid_t)c->pid) {
+				duplicate = true;
+				break;
+			}
+		}
+
+		if (duplicate)
+			continue;
+
+		if (seen_pids)
+			seen_pids[seen++] = c->pid;
+
+		if ((pid_t)c->pid == self)
+			continue;
+
+		if (if_print)
+			igt_warn("%s (pid=%u client=%lu) is using DRM device.\n",
+				 c->print_name, c->pid, c->id);
+		found = true;
+	}
+
+	free(seen_pids);
+	igt_drm_clients_free(clients);
+
+	if (!found)
+		return 0;
+
+	return -1;
+}
+
 static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 		     unsigned long target_percentage, unsigned long target_iter)
 {
@@ -507,6 +579,19 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t config, before[2], after[2];
 	int link[2], pmu_fd[2];
 	double engine_activity, expected;
+	unsigned long wait = 100000;
+
+	/* Wait for other processes using the DRM device ends */
+	for (int pass = 0; pass < 50; pass++) {
+		if (!print_card_fd_user_process_names(fd, false))
+			break;
+		usleep(wait);
+	}
+
+	/* Check if still any process is using the DRM device */
+	if (print_card_fd_user_process_names(fd, true) == -1)
+		igt_skip("Other processes are using the DRM device, "
+			 "cannot ensure the reliability of this test.\n");
 
 	cycle_us = min_test_us / target_iter;
 	active_us = cycle_us * target_percentage / 100;
diff --git a/tests/meson.build b/tests/meson.build
index 79f21c018..649ed90a4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -422,6 +422,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_pmu': [ lib_igt_drm_clients, lib_igt_drm_fdinfo ],
         'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
-- 
2.43.0

