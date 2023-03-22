Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313810E0F6
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 12:33:06 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C3509580CD3
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 05:33:05 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pexeJ-007WDd-2v
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 13:33:03 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 13:33:01 +0100
Message-Id: <20230322123301.1791267-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322123301.1791267-1-mauro.chehab@linux.intel.com>
References: <20230322123301.1791267-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] xe/xe_module_load: add a test to
 load/unload Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This is helpful to allow IGT to check if there are issues
during module load/unload.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-fast-feedback.testlist |   3 +
 tests/meson.build                        |   1 +
 tests/xe/xe_module_load.c                | 158 +++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 tests/xe/xe_module_load.c

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 6525b1676b6f..3140d648833a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,3 +1,6 @@
+# Should be the first test
+igt@xe_module_load@force-load
+
 igt@xe_compute@compute-square
 igt@xe_debugfs@base
 igt@xe_debugfs@gt
diff --git a/tests/meson.build b/tests/meson.build
index 632e36e059d8..f9fef103a736 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -256,6 +256,7 @@ xe_progs = [
 	'xe_huc_copy',
 	'xe_mmap',
 	'xe_mmio',
+	'xe_module_load',
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
new file mode 100644
index 000000000000..9a38d70858d1
--- /dev/null
+++ b/tests/xe/xe_module_load.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Tests the xe module loading
+ * Category: Sofware building block
+ * Sub-category: driver
+ * Test category: functionality test
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <libgen.h>
+#include <signal.h>
+
+#ifdef __linux__
+#include <linux/limits.h>
+#endif
+
+#include <sys/ioctl.h>
+#include <sys/utsname.h>
+
+#include "igt.h"
+
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "igt_debugfs.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#define BAR_SIZE_SHIFT 20
+#define MIN_BAR_SIZE 256
+
+static void hda_dynamic_debug(bool enable)
+{
+	FILE *fp;
+	static const char snd_hda_intel_on[] = "module snd_hda_intel +pf";
+	static const char snd_hda_core_on[] = "module snd_hda_core +pf";
+
+	static const char snd_hda_intel_off[] = "module snd_hda_core =_";
+	static const char snd_hda_core_off[] = "module snd_hda_intel =_";
+
+	fp = fopen("/sys/kernel/debug/dynamic_debug/control", "w");
+	if (!fp) {
+		igt_debug("hda dynamic debug not available\n");
+		return;
+	}
+
+	if (enable) {
+		fwrite(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
+		fwrite(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
+	} else {
+		fwrite(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
+		fwrite(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
+	}
+
+	fclose(fp);
+}
+
+static void load_and_check_xe(const char *opts)
+{
+	int error;
+	int drm_fd;
+
+	hda_dynamic_debug(true);
+	error = igt_xe_driver_load(opts);
+	hda_dynamic_debug(false);
+
+	igt_assert_eq(error, 0);
+
+	/* driver is ready, check if it's bound */
+	drm_fd = __drm_open_driver(DRIVER_XE);
+	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after modprobing xe.\n");
+}
+
+static const char * const unwanted_drivers[] = {
+	"xe",
+	"i915",
+	NULL
+};
+
+/**
+ * SUBTEST: force-load
+ * Description: Load the Xe driver passing ``force_probe=*`` parameter
+ * Run type: BAT
+ *
+ * SUBTEST: load
+ * Description: Load the Xe driver
+ * Run type: FULL
+ *
+ * SUBTEST: unload
+ * Description: Unload the Xe driver
+ * Run type: FULL
+ *
+ * SUBTEST: reload
+ * Description: Reload the Xe driver
+ * Run type: FULL
+ *
+ * SUBTEST: reload-no-display
+ * Description: Reload the Xe driver passing ``enable_display=0`` parameter
+ * Run type: FULL
+ *
+ * SUBTEST: many-reload
+ * Description: Reload the Xe driver many times
+ * Run type: FULL
+ */
+igt_main
+{
+	igt_describe("Check if xe and friends are not yet loaded, then load them.");
+	igt_subtest("load") {
+		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
+			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
+				      "%s is already loaded\n", unwanted_drivers[i]);
+		}
+
+		load_and_check_xe(NULL);
+	}
+
+	igt_subtest("unload") {
+		igt_xe_driver_unload();
+	}
+
+	igt_subtest("force-load") {
+		for (int i = 0; unwanted_drivers[i] != NULL; i++) {
+			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
+				      "%s is already loaded\n", unwanted_drivers[i]);
+		}
+
+		load_and_check_xe("force_probe=*");
+	}
+
+	igt_subtest("reload-no-display") {
+		igt_xe_driver_unload();
+		load_and_check_xe("enable_display=0");
+	}
+
+	igt_subtest("many-reload") {
+		int i;
+
+		for (i = 0; i < 10; i++) {
+			igt_debug("reload cycle: %d\n", i);
+			igt_xe_driver_unload();
+			load_and_check_xe(NULL);
+			sleep(1);
+		}
+	}
+
+	igt_subtest("reload") {
+		igt_xe_driver_unload();
+		load_and_check_xe(NULL);
+
+		/* only default modparams, can leave module loaded */
+	}
+
+	/* Subtests should unload the module themselves if they use modparams */
+}
-- 
2.39.2
