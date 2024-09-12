Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D08CEE644E
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7B410EAD6;
	Thu, 12 Sep 2024 06:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUoR7cFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D9B10EAD4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121805; x=1757657805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3jGsFym3mOwG7fxkiArOP1YUWu7l0C8NdphFKbum2bY=;
 b=MUoR7cFAM2OMhiG8dE8vR6YU+lboBQB199TVzZLSnEpTGPwL0qNNTZeU
 i8TZbTU+/kgtWPmLy/xxoyczCumDHoN65BlbvTzFVvQ4bb+2v1MoB2re8
 aDd7k/dmRWU97elqSVfPlUoDY3XmV2WOlQqwXf2LSoxY4rOBjBHyMxhlp
 oHmcMk2sDibv5fznQICXG8mzoFPjadNe5IDlTWlDFmae78y8G4E6VeXab
 Q2vRdXpyn93WXYsG8e3lH1cO3rXoULGQwYXJSDEht/yPb4Sky8e4GZM0G
 hntevuhCwvwzHVekx4itwuiU/VO2Nk9wuKXq7obNLT+LRb/M+4mfSwc7j Q==;
X-CSE-ConnectionGUID: bLltay28Rrma3l8yLoWifg==
X-CSE-MsgGUID: N6b87bq7S4a5u3EqLiNtHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25056615"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="25056615"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:16:45 -0700
X-CSE-ConnectionGUID: 8OLk3Jq+Q3aDWNv3fAihxQ==
X-CSE-MsgGUID: DdJ0RWZyQF6PrIEdzAbeJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="98310270"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 23:16:44 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_kms: add helper to set connector link status
Date: Thu, 12 Sep 2024 11:58:35 +0530
Message-Id: <20240912062839.760661-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912062839.760661-1-kunal1.joshi@intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
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
index f0ac1e5dc..863eb5331 100644
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
index 895bc9d04..9dca09d93 100644
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

