Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAABC98304
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 21:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872010F1DF;
	Wed, 23 Sep 2026 21:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8AglepF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B6110F1DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 21:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790199714; x=1821735714;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mh/53KTvqwQ2plDNI+U4Yg/yLwu9euK1Gc8z08P3nVs=;
 b=K8AglepFuD36PeLwKUo/eJ/sQ5bFnvsGz9hp5YIdHHSsExiS8vFT/WTY
 EqNCXLp6iJyPk9FEVarDPK0jUPMZmO9BqfgVKVFVM4UiBkvE30aN0I3E5
 dzZH8YXj/fd0euKWmiyD5W0BTKvvgMLfpZq8T03ARODCAXYLic380bx9R
 MDclbxiVt3bi2kWgQT0VukI7DI6C0nK9zirRU/30nntAdXGIB/rfEZgMs
 QRS8awYfU2UYB8HJ/R2GcF7sjCITfeugsnsxORef611PGumYaZZFkn1zQ
 YHL4VYlyN29y3/9VweCFzaw5yfsovaxmMGqMHnVSrkqocqGDptvutCPUR g==;
X-CSE-ConnectionGUID: sbvLMzcaT/epAd+k3fGicA==
X-CSE-MsgGUID: Qzf7RslCR9ewJ7L+y5hX2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93445400"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93445400"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:53 -0700
X-CSE-ConnectionGUID: x/buy0JPQ2e/TFRNkzTzJQ==
X-CSE-MsgGUID: nmREAR4MT4+UvFiR6fcDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4907685"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 14:41:40 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Sep 2026 18:41:08 -0300
Subject: [PATCH i-g-t v2 01/11] lib/xe: Move lib/intel_wa to lib/xe/xe_wa
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-wa_14026539277-v2-1-528b575299d2@intel.com>
References: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
In-Reply-To: <20260923-wa_14026539277-v2-0-528b575299d2@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

The functionality provided by intel_wa is specific devices managed by
the xe driver, so move that module to belong to the lib/xe folder.

While at it, change the function signature to match the adopted
standard for lib/xe (used xe_query.h as example).

v2:
  - Keep includes sorted. (Matt)
  - Use 2026 for the copyright year. (Matt)

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/intel_wa.h                 | 11 -----------
 lib/meson.build                |  2 +-
 lib/{intel_wa.c => xe/xe_wa.c} | 23 ++++++++++++-----------
 lib/xe/xe_wa.h                 | 11 +++++++++++
 tests/intel/xe_oa.c            |  4 ++--
 5 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/lib/intel_wa.h b/lib/intel_wa.h
deleted file mode 100644
index 765a5948ef88..000000000000
--- a/lib/intel_wa.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#ifndef __INTEL_WA_H__
-#define __INTEL_WA_H__
-
-int igt_has_intel_wa(int drm_fd, const char *check_wa);
-
-#endif /* __INTEL_WA_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index d1a770b6d1fb..26b5d32348de 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -96,7 +96,6 @@ lib_sources = [
 	'intel_aux_pgtable.c',
 	'intel_reg_map.c',
 	'intel_iosf.c',
-        'intel_wa.c',
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
@@ -141,6 +140,7 @@ lib_sources = [
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
+	'xe/xe_wa.c',
 
 	# Vendored libraries:
 	'vendor/uwildmat/uwildmat.c',
diff --git a/lib/intel_wa.c b/lib/xe/xe_wa.c
similarity index 63%
rename from lib/intel_wa.c
rename to lib/xe/xe_wa.c
index 727dd6c988df..7b8e54b2ad27 100644
--- a/lib/intel_wa.c
+++ b/lib/xe/xe_wa.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2026 Intel Corporation
  */
 
 #include <fcntl.h>
@@ -9,8 +9,9 @@
 
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
-#include "intel_wa.h"
+
 #include "xe/xe_query.h"
+#include "xe/xe_wa.h"
 
 static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 			       const char *debugfs_name, const char *wa)
@@ -34,32 +35,32 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 }
 
 /**
- * igt_has_intel_wa:
- * @drm_fd:	A drm file descriptor
- * @check_wa:	Workaround to be checked
+ * xe_wa: Check if a workaround is enabled for the device.
+ * @fd: A drm file descriptor.
+ * @wa: Name of the workaround to be checked.
  *
- * Returns:	0 if no WA, 1 if WA present, -1 on error
+ * Returns 1 if enabled, 0 if disabled, -1 on error.
  */
-int igt_has_intel_wa(int drm_fd, const char *check_wa)
+int xe_wa(int fd, const char *wa)
 {
 	int ret = 0;
 	int debugfs_fd;
 	unsigned int xe;
 	char name[256];
 
-	debugfs_fd = igt_debugfs_dir(drm_fd);
+	debugfs_fd = igt_debugfs_dir(fd);
 	if (debugfs_fd == -1)
 		return -1;
 
-	xe_for_each_gt(drm_fd, xe) {
+	xe_for_each_gt(fd, xe) {
 		sprintf(name, "gt%d/workarounds", xe);
-		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, name, check_wa);
+		ret = debugfs_file_has_wa(fd, debugfs_fd, name, wa);
 		if (ret)
 			break;
 	}
 
 	if (!ret)
-		ret = debugfs_file_has_wa(drm_fd, debugfs_fd, "workarounds", check_wa);
+		ret = debugfs_file_has_wa(fd, debugfs_fd, "workarounds", wa);
 
 	close(debugfs_fd);
 	return ret;
diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
new file mode 100644
index 000000000000..4ff897196545
--- /dev/null
+++ b/lib/xe/xe_wa.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef XE_WA_H
+#define XE_WA_H
+
+int xe_wa(int fd, const char *wa);
+
+#endif /* XE_WA_H */
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9ebb18690ec7..9571c62c115e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,10 +24,10 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
-#include "intel_wa.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
+#include "xe/xe_wa.h"
 
 /**
  * TEST: perf
@@ -2585,7 +2585,7 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	 * can result in buffer overflows.
 	 */
 	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
-		igt_has_intel_wa(drm_fd, "14026633728") > 0) {
+	    xe_wa(drm_fd, "14026633728") > 0) {
 		oa_exponent = max(oa_exponent, 8);
 		properties[9] = oa_exponent;
 	}

-- 
2.55.0

