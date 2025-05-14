Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC111C3ABDD
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 17:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6386910E6CB;
	Wed, 14 May 2025 17:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHIli9Kp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690710E6CB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747245139; x=1778781139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iERjQ3KXmPh549NlkRkeVzC80P6QLYQDeHr3aV0S7SI=;
 b=mHIli9KpOOlNKbxQGciWPkCm061vs6GfrWaB/bGxu2SRxHmBkDweHlp9
 UXfLHvQh1WxLIvLxEMLCviZC/hYq2fJLS5zz1d31hMjUqXhI3wA1Bzuan
 orQI92zP/uIXC068+Zj73Q42QW8Dbf+1kTodr7zZPf35+ZBYW5z8KiUs9
 ahUs56tH9i4YyBtI0jbu6XJ7d6caUv5hy6HbSLvL4J0NTVdvtMvzkkFxh
 f1XijnfmZ3dozLN+hVOyWH/5qkiINwN1WHrpAqe4Qog6KUzrye4MockEu
 UM+Ra/apqy916/BAkFKJJ5z+j6eZn7bN8qfBJaNkS7WgLzs1YXJpD652f w==;
X-CSE-ConnectionGUID: Vyd9YbxeQHCTsuc6r7N5Pw==
X-CSE-MsgGUID: rA3a8JSKS++ABlF95Jji1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49025955"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49025955"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:19 -0700
X-CSE-ConnectionGUID: xuiZZq9xQxuo/RQUJlfeDw==
X-CSE-MsgGUID: 67owlmk0TUWtd0lLeMwquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142998426"
Received: from amiron-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.81.154])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 10:52:16 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
Subject: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to recursively
 read all files in a directory
Date: Wed, 14 May 2025 19:51:34 +0200
Message-ID: <20250514175140.115033-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514175140.115033-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
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

Introduces igt_dir_explorer_read_and_discard_all(), a function that
performs a recursive scan of all files within a directory. Each file is
read, and its content is discarded.

This functionality is utilized in the following tests:
- core_debugfs
- core_debugfs_display_on_off
- core_sysfs

This addition enhances the ability to efficiently handle directory
traversal and file processing in tests.

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_dir_explorer.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dir_explorer.h | 10 ++++++
 lib/meson.build        |  1 +
 3 files changed, 83 insertions(+)
 create mode 100644 lib/igt_dir_explorer.c
 create mode 100644 lib/igt_dir_explorer.h

diff --git a/lib/igt_dir_explorer.c b/lib/igt_dir_explorer.c
new file mode 100644
index 000000000..d47e08535
--- /dev/null
+++ b/lib/igt_dir_explorer.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_dir_explorer.h"
+
+void igt_dir_explorer_read_and_discard_all(int path_fd, int indent)
+{
+	struct dirent *dirent;
+	DIR *dir;
+	char tabs[8];
+	int i;
+
+	igt_assert(indent < sizeof(tabs) - 1);
+
+	for (i = 0; i < indent; i++)
+		tabs[i] = '\t';
+	tabs[i] = '\0';
+
+	dir = fdopendir(path_fd);
+	if (!dir)
+		return;
+
+	while ((dirent = readdir(dir))) {
+		if (!strcmp(dirent->d_name, ".") ||
+		    !strcmp(dirent->d_name, ".."))
+			continue;
+
+		if (dirent->d_type == DT_DIR) {
+			int sub_fd;
+
+			sub_fd = openat(path_fd, dirent->d_name,
+					O_RDONLY | O_DIRECTORY);
+			if (sub_fd < 0)
+				continue;
+
+			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
+			igt_dir_explorer_read_and_discard_all(sub_fd, indent + 1);
+			close(sub_fd);
+		} else if (dirent->d_type == DT_REG) {
+			char buf[512];
+			int sub_fd;
+			ssize_t ret;
+
+			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
+			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
+
+			sub_fd = openat(path_fd, dirent->d_name, O_RDONLY | O_NONBLOCK);
+			if (sub_fd == -1) {
+				igt_debug("%sCould not open file \"%s\" with error: %m\n",
+					  tabs, dirent->d_name);
+				continue;
+			}
+
+			do {
+				ret = read(sub_fd, buf, sizeof(buf));
+			} while (ret == sizeof(buf));
+
+			if (ret == -1)
+				igt_debug("%sCould not read file \"%s\" with error: %m\n",
+					  tabs, dirent->d_name);
+
+			close(sub_fd);
+		}
+	}
+	closedir(dir);
+}
diff --git a/lib/igt_dir_explorer.h b/lib/igt_dir_explorer.h
new file mode 100644
index 000000000..b767928a5
--- /dev/null
+++ b/lib/igt_dir_explorer.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef IGT_DIR_EXPLORER_H
+#define IGT_DIR_EXPLORER_H
+
+void igt_dir_explorer_read_and_discard_all(int path_fd, int indent);
+
+#endif /* IGT_DIR_EXPLORER_H */
diff --git a/lib/meson.build b/lib/meson.build
index b58976a43..f98265100 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -90,6 +90,7 @@ lib_sources = [
 	'igt_kms.c',
 	'igt_fb.c',
 	'igt_core.c',
+	'igt_dir_explorer.c',
 	'igt_draw.c',
 	'igt_list.c',
 	'igt_map.c',
-- 
2.43.0

