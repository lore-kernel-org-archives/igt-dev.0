Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A5CF9C6F
	for <igt-dev@archiver.kernel.org>; Sun, 22 Sep 2024 21:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823DF10E352;
	Sun, 22 Sep 2024 21:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZE7VIYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9DD10E352
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Sep 2024 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727039633; x=1758575633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfPNt2aryKOvpwU5RtaBZUSrhCmtAO6IrpTkKERkIas=;
 b=HZE7VIYJeStunj5B2IwHBSRDip+v7MJ3Z0wQXbQDnMTSa5xlmtUwVluL
 n15bUvD1owGj5ZBNrK2ytkDqVC9CQBn8kmQOIb4EOuMTrsOwIYGRUAe5E
 ha3SJeW85/OD6KvLkCz9fT/7wIrwlS5mGPK3Ggsi61WDzTwqMNoZ9EgiK
 nsCRk93jsh/jZFcnZfXehQ7cpY0GtvelV+Cpuq+FEf3LqyqB7GOPvDLOy
 VTZuqwx/lFN7stq7no9vhasP1FqM7Y56KuZQuzfjbg81AqRXYefw6z9fD
 mk6Xb+aAnMGxOH29ykQ9/wz/4+uc53b2jG3IFK/E4XQIm55x8m8E5s9Rx w==;
X-CSE-ConnectionGUID: yG37or7wQBS5jkDPCW9iGQ==
X-CSE-MsgGUID: xWtXTX8OTuOluuoYWhY1dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36641010"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="36641010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 14:13:53 -0700
X-CSE-ConnectionGUID: YlyFYy8PR0Osc34W47pLJg==
X-CSE-MsgGUID: D3GxJP54RcWgl8rqFJeM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71188104"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 14:13:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/7] lib/igt_kms: add helper to set connector link status
Date: Mon, 23 Sep 2024 02:55:44 +0530
Message-Id: <20240922212549.1361889-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922212549.1361889-1-kunal1.joshi@intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

add helper to set connector's link status property

v2: property ID's type is uint32_t (Imre)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 37 +++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c79d800eb..53c6db7f3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2214,6 +2214,43 @@ void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode)
 					       dpms, mode) == 0);
 }
 
+/**
+ * kmstest_set_connector_link_status
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @link_status: DRM link status value
+ *
+ * This function sets the link status of @connector to @link_status.
+ */
+void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
+				       int link_status)
+{
+	bool found_it = false;
+	int i;
+	uint32_t link_status_prop;
+
+	for (i = 0; i < connector->count_props; i++) {
+		struct drm_mode_get_property prop = {
+			.prop_id = connector->props[i],
+		};
+
+		if (drmIoctl(drm_fd, DRM_IOCTL_MODE_GETPROPERTY, &prop))
+			continue;
+
+		if (strcmp(prop.name, "link-status"))
+			continue;
+
+		link_status_prop = prop.prop_id;
+		found_it = true;
+		break;
+	}
+	igt_assert_f(found_it, "LINK_STATUS property not found on %d\n",
+		     connector->connector_id);
+
+	igt_assert(drmModeConnectorSetProperty(drm_fd, connector->connector_id,
+					       link_status_prop, link_status) == 0);
+}
+
 /**
  * kmstest_get_property:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7d9c28d81..34a671bce 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -278,6 +278,8 @@ bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
 void kmstest_free_connector_config(struct kmstest_connector_config *config);
 
 void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode);
+void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
+				       int link_status);
 bool kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
 			  const char *name, uint32_t *prop_id, uint64_t *value,
 			  drmModePropertyPtr *prop);
-- 
2.43.0

