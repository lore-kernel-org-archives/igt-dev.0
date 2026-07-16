Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8B2C44512
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 15:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2C10E1A7;
	Thu, 16 Jul 2026 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TY3WmEuz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5B910F354
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784216279; x=1815752279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=loc70QHokfOjc37dt3vh4dMarccYjOShMldVMTnrwdQ=;
 b=TY3WmEuzJUkeEsnDD8LQKNPfrnCeczEacGmP+uJyeAJa8aEXVBBk8ie6
 tZkYMRulGRmBFZfTJM1SkKrHs/FEo5qtynnYUKSMhwg+FbrHgzDE1+THi
 trEQaIetrneGp1cxkwSj0An/QlUxfeBhJm8HuDY35qAbVab5CRYk+F/v0
 24Ur0YQe99Hfx2pIhShmyYL9+9kuZBqqMxJY2IEnS8cGCYq6U4KqGwmjy
 gFylIZJ09MH2RjY0pvu0Xvf4r0HtMr378mdNkKf5vPBamTscF0wbwMKu3
 Ffp1IMBlL7yTiVWDjhm4HjcF8Dv+rn+6Lb6UzrYEVLr+zzI+lp/gCktAA g==;
X-CSE-ConnectionGUID: vevTRV5bRYWF4bkTv0QQiw==
X-CSE-MsgGUID: TOUJ3n2WRWGZsUM7wZ/H5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84658224"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84658224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:37:58 -0700
X-CSE-ConnectionGUID: Je9j2BxqQ6C9JLmIDENQMw==
X-CSE-MsgGUID: xBAIEdAyQluYhV+qNuvAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260134019"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:37:56 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_ras: Add test for GPU health indicator
Date: Thu, 16 Jul 2026 21:07:38 +0530
Message-ID: <20260716153739.744575-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a new Xe RAS test exercising the gpu_health sysfs attribute
exposed by the Xe driver on platforms that provide the system
controller. The attribute reports and allows updating the GPU
health state.

The gpu-health subtest validates each valid state by writing it
and reading the value back, and checks that invalid writes are
rejected with -EINVAL, guarding against regressions in the
implementation.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_ras.c | 127 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 tests/intel/xe_ras.c

diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..e2465cbb1
--- /dev/null
+++ b/tests/intel/xe_ras.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
+ * Category: Core
+ * Functionality: ras
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Test category: Functional tests
+ *
+ * SUBTEST: gpu-health
+ * Description: Verify the gpu_health sysfs attribute accepts each valid
+ *		state (ok/warning/critical) and rejects invalid writes
+ *		with EINVAL.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "xe_drm.h"
+#include "xe/xe_query.h"
+
+IGT_TEST_DESCRIPTION("Tests for Xe RAS");
+
+/*
+ * gpu_health lives on the PCI device, reachable via the "device" symlink
+ * under the DRM char sysfs directory returned by igt_sysfs_open().
+ */
+#define GPU_HEALTH_ATTR	"device/gpu_health"
+
+static const char * const gpu_health_states[] = {
+	"ok",
+	"warning",
+	"critical",
+};
+
+static bool valid_gpu_health(const char *s)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
+		if (!strcmp(s, gpu_health_states[i]))
+			return true;
+
+	return false;
+}
+
+static void test_gpu_health(int xe)
+{
+	char *orig_health = NULL, *health = NULL;
+	int sys_fd;
+	int ret;
+	int i;
+
+	sys_fd = igt_sysfs_open(xe);
+	igt_assert(sys_fd >= 0);
+
+	igt_require_f(igt_sysfs_has_attr(sys_fd, GPU_HEALTH_ATTR),
+		      "gpu_health sysfs attribute not exposed by driver\n");
+
+	orig_health = igt_sysfs_get(sys_fd, GPU_HEALTH_ATTR);
+	igt_assert_f(orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
+	igt_debug("initial gpu_health: %s\n", orig_health);
+	igt_assert_f(valid_gpu_health(orig_health),
+		     "Unexpected initial gpu_health value: '%s'\n", orig_health);
+
+	/**
+	 * Invalid writes must be rejected with EINVAL.
+	 */
+	errno = 0;
+	ret = igt_sysfs_write(sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
+	igt_assert_f(ret < 0,
+		     "Write of invalid value to %s unexpectedly succeeded\n",
+		     GPU_HEALTH_ATTR);
+	igt_assert_f(ret == -EINVAL,
+		     "Invalid write to %s returned %d, expected -EINVAL\n",
+		     GPU_HEALTH_ATTR, ret);
+
+	/**
+	 * Write each valid state and read it back to confirm the driver
+	 * accepts and reflects the requested value.
+	 */
+	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
+		const char *state = gpu_health_states[i];
+
+		igt_assert_f(igt_sysfs_set(sys_fd, GPU_HEALTH_ATTR, state),
+			     "Failed to write '%s' to %s\n",
+			     state, GPU_HEALTH_ATTR);
+
+		health = igt_sysfs_get(sys_fd, GPU_HEALTH_ATTR);
+		igt_assert(health);
+		igt_assert_f(!strcmp(health, state),
+			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
+			     state, health);
+		free(health);
+	}
+
+	/**
+	 * Restore the original value.
+	 */
+	igt_assert_f(igt_sysfs_set(sys_fd, GPU_HEALTH_ATTR, orig_health),
+		     "Failed to restore original gpu_health '%s'\n", orig_health);
+
+	free(orig_health);
+	close(sys_fd);
+}
+
+int igt_main()
+{
+	int xe;
+
+	igt_fixture()
+		xe = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("gpu-health")
+		test_gpu_health(xe);
+
+	igt_fixture()
+		drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 6d90627b9..4ab4ef603 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -333,6 +333,7 @@ intel_xe_progs = [
 	'xe_prime_self_import',
 	'xe_pxp',
 	'xe_query',
+	'xe_ras',
 	'xe_render_copy',
 	'xe_vm',
 	'xe_userptr_pressure',
-- 
2.43.0

