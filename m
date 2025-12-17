Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042C1D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E10110EBD7;
	Wed, 17 Dec 2025 15:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxqKwYKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926410EBD7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985918; x=1797521918;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NGSwAp/zEqDkMN6lgdbIcEXwiohMm/AlZ4b+rlnqhKQ=;
 b=jxqKwYKbZuwBJrV3A2JZlCvfXZlsLwMZY4ZxU4eaXDCKLcf9kMYHy92M
 ZfqBXjOV/a309nHh5ZROlYQW5HuG7tqWhYqv3PlK5tieHns5cOnqyDYUe
 z0ngRAWfibuQFZiXhwbK/gxdJk8MnNhVQJL0Ib2UrsHFQ5IdnnR5era41
 HH1vAmj7PIponyyO/iUIhaxRp2FFO428Db7YoAyWmHwp/p3P6rwywFqe6
 PYrIMQSIKFlLLQttNVPgYr0aiEue8HkUkPaOyTvlZh+7YGFIxTGxO2yao
 XXopU0G1cakGH5Ap4MDRAqdzNiUPD32IWdRH0ntqeEGZEQcdcrw0yLYQY w==;
X-CSE-ConnectionGUID: 5Kp2MgpbQ+GrSZGsA4mw3A==
X-CSE-MsgGUID: R8Eowj3eT/e/wHAoJFr2Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78235690"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78235690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:37 -0800
X-CSE-ConnectionGUID: BDicaqJGTcOm0mKEkvM/3Q==
X-CSE-MsgGUID: OCWBj6B9QY+DEV7WD5AssQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="229013555"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/11] lib/kms: Extract plane_type_index()
Date: Wed, 17 Dec 2025 17:37:56 +0200
Message-ID: <20251217153758.9369-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 69a430f01e21..4f30732bf1bb 100644
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
@@ -3572,10 +3580,8 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 
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

