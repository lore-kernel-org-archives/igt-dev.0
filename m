Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DB4606A337
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkE9P+hi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5910ECA5;
	Wed, 11 Nov 2026 13:08:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E31610E942
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794402398; x=1825938398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2apBJEuT/n7LfiCu0ZXvx8MkgkyHJ7W3e7BPgdzgCH0=;
 b=nkE9P+hi1exutXoIA4XAKzAXSzaGqcW5aL//DY3ZRQGJEYQxf0E7QQiB
 x75qhdp+v4j0PsQDYldrCG1ALZ+cfOiUGvfMyFnBFPxCSmKj32/IhSBT8
 bNmXYaVo87PqbWndq3fwKhhy9+j+Tk2cjF9zQ+omXdlawh/ogVokjMawF
 aQpMjKh0A2Aux0M80mMzMrERC2JiFUztPyJsgCabI5utESyoVMhSE4qBb
 kEWHq0nV+c+pin4L1X8mWTuaLsCiK9Oke70Ud0vvus0JF9CCC2GoftB2c
 RoeiPipzP6132gaOk4fKnGIh1pSeZqaFD6BbpABKFmv/uVuNle2trLBir w==;
X-CSE-ConnectionGUID: rLjU3vNeQPaOwwtg74TW6g==
X-CSE-MsgGUID: LMhYVr8ESmWnhw86JqNfoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054393"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054393"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:38 -0800
X-CSE-ConnectionGUID: i5TS0iqlQtOW1f55mJCiiQ==
X-CSE-MsgGUID: Ta2fzoQURCWcfZDG+CTPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8413376"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:36 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v8 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Date: Wed, 11 Nov 2026 18:36:15 +0530
Message-Id: <20261111130624.1446908-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
References: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
changes:

b2207d4c4e84 ("drm/ras: Introduce error threshold")
6fdbfc75eaa1 ("drm/drm_ras: Add drm_ras netlink error event")
ee18d39a0877 ("drm/drm_ras: Add clear-error-counter netlink command to
drm_ras")
c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over
generic netlink")

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v7: Updated the DRM RAS UAPI header with a sanitized version in accordance with IGT documentation
---
 include/drm-uapi/drm_ras.h | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..54a4cf2e4
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _LINUX_DRM_RAS_H
+#define _LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	"drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
+
+	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
+	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTER,
+	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
+	DRM_RAS_CMD_ERROR_EVENT,
+	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
+	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#define DRM_RAS_MCGRP_ERROR_REPORT	"error-report"
+
+#endif /* _LINUX_DRM_RAS_H */
-- 
2.34.1

