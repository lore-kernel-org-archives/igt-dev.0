Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5120A1061B12
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EAA10E61A;
	Mon, 30 Mar 2026 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTs5De2c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC5B10E5A4
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774885582; x=1806421582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pCDVh/1VJ48EgKrF87i9e01IJHacWb5TY2K7/YbsEqY=;
 b=BTs5De2cJGNgPQq1fY3jS6KFCGc2SKApyMs+cDTarcDU6c6UHSx5JpOL
 OVixwT/obdzNm37Hpdmmi/1DDoeAE5ao5dYQIexWvWqFnDrcecaKnq+u1
 mTwM0GN7lFvg5PtLHc65q0mRY9opWtFMoPjZdlks4sAw7s4IOAv6/Asd8
 apQLHLwGkwvsnTJ7JwnL7BB3EhcHZA7ykPU7GINrUYPQZUbu/AEM8p5Lx
 fHtj+4ZTl81US1syFkMKRbZiUPTBObUWrTjvmdpRKd6Zo18tN0v3uKfqm
 3gXBDhQlF4NUyFC+WNVqHfSyyz4EVBTBFWJIAVF1dD1KWavO/7SKqsP+J A==;
X-CSE-ConnectionGUID: uVmBbEiaTVeZOx/NU6vrhg==
X-CSE-MsgGUID: rYKt95yQSlWyL85tes81+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75946189"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75946189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:21 -0700
X-CSE-ConnectionGUID: NDYimtCtTKOD7E/iZyX/Og==
X-CSE-MsgGUID: +yog4xeuQpiDaMUILIGPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="256593500"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:46:19 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1 2/3] tests/intel/xe_pmu: Check if other processes are
 using the DRM device
Date: Mon, 30 Mar 2026 21:09:15 +0530
Message-Id: <20260330153916.2474178-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330153916.2474178-1-soham.purkait@intel.com>
References: <20260330153916.2474178-1-soham.purkait@intel.com>
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

If the engine accuracy test is run with other processes using the DRM
device, the GPU engine activity may be higher than expected. Which may
lead to false positives in the test, even if the engine activity is
reported correctly.
To help identify this issue, a check for other processes using the DRM
device is provided and a warning message is printed if any such processes
are found and the very test is skipped.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 25 +++++++++++++++++++++++++
 tests/meson.build    |  1 +
 2 files changed, 26 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..4dd610e8c 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -95,6 +95,7 @@
  */
 
 #include "igt.h"
+#include "igt_drm_clients.h"
 #include "igt_perf.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
@@ -507,6 +508,30 @@ static void accuracy(int fd, struct drm_xe_engine_class_instance *eci,
 	uint64_t config, before[2], after[2];
 	int link[2], pmu_fd[2];
 	double engine_activity, expected;
+	unsigned long wait = 100000;
+	struct igt_drm_client_proc *procs = NULL;
+	int num_clients = 0;
+
+	/* Wait for other processes using the DRM device ends */
+	for (int pass = 0; pass < 50; pass++) {
+		if (!igt_drm_get_client_procs(fd, getpid(), NULL))
+			break;
+		usleep(wait);
+	}
+
+	num_clients = igt_drm_get_client_procs(fd, getpid(), &procs);
+
+	/* Check if still any process is using the DRM device */
+	if (num_clients) {
+		for (unsigned int i = 0; i < num_clients; i++) {
+			igt_warn("%s (pid=%u client=%lu) is using DRM device.\n",
+				 procs[i].print_name, procs[i].pid, procs[i].id);
+		}
+		free(procs);
+		procs = NULL;
+		igt_skip("As other processes are using the DRM device, "
+			 "cannot ensure the reliability of this test.\n");
+	}
 
 	cycle_us = min_test_us / target_iter;
 	active_us = cycle_us * target_percentage / 100;
diff --git a/tests/meson.build b/tests/meson.build
index 79f21c018..d13598fdd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -422,6 +422,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_pmu': [ lib_igt_drm_clients ],
         'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
-- 
2.43.0

