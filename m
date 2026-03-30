Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11451061B15
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 16:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BB110E465;
	Mon, 30 Mar 2026 16:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZRAyXwB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2604210E5FC
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774887907; x=1806423907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBsUy+cnoPMA5SOHjsYHfQe33J1e7CNT21yhU9LxrIU=;
 b=nZRAyXwBnLTPgcNixXt5owc0I+1mtxPZo6SuVRRdLXouSOxMwCJ2SHm6
 J6Tr4oTZLa4xSvV6Hl+w7ahrttWKaqNV1DdcU2+cqeSXjvdjuGSKFUNlD
 6zGUIK7yoW5kDFKXPCziyqPwGVnx/YjIBvPXqHOb/c6P7xljbIWpVRzmS
 o7z+9hAF+JvUJGyHGbSnaWFAncK6MV3uoVvniI3yQ5RsW/OOSfFAONxNl
 OvH4JG9XJBdKlQDSQGkAztuwWav51t00dYEq+MAvVLonPCme+ARD9NJYI
 wcGSQZeBT4ujIsgQiLV3ewEwrEpr1iu4Tu2HRrCbqY1ff8b6AHLOWixQh g==;
X-CSE-ConnectionGUID: L9NNUcByQMWtT6XZZHvNww==
X-CSE-MsgGUID: eUOuq/9+TFa6OnfCay5nXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63437302"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="63437302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 09:25:07 -0700
X-CSE-ConnectionGUID: 85x438QqSnWRdlITu/zjlA==
X-CSE-MsgGUID: MIb2piUASDeEgHlxCRFbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="230576041"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 09:25:05 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm_residency: Check for other DRM
 device users
Date: Mon, 30 Mar 2026 21:48:07 +0530
Message-Id: <20260330161808.2474476-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330161808.2474476-1-soham.purkait@intel.com>
References: <20260330161808.2474476-1-soham.purkait@intel.com>
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
 tests/intel/xe_pm_residency.c | 25 +++++++++++++++++++++++++
 tests/meson.build             |  1 +
 2 files changed, 26 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..43c6a27f0 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -20,6 +20,7 @@
 #include "igt_power.h"
 #include "igt_sysfs.h"
 
+#include "lib/igt_drm_clients.h"
 #include "lib/igt_syncobj.h"
 
 #include "xe/xe_ioctl.h"
@@ -215,6 +216,30 @@ static unsigned long read_idle_residency(int fd, int gt)
 static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
+	struct igt_drm_client_proc *procs = NULL;
+	unsigned long wait = 100000;
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
+	/* Check if any process is still using the DRM device */
+	if (num_clients) {
+		for (unsigned int i = 0; i < num_clients; i++) {
+			igt_warn("%s (pid=%u client=%lu) is using DRM device.\n",
+				 procs[i].print_name, procs[i].pid, procs[i].id);
+		}
+		free(procs);
+		procs = NULL;
+		igt_skip("As other processes are using the DRM device, "
+			 "measured idle_residency may differ from elapsed_ms.\n");
+	}
 
 	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..eb4de8772 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -424,6 +424,7 @@ extra_dependencies = {
 	'sw_sync': [ libatomic ],
 	'xe_fault_injection': [ lib_igt_xe_oa ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_pm_residency': [ lib_igt_drm_clients ],
         'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
 }
 
-- 
2.43.0

