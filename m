Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C291C369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 09:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2D510E2C1;
	Tue, 22 Apr 2025 09:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtrqUj1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6FD10E554
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745314416; x=1776850416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aE2Qy6rHTFVeEu10l2e3vluX1UFqm+ubcOsr1zy3xbA=;
 b=gtrqUj1AGskev5QJHtgYh1tg2j8mIp2vZp78lNO+GkFheOomeO1/8FA+
 8P7jJorlPNyMeQFD33WegD9hnKLIqBvd2XTZOBjNNts/x52ZPLywIfN/9
 ++8wBep4808M+EZDkSp3preWPyJKCZmPsJEGt4GeWIbLBKHBhk3121j8R
 C7TR6gKnZPaMD+JZKkVIdVRS44kkEG4AGnVuB+sSU4vHsEUbt/pRlXIsY
 olHEA69gNH5k5LIJyFKob0WDg4fHpanVA3Pl70ZbNvNyPXZmzvQmuqFOJ
 GG9Y/K1KY7NYCdhbW+eQWi+mZVV+1I2rdqESCZV/MUdvzJeJDOf0zL15f w==;
X-CSE-ConnectionGUID: Jv/iM8HVSBO5ebj4ILsL3g==
X-CSE-MsgGUID: xW35DnkkRJyQrhUQ2cgV7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58232846"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58232846"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:34 -0700
X-CSE-ConnectionGUID: YTWFEwHTRU2RBzvXoTS+1w==
X-CSE-MsgGUID: DdS7HtERQGS4JI30qRP0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131874797"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
Subject: [PATCH i-g-t 2/5] lib/igt_configfs: Add helper to mount configfs
Date: Tue, 22 Apr 2025 15:25:58 +0530
Message-ID: <20250422095602.55041-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250422095602.55041-1-riana.tauro@intel.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
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

From: José Expósito <jose.exposito89@gmail.com>

Add a new helper function to mount and open configfs

Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt.h          |  1 +
 lib/igt_configfs.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_configfs.h | 15 +++++++++
 lib/meson.build    |  1 +
 4 files changed, 99 insertions(+)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h

diff --git a/lib/igt.h b/lib/igt.h
index 58c39e098..173ca70bf 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -27,6 +27,7 @@
 #include "drmtest.h"
 #include "i915_3d.h"
 #include "igt_aux.h"
+#include "igt_configfs.h"
 #include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_draw.h"
diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
new file mode 100644
index 000000000..6b202b76f
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Google LLC.
+ * Copyright © 2023 Collabora, Ltd.
+ * Copyright © 2024 Red Hat, Inc.
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <sys/mount.h>
+#include <fcntl.h>
+#include <limits.h>
+
+#include "igt_aux.h"
+#include "igt_configfs.h"
+
+/**
+ * SECTION:igt_configfs
+ * @short_description: Support code for configfs features
+ * @title: configfs
+ * @include: igt_configfs.h
+ *
+ * This library provides helpers to access configfs features.
+ */
+
+/*
+ * General configfs helpers
+ */
+
+static const char *__igt_configfs_mount(void)
+{
+	if (igt_is_mountpoint("/sys/kernel/config"))
+		return "/sys/kernel/config";
+
+	if (igt_is_mountpoint("/config"))
+		return "/config";
+
+	if (mount("config", "/sys/kernel/config", "configfs", 0, 0))
+		return NULL;
+
+	return "/sys/kernel/config";
+}
+
+/**
+ * igt_configfs_mount:
+ *
+ * This attempts to locate where configfs is mounted on the filesystem,
+ * and if not found, will then try to mount configfs at /sys/kernel/config.
+ *
+ * Returns:
+ * The path to the configfs mount point (e.g. /sys/kernel/config)
+ */
+const char *igt_configfs_mount(void)
+{
+	static const char *path;
+
+	if (!path)
+		path = __igt_configfs_mount();
+
+	return path;
+}
+
+/**
+ * igt_configfs_open: open configfs path
+ * @name: name of the configfs directory
+ *
+ * Opens the configfs directory corresponding to the name
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_configfs_open(const char *name)
+{
+	char path[PATH_MAX];
+	const char *configfs_path;
+
+	configfs_path = igt_configfs_mount();
+	igt_assert(configfs_path);
+
+	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
+
+	return open(path, O_RDONLY);
+}
diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
new file mode 100644
index 000000000..91f95659b
--- /dev/null
+++ b/lib/igt_configfs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Google LLC.
+ * Copyright © 2023 Collabora, Ltd.
+ * Copyright © 2024 Red Hat, Inc.
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __IGT_CONFIGFS_H__
+#define __IGT_CONFIGFS_H__
+
+const char *igt_configfs_mount(void);
+int igt_configfs_open(const char *name);
+
+#endif /* __IGT_CONFIGFS_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 8517cd540..59072d8ce 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -18,6 +18,7 @@ lib_sources = [
 	'i915/i915_crc.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_configfs.c',
 	'igt_facts.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
-- 
2.47.1

