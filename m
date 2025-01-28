Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C1AC02192
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 08:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B232710E5F3;
	Tue, 28 Jan 2025 08:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRzKr2+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4915B10E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 08:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738053055; x=1769589055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nofuJ48ovLVkG4dU3r+3IlKo+S8orFB2hLtAo4nPjUs=;
 b=MRzKr2+s/eYONYGHyDNiDY4DUj0ehcRhN2Kgb68cQItOcuQCl4bDKxM0
 jR0phetXddDdRWaXV/5l5sMjSKdVpKbCq1rCLje8dqoU5IZGP0ofcNSR1
 zVnORgBVOS6aJAYi1hO12jQ84qN7HzyT+smPz1gBGVYcfgC5CisBtLo4V
 kQCcM+ssQPUdL4psp/JsqFNEi9v7PMxOcKvSo6FHH828WFMX5aoE6eAls
 +ZCtpTU84OHnjrXTt8nSzIxkUn24tpKVxYESvsn3I9iCZ22v3W6pmu7u1
 1ozad24j134tVNGFLKtQ9I+AHnm6YTSzYzSDU5A/BZNqtvqaL+yxTB3MA w==;
X-CSE-ConnectionGUID: zbLNy3cdR0a52kYWVLzQ0g==
X-CSE-MsgGUID: CjExJpRaRreeWmIbhcgu5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49946219"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49946219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:30:55 -0800
X-CSE-ConnectionGUID: AMprd9qsToujtK8MniUvZw==
X-CSE-MsgGUID: wzNEhxQsR3WD0+ACGqTM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="108565999"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 00:30:53 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_device_scan: limit fetched device attributes
 from udev
Date: Tue, 28 Jan 2025 09:30:14 +0100
Message-Id: <20250128083014.27713-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tests don't need all attributes so default device scanning is now
limited to small list directly used in device filters. To be backward
compatible tools like lsgpu still may scan whole attribute list what
keeps this behavior intact.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 69 ++++++++++++++++++++++++++++++-------------
 lib/igt_device_scan.h |  1 +
 tools/lsgpu.c         |  2 +-
 3 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index c36b0efa90..15f6bf5728 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -22,6 +22,7 @@
  *
  */
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_device_scan.h"
 #include "igt_list.h"
@@ -206,6 +207,8 @@ enum dev_type {
 #define STR_INTEGRATED "integrated"
 #define STR_DISCRETE "discrete"
 
+static const char * const attrs[] = { "driver", "sriov_numvfs", "physfn" };
+
 static inline bool strequal(const char *a, const char *b)
 {
 	if (a == NULL || b == NULL)
@@ -548,24 +551,35 @@ static void get_props(struct udev_device *dev, struct igt_device *idev)
  * Function skips sysattrs from blacklist ht (acquiring some values can take
  * seconds).
  */
-static void get_attrs(struct udev_device *dev, struct igt_device *idev)
+static void get_attrs(struct udev_device *dev, struct igt_device *idev,
+		      bool limit_attrs)
 {
 	struct udev_list_entry *entry;
+	const char *value;
 
-	entry = udev_device_get_sysattr_list_entry(dev);
-	while (entry) {
-		const char *key = udev_list_entry_get_name(entry);
-		const char *value;
+	if (limit_attrs) {
+		for (int i = 0; i < ARRAY_SIZE(attrs); i++) {
+			value = udev_device_get_sysattr_value(dev, attrs[i]);
+			if (!value)
+				continue;
+			igt_device_add_attr(idev, attrs[i], value);
+			DBG("attr: %s, val: %s\n", attrs[i], value);
+		}
+	} else {
+		entry = udev_device_get_sysattr_list_entry(dev);
+		while (entry) {
+			const char *key = udev_list_entry_get_name(entry);
 
-		if (is_on_blacklist(key)) {
+			if (is_on_blacklist(key)) {
+				entry = udev_list_entry_get_next(entry);
+				continue;
+			}
+
+			value = udev_device_get_sysattr_value(dev, key);
+			igt_device_add_attr(idev, key, value);
 			entry = udev_list_entry_get_next(entry);
-			continue;
+			DBG("attr: %s, val: %s\n", key, value);
 		}
-
-		value = udev_device_get_sysattr_value(dev, key);
-		igt_device_add_attr(idev, key, value);
-		entry = udev_list_entry_get_next(entry);
-		DBG("attr: %s, val: %s\n", key, value);
 	}
 }
 
@@ -639,7 +653,8 @@ static char* strdup_nullsafe(const char* str)
  * Fills structure with most usable udev device variables, properties
  * and sysattrs.
  */
-static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
+static struct igt_device *igt_device_new_from_udev(struct udev_device *dev,
+						   bool limit_attrs)
 {
 	struct igt_device *idev = igt_device_new();
 
@@ -654,7 +669,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
 		idev->drm_render = strdup(idev->devnode);
 
 	get_props(dev, idev);
-	get_attrs(dev, idev);
+	get_attrs(dev, idev, limit_attrs);
 
 	if (is_pci_subsystem(idev)) {
 		uint16_t vendor, device;
@@ -868,7 +883,8 @@ static struct igt_device *igt_device_from_syspath(const char *syspath)
  */
 static void update_or_add_parent(struct udev *udev,
 				 struct udev_device *dev,
-				 struct igt_device *idev)
+				 struct igt_device *idev,
+				 bool limit_attrs)
 {
 	struct udev_device *parent_dev;
 	struct igt_device *parent_idev;
@@ -899,7 +915,7 @@ static void update_or_add_parent(struct udev *udev,
 		 * return fresh udev device.
 		 */
 		parent_dev = udev_device_new_from_syspath(udev, syspath);
-		parent_idev = igt_device_new_from_udev(parent_dev);
+		parent_idev = igt_device_new_from_udev(parent_dev, limit_attrs);
 		udev_device_unref(parent_dev);
 
 		if (parent_idev)
@@ -1000,7 +1016,7 @@ static void index_pci_devices(void)
  * Function sorts all found devices to keep same order of bus devices
  * for providing predictable search.
  */
-static void scan_drm_devices(void)
+static void scan_drm_devices(bool limit_attrs)
 {
 	struct udev *udev;
 	struct udev_enumerate *enumerate;
@@ -1035,9 +1051,9 @@ static void scan_drm_devices(void)
 
 		path = udev_list_entry_get_name(dev_list_entry);
 		udev_dev = udev_device_new_from_syspath(udev, path);
-		idev = igt_device_new_from_udev(udev_dev);
+		idev = igt_device_new_from_udev(udev_dev, limit_attrs);
 		igt_list_add_tail(&idev->link, &igt_devs.all);
-		update_or_add_parent(udev, udev_dev, idev);
+		update_or_add_parent(udev, udev_dev, idev, limit_attrs);
 
 		udev_device_unref(udev_dev);
 	}
@@ -1092,17 +1108,28 @@ void igt_devices_free(void)
  *
  * Function scans udev in search of gpu devices.
  */
-void igt_devices_scan(void)
+
+static void __igt_devices_scan(bool limit_attrs)
 {
 	if (igt_devs.devs_scanned)
 		igt_devices_free();
 
 	prepare_scan();
-	scan_drm_devices();
+	scan_drm_devices(limit_attrs);
 
 	igt_devs.devs_scanned = true;
 }
 
+void igt_devices_scan(void)
+{
+	__igt_devices_scan(true);
+}
+
+void igt_devices_scan_all_attrs(void)
+{
+	__igt_devices_scan(false);
+}
+
 static inline void _pr_simple(const char *k, const char *v)
 {
 	printf("    %-16s: %s\n", k, v);
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index fa90134aa3..92741fe3c7 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -64,6 +64,7 @@ struct igt_device_card {
 };
 
 void igt_devices_scan(void);
+void igt_devices_scan_all_attrs(void);
 
 void igt_devices_print(const struct igt_devices_print_format *fmt);
 void igt_devices_print_vendors(void);
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index e482ca6b75..e683900833 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -362,7 +362,7 @@ int main(int argc, char *argv[])
 		printf("Notice: Using filter from .igtrc\n");
 	}
 
-	igt_devices_scan();
+	igt_devices_scan_all_attrs();
 
 	if (igt_device != NULL) {
 		struct igt_device_card card;
-- 
2.34.1

