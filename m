Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8C10E1BD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:52:02 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 07:51:40 +0100
Message-Id: <20231109065147.9479-2-lukasz.laguna@intel.com>
In-Reply-To: <20231109065147.9479-1-lukasz.laguna@intel.com>
References: <20231109065147.9479-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] lib/igt_sriov_device: add core SR-IOV
 helpers
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

Create lib for core SR-IOV helpers that allow to manage SR-IOV devices.

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 176 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  20 +++++
 lib/meson.build        |   1 +
 3 files changed, 197 insertions(+)
 create mode 100644 lib/igt_sriov_device.c
 create mode 100644 lib/igt_sriov_device.h

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
new file mode 100644
index 000000000..c7338d13a
--- /dev/null
+++ b/lib/igt_sriov_device.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+
+/**
+ * igt_sriov_is_pf:
+ * @device: device file descriptor
+ *
+ * Check if device is PF by checking existence of sriov_totalvfs file
+ * and non-zero value read from that file.
+ *
+ * Returns:
+ * True if device is PF, false otherwise.
+ */
+bool igt_sriov_is_pf(int device)
+{
+	int sysfs;
+	bool ret;
+	uint32_t totalvfs;
+
+	sysfs = igt_sysfs_open(device);
+	igt_assert_fd(sysfs);
+
+	ret = __igt_sysfs_get_u32(sysfs, "device/sriov_totalvfs", &totalvfs);
+	close(sysfs);
+
+	if (!ret)
+		return false;
+
+	return totalvfs > 0;
+}
+
+static uint32_t __pf_attr_get_u32(int pf, const char *attr)
+{
+	int sysfs;
+	uint32_t value;
+
+	igt_assert(igt_sriov_is_pf(pf));
+
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+
+	value = igt_sysfs_get_u32(sysfs, attr);
+	close(sysfs);
+
+	return value;
+}
+
+static bool __pf_attr_set_u32(int pf, const char *attr, uint32_t value)
+{
+	int sysfs;
+	bool ret;
+
+	igt_assert(igt_sriov_is_pf(pf));
+
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+
+	ret = __igt_sysfs_set_u32(sysfs, attr, value);
+	close(sysfs);
+
+	return ret;
+}
+
+/**
+ * igt_sriov_get_totalvfs:
+ * @pf: PF device file descriptor
+ *
+ * Get maximum number of VFs that can be enabled.
+ *
+ * Returns:
+ * Maximum number of VFs that could be associated with given PF.
+ */
+unsigned int igt_sriov_get_total_vfs(int pf)
+{
+	return __pf_attr_get_u32(pf, "device/sriov_totalvfs");
+}
+
+/**
+ * igt_sriov_get_numvfs:
+ * @pf: PF device file descriptor
+ *
+ * Get number of enabled VFs.
+ *
+ * Returns:
+ * Number of VFs enabled by given PF.
+ */
+unsigned int igt_sriov_get_enabled_vfs(int pf)
+{
+	return __pf_attr_get_u32(pf, "device/sriov_numvfs");
+}
+
+/**
+ * igt_sriov_enable_vfs:
+ * @pf: PF device file descriptor
+ * @num_vfs: Number of virtual functions to be enabled
+ *
+ * Enable VFs by writing @num_vfs to sriov_numvfs attribute corresponding to
+ * @pf device.
+ *
+ * Returns:
+ * True on success and false on failure.
+ */
+bool igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
+{
+	igt_assert(num_vfs > 0);
+	igt_debug("Enabling %u VFs\n", num_vfs);
+	return __pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
+}
+
+/**
+ * igt_sriov_disable_vfs:
+ * @pf: PF device file descriptor
+ *
+ * Disable VFs by writing 0 to sriov_numvfs attribute corresponding to @pf
+ * device.
+ *
+ * Returns:
+ * True on success and false on failure.
+ */
+bool igt_sriov_disable_vfs(int pf)
+{
+	return __pf_attr_set_u32(pf, "device/sriov_numvfs", 0);
+}
+
+/**
+ * igt_sriov_is_driver_autoprobe_enabled:
+ * @pf: PF device file descriptor
+ *
+ * Get current VF driver autoprobe setting.
+ *
+ * Returns:
+ * True if autoprobe is enabled, false otherwise.
+ */
+bool igt_sriov_is_driver_autoprobe_enabled(int pf)
+{
+	return __pf_attr_get_u32(pf, "device/sriov_drivers_autoprobe");
+}
+
+/**
+ * igt_sriov_enable_driver_autoprobe:
+ * @pf: PF device file descriptor
+ *
+ * Set VF driver autoprobe to true.
+ *
+ * If successful, kernel will automatically bind VFs to a compatible driver
+ * immediately after they are enabled.
+ *
+ * Return:
+ * True if setting driver autoprobe succeed, otherwise false.
+ */
+bool igt_sriov_enable_driver_autoprobe(int pf)
+{
+	return __pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", true);
+}
+
+/**
+ * igt_sriov_disable_driver_autoprobe:
+ * @pf: PF device file descriptor
+ *
+ * Set VF driver autoprobe to false.
+ *
+ * During VFs enabling driver won't be bound to VFs.
+ *
+ * Return:
+ * True if setting driver autoprobe succeed, otherwise false.
+ */
+bool igt_sriov_disable_driver_autoprobe(int pf)
+{
+	return __pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", false);
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
new file mode 100644
index 000000000..f2c5c44fa
--- /dev/null
+++ b/lib/igt_sriov_device.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __IGT_SRIOV_DEVICE_H__
+#define __IGT_SRIOV_DEVICE_H__
+
+#include <stdint.h>
+
+bool igt_sriov_is_pf(int device);
+unsigned int igt_sriov_get_total_vfs(int pf);
+unsigned int igt_sriov_get_enabled_vfs(int pf);
+bool igt_sriov_enable_vfs(int pf, unsigned int num_vfs);
+bool igt_sriov_disable_vfs(int pf);
+bool igt_sriov_is_driver_autoprobe_enabled(int pf);
+bool igt_sriov_enable_driver_autoprobe(int pf);
+bool igt_sriov_disable_driver_autoprobe(int pf);
+
+#endif /* __IGT_SRIOV_DEVICE_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index a7bccafc3..083baa68a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -38,6 +38,7 @@ lib_sources = [
 	'igt_primes.c',
 	'igt_pci.c',
 	'igt_rand.c',
+	'igt_sriov_device.c',
 	'igt_stats.c',
 	'igt_syncobj.c',
 	'igt_sysfs.c',
-- 
2.40.0
