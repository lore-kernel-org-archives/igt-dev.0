Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC015C5AD7B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972EE10E21D;
	Mon, 10 Aug 2026 18:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFym+ATr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2A510E963
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Aug 2026 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786385138; x=1817921138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i1GH3rey8witwdKCQv0cf38gm21E8i0OASAb0L0zhMc=;
 b=DFym+ATrmWB+TPymtE20mr/oj8ZdVTEszU8gTAKknxsmyNFCdiNckPeN
 nBw8JBtSwJnUis4Xma7eneIDXV/ECj/Qz7PdxCeHwweMG32Z6gTtirzpK
 PZV1LhPtPS/JJc9WhTaL1cI/d9SqAWrofUVLmiwGUGrsUcwoUBZrke9Oe
 fh6xl68x+ra0xIyInlakHPMoa7QgPp3gw6oKE4sY1p096b6wPJYO7xBLA
 kpR+59MYSlYPEOvJG2dpffHLkhXhDW0JaynC6X/RYHfIs+s3uPzOpbzlK
 ZGRgwFtV3JZolqEbIWoxsLLgs4tXYsIonFiIlQOejD4Uo6Zj21I5r5bT9 A==;
X-CSE-ConnectionGUID: KO8LYlCBQJiPMl5gZu6SEA==
X-CSE-MsgGUID: dnJOTnpHSzaHtizuz6UcWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90790068"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="90790068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 11:05:37 -0700
X-CSE-ConnectionGUID: tno3rIxsTEynJQVS8rCGoA==
X-CSE-MsgGUID: mL0HiCDmQwG/Kcgxf5j4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; d="scan'208";a="286520036"
Received: from unknown (HELO psoham-MS-7E03.iind.intel.com) ([10.223.55.64])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 11:05:34 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
Cc: anshuman.gupta@intel.com,
	soham.purkait@intel.com
Subject: [PATCH i-g-t v1] tests/intel/xe_ras: Add test for GPU health indicator
Date: Mon, 10 Aug 2026 23:35:17 +0530
Message-ID: <20260810180518.1131459-2-soham.purkait@intel.com>
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

v1:
 - Platform-conditional skip w/o fd leak. (Anirban)
 - Restore via exit handler. (Anirban)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_ras.c | 135 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 tests/intel/xe_ras.c

diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
new file mode 100644
index 000000000..c43dc3bdd
--- /dev/null
+++ b/tests/intel/xe_ras.c
@@ -0,0 +1,135 @@
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
+#include "xe_drm.h"
+#include "xe/xe_query.h"
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
+	free(gpu_health_ctx.orig_health);
+	gpu_health_ctx.orig_health = NULL;
+	close(gpu_health_ctx.sys_fd);
+	gpu_health_ctx.sys_fd = -1;
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
+	igt_debug("initial gpu_health: %s\n", gpu_health_ctx.orig_health);
+	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
+		     "Unexpected initial gpu_health value: '%s'\n",
+		     gpu_health_ctx.orig_health);
+
+	igt_install_exit_handler(restore_gpu_health);
+
+	/**
+	 * Invalid writes must be rejected with EINVAL.
+	 */
+	errno = 0;
+	ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
+	igt_assert_f(ret == -EINVAL,
+		     "Write of invalid value to %s returned %d, expected -EINVAL\n",
+		     GPU_HEALTH_ATTR, ret);
+
+	/**
+	 * Write each valid state and read it back to confirm the driver
+	 * accepts and reflects the requested value.
+	 */
+	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
+		const char *state = gpu_health_states[i];
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

