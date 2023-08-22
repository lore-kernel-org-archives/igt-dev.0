Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B2D10E1C5
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 09:41:07 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 12:40:32 +0300
Message-Id: <20230822094035.3424673-2-jouni.hogander@intel.com>
In-Reply-To: <20230822094035.3424673-1-jouni.hogander@intel.com>
References: <20230822094035.3424673-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 1/4] lib/i915/fbc: Add fbc helpers
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

Add some fbc helpes into a library to be used by kms_frontbuffer_tracking
and other tests as well.

v4: Split testcase modification into a separate patch
v3: Add library function descriptions
v2: Moved into libigt instead of static kms_fbc_helper

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/i915/intel_fbc.c | 96 ++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/intel_fbc.h | 18 +++++++++
 lib/meson.build      |  1 +
 3 files changed, 115 insertions(+)
 create mode 100644 lib/i915/intel_fbc.c
 create mode 100644 lib/i915/intel_fbc.h

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
new file mode 100644
index 000000000..a885b2f97
--- /dev/null
+++ b/lib/i915/intel_fbc.c
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+
+#include "intel_fbc.h"
+
+#define FBC_STATUS_BUF_LEN 128
+
+/**
+ * intel_fbc_supported_on_chipset:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Check if FBC is supported by chipset on given pipe.
+ *
+ * Returns:
+ * true if FBC is supported and false otherwise.
+ */
+bool intel_fbc_supported_on_chipset(int device, enum pipe pipe)
+{
+	char buf[FBC_STATUS_BUF_LEN];
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
+	close(dir);
+	if (*buf == '\0')
+		return false;
+
+	return !strstr(buf, "FBC unsupported on this chipset\n");
+}
+
+static bool _intel_fbc_is_enabled(int device, enum pipe pipe, int log_level, char *last_fbc_buf)
+{
+	char buf[FBC_STATUS_BUF_LEN];
+	bool print = true;
+	int dir;
+
+	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
+	igt_require_fd(dir);
+	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
+	close(dir);
+	if (log_level != IGT_LOG_DEBUG)
+		last_fbc_buf[0] = '\0';
+	else if (strcmp(last_fbc_buf, buf))
+		strcpy(last_fbc_buf, buf);
+	else
+		print = false;
+
+	if (print)
+		igt_log(IGT_LOG_DOMAIN, log_level, "fbc_is_enabled():\n%s\n", buf);
+
+	return strstr(buf, "FBC enabled\n");
+}
+
+/**
+ * intel_fbc_is_enabled:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ * @log_level: Wanted loglevel
+ *
+ * Check if FBC is enabled on given pipe. Loglevel can be used to
+ * control at which loglevel current state is printed out.
+ *
+ * Returns:
+ * true if FBC is enabled.
+ */
+bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
+{
+	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+
+	return _intel_fbc_is_enabled(device, pipe, log_level, last_fbc_buf);
+}
+
+/**
+ * intel_fbc_wait_until_enabled:
+ * @device: fd of the device
+ * @pipe: Display pipe
+ *
+ * Wait until fbc is enabled. Used timeout is constant 2 seconds.
+ *
+ * Returns:
+ * true if FBC got enabled.
+ */
+bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
+{
+	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+
+	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
new file mode 100644
index 000000000..995dc7f1e
--- /dev/null
+++ b/lib/i915/intel_fbc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef INTEL_FBC_H
+#define INTEL_FBC_H
+
+#include "igt.h"
+
+#define intel_fbc_enable(device) igt_set_module_param_int(device, "enable_fbc", 1)
+#define intel_fbc_disable(device) igt_set_module_param_int(device, "enable_fbc", 0)
+
+bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
+bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
+bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index b7bfcf4f0..748667c10 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -12,6 +12,7 @@ lib_sources = [
 	'i915/gem_mman.c',
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
+	'i915/intel_fbc.c',
 	'i915/intel_memory_region.c',
 	'i915/i915_crc.c',
 	'igt_collection.c',
-- 
2.34.1
