Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86794CA0EEB
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 15:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF0C10E62E;
	Tue, 19 Aug 2025 15:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaM/VoqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF1110E62E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618676; x=1787154676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3NNV7jQB5HktFV3Yj2ah5dQlVBSi/m9UZqkvuyR2qY=;
 b=IaM/VoqUr5Cdkmd2nHcDAKWfOL1MTnGS2TcUVJZJdxo+1gmV45aR4F9U
 10J7oWEbKJARPXFk9OXezcTkF60+m37TZvriQ+N/NEUQePjPWUVxTe23Y
 eg1KzgzrFCNCFxI/ciXNjNuSFvG+fsNYXPBMA9tpq7mjQukFTsGdaLGcU
 OPP4lrKVrDwsQsq7Y9v4ecqqqnGmIcDi59wYBSsw8xg6uG6mIHZd3NJJD
 7fZwM7ui2U06up+X4kz3r/ZVXfQSgGfez632+Ao6KXLr151hnpdjurR5l
 +XZHodG/oOZPOLsojkcYRFf9qFy2H9JPuLQMfGVIEYVCW9zETAv6iHWPG Q==;
X-CSE-ConnectionGUID: rAohZ3KtTbOE42oFkjYHYQ==
X-CSE-MsgGUID: 0EX3nPkJSselO4wPdFOmMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57779694"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57779694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:16 -0700
X-CSE-ConnectionGUID: 5XxLzuB3TRS7qj0isCC1Ug==
X-CSE-MsgGUID: b1xQasRKSzub5D6pDIBXyQ==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/kms_3d: Convert to subtest
Date: Tue, 19 Aug 2025 17:50:57 +0200
Message-ID: <20250819155058.129794-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
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

Convert this test to have one basic subtest. This will allow it
to have a proper cleanup at end. Also while at this, fix code
style and avoid comparision to bool.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_3d.c | 133 ++++++++++++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 62 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 31242c5f5..f9734ba38 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -34,13 +34,13 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST:
- * Description: Tests 3D mode setting.
+ * SUBTEST: basic
+ * Description: Tests basic 3D mode setting.
  */
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
-igt_simple_main
+igt_main
 {
 	int drm_fd;
 	drmModeRes *res;
@@ -48,84 +48,93 @@ igt_simple_main
 	const struct edid *edid;
 	int mode_count, connector_id;
 
-	drm_fd = drm_open_driver_master(DRIVER_ANY);
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-	res = drmModeGetResources(drm_fd);
-	igt_require(res);
+		res = drmModeGetResources(drm_fd);
+		igt_require(res);
+	}
 
-	igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
-		     "Failed to enable STEREO_3D capability.\n");
+	igt_subtest("basic") {
+		igt_assert_f(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_STEREO_3D, 1) >= 0,
+			     "Failed to enable STEREO_3D capability.\n");
+
+		/* find an hdmi connector */
+		for (int i = 0; i < res->count_connectors; i++) {
+			connector = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
+			if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
+				break;
+			drmModeFreeConnector(connector);
+			connector = NULL;
+		}
 
-	/* find an hdmi connector */
-	for (int i = 0; i < res->count_connectors; i++) {
-		connector = drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
-		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
-			break;
-		drmModeFreeConnector(connector);
-		connector = NULL;
-	}
-	igt_require_f(connector, "No HDMI connector found.\n");
+		igt_require_f(connector, "No HDMI connector found.\n");
 
-	kmstest_unset_all_crtcs(drm_fd, res);
+		kmstest_unset_all_crtcs(drm_fd, res);
 
-	edid = igt_kms_get_3d_edid();
+		edid = igt_kms_get_3d_edid();
 
-	kmstest_force_edid(drm_fd, connector, edid);
-	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
-		igt_skip("Could not force connector on\n");
+		kmstest_force_edid(drm_fd, connector, edid);
+		if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
+			igt_skip("Could not force connector on\n");
 
-	connector_id = connector->connector_id;
+		connector_id = connector->connector_id;
 
-	/* check for 3D modes */
-	mode_count = 0;
-	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
-	for (int i = 0; i < connector->count_modes; i++) {
-		if (connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)
-			mode_count++;
-	}
+		/* check for 3D modes */
+		mode_count = 0;
+		connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
+		for (int i = 0; i < connector->count_modes; i++) {
+			if (connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK)
+				mode_count++;
+		}
 
-	igt_assert_f(mode_count, "3D modes not detected.\n");
+		igt_assert_f(mode_count, "3D modes not detected.\n");
 
-	/* set 3D modes */
-	igt_info("Testing:\n");
-	for (int i = 0; i < connector->count_modes; i++) {
-		int fb_id;
-		struct kmstest_connector_config config;
-		int crtc_mask = -1;
-		int ret;
+		/* set 3D modes */
+		igt_info("Testing:\n");
+		for (int i = 0; i < connector->count_modes; i++) {
+			int fb_id;
+			struct kmstest_connector_config config;
+			int crtc_mask = -1;
+			int ret;
 
-		if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
-			continue;
+			if (!(connector->modes[i].flags & DRM_MODE_FLAG_3D_MASK))
+				continue;
 
-		/* create a configuration */
-		ret = kmstest_get_connector_config(drm_fd, connector_id,
-						   crtc_mask, &config);
-		if (ret != true) {
-			igt_info("Error creating configuration for:\n  ");
-			kmstest_dump_mode(&connector->modes[i]);
+			/* create a configuration */
+			ret = kmstest_get_connector_config(drm_fd, connector_id,
+							   crtc_mask, &config);
+			if (!ret) {
+				igt_info("Error creating configuration for:\n  ");
+				kmstest_dump_mode(&connector->modes[i]);
 
-			continue;
-		}
+				continue;
+			}
 
-		igt_info("  ");
-		kmstest_dump_mode(&connector->modes[i]);
+			igt_info("  ");
+			kmstest_dump_mode(&connector->modes[i]);
 
-		/* create stereo framebuffer */
-		fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
-					     igt_bpp_depth_to_drm_format(32, 24),
-					     DRM_FORMAT_MOD_LINEAR);
+			/* create stereo framebuffer */
+			fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
+						     igt_bpp_depth_to_drm_format(32, 24),
+						     DRM_FORMAT_MOD_LINEAR);
 
-		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
-				     &connector->connector_id, 1,
-				     &connector->modes[i]);
+			ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
+					     &connector->connector_id, 1,
+					     &connector->modes[i]);
 
-		igt_assert(ret == 0);
+			igt_assert(ret == 0);
+		}
 	}
 
-	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
-	kmstest_force_edid(drm_fd, connector, NULL);
+	igt_fixture {
+		if (connector) {
+			kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
+			kmstest_force_edid(drm_fd, connector, NULL);
 
-	drmModeFreeConnector(connector);
+			drmModeFreeConnector(connector);
+		}
 
-	drm_close_driver(drm_fd);
+		drm_close_driver(drm_fd);
+	}
 }
-- 
2.51.0

