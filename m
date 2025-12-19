Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAC2E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:34:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DC710F0AC;
	Fri, 19 Dec 2025 20:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nv7QorDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC17610F0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176451; x=1797712451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQ2usegMYoHAFuRd1tObGhGmEjzlLukPubEwzOdf/Fk=;
 b=nv7QorDzJAHuWVqLkdzI6u7q6MDakG7+g1IBljPB8ZgcdslvmMpV8A2y
 7lIkbBTgjrQs9Sn0Z30/x+ZsLXB8K46tSIpfSmMZQVuWexZdEbT4gyz+w
 cXghvQ7Usk4aEufehEfAfoXC03MMjP9jp3MxPg1CYzrNb0hcWgG4zVH4f
 AjQkM52n2GrN2rq7TNjsq4UBgk/JJZZk9uec7S7Iwl22FUe6F4wrXkKxe
 sBGlBB4odAqCqgsAuH4kRtrxmi/t93LDmD66tPrN0CEfIZmu51dilWp4O
 IsR7McKLE3dHX4gJ3U/M7t5gMDuSOTwq+m4bszgn0HVRzXlY6yPXl/jV9 A==;
X-CSE-ConnectionGUID: Ag1TaJEUS4WLLE9Anj8wJg==
X-CSE-MsgGUID: iJa7W+I9TuSP8JSy3xH4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034145"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:11 -0800
X-CSE-ConnectionGUID: GhrFa1SERTG8BOk3MDmY+g==
X-CSE-MsgGUID: o2JdDpCBSU6WPgO3onL38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367594"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 10/11] lib/kms: Extract plane_type_index()
Date: Fri, 19 Dec 2025 22:33:26 +0200
Message-ID: <20251219203327.16573-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
References: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the duplicated plane_type->index stuff into a helper.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f38f3367958a..216c0efaf5d4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3055,6 +3055,18 @@ void igt_display_reset_outputs(igt_display_t *display)
 	drmModeFreeResources(resources);
 }
 
+static int plane_type_index(igt_crtc_t *crtc, int type)
+{
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		return 0;
+	case DRM_PLANE_TYPE_CURSOR:
+		return crtc->n_planes - 1;
+	default:
+		return -1;
+	}
+}
+
 static void igt_crtc_plane_init(igt_display_t *display,
 				igt_crtc_t *pipe,
 				drmModeRes *resources,
@@ -3063,15 +3075,11 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	drmModePlane *drm_plane = global_plane->drm_plane;
 	int type = global_plane->type;
 	igt_plane_t *plane;
-	int index;
-
-	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->planes[0].index < 0) {
-		index = 0;
+	int index = plane_type_index(pipe, type);
 
+	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->planes[index].index < 0) {
 		pipe->num_primary_planes++;
-	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->planes[pipe->n_planes - 1].index < 0) {
-		index = pipe->n_planes - 1;
-
+	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->planes[index].index < 0) {
 		display->has_cursor_plane = true;
 	} else {
 		for (index = 1; index < pipe->n_planes; index++) {
@@ -3573,10 +3581,8 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 
 	switch(plane_type) {
 	case DRM_PLANE_TYPE_CURSOR:
-		plane_idx = pipe->n_planes - 1;
-		break;
 	case DRM_PLANE_TYPE_PRIMARY:
-		plane_idx = 0;
+		plane_idx = plane_type_index(pipe, plane_type);
 		break;
 	case DRM_PLANE_TYPE_OVERLAY:
 		for(i = 0; i < pipe->n_planes; i++)
-- 
2.51.2

