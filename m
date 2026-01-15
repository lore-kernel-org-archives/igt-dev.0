Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F08BD44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 13:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5A010E752;
	Thu, 15 Jan 2026 13:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkyx0VUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B200610E756
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768483123; x=1800019123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IE6JisX0fRpbtefTd+VeZZ+wE0u+NJ4U5y+NhgPMnpk=;
 b=nkyx0VUQ3NGmeg5x6v22UR39UrGg8cDJpwalrouv30+qhWCRhICBCfgF
 7JXuBeXQFzzWrMX5HQfXJcs78NuzbMrSxLzwiB0a5m+fbt3wXDvFxp1ps
 5UV2wPnUbD9r+SeTmDDl3BXaNkaCSv93N8SlZIfhqzHkN86oUff4VFzD5
 k/VoNmqkOTlOTf+zuLFFj1ohWsMvDwA9ol4H1Oq46zt2/DN3l4SJr7yzn
 m9+ASKj61yfalJJ46sdQ5W0UaByYit32+yKSdazC4NVUV5nojlbAmzdMT
 3yw/PyOuBKSLC+R5HcuEsVichBPaYCPNlRNj3KuMQzO02tgVdY3c3hAm1 g==;
X-CSE-ConnectionGUID: utAK/laQSWmoW4BpV9sXmw==
X-CSE-MsgGUID: eBUeDyspRAmBmuAn7NxbQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80509812"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80509812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:43 -0800
X-CSE-ConnectionGUID: F5eTUwx5QJeNSWwTyHGOqw==
X-CSE-MsgGUID: 6rSmWZMITHiOepo+CAxhwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205364161"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.143])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:41 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/4] lib/igt_kmod: Fix PCI bind/unbind for module/driver
 name mismatch
Date: Thu, 15 Jan 2026 14:18:09 +0100
Message-ID: <20260115131812.256678-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
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

igt_kmod_bind() and igt_kmod_unbind() assumed that the PCI
driver name was identical to the module name, which is not true
for drivers such as xe_vfio_pci (module) vs xe-vfio-pci (driver).

Resolve the registered PCI driver name via
/sys/module/<module>/drivers/pci:* and forward bind/unbind operations
to the generic PCI driver helpers.

Mark these helpers as deprecated, as bind/unbind are fundamentally
driver-level operations. New code should prefer the igt_pci_driver_*
APIs, while these wrappers remain for backwards compatibility and
“unbind before module unload” workflows.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/igt_kmod.c | 90 ++++++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d1d7a3840..008752f29 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -44,6 +44,7 @@
 #include "igt_hook.h"
 #include "igt_kmod.h"
 #include "igt_ktap.h"
+#include "igt_pci.h"
 #include "igt_sysfs.h"
 #include "igt_taints.h"
 
@@ -598,43 +599,58 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	return 0;
 }
 
+static char *kmod_pci_driver_from_module_alloc(const char *mod_name)
+{
+	char dirpath[PATH_MAX];
+	struct dirent *de;
+	DIR *d;
+
+	snprintf(dirpath, sizeof(dirpath), "/sys/module/%s/drivers", mod_name);
+	d = opendir(dirpath);
+	if (!d)
+		return NULL;
+
+	while ((de = readdir(d))) {
+		if (!strncmp(de->d_name, "pci:", 4)) {
+			char *drv = strdup(de->d_name + 4);
+
+			closedir(d);
+			return drv;
+		}
+	}
+
+	closedir(d);
+	return NULL;
+}
+
 /**
  * igt_kmod_unbind: Unbind driver from devices. Currently supports only PCI bus
  * @mod_name: name of the module to unbind
  * @pci_device: if provided, unbind only this device, otherwise unbind all devices
+ *
+ * Deprecated: bind/unbind is a driver operation. Prefer using:
+ *   - igt_pci_driver_unbind()/igt_pci_driver_unbind_all()
+ *   - igt_pci_device_unbind()
+ *
+ * This helper remains for backwards compatibility and for “unbind before
+ * module unload” workflows.
  */
 int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 {
 	struct igt_hook *igt_hook = NULL;
-	char path[PATH_MAX];
-	struct dirent *de;
-	int dirlen;
-	DIR *dir;
-
-	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
-			  mod_name, mod_name);
-	igt_assert(dirlen < sizeof(path));
-
-	dir = opendir(path);
-
-	/* Module not loaded, nothing to unbind */
-	if (!dir)
-		return 0;
-
-	while ((de = readdir(dir))) {
-		bool ret;
-
-		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
-			continue;
+	char *driver;
+	int ret;
 
-		if (pci_device && strcmp(pci_device, de->d_name) != 0)
-			continue;
+	driver = kmod_pci_driver_from_module_alloc(mod_name);
+	if (!driver)
+		return 0; /* module not loaded / no pci driver */
 
-		ret = igt_sysfs_set(dirfd(dir), "unbind", de->d_name);
-		igt_assert(ret);
-	}
+	if (pci_device)
+		ret = igt_pci_driver_unbind(driver, pci_device);
+	else
+		ret = igt_pci_driver_unbind_all(driver);
 
-	closedir(dir);
+	free(driver);
 
 	igt_hook = igt_core_get_igt_hook();
 	igt_hook_event_notify(igt_hook, &(struct igt_hook_evt){
@@ -642,7 +658,7 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
 		.target_name = mod_name,
 	});
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -651,25 +667,21 @@ int igt_kmod_unbind(const char *mod_name, const char *pci_device)
  * @pci_device: device to bind
  *
  * Module should already be loaded
+ *
+ * Deprecated: prefer igt_pci_driver_bind().
  */
 int igt_kmod_bind(const char *mod_name, const char *pci_device)
 {
-	char path[PATH_MAX];
-	int dirlen, dirfd;
+	char *driver;
 	int ret;
 
-	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
-			  mod_name, mod_name);
-	igt_assert(dirlen < sizeof(path));
-
-	dirfd = open(path, O_RDONLY | O_CLOEXEC);
-	if (dirfd < 0)
-		return dirfd;
-
-	ret = igt_sysfs_set(dirfd, "bind", pci_device);
+	driver = kmod_pci_driver_from_module_alloc(mod_name);
+	if (!driver)
+		return -ENOENT;
 
-	close(dirfd);
+	ret = igt_pci_driver_bind(driver, pci_device);
 
+	free(driver);
 	return ret;
 }
 
-- 
2.43.0

