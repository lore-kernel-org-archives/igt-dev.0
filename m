Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39081C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAF10E22D;
	Mon, 19 Aug 2024 09:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4ADiw1g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7BE10E22E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058875; x=1755594875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ghxeJgiSzxUjdNs8NGzCFXE1TIJguUO3ArI9GvObFwU=;
 b=R4ADiw1g9VmTLNa5bYyp+HyPFaiO4fN/AEsRm2gtkCQiN53n8GBedHMu
 CVF+vhTDLGcI20OC8EuCzb9HeTy4ESocNJzzV0U+m0gJQ3XfOaYAe/ORU
 utiCsobqNZZ/jboliGzwDj3JJqt0YmlekOaN1Ww/IcgHPAL2M3tkZ2UAe
 YKcUHLJW5+HErjTJxs5goJ3axPE5gpLG/WNte8mIbFodhqGsEfZT/cYrz
 Vo5CWNraXzqtGmA/OxjJuN3kaVBNqJDD55YEQBTgNK78O1/YeKsH96LN/
 k0XSiSzqgJV9CdL5DxkfVNWhZ9HJOk2y63Lweg4bFgrYetw3MdcNTQOJa g==;
X-CSE-ConnectionGUID: 4asvqZadS4yr9nXvobnIiw==
X-CSE-MsgGUID: jLSzokXUR2KCnN41jtfPKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816329"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:35 -0700
X-CSE-ConnectionGUID: sExiPYPMRQOJt+hbkbm6vQ==
X-CSE-MsgGUID: 0Tvhg2lnQa6rsITzOVxxSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884196"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:33 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/12] lib/igt_kms: add helper to set connector link
 status
Date: Mon, 19 Aug 2024 14:56:13 +0530
Message-Id: <20240819092615.3669803-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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
 lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 64591b760..3cbc7ca64 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2213,6 +2213,40 @@ void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode)
 					       dpms, mode) == 0);
 }
 
+/**
+ * kmstest_set_connector_link_status
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @link_status: DRM link status value
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
index 182200899..0206c92db 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -307,6 +307,8 @@ bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
 void kmstest_free_connector_config(struct kmstest_connector_config *config);
 
 void kmstest_set_connector_dpms(int fd, drmModeConnector *connector, int mode);
+void kmstest_set_connector_link_status(int drm_fd, drmModeConnector *connector,
+				       int link_status);
 bool kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
 			  const char *name, uint32_t *prop_id, uint64_t *value,
 			  drmModePropertyPtr *prop);
-- 
2.43.0

