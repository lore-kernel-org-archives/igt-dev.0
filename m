Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC012C531CB
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 09:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2DE10F054;
	Thu, 23 Jul 2026 09:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK8xjWLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999DA10F054
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784800634; x=1816336634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a7tSSOLXnSBp4l8ARyk/iCtHbwnC0Noav2U6nOhneFI=;
 b=JK8xjWLl3XuJ5nENi9WGquob1jTNY9zhdyW/5l6pDMAJMFQGoLgX8EGP
 18U3GCt4fsHW6eV7VsyQoOYkfoDfevr5cwejvPgrJu+wMny7qBWalLJvy
 /Qd2lEL6WZ25wSCupCtm7JBEUDrNNRrzvo5E//l+znquoKJJQ85mq/u6T
 yW3phAysFuDfe9lvdrUHhhQcllRq6kCbEtIE6vyG9Y64hySA3WJhMkH6U
 dmXgsdItRvCvSDCJqs1ysMtDfTOXszoR7/+46SyUyIubZqURoTGhr/nQJ
 loRTvudKGuOukCyNLS3qiLFFwUe/2435oNL0xDAkbIsguw1gWADhJX1RZ w==;
X-CSE-ConnectionGUID: R6v6chZFRCGFLJwH8sEw9Q==
X-CSE-MsgGUID: u9UhywAYRCKIGG8T6qjc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96826191"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96826191"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:57:14 -0700
X-CSE-ConnectionGUID: Mre/Mn0WQM6zD2CjvTzhng==
X-CSE-MsgGUID: MoPPBPG4TR6jSddGTPxe+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="254016160"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:57:13 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	janusz.krzysztofik@intel.com
Subject: [PATCH 1/2] lib/igt_device: Extract helper setting device filter from
 fd
Date: Thu, 23 Jul 2026 11:57:00 +0200
Message-ID: <20260723095701.528790-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Helper sets device filter to the device corresponding to DRM device file
descriptor. Move the implementation from core_hotunplug test into the
library, so it can be reused in other tests.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_device.c       | 22 ++++++++++++++++++++++
 lib/igt_device.h       |  1 +
 tests/core_hotunplug.c | 18 ++----------------
 3 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c617a98bc..b7227dc91 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -31,6 +31,7 @@
 #endif
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_device_scan.h"
 #include "igt_sysfs.h"
 #include "igt_pci.h"
 
@@ -351,3 +352,24 @@ igt_device_get_pci_upstream_port(int fd)
 
 	return NULL;
 }
+
+/**
+ * igt_device_set_filter_from_fd:
+ * @fd: DRM device file descriptor
+ *
+ * Set device filter to the device corresponding to @fd.
+ */
+void igt_device_set_filter_from_fd(int fd)
+{
+	const char *filter_type = "sys:";
+	char filter[strlen(filter_type) + PATH_MAX + 1];
+	char *dst = stpcpy(filter, filter_type);
+	char path[PATH_MAX + 1];
+
+	igt_assert(igt_sysfs_path(fd, path, PATH_MAX));
+	igt_ignore_warn(strncat(path, "/device", PATH_MAX - strlen(path)));
+	igt_assert(realpath(path, dst));
+
+	igt_device_filter_free_all();
+	igt_assert_eq(igt_device_filter_add(filter), 1);
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index 781a72235..3ad08d3ee 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -38,4 +38,5 @@ struct pci_device *igt_device_get_pci_root_port(int fd);
 struct pci_device *igt_device_get_pci_upstream_port(int fd);
 
 void igt_device_get_pci_slot_name(int fd, char *pci_slot_name);
+void igt_device_set_filter_from_fd(int fd);
 #endif /* __IGT_DEVICE_H__ */
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..c6e9d4854 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -35,6 +35,7 @@
 #include "i915/gem_create.h"
 #include "i915/perf.h"
 #include "igt.h"
+#include "igt_device.h"
 #include "igt_device_scan.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
@@ -550,21 +551,6 @@ static void post_healthcheck(struct hotunplug *priv)
 	cleanup(priv);
 }
 
-static void set_filter_from_device(int fd)
-{
-	const char *filter_type = "sys:";
-	char filter[strlen(filter_type) + PATH_MAX + 1];
-	char *dst = stpcpy(filter, filter_type);
-	char path[PATH_MAX + 1];
-
-	igt_assert(igt_sysfs_path(fd, path, PATH_MAX));
-	igt_ignore_warn(strncat(path, "/device", PATH_MAX - strlen(path)));
-	igt_assert(realpath(path, dst));
-
-	igt_device_filter_free_all();
-	igt_assert_eq(igt_device_filter_add(filter), 1);
-}
-
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -713,7 +699,7 @@ int igt_main()
 		}
 
 		/* Make sure subtests always reopen the same device */
-		set_filter_from_device(fd_drm);
+		igt_device_set_filter_from_fd(fd_drm);
 
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
-- 
2.43.0

