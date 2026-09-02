Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B84C61DD3
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 02:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0B10E444;
	Wed,  2 Sep 2026 02:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETx/556m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E5A10E444
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 02:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788317912; x=1819853912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=coTzI/RIK6bxqNsFD1jihHlyl3qPxnx8x0QtIKDUu0s=;
 b=ETx/556mcuWtRRtPiEU60QzYMAR1zjv6fUyVZDx3EhpO5Ou0oAucGgZG
 fbzeIMIT7d7zlGr4rvZZpcDNlIlL8yfKV88AI+AGgrUp3YgnMYD9eB54R
 ZzZwtSHiRtS6ATHr1UMH6Zm9j3dCXOng1cz3yMitBh96pIcnYOyDtgwPX
 CZx4U1j8nrohtDHHW+tnugT79CVcN1ziecR75rTkK/hceOzXIDNd9tenz
 I5VJ3AqPyHsR2e7Ehn8IfhHJ22lRnur8sHGwxRMZ9kIivIXzxIxr0KhU0
 ChXZYLgJVVoRjS851jWXxXtPYHXSqKTtBmwoudVve+8JzATDivPS7b9f0 w==;
X-CSE-ConnectionGUID: 6m+09x6ATZa1Y8uCVIjA4g==
X-CSE-MsgGUID: vqyTO2SuSmaJbk+Xy+1+fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106284094"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="106284094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 19:58:32 -0700
X-CSE-ConnectionGUID: CM9oVcIJQXK0lVkWwYhuoQ==
X-CSE-MsgGUID: MdWwixt2TmaXKmrtFZsa+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="267971948"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 19:58:29 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_ras: Add test for GPU health indicator
Date: Wed,  2 Sep 2026 08:28:07 +0530
Message-ID: <20260902025813.1795134-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

v1:
 - Platform-conditional skip w/o fd leak. (Anirban)
 - Restore via exit handler. (Anirban)

v2:
 - Remove dead-code and extra comments. (Anirban)
 - Initialize exit handler under igt_subtest. (Anirban)

v3:
 - Move igt_info to the normal cleanup path when
   restoring gpu_health. (Anirban)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 tests/intel/xe_ras.c

diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..f3b507ce0
--- /dev/null
+++ b/tests/intel/xe_ras.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+/**
+ * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: ras
+ * Test category: Functional tests
+ *
+ * SUBTEST: gpu-health
+ * Description: Verify the gpu_health sysfs attribute accepts each valid
+ *		state (ok/warning/critical) and rejects invalid writes
+ *		with EINVAL.
+ */
+
+IGT_TEST_DESCRIPTION("Tests for Xe RAS");
+
+#define GPU_HEALTH_ATTR	"device/gpu_health"
+
+static const char * const gpu_health_states[] = {
+	"ok",
+	"warning",
+	"critical",
+};
+
+static struct {
+	int sys_fd;
+	char *orig_health;
+} gpu_health_ctx = { .sys_fd = -1 };
+
+static void restore_gpu_health(int sig)
+{
+	if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
+		return;
+
+	igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, gpu_health_ctx.orig_health);
+	close(gpu_health_ctx.sys_fd);
+	gpu_health_ctx.sys_fd = -1;
+	if (sig)
+		return;
+	igt_info("Restored initial gpu_health to '%s'\n", gpu_health_ctx.orig_health);
+	free(gpu_health_ctx.orig_health);
+	gpu_health_ctx.orig_health = NULL;
+}
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
+	char *health = NULL;
+	int ret;
+	int i;
+
+	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
+	igt_assert(gpu_health_ctx.sys_fd >= 0);
+
+	if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
+		close(gpu_health_ctx.sys_fd);
+		gpu_health_ctx.sys_fd = -1;
+		igt_skip("gpu_health sysfs attribute not exposed by driver\n");
+	}
+
+	gpu_health_ctx.orig_health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
+	igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
+	igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
+	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
+		     "Unexpected initial gpu_health value: '%s'\n",
+		     gpu_health_ctx.orig_health);
+
+	ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
+	igt_assert_f(ret == -EINVAL,
+		     "Write of invalid value to %s returned %d, expected -EINVAL\n",
+		     GPU_HEALTH_ATTR, ret);
+
+	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
+		const char *state = gpu_health_states[i];
+
+		igt_info("Setting gpu_health to '%s'\n", state);
+
+		igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
+			     "Failed to write '%s' to %s\n",
+			     state, GPU_HEALTH_ATTR);
+
+		health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
+		igt_assert(health);
+		igt_assert_f(!strcmp(health, state),
+			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
+			     state, health);
+		igt_info("Verified gpu_health state readback for '%s' successfully\n",
+			 state);
+		free(health);
+	}
+
+	restore_gpu_health(0);
+}
+
+int igt_main()
+{
+	int xe;
+
+	igt_fixture()
+		xe = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("gpu-health") {
+		igt_install_exit_handler(restore_gpu_health);
+		test_gpu_health(xe);
+	}
+
+	igt_fixture()
+		drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..3c2d4fdda 100644
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

