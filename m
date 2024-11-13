Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7497D41C04
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 12:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AB510E243;
	Wed, 13 Nov 2024 12:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lR12chB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011B910E6F5
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731499204; x=1763035204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A2sQYJcH+n6Bj9waqFjxkpTOweM5De3tLzTOmZwhcwU=;
 b=lR12chB1eTBS5QzgUKuk9HNs4pHwaYI8zG+W1xvgzT0+rUPdRxEMeYem
 Gkol/SOeX5WUAuBQIUGbHAcIjZyqSY7p511X0Q7xzXems7gTw+ZSVjajO
 uIO5C/HlapyQjDipW6EYp1HHvPaWFFqOTijYDM+QX/SYd9lxr3e6Tru3G
 GVQYLbXB64A9GgGXVmDCcWFPC1GpF363ghsq00iDIjtuiHVK+xfUG4E4L
 e2whl7DI2QyRUYrQbNW9IDFK3DMsIuSyVMfYEyH2gQrSiJpcPG4MG9KMj
 pA4gL4jrdaqAGYeMNVuXVtURyersuXyO8d2rdFazsPysbu4wJgQvZPNnH A==;
X-CSE-ConnectionGUID: cHiDCwCNRP+HlUgKwkahXQ==
X-CSE-MsgGUID: X9JYkosEQFC27WaGQQu0AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35097072"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35097072"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:00:03 -0800
X-CSE-ConnectionGUID: gKxjwGT+TjqLp5Qza0QLMA==
X-CSE-MsgGUID: Ipu9LkksS9u9LFLpibp+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92794315"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.140])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:00:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/5] lib/xe_sriov_debugfs: Add helper for opening
 attributes
Date: Wed, 13 Nov 2024 12:59:44 +0100
Message-Id: <20241113115948.287709-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241113115948.287709-1-marcin.bernatowicz@linux.intel.com>
References: <20241113115948.287709-1-marcin.bernatowicz@linux.intel.com>
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

From: Lukasz Laguna <lukasz.laguna@intel.com>

Helper allows to open SR-IOV debugfs attributes corresponding to
specified PF device, VF number and GT number.

v2: Remove unnecessary include (Kamil)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/meson.build           |  1 +
 lib/xe/xe_sriov_debugfs.c | 69 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h | 12 +++++++
 3 files changed, 82 insertions(+)
 create mode 100644 lib/xe/xe_sriov_debugfs.c
 create mode 100644 lib/xe/xe_sriov_debugfs.h

diff --git a/lib/meson.build b/lib/meson.build
index c3556a921..3d5d68b75 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -116,6 +116,7 @@ lib_sources = [
 	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
+	'xe/xe_sriov_debugfs.c',
 	'xe/xe_util.c',
 ]
 
diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
new file mode 100644
index 000000000..dc6ef9da3
--- /dev/null
+++ b/lib/xe/xe_sriov_debugfs.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+
+#include "drmtest.h"
+#include "igt_debugfs.h"
+#include "igt_sriov_device.h"
+#include "xe/xe_sriov_debugfs.h"
+#include "xe/xe_query.h"
+
+#define SRIOV_DEBUGFS_PATH_MAX 96
+
+static char *xe_sriov_pf_debugfs_path(int pf, unsigned int vf_num, unsigned int gt_num, char *path,
+				      int pathlen)
+{
+	char sriov_path[SRIOV_DEBUGFS_PATH_MAX];
+
+	if (!igt_debugfs_path(pf, path, pathlen))
+		return NULL;
+
+	if (vf_num)
+		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/vf%u/", gt_num, vf_num);
+	else
+		snprintf(sriov_path, SRIOV_DEBUGFS_PATH_MAX, "/gt%u/pf/", gt_num);
+
+	strncat(path, sriov_path, pathlen - strlen(path));
+
+	if (access(path, F_OK))
+		return NULL;
+
+	return path;
+}
+
+/**
+ * xe_sriov_pf_debugfs_attr_open:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @attr: debugfs attribute name
+ * @mode: mode bits as used by open()
+ *
+ * Opens SR-IOV debugfs attribute @attr for given PF device @pf, VF number @vf_num on GT @gt_num.
+ *
+ * Returns:
+ * File descriptor or -1 on failure.
+ */
+int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
+				  const char *attr, int mode)
+{
+	char path[PATH_MAX];
+	int debugfs;
+
+	igt_assert(igt_sriov_is_pf(pf) && is_xe_device(pf));
+	igt_assert(gt_num < xe_number_gt(pf));
+
+	if (!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path, sizeof(path)))
+		return -1;
+
+	strncat(path, attr, sizeof(path) - strlen(path));
+
+	debugfs = open(path, mode);
+	igt_debug_on(debugfs < 0);
+
+	return debugfs;
+}
diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
new file mode 100644
index 000000000..9f4ba8f43
--- /dev/null
+++ b/lib/xe/xe_sriov_debugfs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_SRIOV_DEBUGFS_H__
+#define __XE_SRIOV_DEBUGFS_H__
+
+int xe_sriov_pf_debugfs_attr_open(int pf, unsigned int vf_num, unsigned int gt_num,
+				  const char *attr, int mode);
+
+#endif /* __XE_SRIOV_DEBUGFS_H__ */
-- 
2.31.1

