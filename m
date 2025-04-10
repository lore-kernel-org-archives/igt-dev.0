Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39436C369A4
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 05:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E302010E361;
	Thu, 10 Apr 2025 05:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsBJ/yyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD87710E361
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 05:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263941; x=1775799941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ol+b3TeN/rsEST4PmzY93XokjLehboT9hfTyaln+WZc=;
 b=DsBJ/yyb6uYbxqJtTq2V+Hrsbl678p3j8FFoLMJOKyvRjXjfI6uba9H6
 bcriVrm28cm96auhpK1drPWkI1yTyutrIuE1EeVZ98k3szNIiDQEnEZXx
 q1EEZrTr/+OtpNdglTBydjKNizp+g+rLzIwd2KhGy2eKhrUw93n8MIq+v
 TtMP568UwWdaK9edswW709bhnUPkbcWLRG5M0Fe30w0NGz7ia7aGniPyQ
 i35qS+zxf3oKohEH40FYQtCmD1g+IaeqhXjhoaqs6k3f/EnQW/Jmx0W+9
 3qUXZV/v9meUUWhniaYR+nkU2GvzUFRFEfXK+cQ2eytTW1FF5iKIzoDGt w==;
X-CSE-ConnectionGUID: q4ERZBBHTTelNL2+Uq/44w==
X-CSE-MsgGUID: jHYZyaFxTIWUYFn8BXijzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44902877"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44902877"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:40 -0700
X-CSE-ConnectionGUID: gipyR8FWSSOv4sUvz+8S2A==
X-CSE-MsgGUID: uF3filBNQMSfhJX7bX9RQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133765971"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:39 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_configfs: Add library for configfs
Date: Thu, 10 Apr 2025 11:37:25 +0530
Message-ID: <20250410060727.1857299-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250410060727.1857299-1-riana.tauro@intel.com>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
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

Add library functions to open configfs and create
and remove configfs directories.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_configfs.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_configfs.h | 13 +++++++
 lib/meson.build    |  1 +
 3 files changed, 102 insertions(+)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h

diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
new file mode 100644
index 000000000..57d59f1c4
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <sys/mount.h>
+#include <sys/stat.h>
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+
+#include "igt_configfs.h"
+#include "igt_core.h"
+
+static const char *igt_configfs_mount(void)
+{
+	struct stat st;
+
+	if (stat("/sys/kernel/debug", &st) == 0)
+		return "/sys/kernel/config";
+
+	if (mount("none", "/sys/kernel/config", "configfs", 0, 0))
+		return NULL;
+
+	return "/sys/kernel/config";
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
+
+/**
+ * igt_configfs_create_directory: creates configfs group
+ * @fd: fd of configfs parent directory
+ * @name: name of the directory to create
+ *
+ * creates a directory under configfs parent directory
+ *
+ * Returns: 0 on success, -errno otherwise
+ */
+int igt_configfs_create_directory(int fd, const char *name)
+{
+	int ret;
+	int dirfd;
+
+	ret = mkdirat(fd, name, 0755);
+	if (ret)
+		return -errno;
+
+	dirfd = openat(fd, name, O_DIRECTORY);
+	if (dirfd < 0)
+		return -errno;
+
+	return dirfd;
+}
+
+/**
+ * igt_configfs_remove_directory: removes configfs group
+ * @fd: fd of configfs parent directory
+ * @name: name of directory to create
+ *
+ * removes directory under configfs parent directory
+ */
+void igt_configfs_remove_directory(int fd, const char *name)
+{
+	int ret = unlinkat(fd, name, AT_REMOVEDIR);
+
+	if (ret)
+		igt_warn("Unable to remove %s directory: %s\n", name, strerror(errno));
+}
diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
new file mode 100644
index 000000000..d839db49a
--- /dev/null
+++ b/lib/igt_configfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef IGT_CONFIGFS_H
+#define IGT_CONFIGFS_H
+
+int igt_configfs_open(const char *name);
+int igt_configfs_create_directory(int fd, const char *name);
+void igt_configfs_remove_directory(int fd, const char *name);
+
+#endif /* IGT_CONFIGFS_H */
diff --git a/lib/meson.build b/lib/meson.build
index d7bb72c57..f087947e7 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -19,6 +19,7 @@ lib_sources = [
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_facts.c',
+	'igt_configfs.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
 	'igt_device.c',
-- 
2.47.1

