Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98C5E9D411
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F410E6BE;
	Wed,  4 Feb 2026 16:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TR6erLLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8A10E6BE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222767; x=1801758767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ENbaAQfUXxVyLCVAzMFfDgGkRKZuguQmRn1LnkF0WSo=;
 b=TR6erLLx03ZO8D/LMhNG2r6LuoUHsM7DN8/s0LdEIfRpIt/wJGhj9l/u
 mk5Bpebu/5dqlfFXuznTzFtvEXvNhqIPCtd/B08e+617sI8dXVlL0tmc9
 amvGQAU/x0HZrgJCOZwAOIwPZmQANvfVzLVV5xTAteA5qxHyKlatN08Pi
 zaKekH4Eka0ELDk4k8aJMPqxxKQv9YRpI9vDmVapJnRFV3pdnwSaXH7lj
 h8J626Ge3vL3rhznefTWVt+DBDmj3aC4E8hBZ/nDhXMoaEqq8GnsmYnzC
 ZtuoG5KB70hqdL+2tJtGfyItqxVgDGqh0iHcr07vPUb0KQKrbu96GXSYs g==;
X-CSE-ConnectionGUID: b2FeRZuFTOy5yl+mE4vEAQ==
X-CSE-MsgGUID: bhfG4f/sT9yKGpemNtPMiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71472396"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71472396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:47 -0800
X-CSE-ConnectionGUID: oafHo1+cRMaQexh67VqqqQ==
X-CSE-MsgGUID: g9ZOcM2/SKS12y6KIKsRdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209315401"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:32:46 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v3 i-g-t 4/7] lib/igt_kmod: Fix PCI bind/unbind for
 module/driver name mismatch
Date: Wed,  4 Feb 2026 17:32:07 +0100
Message-ID: <20260204163217.121305-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
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

