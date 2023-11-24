Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE4D10E7BC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:54:23 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:52:56 +0100
Message-Id: <20231124085259.1777-6-lukasz.laguna@intel.com>
In-Reply-To: <20231124085259.1777-1-lukasz.laguna@intel.com>
References: <20231124085259.1777-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/8] tests/sriov_basic: add basic tests for
 enabling SR-IOV VFs
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

From: Katarzyna Dec <katarzyna.dec@intel.com>

Add subtests that validate SR-IOV VFs enabling in two variants: with
autoprobe disabled and enabled.

v2:
 - rename function (Michal)
 - remove checks that are outside the scope of the test (Michal)
v3:
 - change run type of enable-vfs-autoprobe-on subtest (Michal)
 - don't init random seed in test code (Michal)

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/meson.build   |   1 +
 tests/sriov_basic.c | 123 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 tests/sriov_basic.c

diff --git a/tests/meson.build b/tests/meson.build
index 3e4d54601..928753098 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -71,6 +71,7 @@ test_progs = [
 	'panfrost_submit',
 	'prime_udl',
 	'prime_vgem',
+	'sriov_basic',
 	'syncobj_basic',
 	'syncobj_eventfd',
 	'syncobj_wait',
diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
new file mode 100644
index 000000000..ce75f4198
--- /dev/null
+++ b/tests/sriov_basic.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+
+IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
+
+/**
+ * TEST: sriov_basic
+ * Category: Software building block
+ * Mega feature: SR-IOV
+ * Sub-category: VFs enabling
+ * Description: Validate SR-IOV VFs enabling
+ */
+
+/**
+ * SUBTEST: enable-vfs-autoprobe-off
+ * Description:
+ *   Verify VFs enabling without probing VF driver
+ * Run type: BAT
+ */
+static void enable_vfs_autoprobe_off(int pf_fd, unsigned int num_vfs)
+{
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
+	igt_sriov_disable_vfs(pf_fd);
+}
+
+/**
+ * SUBTEST: enable-vfs-autoprobe-on
+ * Description:
+ *   Verify VFs enabling and auto-probing VF driver
+ * Run type: FULL
+ */
+static void enable_vfs_autoprobe_on(int pf_fd, unsigned int num_vfs)
+{
+	bool err = false;
+
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(pf_fd));
+	for (int vf_num = 1; vf_num <= num_vfs; ++vf_num) {
+		if (!igt_sriov_is_vf_drm_driver_probed(pf_fd, vf_num)) {
+			igt_debug("VF%u probe failed\n", vf_num);
+			err = true;
+		}
+	}
+	igt_sriov_disable_vfs(pf_fd);
+	igt_assert(!err);
+}
+
+igt_main
+{
+	int pf_fd;
+	bool autoprobe;
+
+	igt_fixture {
+		pf_fd = drm_open_driver(DRIVER_ANY);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+	}
+
+	igt_describe("Verify VFs enabling without probing VF driver");
+	igt_subtest_with_dynamic("enable-vfs-autoprobe-off") {
+		for_each_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-%u", num_vfs) {
+				enable_vfs_autoprobe_off(pf_fd, num_vfs);
+			}
+		}
+		for_random_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				enable_vfs_autoprobe_off(pf_fd, num_vfs);
+			}
+		}
+		for_max_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-all") {
+				enable_vfs_autoprobe_off(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Verify VFs enabling and auto-probing VF driver");
+	igt_subtest_with_dynamic("enable-vfs-autoprobe-on") {
+		for_each_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-%u", num_vfs) {
+				enable_vfs_autoprobe_on(pf_fd, num_vfs);
+			}
+		}
+		for_random_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				enable_vfs_autoprobe_on(pf_fd, num_vfs);
+			}
+		}
+		for_max_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-all") {
+				enable_vfs_autoprobe_on(pf_fd, num_vfs);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		close(pf_fd);
+	}
+}
-- 
2.40.0
