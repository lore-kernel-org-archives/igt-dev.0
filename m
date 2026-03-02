Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1176EA4E09
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAF210E500;
	Mon,  2 Mar 2026 14:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Chxp54oU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AE510E4FF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772460562; x=1803996562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jbN16FllEvlvKCMqij7XCNIZUTY8WbrCF7HzZ7IMMxU=;
 b=Chxp54oUMAWtV15Yg8pkeby2c/ZO98NyFevdZGJ5Xp0wXJ5LYrKEZq6A
 w4KHAjp8KUqWz/8knKQp3paggKyCjiQY6oE2Ct5rKr5SYCCUKfXjqmE3z
 aVPnolOVULdaedcAM9R+J4nhJHQ3veUJyR4W1fNkwGbESXo0Mbsh8MQTA
 TmI1la3GyPoK8GnC7jNzr9Dc7qv3SmCf/BPS01Qipplosu5eiBey/A1sq
 4lAJLLkjCgXD/yZD/R3D2VEhW5r5NQwE7C+PzerpRWnSyWIUh9LqtIbr+
 4jTbplq0nB7LsTTKNGGDF0FCX1O1w0KdoFMZEhX05J3W2TQmaHPxzPthc Q==;
X-CSE-ConnectionGUID: 5nFS/t02RrqL6Cl5JrkDrQ==
X-CSE-MsgGUID: 0OfU5ZzQR36zrYWdQ8uujA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84932945"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84932945"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:22 -0800
X-CSE-ConnectionGUID: fAKu1Qz0QJS4Nlo8/lq1+w==
X-CSE-MsgGUID: /LZnfE+tSrKR0lafY9P2Zg==
X-ExtLoop1: 1
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:09:20 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_properties: Refresh connector when
 property fetch fails
Date: Mon,  2 Mar 2026 20:00:12 +0530
Message-ID: <20260302143013.264657-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302143013.264657-1-sowmiya.s@intel.com>
References: <20260302143013.264657-1-sowmiya.s@intel.com>
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

drmModeObjectGetProperties() may fail for connectors
that have just changed state (e.g., hotplug, reprobing)
and whose connector ID is now stale. Add a connector
specific recovery path to test_properties

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_properties.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 86d05c6d4..8ac122850 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -178,14 +178,26 @@ static bool has_additional_test_lookup(uint32_t obj_type, const char *name,
 
 	return false;
 }
-static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, bool has_color_pipeline)
+
+static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic,
+			    bool has_color_pipeline, igt_output_t *output)
 {
 	drmModeObjectPropertiesPtr props =
 		drmModeObjectGetProperties(fd, id, type);
 	int i, j, ret;
 	drmModeAtomicReqPtr req = NULL;
 
-	igt_assert(props);
+	if (!props && type == DRM_MODE_OBJECT_CONNECTOR && output) {
+		igt_info("Connector properties query failed on id=%u, refreshing output and retrying\n",
+			 id);
+		igt_output_refresh(output);
+		id = output->id;
+		props = drmModeObjectGetProperties(fd, id, type);
+	}
+
+	igt_assert_f(props,
+		     "Failed to get properties for object id=%u type=%u after retry (output: %s)\n",
+		     id, type, output ? output->name : "N/A");
 
 	if (atomic)
 		req = drmModeAtomicAlloc();
@@ -261,7 +273,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 					  colorop->id,
 					  kmstest_plane_type_name(plane->type), output->name);
 				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
-						atomic, display->has_plane_color_pipeline);
+						atomic, display->has_plane_color_pipeline, output);
 
 				colorop_id = igt_colorop_get_prop(display, colorop,
 								IGT_COLOROP_NEXT);
@@ -288,7 +300,8 @@ static void run_plane_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
 
-		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
+		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id,
+				atomic, display->has_plane_color_pipeline, output);
 	}
 
 	cleanup_pipe(display, crtc, output,
@@ -309,7 +322,8 @@ static void run_crtc_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC,
 			crtc->crtc_id,
 			atomic,
-			false);
+			false,
+			output);
 
 	cleanup_pipe(display, crtc, output,
 		     &fb);
@@ -328,7 +342,8 @@ static void run_connector_property_tests(igt_display_t *display,
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name,
 		 igt_crtc_name(crtc));
 
-	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
+	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id,
+			atomic, false, output);
 
 	if (crtc != NULL)
 		cleanup_pipe(display, crtc,
-- 
2.43.0

