Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D27CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 17:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50E210E27D;
	Mon,  5 Oct 2026 17:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmTzAqZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6724810EA0D
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 17:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791222433; x=1822758433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Avwp/B2iW3DCmvY3SN4lLYrI+as+iYWAIRhfkC7luQ=;
 b=YmTzAqZffw9+mqEjebyBEEXxRQ2CkdozRhSrcgN7AwCItVsUAMJvCaKB
 Zw0k/yIVDy2lzpYlkG3dU19TT6Ai6ynfnfCRDI0VZ4xqLZMuwRNrV2T2p
 v4FnFzcDROmJLR6Et4H3/q5PZTVW3V2k39/ikNzNVtQEdK7T+WLGPyDoB
 8GgfAFQ2VHt3+o/QTAjAqTy+7N2Y/lmasvVGaYZ3vouiNgFgAr0jFUTy1
 5RhcpJFsuHNo6J+fs5mfE7rGM7GzHl2r+q5KfhQGy5D7oAEfCmcmyuz6j
 e9fgKOzJ32KxTKdyOjT7E2Bdz7eDz+QX5JL0uHL6b5Sf5hiD8op3THDPa Q==;
X-CSE-ConnectionGUID: NyFo2nZKQHSTpoAGy/Ochw==
X-CSE-MsgGUID: FcoI9WHZRheVUv3BrKoDOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="79462977"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="79462977"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:47:13 -0700
X-CSE-ConnectionGUID: Fjnau4puQPOnHt+THQ3kiw==
X-CSE-MsgGUID: gN0/4iniRq68zhiOyD/xHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="897935"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 10:47:11 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v6] tests/intel/xe_ras: Add test for GPU health indicator
Date: Mon,  5 Oct 2026 23:17:02 +0530
Message-ID: <20261005174702.2574483-2-soham.purkait@intel.com>
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
rejected with -EINVAL, guarding against regressions.

v1:
 - Add platform-conditional skip and exit handler. (Anirban)
v2:
 - Add dynamic subtests for each case. (Riana)
v3:
 - Add health state description.
 - Store original health state as an index instead of a char pointer. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_ras.c | 158 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 tests/intel/xe_ras.c

diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..c98a10f00
--- /dev/null
+++ b/tests/intel/xe_ras.c
@@ -0,0 +1,158 @@
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
+ * Description: Verify the gpu_health sysfs attribute accepts each valid state
+ *		and rejects invalid writes with -EINVAL.
+ *		The valid states are:
+ *		ok	 - The gpu is healthy and operating within normal
+ *			   parameters.
+ *		warning	 - The gpu is experiencing minor issues but remains
+ *			   operational.
+ *		critical - The gpu is in a critical state and may not be
+ *			   operational.
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
+	"invalid-input",
+};
+
+#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) - 1)
+
+static struct {
+	int sys_fd;
+	int orig_health;
+} gpu_health_ctx = { .sys_fd = -1, .orig_health = -1 };
+
+static void restore_gpu_health(int sig)
+{
+	if (gpu_health_ctx.sys_fd < 0)
+		return;
+
+	if (gpu_health_ctx.orig_health >= 0) {
+		igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
+			      gpu_health_states[gpu_health_ctx.orig_health]);
+		igt_info("Restored initial gpu_health to '%s'\n",
+			 gpu_health_states[gpu_health_ctx.orig_health]);
+		gpu_health_ctx.orig_health = -1;
+	}
+	close(gpu_health_ctx.sys_fd);
+	gpu_health_ctx.sys_fd = -1;
+}
+
+static bool valid_gpu_health(const char *s)
+{
+	int i;
+
+	if (!s)
+		return false;
+
+	for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
+		if (!strcmp(s, gpu_health_states[i]))
+			return true;
+
+	return false;
+}
+
+static void setup_gpu_health(int xe)
+{
+	char *health;
+	int i;
+
+	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
+	igt_assert(gpu_health_ctx.sys_fd >= 0);
+
+	igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR),
+		      "gpu_health sysfs attribute not exposed by driver\n");
+
+	health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
+	igt_assert_f(valid_gpu_health(health),
+		     "Unexpected initial gpu_health value: '%s'\n", health);
+
+	for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
+		if (!strcmp(health, gpu_health_states[i]))
+			gpu_health_ctx.orig_health = i;
+
+	igt_info("Initial gpu_health: %s\n", health);
+	free(health);
+}
+
+static void test_gpu_health_state(const char *state)
+{
+	char *health;
+	int ret;
+
+	if (!valid_gpu_health(state)) {
+		ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
+				      state, strlen(state));
+		igt_assert_f(ret == -EINVAL,
+			     "Writing invalid value to %s returned %d, expected -EINVAL\n",
+			     GPU_HEALTH_ATTR, ret);
+		return;
+	}
+
+	igt_info("Setting gpu_health to '%s'\n", state);
+
+	igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
+		     "Failed to write '%s' to %s\n",
+		     state, GPU_HEALTH_ATTR);
+
+	health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
+	igt_assert(health);
+	igt_assert_f(!strcmp(health, state),
+		     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
+		     state, health);
+	igt_info("Verified gpu_health state readback for '%s' successfully\n",
+		 state);
+	free(health);
+}
+
+int igt_main()
+{
+	int xe;
+	int state;
+
+	igt_fixture() {
+		xe = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest_with_dynamic("gpu-health") {
+		igt_install_exit_handler(restore_gpu_health);
+		setup_gpu_health(xe);
+
+		for (state = 0; state < ARRAY_SIZE(gpu_health_states); state++) {
+			igt_dynamic_f("%s", gpu_health_states[state]) {
+				test_gpu_health_state(gpu_health_states[state]);
+			}
+		}
+
+		restore_gpu_health(0);
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

