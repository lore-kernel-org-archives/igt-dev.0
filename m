Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF056C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD4610E155;
	Tue, 17 Jun 2025 19:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huwkgR6V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F9810E18C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188408; x=1781724408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IyXZ6aP1EgQBJ4AqHRd8sLLLR82f31bXPn9ckSc6CM=;
 b=huwkgR6VgpHBqfHF1u+//3PUPFL5CEsJJxfRwf7yKq7ZVR3q23bz31yG
 jbzgwg4r2Zg1/s2RKIZfzexsaembj7TmbHPDT9RUklqoucOeOmGW9Zmk3
 p5WSIrFUcxzer5VcHpl6WF85q7f7JX2fslvZrQA4AKRYLbA9cMCje05AI
 vofMWl/VxiZbXJ1CesT8M1OyIP86xn2wH82NIsF7BcawXI6ehm9MT1HkR
 1pFNcKyYAJhoWFc2vglwH6tkPuSRM2T+jies9dICN6iBXBhX4E7TPwG1+
 w/TDboa0mr1aQU2mL7eGixHLONAdIrPpQqw8SW9EkLB/Fyx+pY7M4GNQw Q==;
X-CSE-ConnectionGUID: 7I8fA7YgQ+e0O/4/KuiwEA==
X-CSE-MsgGUID: Fv6OU6XqQoC8WA+fV12NAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523988"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52523988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:48 -0700
X-CSE-ConnectionGUID: AQ15rtCFQ2iwfHWYoROV9w==
X-CSE-MsgGUID: TQ4WLzSsSX22peqk8ojpzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807841"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:48 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v6 1/7] lib/intel_wa: Add specific checks for WA in GTs
Date: Wed, 18 Jun 2025 01:00:22 +0530
Message-Id: <20250617193028.107483-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

This function check the given workaround on available GTs.

v2: Add discription for return. (Kamil)
    Rename function to igt_has_intel_wa. (Kamil)
    Move lib changes to lib/igt_debugfs. (Kamil)
    Dump the whole wa sysfs file and then search for the wa. (Vinod)
    Use return true/false directly instead assigning value. (Vinod)
v3: Updated return type discription and debugfs_fd failure check. (Kamil)
    Return 0 or 1 instead of true or false. (Kamil)
v4: Add check for xe device before execution. (Vinod)
v5: Move igt_has_intel_wa to lib/intel_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/intel_wa.c  | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_wa.h  | 14 ++++++++++++++
 lib/meson.build |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 lib/intel_wa.c
 create mode 100644 lib/intel_wa.h

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
new file mode 100644
index 000000000..6d89d1740
--- /dev/null
+++ b/lib/intel_wa.c
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt_kms.h"
+#include "igt_debugfs.h"
+#include "igt_sysfs.h"
+#include "intel_wa.h"
+#include "xe/xe_query.h"
+#include "lib/drmtest.h"
+
+/**
+ * igt_has_intel_wa:
+ * @drm_fd:	A drm file descriptor
+ * @check_wa:	Workaround to be checked
+ *
+ * Returns:	0 if no WA, 1 if WA present, -1 on error
+ */
+int igt_has_intel_wa(int drm_fd, const char *check_wa)
+{
+	int debugfs_fd;
+	unsigned int xe;
+	char name[PATH_MAX];
+	char *debugfs_dump, *has_wa;
+
+	if (!is_xe_device(drm_fd))
+		return 0;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+	if (debugfs_fd == -1)
+		return -1;
+
+	xe_for_each_gt(drm_fd, xe) {
+		sprintf(name, "gt%d/workarounds", xe);
+		if (!igt_debugfs_exists(drm_fd, name, O_RDONLY))
+			return -1;
+
+		debugfs_dump = igt_sysfs_get(debugfs_fd, name);
+		if (debugfs_dump != NULL) {
+			has_wa = strstr(debugfs_dump, check_wa);
+			free(debugfs_dump);
+			if (has_wa)
+				return 1;
+		}
+	}
+
+	return 0;
+}
diff --git a/lib/intel_wa.h b/lib/intel_wa.h
new file mode 100644
index 000000000..be6996190
--- /dev/null
+++ b/lib/intel_wa.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_WA_H__
+#define __INTEL_WA_H__
+
+#include <stdint.h>
+#include <stdio.h>
+
+int igt_has_intel_wa(int drm_fd, const char *check_wa);
+
+#endif /* __INTEL_WA_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index ff81baae1..36806aa31 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -88,6 +88,7 @@ lib_sources = [
 	'intel_aux_pgtable.c',
 	'intel_reg_map.c',
 	'intel_iosf.c',
+        'intel_wa.c',
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
-- 
2.34.1

