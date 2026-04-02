Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E094D3941E
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 13:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D872E10E4E8;
	Thu,  2 Apr 2026 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJAww7Uy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FF710E40B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775135262; x=1806671262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gl2m4B3hXGUHfHQ7XmcHdV8EbCM2HwW1b+Q3p2ZZLY8=;
 b=EJAww7UyB7DapqBmykfcCbuFNIsjuo/Cd2ExHVDodlhGA8vKYf6Asb5r
 RuPdSQJ6OlZZgYPqvI4URr/eF+kuNJkEaMlJ/ewd0Mjzc5LhF1UVijLuJ
 Ymc5H3vv54zbj9atHf6+680+y8/5E08/wPapDXKfnmIliH160i1+XJeuR
 V9dtyjb39k3DDyLu0glozvx1xUSpBgsp9jfMP4lTKxTET2DLprjhE3aWy
 6hHepOzUn89IKGvEwX/P/FINQcM212wJ+xKqlHXEB4i3YlcIldz38fqyb
 to5yQNuH/Dw4BCyIZWqVJVh0S2YLmXFlt02Tm57BNfa1k3vaSZ/WJJ9jN w==;
X-CSE-ConnectionGUID: kqnsIAtvRHCHEOorjsyQWA==
X-CSE-MsgGUID: zVXjGK4eTL+TbODaJlNAuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93584987"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93584987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:42 -0700
X-CSE-ConnectionGUID: UocFrBmORg6shWBcNJGHgQ==
X-CSE-MsgGUID: XOvr233yQ1eI4jXZOFnouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222119739"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 06:07:40 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add check for the other drm
 clients using the device
Date: Thu,  2 Apr 2026 18:30:25 +0530
Message-Id: <20260402130026.2687520-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402130026.2687520-1-soham.purkait@intel.com>
References: <20260402130026.2687520-1-soham.purkait@intel.com>
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

If other processes are using the DRM device while idle residency test
is running, GPU engines may be in use, and idle residency might be lower
than expected leading to false positives.
To help identify this issue, a check for the DRM clients, except the very
test, is used and a warning message is printed if any such processes
are found and the test is skipped.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 27 +++++++++++++++++++++++++--
 tests/meson.build    |  1 +
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..c907b6207 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -100,6 +100,7 @@
 #include "igt_sysfs.h"
 
 #include "xe/xe_gt.h"
+#include "igt_drm_clients.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_spin.h"
 #include "xe/xe_sriov_admin.h"
@@ -865,17 +866,39 @@ static void engine_activity_multi_client(int fd, struct drm_xe_engine_class_inst
 
 static void test_gt_c6_idle(int xe, unsigned int gt)
 {
-	int pmu_fd;
+	int pmu_fd, num_clients = 0;
 	uint64_t pmu_config;
 	uint64_t ts[2];
-	unsigned long slept, start, end;
+	unsigned long slept, start, end, wait = 100000;
 	uint64_t val;
+	struct igt_drm_client_proc *procs = NULL;
 
 	/* Get the PMU config for the gt-c6 event */
 	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
 
 	pmu_fd = open_pmu(xe, pmu_config);
 
+	/* Wait for other processes using the DRM device ends */
+	for (int pass = 0; pass < 50; pass++) {
+		if (!igt_drm_get_client_procs(xe, getpid(), NULL))
+			break;
+		usleep(wait);
+	}
+
+	num_clients = igt_drm_get_client_procs(xe, getpid(), &procs);
+
+	/* Check if any process is still using the DRM device */
+	if (num_clients) {
+		for (unsigned int i = 0; i < num_clients; i++) {
+			igt_warn("%s (pid=%u client=%lu) is using DRM device.\n",
+				 procs[i].print_name, procs[i].pid, procs[i].id);
+		}
+		free(procs);
+		procs = NULL;
+		igt_skip("As other processes are using the DRM device, "
+			 "measured idle_residency may be lower than expected.\n");
+	}
+
 	igt_require_f(igt_wait(xe_gt_is_in_c6(xe, gt), 1000, 10), "GT %d should be in C6\n", gt);
 
 	/* While idle check full RC6. */
diff --git a/tests/meson.build b/tests/meson.build
index 26d9345ec..e682ed9dd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -425,6 +425,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_pmu': [ lib_igt_drm_clients ],
         'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
-- 
2.34.1

