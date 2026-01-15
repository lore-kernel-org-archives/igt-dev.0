Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFDED44C42
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 13:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EFD10E752;
	Thu, 15 Jan 2026 13:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BinLHGvD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AE510E752
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768483114; x=1800019114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8OgWnOdswRnAD30mW1vB8V8qFY9nn1ay7oB/pgnW8E=;
 b=BinLHGvD7v59Et92WS3YkTsm3T5YHbpEE8qJO6QtD/E1UAghyII0d5I+
 KoPNd08x02W+XeJT8jBA2rZdnFJ/UWiRfWfjPmmQ8xEb/nAAyWBBm2Vew
 G0P2a0tffBWSADho7GK82eFrkfJWRNsdb5iMD1EhNdxGS2XveIIjsaDV6
 IQOEFSvScIoTu0YgAYMDV7OjLJtr84KIkN8ONR4Xm62JiiQg+DsDWEKFN
 Ne0z03t34P2lTdMw6Sn+8RKXkCmQJSNZnyPkpc7Gwav6OaNaAs/Wfhf+K
 4q9XEK/oocB0fpzdLYSUzy/YR4WbjNhXYXFdlzI6RiLNfRNCtzMwKEuP7 g==;
X-CSE-ConnectionGUID: lwKtKcsGQZqiBynkU++avA==
X-CSE-MsgGUID: Kvaj1aYNRyO8oGQ/QqFGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69766905"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="69766905"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:33 -0800
X-CSE-ConnectionGUID: tSDGJu7/TdGq8ywluDVZmg==
X-CSE-MsgGUID: dcntuE8YRQu2yHagpqpFkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205230186"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.143])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:31 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_pci: Add generic PCI driver override and
 bind/unbind helpers
Date: Thu, 15 Jan 2026 14:18:07 +0100
Message-ID: <20260115131812.256678-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
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

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_pci.c | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h |   8 ++
 2 files changed, 236 insertions(+)

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
index 61aaf939d..d4236ec5b 100644
--- a/lib/igt_pci.c
+++ b/lib/igt_pci.c
@@ -3,9 +3,15 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#include <ctype.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
 #include <pciaccess.h>
 #include "igt_core.h"
 #include "igt_pci.h"
+#include "igt_sysfs.h"
 
 static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
 				  int start_offset)
@@ -51,3 +57,225 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
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
+ * igt_pci_bind_driver_override:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ * @driver: PCI driver name to bind (must not be NULL or empty)
+ *
+ * Bind @pci_slot to @driver using the driver_override mechanism.
+ *
+ * This helper sets driver_override and immediately triggers driver
+ * reprobe so that the device is bound to the requested driver.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int igt_pci_bind_driver_override(const char *pci_slot, const char *driver)
+{
+	int ret;
+
+	if (!driver || !driver[0])
+		return -EINVAL;
+
+	ret = igt_pci_set_driver_override(pci_slot, driver);
+	if (ret)
+		return ret;
+
+	return igt_pci_probe_drivers(pci_slot);
+}
+
+/**
+ * igt_pci_unbind_driver_override:
+ * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
+ *
+ * Unbind @pci_slot from its currently bound driver (if any) and clear
+ * any driver_override setting.
+ *
+ * This is the inverse operation of igt_pci_bind_driver_override().
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int igt_pci_unbind_driver_override(const char *pci_slot)
+{
+	int ret;
+
+	ret = igt_pci_device_unbind(pci_slot);
+	if (ret)
+		return ret;
+
+	return igt_pci_set_driver_override(pci_slot, "");
+}
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 92b9cc392..76ccfa383 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -24,5 +24,13 @@ enum pci_cap_id {
 #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
 
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+int igt_pci_device_unbind(const char *pci_slot);
+int igt_pci_driver_bind(const char *driver, const char *pci_slot);
+int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
+int igt_pci_driver_unbind_all(const char *driver);
+int igt_pci_set_driver_override(const char *pci_slot, const char *driver);
+int igt_pci_probe_drivers(const char *pci_slot);
+int igt_pci_bind_driver_override(const char *pci_slot, const char *driver);
+int igt_pci_unbind_driver_override(const char *pci_slot);
 
 #endif
-- 
2.43.0

