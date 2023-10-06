Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D71F10E201
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 06:45:42 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 tejas.upadhyay@intel.com, priyanka.dandamudi@intel.com
Date: Fri,  6 Oct 2023 12:10:37 +0530
Message-Id: <20231006064037.1954962-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_access_counter: New access
 counter test
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added a negative test related to access counter.
It tries to test GRANULARITY access counter parameter.

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_access_counter.c | 67 +++++++++++++++++++++++++++++++++
 tests/meson.build               |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 tests/intel/xe_access_counter.c

diff --git a/tests/intel/xe_access_counter.c b/tests/intel/xe_access_counter.c
new file mode 100644
index 000000000..98882405f
--- /dev/null
+++ b/tests/intel/xe_access_counter.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for access counter functionality
+ * Category: Software building block
+ * Run type: FULL
+ * Sub-category: access counter
+ * Functionality: access counter
+ * Test category: functionality test
+ * SUBTEST: invalid-param
+ */
+
+#include "igt.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include <string.h>
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		uint16_t devid;
+
+		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		igt_require(IS_PONTEVECCHIO(devid));
+	}
+
+	igt_subtest("invalid-param") {
+		struct drm_xe_engine_class_instance instance = {
+			 .engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
+		 };
+
+		int err;
+		const int expected = -EINVAL;
+
+		struct drm_xe_ext_exec_queue_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY,
+			.value = 5,
+		};
+
+		struct drm_xe_exec_queue_create create = {
+			.extensions = to_user_pointer(&ext),
+			.vm_id = xe_vm_create(fd, 0, 0),
+			.width = 1,
+			.num_placements = 1,
+			.instances = to_user_pointer(&instance),
+		};
+
+		err = igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create);
+
+		igt_assert_eq(err, expected);
+	}
+
+	igt_fixture
+		drm_close_driver(fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2404b2d4a..af5da1bdc 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -271,6 +271,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'xe_access_counter',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.25.1
