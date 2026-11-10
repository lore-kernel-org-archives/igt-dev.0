Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A50606A32D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kKc54VGl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786FF10F804;
	Tue, 10 Nov 2026 16:10:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2DA10E21A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326873; x=1825862873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2apBJEuT/n7LfiCu0ZXvx8MkgkyHJ7W3e7BPgdzgCH0=;
 b=kKc54VGl+iN8wAJvwlwnqLI9uNekbtvs8R33sfavrqWg5R97CrcYUOeI
 pj9+F2W9UCyO5GtZQ7rGmyYjsDatYQWEwRG8IgOb+CFoM+BIW9XIZ+uNB
 Si+0sHVju97ogeeUrwcGNBa/hAkE9AzE+EcOhrbLiWOnVlkvyHcG61w7k
 vcHerGZrjYX0BbvwQ8VZ/SBp86UBS2Omm/onYG64h2vbfhqmpSALRUeDw
 xkyZ+C74c3JcFqa/IAfBIapcVyr77ow6S2ll6sErCmib6eLkQbI/hUwp2
 4lDeyx5YlDjd0fc4t/cK6BxeLHotFAR0dkaNyGjlwAbSqEH6lk2RZ194s w==;
X-CSE-ConnectionGUID: b0Dkiq1IR0e9JfcjhSIf3A==
X-CSE-MsgGUID: xKQ6/8YoQqq+ms8YAlxolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079289"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079289"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:29 -0800
X-CSE-ConnectionGUID: YH8MvT7nThCwHFP1uh0k/Q==
X-CSE-MsgGUID: VgAgPaJiQn2JC+p6NwExmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781794"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:27 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Date: Tue, 10 Nov 2026 21:34:55 +0530
Message-Id: <20261110160504.1315160-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
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

