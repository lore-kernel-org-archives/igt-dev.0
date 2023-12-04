Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713E410E394
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 17:11:05 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Dec 2023 18:10:26 +0100
Message-Id: <20231204171033.2167-2-lukasz.laguna@intel.com>
In-Reply-To: <20231204171033.2167-1-lukasz.laguna@intel.com>
References: <20231204171033.2167-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 1/8] lib/igt_sriov_device: add core
 SR-IOV helpers
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

Create lib for core SR-IOV (Single Root I/O Virtualization) helpers
that allow to manage SR-IOV devices.

v2:
 - change functions description (Michal)
v3:
 - decipher SR-IOV shortcut in commit message (Kamil)
 - add SR-IOV description in header file (Kamil)
 - remove old r-b and add cc (Kamil)
 - return bool result in functions prefixed with "__" (Kamil)
 - add brief description in functions documentation (Michal)
 - add asserts in helpers (Michal)
v4:
 - remove unnecessary include (Kamil)

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sriov_device.c | 213 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  27 ++++++
 lib/meson.build        |   1 +
 3 files changed, 241 insertions(+)
 create mode 100644 lib/igt_sriov_device.c
 create mode 100644 lib/igt_sriov_device.h

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
new file mode 100644
index 000000000..c5c594c2c
--- /dev/null
+++ b/lib/igt_sriov_device.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include <errno.h>
+
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+
+/**
+ * igt_sriov_is_pf - Check if device is PF
+ * @device: device file descriptor
+ *
+ * Determine if device is PF by checking existence of sriov_totalvfs file.
+ *
+ * Return:
+ * True if device is PF, false otherwise.
+ */
+bool igt_sriov_is_pf(int device)
+{
+	int sysfs;
+	bool ret;
+
+	sysfs = igt_sysfs_open(device);
+	igt_assert_fd(sysfs);
+
+	ret = igt_sysfs_has_attr(sysfs, "device/sriov_totalvfs");
+	close(sysfs);
+
+	return ret;
+}
+
+static bool __pf_attr_get_u32(int pf, const char *attr, uint32_t *value)
+{
+	int sysfs;
+	bool ret;
+
+	igt_assert(igt_sriov_is_pf(pf));
+
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+
+	ret = __igt_sysfs_get_u32(sysfs, attr, value);
+	close(sysfs);
+
+	return ret;
+}
+
+static uint32_t pf_attr_get_u32(int pf, const char *attr)
+{
+	uint32_t value;
+
+	igt_assert_f(__pf_attr_get_u32(pf, attr, &value),
+		     "Failed to read %s attribute (%s)\n", attr, strerror(errno));
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
+static void pf_attr_set_u32(int pf, const char *attr, uint32_t value)
+{
+	igt_assert_f(__pf_attr_set_u32(pf, attr, value),
+		     "Failed to write %u to %s attribute (%s)\n", value, attr, strerror(errno));
+}
+
+/**
+ * igt_sriov_vfs_supported - Check if VFs are supported
+ * @pf: PF device file descriptor
+ *
+ * Determine VFs support by checking if value of sriov_totalvfs attribute
+ * corresponding to @pf device is bigger than 0.
+ *
+ * Return:
+ * True if VFs are supported, false otherwise.
+ */
+bool igt_sriov_vfs_supported(int pf)
+{
+	uint32_t totalvfs;
+
+	if (!__pf_attr_get_u32(pf, "device/sriov_totalvfs", &totalvfs))
+		return false;
+
+	return totalvfs > 0;
+}
+
+/**
+ * igt_sriov_get_totalvfs - Get maximum number of VFs that can be enabled
+ * @pf: PF device file descriptor
+ *
+ * Maximum number of VFs that can be enabled is checked by reading
+ * sriov_totalvfs attribute corresponding to @pf device.
+ *
+ * It asserts on failure.
+ *
+ * Return:
+ * Maximum number of VFs that can be associated with given PF.
+ */
+unsigned int igt_sriov_get_total_vfs(int pf)
+{
+	return pf_attr_get_u32(pf, "device/sriov_totalvfs");
+}
+
+/**
+ * igt_sriov_get_numvfs - Get number of enabled VFs
+ * @pf: PF device file descriptor
+ *
+ * Number of enabled VFs is checked by reading sriov_numvfs attribute
+ * corresponding to @pf device.
+ *
+ * It asserts on failure.
+ *
+ * Return:
+ * Number of VFs enabled by given PF.
+ */
+unsigned int igt_sriov_get_enabled_vfs(int pf)
+{
+	return pf_attr_get_u32(pf, "device/sriov_numvfs");
+}
+
+/**
+ * igt_sriov_enable_vfs - Enable VFs
+ * @pf: PF device file descriptor
+ * @num_vfs: Number of virtual functions to be enabled
+ *
+ * Enable VFs by writing @num_vfs to sriov_numvfs attribute corresponding to
+ * @pf device.
+ * It asserts on failure.
+ */
+void igt_sriov_enable_vfs(int pf, unsigned int num_vfs)
+{
+	igt_assert(num_vfs > 0);
+
+	igt_debug("Enabling %u VFs\n", num_vfs);
+	pf_attr_set_u32(pf, "device/sriov_numvfs", num_vfs);
+}
+
+/**
+ * igt_sriov_disable_vfs - Disable VFs
+ * @pf: PF device file descriptor
+ *
+ * Disable VFs by writing 0 to sriov_numvfs attribute corresponding to @pf
+ * device.
+ * It asserts on failure.
+ */
+void igt_sriov_disable_vfs(int pf)
+{
+	pf_attr_set_u32(pf, "device/sriov_numvfs", 0);
+}
+
+/**
+ * igt_sriov_is_driver_autoprobe_enabled - Get VF driver autoprobe setting
+ * @pf: PF device file descriptor
+ *
+ * Get current VF driver autoprobe setting by reading sriov_drivers_autoprobe
+ * attribute corresponding to @pf device.
+ *
+ * It asserts on failure.
+ *
+ * Return:
+ * True if autoprobe is enabled, false otherwise.
+ */
+bool igt_sriov_is_driver_autoprobe_enabled(int pf)
+{
+	return pf_attr_get_u32(pf, "device/sriov_drivers_autoprobe");
+}
+
+/**
+ * igt_sriov_enable_driver_autoprobe - Enable VF driver autoprobe
+ * @pf: PF device file descriptor
+ *
+ * Enable VF driver autoprobe setting by writing 1 to sriov_drivers_autoprobe
+ * attribute corresponding to @pf device.
+ *
+ * If successful, kernel will automatically bind VFs to a compatible driver
+ * immediately after they are enabled.
+ * It asserts on failure.
+ */
+void igt_sriov_enable_driver_autoprobe(int pf)
+{
+	pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", true);
+}
+
+/**
+ * igt_sriov_disable_driver_autoprobe - Disable VF driver autoprobe
+ * @pf: PF device file descriptor
+ *
+ * Disable VF driver autoprobe setting by writing 0 to sriov_drivers_autoprobe
+ * attribute corresponding to @pf device.
+ *
+ * During VFs enabling driver won't be bound to VFs.
+ * It asserts on failure.
+ */
+void igt_sriov_disable_driver_autoprobe(int pf)
+{
+	pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", false);
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
new file mode 100644
index 000000000..63359d57c
--- /dev/null
+++ b/lib/igt_sriov_device.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __IGT_SRIOV_DEVICE_H__
+#define __IGT_SRIOV_DEVICE_H__
+
+/* Library for managing SR-IOV (Single Root I/O Virtualization)
+ * devices.
+ *
+ * SR-IOV is a specification that allows a single PCIe physical
+ * device to appear as a physical function (PF) and multiple virtual
+ * functions (VFs) to the operating system.
+ */
+
+bool igt_sriov_is_pf(int device);
+bool igt_sriov_vfs_supported(int pf);
+unsigned int igt_sriov_get_total_vfs(int pf);
+unsigned int igt_sriov_get_enabled_vfs(int pf);
+void igt_sriov_enable_vfs(int pf, unsigned int num_vfs);
+void igt_sriov_disable_vfs(int pf);
+bool igt_sriov_is_driver_autoprobe_enabled(int pf);
+void igt_sriov_enable_driver_autoprobe(int pf);
+void igt_sriov_disable_driver_autoprobe(int pf);
+
+#endif /* __IGT_SRIOV_DEVICE_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 48466a2e9..0fc11b26c 100644
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
