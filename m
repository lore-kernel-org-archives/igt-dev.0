Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC337606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azECH/UF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD1110E541;
	Wed, 18 Nov 2026 15:50:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFC510FE0B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016744; x=1826552744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UOf2bYycxoNeY+mYW/HsrtOzTC/+Po7pTJXWIPwk7X8=;
 b=azECH/UFNPzeAEu90kQLH2F+JwPc9Z8rQW4iPexynvy7Mm2ckxGwpB8e
 lT19sbjvDK0bdj+vz/H0iTFL3jVicpAUgE2f8VKvvAjmDgjzoifsZN4Wg
 jhDYeTJuAI+swlLgjEqtsBEKqR8ZSbUgyEMw1zSda+suIihmGXBSJ4Dil
 R0AhOSd4HIyRDWdgThbae+Os0lazNP0DRRLMpHSBROxT5XBxf8PjYjWuV
 O5bN1m9VhEXfcsUKi+Tw8KdqyNx+eBfYk+Uz+bcUJWJQpCfsmA7ShKotX
 VxqVgTQYCT8yFPVAk6mJdPcwJz2AJKHUSF97DzywqnPxgfwG+gLteZczL w==;
X-CSE-ConnectionGUID: PUYWr7EeQSGfhn3YBzoQUg==
X-CSE-MsgGUID: M/MSYmaERAuyvA99UkGroQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3720384"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3720384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:44 -0800
X-CSE-ConnectionGUID: iAjZ15Z9QQ+l9h8ipd1OUQ==
X-CSE-MsgGUID: WlpFhcOCTl2RzhWCXfuUYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10319407"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:45:42 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, pranay.samala@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 6/8] tests/intel: Add intel_display_module_load test
Date: Wed, 18 Nov 2026 21:14:21 +0530
Message-ID: <20261118154426.345883-7-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118154426.345883-1-jeevan.b@intel.com>
References: <20261118154426.345883-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a driver-agnostic test for the dedicated intel_display module, which
is shared by i915 and xe. Each subtest runs as a dynamic subtest for every
GPU driver module available on the system:

- display-load-no-gpu-driver: load intel_display standalone
- display-unload-no-gpu-driver: unloading it with no driver is harmless
- display-load-then-gpu-driver: intel_display first, then the driver
- display-unload-order: driver first, then intel_display
- display-reverse-order: the driver pulls in intel_display, which is then
  unloaded first

The test skips before touching the driver when intel_display is not a
separate module, and reloads the driver on exit.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/intel_display_module_load.c | 221 ++++++++++++++++++++++++
 tests/meson.build                       |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 tests/intel/intel_display_module_load.c

diff --git a/tests/intel/intel_display_module_load.c b/tests/intel/intel_display_module_load.c
new file mode 100644
index 000000000..53ebba810
--- /dev/null
+++ b/tests/intel/intel_display_module_load.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Tests loading and unloading of the intel_display module
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: driver
+ * Functionality: module load
+ * Test category: functionality test
+ *
+ * SUBTEST: display-load-no-gpu-driver
+ * Description: Verify that intel_display can be loaded standalone, without i915 or xe.
+ *
+ * SUBTEST: display-unload-no-gpu-driver
+ * Description: Verify unloading intel_display with no GPU driver loaded is harmless.
+ *
+ * SUBTEST: display-load-then-gpu-driver
+ * Description: Load intel_display first, then the GPU driver, and verify the driver binds.
+ *
+ * SUBTEST: display-unload-order
+ * Description: Verify the GPU driver, then intel_display, unload cleanly in order.
+ *
+ * SUBTEST: display-reverse-order
+ * Description: Load the GPU driver alone, then unload intel_display first.
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+struct gpu_driver {
+	const char *name;
+	int drm_driver;
+	int (*load)(const char *opts);
+	int (*unload)(void);
+};
+
+static const struct gpu_driver drivers[] = {
+	{ "i915", DRIVER_INTEL, igt_i915_driver_load, igt_i915_driver_unload },
+	{ "xe", DRIVER_XE, igt_xe_driver_load, igt_xe_driver_unload },
+};
+
+static const struct gpu_driver *cur;
+
+/*
+ * intel_display is only a separate module on kernels where the display code
+ * has been split out of the GPU drivers. Detect that before touching anything.
+ */
+static bool module_available(const char *name)
+{
+	char cmd[64];
+
+	if (igt_kmod_is_loaded(name))
+		return true;
+
+	snprintf(cmd, sizeof(cmd), "modinfo -n %s >/dev/null 2>&1", name);
+	return system(cmd) == 0;
+}
+
+static int unload_display(void)
+{
+	int err = igt_kmod_unload("intel_display");
+
+	return err == -ENOENT ? 0 : err;
+}
+
+static void unload_all(void)
+{
+	for (int i = 0; i < ARRAY_SIZE(drivers); i++) {
+		if (!igt_kmod_is_loaded(drivers[i].name))
+			continue;
+		igt_assert_eq(drivers[i].unload(), 0);
+		igt_assert_f(!igt_kmod_is_loaded(drivers[i].name),
+			     "%s failed to unload\n", drivers[i].name);
+	}
+
+	igt_assert_eq(unload_display(), 0);
+	igt_assert_f(!igt_kmod_is_loaded("intel_display"),
+		     "intel_display failed to unload\n");
+}
+
+static void load_display_only(void)
+{
+	igt_assert_eq(igt_kmod_load("intel_display", NULL), 0);
+	igt_assert(igt_kmod_is_loaded("intel_display"));
+
+	for (int i = 0; i < ARRAY_SIZE(drivers); i++)
+		igt_assert(!igt_kmod_is_loaded(drivers[i].name));
+}
+
+static void load_and_check_driver(void)
+{
+	int fd;
+
+	igt_assert_eq(cur->load(NULL), 0);
+
+	fd = __drm_open_driver(cur->drm_driver);
+	igt_fail_on_f(fd < 0, "Cannot open the %s DRM driver after modprobing it.\n",
+		      cur->name);
+	drm_close_driver(fd);
+}
+
+static void exit_handler(int sig)
+{
+	/* Leave the machine with the driver loaded, default params */
+	if (cur && !igt_kmod_is_loaded(cur->name))
+		cur->load(NULL);
+}
+
+static void test_load_no_gpu_driver(void)
+{
+	unload_all();
+	load_display_only();
+	unload_all();
+}
+
+static void test_unload_no_gpu_driver(void)
+{
+	unload_all();
+
+	/* Unloading an absent module must be a harmless no-op */
+	igt_assert_eq(unload_display(), 0);
+
+	/* ... and the module must still be loadable afterwards */
+	load_display_only();
+	igt_assert_eq(unload_display(), 0);
+	igt_assert(!igt_kmod_is_loaded("intel_display"));
+}
+
+static void test_load_then_gpu_driver(void)
+{
+	unload_all();
+	load_display_only();
+
+	load_and_check_driver();
+	igt_assert(igt_kmod_is_loaded("intel_display"));
+	igt_assert(igt_kmod_is_loaded(cur->name));
+}
+
+static void test_unload_order(void)
+{
+	unload_all();
+	load_display_only();
+	load_and_check_driver();
+
+	/*
+	 * The GPU driver depends on intel_display, so unload it first. Remove
+	 * only the driver module: the unload helpers also remove intel_display.
+	 */
+	igt_assert_eq(igt_kmod_unload(cur->name), 0);
+	igt_assert(!igt_kmod_is_loaded(cur->name));
+
+	igt_assert_eq(unload_display(), 0);
+	igt_assert(!igt_kmod_is_loaded("intel_display"));
+}
+
+static void test_reverse_order(void)
+{
+	unload_all();
+
+	/* The driver loaded first must bring intel_display in as a dependency */
+	load_and_check_driver();
+	igt_assert_f(igt_kmod_is_loaded("intel_display"),
+		     "intel_display was not loaded as a %s dependency\n", cur->name);
+
+	/*
+	 * Reverse of the normal teardown: unload intel_display first. As it
+	 * is in use by the driver, its holders must be removed with it.
+	 */
+	igt_assert_eq(unload_display(), 0);
+	igt_assert(!igt_kmod_is_loaded("intel_display"));
+	igt_assert(!igt_kmod_is_loaded(cur->name));
+}
+
+static void run_for_each_driver(void (*fn)(void))
+{
+	bool ran = false;
+
+	for (int i = 0; i < ARRAY_SIZE(drivers); i++) {
+		if (!module_available(drivers[i].name))
+			continue;
+
+		cur = &drivers[i];
+		igt_dynamic(cur->name)
+			fn();
+		ran = true;
+	}
+
+	igt_skip_on_f(!ran, "No supported GPU driver module found\n");
+}
+
+int igt_main()
+{
+	igt_fixture() {
+		igt_require_f(module_available("intel_display"),
+			      "intel_display is not a separate module on this kernel\n");
+		igt_install_exit_handler(exit_handler);
+	}
+
+	igt_describe("Verify intel_display can be loaded without a GPU driver.");
+	igt_subtest_with_dynamic("display-load-no-gpu-driver")
+		run_for_each_driver(test_load_no_gpu_driver);
+
+	igt_describe("Verify unloading intel_display with no GPU driver is harmless.");
+	igt_subtest_with_dynamic("display-unload-no-gpu-driver")
+		run_for_each_driver(test_unload_no_gpu_driver);
+
+	igt_describe("Load intel_display, then the GPU driver, and check it binds.");
+	igt_subtest_with_dynamic("display-load-then-gpu-driver")
+		run_for_each_driver(test_load_then_gpu_driver);
+
+	igt_describe("Unload the GPU driver then intel_display after loading them in order.");
+	igt_subtest_with_dynamic("display-unload-order")
+		run_for_each_driver(test_unload_order);
+
+	igt_describe("Load the GPU driver first (pulling intel_display), then unload intel_display first.");
+	igt_subtest_with_dynamic("display-reverse-order")
+		run_for_each_driver(test_reverse_order);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..c981921a4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -88,6 +88,7 @@ test_progs = [
 
 intel_i915_xe_progs = [
 	'api_intel_allocator',
+	'intel_display_module_load',
 	'intel_hwmon',
 ]
 
-- 
2.43.0

