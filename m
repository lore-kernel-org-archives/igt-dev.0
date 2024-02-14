Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95D8C4829F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4F510E203;
	Wed, 14 Feb 2024 06:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S56CnFhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0254510E1BF
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893143; x=1739429143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2m6lYF1In0GDUJPiFKT8060D3oa1GAJNcje6ijNlY5c=;
 b=S56CnFhSca86GVaLVfBnExJZfxnbMUqrsqiYnoCE0G75JXNdpzFaIjEm
 uMKHNlEsBvLOrN1hCJdRU7iHDsHC4AptSBu9smZbzhUyJcKUPD09O9kLj
 422en85f4M2lzp+OEJIlxINFGl+PUtoWwWDKzPBwy5YwMFGA9q4UCdIkr
 3KxlGCnvBtsHorkAzTJMET6LXHDyJNgyKR8RgW3dGuWKTf2TOgkwXNGch
 TJIOfjza5abjcdUgfwQGjIb56H+LH+Ipr6xig1+cYSU0JkclmEwrbp+3A
 d2reFwslPcgWpFgPhYz2LOfjr4YIofIvK+LYqrQ95unh8vf21h8Q0wEC6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645420"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645420"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427551"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:41 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC v4 02/22] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Date: Wed, 14 Feb 2024 12:09:33 +0530
Message-ID: <20240214063953.1285495-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

From: Harry Wentland <harry.wentland@amd.com>

We don't want to set this by default since existing tests
might require COLOR_RANGE and COLOR_ENCODING plane properties.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          |  4 ++++
 lib/igt_kms.h          |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248d..002337cc9 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -836,6 +836,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d761..ef1f611ec 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2801,6 +2801,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..2e9484413 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -482,6 +482,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
-- 
2.43.0

