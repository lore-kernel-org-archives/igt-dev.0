Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354C810E1C9
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 09:41:08 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 12:40:33 +0300
Message-Id: <20230822094035.3424673-3-jouni.hogander@intel.com>
In-Reply-To: <20230822094035.3424673-1-jouni.hogander@intel.com>
References: <20230822094035.3424673-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 2/4] lib/i915/drrs: Add drrs helpers
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

Add drrs handling into a library to be used by kms_frontbuffer_tracking and
other tests as well.

v4: Split testcase modification into a separate patch
v3: Add library function descriptions
v2: Moved into libigt instead of static kms_drrs_helper

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/i915/intel_drrs.c | 133 ++++++++++++++++++++++++++++++++++++++++++
 lib/i915/intel_drrs.h |  17 ++++++
 lib/meson.build       |   1 +
 3 files changed, 151 insertions(+)
 create mode 100644 lib/i915/intel_drrs.c
 create mode 100644 lib/i915/intel_drrs.h

diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
new file mode 100644
index 000000000..2f83e1394
--- /dev/null
+++ b/lib/i915/intel_drrs.c
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+#include "intel_drrs.h"
+
+/**
+ * intel_is_drrs_supported:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if DRRS is supported on given pipe.
+ *
+ * Returns:
+ * true if DRRS is supported and false otherwise.
+ */
+bool intel_is_drrs_supported(int device, enum pipe pipe)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
+	close(dir);
+	if (*buf == '\0')
+		return false;
+
+	return !strcasestr(buf, "DRRS enabled:");
+}
+
+/**
+ * intel_output_has_drrs
+ * @device: fd of the device
+ * @output: Display output
+ *
+ * Check if drrs used on given output.
+ *
+ * Returns:
+ * true if DRRS is used and false otherwise.
+ */
+bool intel_output_has_drrs(int device, igt_output_t *output)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_connector_dir(device, output->name, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_type", buf, sizeof(buf));
+	close(dir);
+
+	return strstr(buf, "seamless");
+}
+
+static void drrs_set(int device, enum pipe pipe, unsigned int val)
+{
+	char buf[2];
+	int dir, ret;
+
+	igt_debug("Manually %sabling DRRS. %u\n", val ? "en" : "dis", val);
+	snprintf(buf, sizeof(buf), "%d", val);
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
+
+	/*
+	 * drrs_enable() is called on DRRS capable platform only,
+	 * whereas drrs_disable() is called on all platforms.
+	 * So handle the failure of debugfs_write only for drrs_enable().
+	 */
+	if (val)
+		igt_assert_f(ret == (sizeof(buf) - 1), "debugfs_write failed");
+}
+
+/**
+ * intel_drrs_enable:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Enable DRRS on given pipe
+ *
+ * Returns:
+ * none
+ */
+void intel_drrs_enable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 1);
+}
+
+/**
+ * intel_drrs_disable:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Disable DRRS on given pipe
+ *
+ * Returns:
+ * none
+ */
+void intel_drrs_disable(int device, enum pipe pipe)
+{
+	drrs_set(device, pipe, 0);
+}
+
+/**
+ * intel_is_drrs_inactive:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if drrs is inactive on given pipe
+ *
+ * Returns:
+ * true if inactive and false otherwise
+ */
+bool intel_is_drrs_inactive(int device, enum pipe pipe)
+{
+	char buf[256];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_drrs_status", buf, sizeof(buf));
+	close(dir);
+
+	return strstr(buf, "DRRS active: no");
+}
diff --git a/lib/i915/intel_drrs.h b/lib/i915/intel_drrs.h
new file mode 100644
index 000000000..d4d27a5f9
--- /dev/null
+++ b/lib/i915/intel_drrs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef INTEL_DRRS_H
+#define INTEL_DRRS_H
+
+#include "igt.h"
+
+bool intel_is_drrs_supported(int device, enum pipe pipe);
+bool intel_output_has_drrs(int device, igt_output_t *output);
+void intel_drrs_enable(int device, enum pipe pipe);
+void intel_drrs_disable(int device, enum pipe pipe);
+bool intel_is_drrs_inactive(int device, enum pipe pipe);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 748667c10..21ea9d5ac 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,6 +12,7 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
+	'i915/intel_drrs.c',
 	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/i915_crc.c',
-- 
2.34.1
