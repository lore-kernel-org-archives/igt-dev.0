Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8132C5320E
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 19:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D95A10E11B;
	Sun, 25 Aug 2024 19:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0h3U6UA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B90510E10F
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724615670; x=1756151670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z+85EZp2ZJHvlZmpxwbqn+8Hi6lcoVU+vpaIbXtPx/U=;
 b=I0h3U6UAZ54kkiDOK5yJ5bzymteZnvCJecUABD+pM+tPqcuuZ87lx89Z
 wgAVt0slUYrDLnCfvwKukIBgG43mjpKeLT6nT9HiRRXDVNkALwTAzJq9K
 XoeWsCeFtEoUB1sWiTt7YBXYcf+nM9tZVI7goTpEL7GUyoF2zmXD78syp
 ab+1knUzZl/Cyt9q+wqlaKwFcgwEw+Cy82GT/qRR8qd79Cnx5vSJ7WH9K
 O28ZfGm/2EZdpwbdba4dJdhymlpr9YqIJPAG3BmKes+/Veg9FDCfuMEy4
 LE8+uzfkmEm/ipVAK5rG8If6/57bWTUpzHcDwGNS8+4VFm4y/ze+aRzHz w==;
X-CSE-ConnectionGUID: L0YancdGS/Gt+Xwmmn+M8Q==
X-CSE-MsgGUID: VFzVRNr1QTqM9Qda2rfQeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33591500"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="33591500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 12:54:30 -0700
X-CSE-ConnectionGUID: l6KpGcriTiGn5IO1ziMQ9A==
X-CSE-MsgGUID: Ym7ovHcnRU6ObDBwn//a3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="62283702"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 12:54:29 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector link
 status
Date: Mon, 26 Aug 2024 01:36:08 +0530
Message-Id: <20240825200612.4036178-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825200612.4036178-1-kunal1.joshi@intel.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 91f75243d..e0533f6ae 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2213,6 +2213,42 @@ void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode)
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
+	int i, link_status_prop = 0;
+	bool found_it = false;
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
index 640ec4e09..3d7842b36 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -301,6 +301,8 @@ bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
 void kmstest_free_connector_config(struct kmstest_connector_config *config);
 
 void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode);
+void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
+				       int link_status);
 bool kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
 			  const char *name, uint32_t *prop_id, uint64_t *value,
 			  drmModePropertyPtr *prop);
-- 
2.34.1

