Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2179D6B6CE
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 19:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A74110E7F8;
	Wed, 30 Oct 2024 19:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN1czEc/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B210E7F8
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730317012; x=1761853012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HFtx9JvdIFl9QMOQIot1M2tlR3yTQ7fHAgP1FWb9KUE=;
 b=hN1czEc/1R2vQQWx1dSmwrn1Q48XxOiwoV9tmrItauzQoNZqQW0FkZnF
 /bypNfBmOoCSehn9f0WhncmgS2C62ZtZEklaSDHlFjFqoQXy4jzmpMqmU
 0xnOaagK2ORiwTbfRXLW5x76HY/oNt0GH7sXf4dKv77JeaC1YM7Yk4J/H
 cG6mgl40X/DthhBxiKxvZ4yo1Y9mgfyQgF+/K+v+a2ibIq7Bdmd1B90ct
 Gdr2DHc7BW03KatiTucsnDFEuXeG0jVcButzMIuSPRRn9mpcKJepZ0VrX
 QPfvOgMQP6yik/o3+9yMsA61Cy/6M0feP9aW6AClrZbKKBC+zBQzdZXU9 g==;
X-CSE-ConnectionGUID: lbucHFU2SF2Q/DRx3TJjCA==
X-CSE-MsgGUID: AThVrl3YQjKF9tgBl/wjwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47499962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47499962"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:36:52 -0700
X-CSE-ConnectionGUID: vN1h91QLSYmLDbFkX/4LZA==
X-CSE-MsgGUID: Vz0xI28QTOKlYM+h+Jdisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82578439"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 12:36:49 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Define resource types
 and provisioned range structure
Date: Wed, 30 Oct 2024 20:36:26 +0100
Message-Id: <20241030193629.1238637-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
References: <20241030193629.1238637-1-marcin.bernatowicz@linux.intel.com>
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

Add shared resource enumeration, provisioned range structure definition,
and provide a function to convert shared resource enums to their string
representation. These types will be used in a subsequent patch to read
VF provisioned resources from the debug filesystem.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/meson.build                |  1 +
 lib/xe/xe_sriov_provisioning.c | 33 +++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 45 ++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 lib/xe/xe_sriov_provisioning.c
 create mode 100644 lib/xe/xe_sriov_provisioning.h

diff --git a/lib/meson.build b/lib/meson.build
index 3d5d68b75..3d459c7a3 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -117,6 +117,7 @@ lib_sources = [
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_sriov_debugfs.c',
+	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
 ]
 
diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
new file mode 100644
index 000000000..6a9ad411a
--- /dev/null
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include <stdlib.h>
+
+#include "xe/xe_sriov_provisioning.h"
+
+/**
+ * xe_sriov_shared_res_to_string:
+ * @key: The shared resource of type enum xe_sriov_shared_res
+ *
+ * Converts a shared resource enum to its corresponding string
+ * representation. It is useful for logging and debugging purposes.
+ *
+ * Return: A string representing the shared resource key.
+ */
+const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return "contexts";
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return "doorbells";
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return "ggtt";
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return "lmem";
+	}
+
+	return NULL;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
new file mode 100644
index 000000000..7b7b3db90
--- /dev/null
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_SRIOV_PROVISIONING_H__
+#define __XE_SRIOV_PROVISIONING_H__
+
+#include <stdint.h>
+
+/**
+ * enum xe_sriov_shared_res - Shared resource types
+ * @XE_SRIOV_SHARED_RES_CONTEXTS: Contexts
+ * @XE_SRIOV_SHARED_RES_DOORBELLS: Doorbells
+ * @XE_SRIOV_SHARED_RES_GGTT: GGTT (Global Graphics Translation Table)
+ * @XE_SRIOV_SHARED_RES_LMEM: Local memory
+ *
+ * This enumeration defines the types of shared resources
+ * that can be provisioned to Virtual Functions (VFs).
+ */
+enum xe_sriov_shared_res {
+	XE_SRIOV_SHARED_RES_CONTEXTS,
+	XE_SRIOV_SHARED_RES_DOORBELLS,
+	XE_SRIOV_SHARED_RES_GGTT,
+	XE_SRIOV_SHARED_RES_LMEM,
+};
+
+/**
+ * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
+ * @vf_id: The ID of the VF
+ * @start: The inclusive start of the provisioned range
+ * @end: The inclusive end of the provisioned range
+ *
+ * This structure represents a range of resources that have been provisioned
+ * for a specific VF, with both start and end values included in the range.
+ */
+struct xe_sriov_provisioned_range {
+	unsigned int vf_id;
+	uint64_t start;
+	uint64_t end;
+};
+
+const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
+
+#endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.31.1

