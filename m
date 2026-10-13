Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22C8CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FA110E8DD;
	Tue, 13 Oct 2026 19:08:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F4410E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918441; x=1823454441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pupx8u5guJp8BpBbtzqaNeaESPxu3UUb2y7MO1z+9Vc=;
 b=MNXV3LcqrvmNzD1y7upVbsgmrEOvfLtQD3mxj4/jilZVuMYUzlWoJ3oE
 RTs6exkW0fJD7MnKI1Qpc1FJWK7RUpNHUXKz6pjGsgLmaTbA3/hEHGq8R
 u6cdmEk81tdzyOZ/xYAhpwjoI3X5i2jFe+dqTgdTscx5ASEkZMMxmf3Nl
 THhUCioNHVQcsh1CNWr+QytynSYZZ9YaRNiiw+cSkIbwcYhJDHPnA6JbQ
 nrvhQXDLh7VHIr0wYHjbaqJ0cyi6NuIoNmlroy4Cu03ZcWoBtTysQwP9Z
 +5lWFj/XTTgDXUS9/dNrKOQIi0j9OtZX4EGq/y/1f9dtkBWbsbp4+6Sgw A==;
X-CSE-ConnectionGUID: vqXT0Je9T+aAUwV9VghliA==
X-CSE-MsgGUID: KS4O7fDPQCSfA5Mgz+oJKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687211"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687211"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:21 -0700
X-CSE-ConnectionGUID: RO2z1qTfSP6cgMFhGWP/SQ==
X-CSE-MsgGUID: bIES5ByOQoOWpSURlWnc/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004443"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:18 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v5 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
Date: Wed, 14 Oct 2026 00:36:42 +0530
Message-Id: <20261013190651.897241-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
changes:

b2207d4c4e84 ("drm/ras: Introduce error threshold")
6fdbfc75eaa1 ("drm/drm_ras: Add drm_ras netlink error event")
ee18d39a0877 ("drm/drm_ras: Add clear-error-counter netlink command to
drm_ras")
c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over
generic netlink")

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 include/drm-uapi/drm_ras.h | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..6b504faeb
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
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
+#endif /* _UAPI_LINUX_DRM_RAS_H */
-- 
2.34.1

