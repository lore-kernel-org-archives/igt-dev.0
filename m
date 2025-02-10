Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8F7C0219E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68810E5E9;
	Mon, 10 Feb 2025 18:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf3OgVM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9AB10E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212830; x=1770748830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lPswyt+LoxnFOR2nRt+HA2fDnTaRgWCI0hVK1W2qcoc=;
 b=Rf3OgVM/+jJEMAO7aPmqf4LsWoQJjsrFpakUZYx7AYw09vdBQquisi0l
 tn0k+j1RczZpMDBOrmyVBUp9ySLKtf7ShtXBGoqtaxUToQevIjWlVQhNp
 MhiABIySI/3kO8+1EuaY2M2jaZmIiB38qxlk9KHIaBhbFLlGvZps2M6Xn
 mcnG3qkGQKuSQjP8JEOR2Ai4xCpAJzhA4WXgJSwmfoaIezvIXXLXCJ+OM
 vmwfhW78pgrgZQ3xI4QaAn28rHpwyt3x4ARU+h9FJt6gOsutr/WTspgq5
 hBkObkRpq+m2r8+JBcwyncbbmQ++/wfAKyGKAaF8kmxudTY17VTK+F1hS g==;
X-CSE-ConnectionGUID: FZJq5TeARxiynuw8h1OSSw==
X-CSE-MsgGUID: DBy1v5joQs6Z41JRRsL09Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39497468"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39497468"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:40:30 -0800
X-CSE-ConnectionGUID: LflQu5pzTPGmlrLqpfC7+A==
X-CSE-MsgGUID: 2M6rsMtdS1OkOxoWv/sHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112229419"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:40:29 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t 1/6] tests/intel/kms_mst_helper: add helper for
 MST-related functions
Date: Tue, 11 Feb 2025 00:26:01 +0530
Message-Id: <20250210185606.1327892-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210185606.1327892-1-kunal1.joshi@intel.com>
References: <20250210185606.1327892-1-kunal1.joshi@intel.com>
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

Add helper to centralize commonly used MST-related logic.
igt_find_all_mst_output_in_topology() enumerates MST outputs
that share the same root connector id.

v2: fix docs (Ankit)
    change return type to int (Ankit)
    split patch (Ankit)

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_mst_helper.c | 49 ++++++++++++++++++++++++++++++++++++
 tests/intel/kms_mst_helper.h | 15 +++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 tests/intel/kms_mst_helper.c
 create mode 100644 tests/intel/kms_mst_helper.h

diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
new file mode 100644
index 000000000..fb5aaab77
--- /dev/null
+++ b/tests/intel/kms_mst_helper.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "kms_mst_helper.h"
+
+/*
+ * @drm_fd: DRM file descriptor
+ * @display: pointer to #igt_display_t structure
+ * @output: target output
+ * @mst_outputs: filled with mst output of same toplogy as @output
+ * @num_mst_outputs: filled with count of mst outputs found in topology
+ *
+ * Iterates over all connected outputs and adds each DP MST
+ * output that shares the same MST connector ID as @output
+ * into @mst_outputs.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+					 igt_output_t *output,
+					 igt_output_t *mst_outputs[],
+					 int *num_mst_outputs)
+{
+	int output_root_id, root_id;
+	igt_output_t *connector_output;
+
+	if (!igt_check_output_is_dp_mst(output))
+		return -1;
+
+	output_root_id = igt_get_dp_mst_connector_id(output);
+	if (output_root_id == -EINVAL)
+		return -1;
+
+	/*
+	 * If output is MST, check all other connected output which shares
+	 * same path and fill mst_outputs and num_mst_outputs
+	 */
+	for_each_connected_output(display, connector_output) {
+		if (!igt_check_output_is_dp_mst(connector_output))
+			continue;
+
+		root_id = igt_get_dp_mst_connector_id(connector_output);
+		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
+			mst_outputs[(*num_mst_outputs)++] = connector_output;
+	}
+	return 0;
+}
diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
new file mode 100644
index 000000000..637ca696e
--- /dev/null
+++ b/tests/intel/kms_mst_helper.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef KMS_MST_HELPER_H
+#define KMS_MST_HELPER_H
+
+#include "igt.h"
+
+int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
+					 igt_output_t *output,
+					 igt_output_t *mst_outputs[],
+					 int *num_mst_outputs);
+#endif
-- 
2.25.1

