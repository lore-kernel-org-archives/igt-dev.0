Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA0DE9D410
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD2910E6B5;
	Wed,  4 Feb 2026 16:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6LEUPIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1146410E6B5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222758; x=1801758758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Sqc8bxlhcJPqP9jUg5ofk4w8z/6aqkLTMeGExzk40o=;
 b=B6LEUPIylZtxubkZYohDTQSacvHB08CJx2kyAnHeG3pYKztybg0uHvJh
 FY/mKmME2T+S6WvJ+88YQYxiKNdiDSalJY1AQutMoS9QC44S3Qd2DhcwN
 8ChQ/eajDCvzD7fymSVjagc3GCt72FuSVfihbbsCx2Q+K+3dJxbs2Db+C
 dY1TVMAl9NFUFwv6TdJJdbfWbDRvDzLbnjd9yvEwM2tTYKinoRK6XO2y0
 g3gq1sES1EKS8er0DzEb3d42aj1wYHIwyE17Z4vah21bzbKoqBYrPHz0x
 Kt3DrGKWpOO0nhvQCI+GWq6mTGtow8IAWB4bCBOKI7zKmGnI0hxh3rkUc Q==;
X-CSE-ConnectionGUID: IuNYHOTLR5KU30IRWZvjWw==
X-CSE-MsgGUID: ZDgooV1/RSKGHaRyVk79DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71472383"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71472383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:38 -0800
X-CSE-ConnectionGUID: l0p4mvQkTi20vPg2MCchig==
X-CSE-MsgGUID: J1Q3pISESWO7Mm/CNvzWtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209315377"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:36 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v3 i-g-t 2/7] lib/igt_pci: Add generic PCI driver override and
 bind/unbind helpers
Date: Wed,  4 Feb 2026 17:32:05 +0100
Message-ID: <20260204163217.121305-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add generic helpers for controlling PCI driver binding via sysfs.

The new APIs provide driver- and device-centric primitives for:
  - setting and clearing driver_override
  - triggering PCI driver reprobe
  - binding and unbinding devices to a specific PCI driver
  - query the currently bound PCI driver

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

---
v2:
- Add igt_pci_get_bound_driver_name() to query the currently bound PCI
  driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
- Extend igt_pci_bind_driver_override() and igt_pci_unbind_driver_override()
  with a timeout_ms parameter so callers can wait for bind/unbind to
  actually complete, instead of relying on drivers_probe write success.

---
 lib/igt_pci.c | 351 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h |  13 +-
 2 files changed, 363 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index 61aaf939d..80aaf07c5 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -3,9 +3,18 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <string.h>
+#include <unistd.h>
 #include <pciaccess.h>
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_pci.h"
+#include "igt_sysfs.h"
 
 static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
 				  int start_offset)
@@ -51,3 +60,345 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
 {
 	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
 }
+
+static int open_pci_driver_dir(const char *driver)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
+	return open(path, O_RDONLY | O_CLOEXEC);
+}
+
+/**
+ * igt_pci_device_unbind:
+ * @pci_slot: BDF like "0000:01:00.0"
+ *
+ * Unbind @pci_slot from its currently bound driver, if any.
+ * Returns 0 on success, or a negative errno-like value.
+ */
+int igt_pci_device_unbind(const char *pci_slot)
+{
+	char path[PATH_MAX];
+	int dirfd;
+	int ret;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
+	dirfd = open(path, O_RDONLY | O_CLOEXEC);
+	if (dirfd < 0)
+		return 0; /* already unbound */
+
+	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
+	close(dirfd);
+
+	return ret;
+}
+
+/**
+ * igt_pci_driver_bind:
+ * @driver: PCI driver name under /sys/bus/pci/drivers/<driver>
+ * @pci_slot: device to bind
+ *
+ * Bind @pci_slot to @driver. Driver must be present/loaded.
+ * Returns 0 on success, or a negative errno-like value.
+ */
+int igt_pci_driver_bind(const char *driver, const char *pci_slot)
+{
+	int dirfd, ret;
+
+	dirfd = open_pci_driver_dir(driver);
+	if (dirfd < 0)
+		return -errno;
+
+	ret = igt_sysfs_set(dirfd, "bind", pci_slot) ? 0 : -errno;
+	close(dirfd);
+
+	return ret;
+}
+
+/**
+ * igt_pci_driver_unbind:
+ * @driver: PCI driver name
+ * @pci_slot: device to unbind
+ *
+ * Unbind @pci_slot from @driver.
+ * Returns 0 on success, or a negative errno-like value.
+ */
+int igt_pci_driver_unbind(const char *driver, const char *pci_slot)
+{
+	int dirfd, ret;
+
+	dirfd = open_pci_driver_dir(driver);
+	if (dirfd < 0)
+		return -errno;
+
+	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
+	close(dirfd);
+
+	return ret;
+}
+
+/**
+ * igt_pci_driver_unbind_all:
+ * @driver: PCI driver name
+ *
+ * Unbind all devices currently bound to @driver.
+ * Returns 0 on success, or a negative errno-like value.
+ */
+int igt_pci_driver_unbind_all(const char *driver)
+{
+	char path[PATH_MAX];
+	DIR *dir;
+	struct dirent *de;
+	int driver_fd;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
+	dir = opendir(path);
+	if (!dir)
+		return -errno;
+
+	driver_fd = dirfd(dir);
+
+	while ((de = readdir(dir))) {
+		bool ok;
+
+		/* BDF symlinks are like "0000:01:00.0" and start with digit */
+		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
+			continue;
+
+		ok = igt_sysfs_set(driver_fd, "unbind", de->d_name);
+		if (!ok) {
+			int err = -errno;
+
+			closedir(dir);
+			return err;
+		}
+	}
+
+	closedir(dir);
+	return 0;
+}
+
+/**
+ * igt_pci_set_driver_override:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @driver: PCI driver name to force-bind (e.g. "xe-vfio-pci"), or
+ *          NULL / empty string to clear an existing override
+ *
+ * Set or clear the PCI driver_override for @pci_slot via sysfs.
+ *
+ * This does not trigger driver reprobe by itself. Call
+ * igt_pci_probe_drivers() afterwards to apply the override.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int igt_pci_set_driver_override(const char *pci_slot, const char *driver)
+{
+	char devpath[PATH_MAX];
+	int dev;
+	bool ok;
+
+	snprintf(devpath, sizeof(devpath), "/sys/bus/pci/devices/%s", pci_slot);
+	dev = open(devpath, O_DIRECTORY | O_RDONLY);
+	if (dev < 0)
+		return -errno;
+
+	ok = igt_sysfs_set(dev, "driver_override", driver ? driver : "");
+	close(dev);
+
+	return ok ? 0 : -errno;
+}
+
+/**
+ * igt_pci_probe_drivers:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ *
+ * Trigger PCI driver reprobe for @pci_slot by writing to
+ * /sys/bus/pci/drivers_probe.
+ *
+ * This causes the kernel to attempt binding the device, honoring any
+ * driver_override previously set.
+ *
+ * Note: a successful write only means the reprobe request was accepted.
+ * It does not guarantee that a driver actually bound to the device.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int igt_pci_probe_drivers(const char *pci_slot)
+{
+	int pci;
+	bool ok;
+
+	pci = open("/sys/bus/pci", O_DIRECTORY | O_RDONLY);
+	if (pci < 0)
+		return -errno;
+
+	ok = igt_sysfs_set(pci, "drivers_probe", pci_slot);
+	close(pci);
+
+	return ok ? 0 : -errno;
+}
+
+/**
+ * igt_pci_get_bound_driver_name:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @driver: destination buffer for the bound driver name
+ * @driver_len: size of @driver in bytes
+ *
+ * Read the currently bound PCI driver name for @pci_slot by inspecting the
+ * /sys/bus/pci/devices/<BDF>/driver symlink.
+ *
+ * Return values:
+ *  1: device is bound and @driver contains the driver name
+ *  0: device is unbound (no driver symlink)
+ * <0: negative errno-like value on error
+ */
+int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len)
+{
+	char path[PATH_MAX];
+	char link[PATH_MAX];
+	const char *base;
+	ssize_t len;
+
+	if (driver && driver_len)
+		driver[0] = '\0';
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
+	len = readlink(path, link, sizeof(link) - 1);
+	if (len < 0) {
+		if (errno == ENOENT)
+			return 0; /* unbound */
+
+		return -errno;
+	}
+
+	link[len] = '\0';
+	base = strrchr(link, '/');
+	base = base ? base + 1 : link;
+
+	if (driver && driver_len)
+		snprintf(driver, driver_len, "%s", base);
+
+	return 1;
+}
+
+/**
+ * igt_pci_bind_driver_override:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @driver: PCI driver name to bind (must not be NULL or empty)
+ * @timeout_ms: how long to wait for the device to become bound.
+ *              If 0, don't wait (best-effort immediate check only).
+ *
+ * Bind @pci_slot to @driver using the driver_override mechanism.
+ *
+ * This helper sets driver_override and immediately triggers driver
+ * reprobe so that the device is bound to the requested driver.
+ *
+ * Returns: 0 on success, negative errno-like value on failure.
+ * A reprobe request can be accepted by sysfs while the driver probe
+ * fails later; this helper verifies the device ended up bound.
+ *
+ * On bind failure, returns a negative error and the failure reason may
+ * also be logged to dmesg by the kernel driver.
+ */
+int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
+				 unsigned int timeout_ms)
+{
+	int ret;
+	char bound[64];
+	int bound_ret;
+	bool bound_ok;
+
+	if (!driver || !driver[0])
+		return -EINVAL;
+
+	ret = igt_pci_set_driver_override(pci_slot, driver);
+	if (ret)
+		return ret;
+
+	ret = igt_pci_probe_drivers(pci_slot);
+	if (ret)
+		return ret;
+
+	/*
+	 * Writing to drivers_probe only tells us the kernel accepted the request.
+	 * The actual driver probe may still fail (and only be reported via dmesg).
+	 * Verify that the device ended up bound to the requested driver.
+	 */
+	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
+	if (bound_ret < 0)
+		return bound_ret;
+
+	if (timeout_ms == 0) {
+		/*
+		 * No waiting requested. If the device is already bound, validate
+		 * it is bound to the expected driver; otherwise treat as
+		 * best-effort request-only success.
+		 */
+		if (bound_ret > 0 && strcmp(bound, driver))
+			return -EBUSY;
+
+		return 0;
+	}
+
+	bound_ok = igt_wait((bound_ret =
+			     igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) != 0,
+			    timeout_ms, 1);
+	if (!bound_ok)
+		return -EIO;
+
+	if (bound_ret < 0)
+		return bound_ret;
+
+	if (strcmp(bound, driver))
+		return -EBUSY;
+
+	return 0;
+}
+
+/**
+ * igt_pci_unbind_driver_override:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @timeout_ms: how long to wait for the device to become unbound.
+ *              If 0, don't wait (best-effort immediate check only).
+ *
+ * Unbind @pci_slot from its currently bound driver (if any) and clear
+ * any driver_override setting.
+ *
+ * This is the inverse operation of igt_pci_bind_driver_override().
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms)
+{
+	int ret;
+	int bound_ret;
+	char bound[64];
+	bool unbound_ok;
+
+	ret = igt_pci_device_unbind(pci_slot);
+	if (ret)
+		return ret;
+
+	ret = igt_pci_set_driver_override(pci_slot, "");
+	if (ret)
+		return ret;
+
+	bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
+	if (bound_ret < 0)
+		return bound_ret;
+
+	if (timeout_ms == 0)
+		return 0;
+
+	/* Verify the device actually ends up unbound (driver symlink removed). */
+	unbound_ok = igt_wait((bound_ret =
+			       igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound))) == 0,
+			      timeout_ms, 1);
+	if (!unbound_ok)
+		return -EBUSY;
+
+	if (bound_ret < 0)
+		return bound_ret;
+
+	return 0;
+}
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 92b9cc392..a66eeebf2 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -6,8 +6,9 @@
 #ifndef __IGT_PCI_H__
 #define __IGT_PCI_H__
 
-#include <stdint.h>
 #include <endian.h>
+#include <stddef.h>
+#include <stdint.h>
 
 /* forward declaration */
 struct pci_device;
@@ -24,5 +25,15 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int igt_pci_device_unbind(const char *pci_slot);
+int igt_pci_driver_bind(const char *driver, const char *pci_slot);
+int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
+int igt_pci_driver_unbind_all(const char *driver);
+int igt_pci_set_driver_override(const char *pci_slot, const char *driver);
+int igt_pci_probe_drivers(const char *pci_slot);
+int igt_pci_get_bound_driver_name(const char *pci_slot, char *driver, size_t driver_len);
+int igt_pci_bind_driver_override(const char *pci_slot, const char *driver,
+				 unsigned int timeout_ms);
+int igt_pci_unbind_driver_override(const char *pci_slot, unsigned int timeout_ms);
 
 #endif
-- 
2.43.0

