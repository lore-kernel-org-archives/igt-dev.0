Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702B910E656
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 05:32:09 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, janga.rahul.kumar@intel.com,
 igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 10:57:45 +0530
Message-Id: <20231110052746.2131907-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20231110052746.2131907-1-priyanka.dandamudi@intel.com>
References: <20231110052746.2131907-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/xe_exec_queue_property: Add
 exec queue set property tests
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

Added tests to check exec_queue set properties.
It tests basic positive and invalid values for priority and persistence.

v2: Modified test description.(Matt)
and minute changes in description.(Kamil)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 101 +++++++++++++++++++++++++++
 tests/meson.build                    |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 tests/intel/xe_exec_queue_property.c

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
new file mode 100644
index 000000000..f61ab1a19
--- /dev/null
+++ b/tests/intel/xe_exec_queue_property.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests to check exec_queue set property functionality
+ * Category: Software building block
+ * Sub-category: exec queue property
+ * Functionality: exec queue set property
+ * Test category: functionality test
+ * SUBTEST: priority-set-property
+ * Description: tests basic priority property by setting invalid values and positive values.
+ * SUBTEST: persistence-set-property
+ * Description: tests basic persistence property by setting positive values
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define DRM_SCHED_PRIORITY_HIGH  2
+#define DRM_SCHED_PRIORITY_NORMAL 1
+
+static void test_set_property(int xe, int property_name,
+			      int property_value, int err_val)
+{
+	struct drm_xe_engine_class_instance instance = {
+			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND_SYNC,
+	};
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = property_name,
+		.value = property_value,
+	};
+
+	struct drm_xe_exec_queue_create create = {
+		.extensions = to_user_pointer(&ext),
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&instance),
+		.vm_id = xe_vm_create(xe, 0, 0),
+	};
+	int ret = 0;
+
+	if (igt_ioctl(xe, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create)) {
+		ret = -errno;
+		errno = 0;
+	}
+	igt_assert_eq(ret, err_val);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture {
+		xe = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_subtest("priority-set-property") {
+		/* Tests priority property by setting positive values. */
+		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+				  DRM_SCHED_PRIORITY_NORMAL, 0);
+
+		/* Tests priority property by setting invalid value. */
+		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+				  DRM_SCHED_PRIORITY_HIGH + 1, -EINVAL);
+		igt_fork(child, 1) {
+			igt_drop_root();
+
+			/* Tests priority property by dropping root permissions. */
+			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+					  DRM_SCHED_PRIORITY_HIGH, -EPERM);
+			test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+					  DRM_SCHED_PRIORITY_NORMAL, 0);
+		}
+		igt_waitchildren();
+	}
+
+	igt_subtest("persistence-set-property") {
+		/* Tests persistence property by setting positive values. */
+		test_set_property(xe, XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE, 1, 0);
+
+	}
+
+	igt_fixture {
+		xe_device_put(xe);
+		drm_close_driver(xe);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 62721157d..3e4d54601 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -287,6 +287,7 @@ intel_xe_progs = [
 	'xe_exec_basic',
 	'xe_exec_compute_mode',
 	'xe_exec_fault_mode',
+	'xe_exec_queue_property',
 	'xe_exec_reset',
 	'xe_exec_store',
 	'xe_exec_threads',
-- 
2.25.1
