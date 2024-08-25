Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24775C5472C
	for <igt-dev@archiver.kernel.org>; Sun, 25 Aug 2024 18:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA35D10E0F8;
	Sun, 25 Aug 2024 18:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf4UaRRR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41010E0DF
 for <igt-dev@lists.freedesktop.org>; Sun, 25 Aug 2024 18:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724608961; x=1756144961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28gmxA+8xP4ufkCPNUm6DCeGN8XMZ5Asf2Newm64zOs=;
 b=hf4UaRRRC+v5kCOjO49EjKUVVmMlHnCtIhCrrO9KnxBi8Q6S3fGmQuCs
 /HKXHIA+5iaQvT2zofyDczWyaUEUruuaLBTG04XHLWkH0+84J0yhIGHdy
 cBbRnqpq1vuX18ufLCcq91VkhAaKhT20dOBC7Gyi95t8BVb1lF66Lxpt+
 wHav/tc7zBLrDY3W4r1XCV7k6MsnCKiPpvhC1yXi+Ywd+rpaj70cxNAar
 /Kk+mu6IKuaUq1gtX1UdEJaplVAxO29HJCrlsd9v9B1TuUIXZrxA43NbR
 Ez0c76cubjKOwVwV5WOkecFY/x/YgrGn9MWZD4VU4iXTQNm90j8p3EPBs Q==;
X-CSE-ConnectionGUID: 64Mk9f7UTPqNu9oBpV7d1g==
X-CSE-MsgGUID: qe9Ky83ySeCesjH08urllA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25917460"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="25917460"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 11:02:41 -0700
X-CSE-ConnectionGUID: Y1GuPKwjTkCqez5PuwhqYA==
X-CSE-MsgGUID: ZInU8wYASem6cHpajSCAJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; d="scan'208";a="85488314"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 11:02:40 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/14] lib/igt_kms: add helper to set connector link
 status
Date: Sun, 25 Aug 2024 23:44:20 +0530
Message-Id: <20240825181424.4034541-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240825181424.4034541-1-kunal1.joshi@intel.com>
References: <20240825181424.4034541-1-kunal1.joshi@intel.com>
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
2.43.0

