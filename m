Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D8EC5DF81
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 04:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACAA10E112;
	Tue, 25 Aug 2026 04:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6xDrzK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC92E10E112
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 04:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787631189; x=1819167189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=id9BZRz2ZFLi0qz2bYtQ5tiOopFqC2XmlxT4ZXf1tkU=;
 b=K6xDrzK3u0ew4KThH6TWlb21uZ4UOSOuBodb+6L/5KVZezcxpMr3LFuU
 XvoKRMU7hVi/xP1eZjCkEj64PJnvTzsvRgN+eddeKvyBY+lvoU6Bg1EbH
 pILmyaqEJ/MHgEhx0rw8+AWiMQx8ECsa4DjRbsNPld8gan8/br11uVPkS
 K5i2oNRsyU2385lZ6YYKokwArc4VuVEXY1m5e4Rshfl/K1VooEda2TiJj
 FFKCwmOOBFMziuA2aC0iD1Zoo69JUGF0LSdsT4FJ4TnWpl3+O7wMVg39V
 Uf4oZMgy2GDfSCWrm6HOH5KQ7RqNvfz62yo1tMXzKW7uRbf2QIqwyzI8/ w==;
X-CSE-ConnectionGUID: 4nwnLutuSjW2Gs4u+R48kg==
X-CSE-MsgGUID: 4T+ponrqTKeVa4056iTmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87951762"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87951762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:13:09 -0700
X-CSE-ConnectionGUID: AMpF+iNlRyyq3aMV4ziGbQ==
X-CSE-MsgGUID: 5k43xRV6T4eBHCzobRs2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263446585"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 21:13:06 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_ras: Add test for GPU health indicator
Date: Tue, 25 Aug 2026 09:42:43 +0530
Message-ID: <20260825041252.1440299-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 tests/intel/xe_ras.c

diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..2452f6ff1
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
+	igt_info("Restored initial gpu_health to '%s'\n", gpu_health_ctx.orig_health);
+	close(gpu_health_ctx.sys_fd);
+	gpu_health_ctx.sys_fd = -1;
+	if (sig)
+		return;
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

