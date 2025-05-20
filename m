Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB9C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A282B10E33D;
	Tue, 20 May 2025 06:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKpAFkGo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C2110E128
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747722331; x=1779258331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gs08CInT+7Xo5w0XCVZYt8gfN+JLInh61ASDu6BL7XQ=;
 b=UKpAFkGoTVeVvillw+4h5meS77eI5g01NOG1JNURpn+3l/AQw8Y68qxn
 Bd6P/qWYYDCZpNiymgGoM3RKnOJwd2GaNNWYGaWysR3eczFr+QXV+02hz
 jB5hlhhFGPQnI4gn1XojTL9W2op70GJ40zZbXyGqNEwiUtTWSyLbKasZD
 BpVtVZlDDWMSrtp16FFUL+dd/DXkRJ5+oUUfhKT7b0K4M4Ex8rajuMwIJ
 ujlstmLTu5jBoUvH1Zlj7dfFIbypEASAYdm1epq9KIV6gfZGxmMv8n5os
 EgsojJm1F2eyvhzgO6jVTDZqPwFBQEJnHpUwFNay7y87INujU88IYmHnb Q==;
X-CSE-ConnectionGUID: 4955W4jNQ0C9qi3ksUqA0A==
X-CSE-MsgGUID: d3QCjTuVSj+Yg44u7u2cqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52272711"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52272711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:30 -0700
X-CSE-ConnectionGUID: 2QmzfJAFSUCiAagii35nKA==
X-CSE-MsgGUID: 1vOUuC9/Rze7XyJdQxjsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170609591"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:28 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t v4 2/5] lib/igt_configfs: Add helper to mount configfs
Date: Tue, 20 May 2025 12:19:07 +0530
Message-ID: <20250520064910.663022-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520064910.663022-1-riana.tauro@intel.com>
References: <20250520064910.663022-1-riana.tauro@intel.com>
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

v2: reorder headers
    do not use asserts in libs (Kamil)
    use O_DIRECTORY (Aravind)

Co-developed-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Jim Shargo <jshargo@chromium.org>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt.h          |  1 +
 lib/igt_configfs.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_configfs.h | 15 ++++++++
 lib/meson.build    |  1 +
 4 files changed, 103 insertions(+)
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
index 000000000..e0cba92a1
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Google LLC.
+ * Copyright © 2023 Collabora, Ltd.
+ * Copyright © 2024 Red Hat, Inc.
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <sys/mount.h>
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
+	if (!configfs_path) {
+		igt_debug("configfs not mounted, errno=%d\n", errno);
+		return -1;
+	}
+
+	snprintf(path, sizeof(path), "%s/%s", configfs_path, name);
+
+	return open(path, O_DIRECTORY | O_RDONLY);
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
index b58976a43..4a9213375 100644
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

