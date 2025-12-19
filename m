Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1195E6688C
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4A210F0AB;
	Fri, 19 Dec 2025 20:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0l0IAnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A43210F0AB
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176435; x=1797712435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qv1hPb/8RVDK+iu+zpqj9V0mua7FSQJGoNsnkIOjIUY=;
 b=G0l0IAnA/2xuXwROiUzb5+5qOKDj6ASKa4HtyP3ejeUMwThZdugp3+oy
 5baQTaYvCYFIrhmrcGmTFDCCjc3vpyC82HSikvAGnE5VG5PwZQLoQKy0v
 z+H/pQz79ScKuZecGAxtrKNIXpxhATy9juDjDtj/9SEAB6nTyePEWCp/h
 mxF9d0zGuc/JiCgoo8YbviXf0QOlpzosb2/9mut181XVPwfU5htwh3IKg
 GijydAAVTEcOBNSnk/jvJijJAdwj9gpn2EtX/ae4Zu8E4AscXwJTiCrUr
 aUlD3ZeMuVxwHFU+3VuKa7FZkN9pWtVm005tQwpuuaZDjx1IP4sEVJAp/ g==;
X-CSE-ConnectionGUID: +Pcl9o2JQxymNFuiYPaqBQ==
X-CSE-MsgGUID: hMm4746SQQu6FL0RceyFcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034136"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034136"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:55 -0800
X-CSE-ConnectionGUID: tewYcRFXTBehj24n5F0D6w==
X-CSE-MsgGUID: dHE91qIETmeWVyIsOTTzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367561"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 06/11] lib/kms: Nuke pipe->plane_primary
Date: Fri, 19 Dec 2025 22:33:22 +0200
Message-ID: <20251219203327.16573-7-ville.syrjala@linux.intel.com>
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

Get rid of of the redundant pipe->plane_primary. It'll
always be 0 after we've found the plane. And before we've
found the plane we can just check for 'pipe->planes[0].index < 0'.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 31 +++++++++----------------------
 lib/igt_kms.h |  1 -
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6e9eb53a0c13..4af517a991f8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3022,29 +3022,24 @@ void igt_display_reset_outputs(igt_display_t *display)
 		output = igt_get_single_output_for_pipe(display, i);
 
 		if (pipe->num_primary_planes > 1) {
-			igt_plane_t *primary =
-				&pipe->planes[pipe->plane_primary];
+			igt_plane_t *primary = &pipe->planes[0];
 			igt_plane_t *assigned_primary =
 				igt_get_assigned_primary(output, pipe);
 			int assigned_primary_index = assigned_primary->index;
 
 			/*
 			 * If the driver-assigned primary plane isn't at
-			 * the pipe->plane_primary index, swap it with
-			 * the plane that's currently at the
-			 * plane_primary index and update plane->index
-			 * accordingly.
+			 * index 0, swap it with the plane that's currently
+			 * at index 0 and update the indexes accordingly.
 			 *
-			 * This way, we can preserve pipe->plane_primary
-			 * as 0 so that tests that assume
-			 * pipe->plane_primary is always 0 won't break.
+			 * This way, the primary plane is always at index 0.
 			 */
-			if (assigned_primary_index != pipe->plane_primary) {
-				assigned_primary->index = pipe->plane_primary;
+			if (assigned_primary_index != 0) {
+				assigned_primary->index = 0;
 				primary->index = assigned_primary_index;
 
 				igt_swap(pipe->planes[assigned_primary_index],
-					 pipe->planes[pipe->plane_primary]);
+					 pipe->planes[0]);
 			}
 		}
 	}
@@ -3062,10 +3057,9 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	igt_plane_t *plane;
 	int index;
 
-	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
+	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->planes[0].index < 0) {
 		index = 0;
 
-		pipe->plane_primary = index;
 		pipe->num_primary_planes++;
 	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
 		index = pipe->n_planes - 1;
@@ -3120,7 +3114,6 @@ static void igt_crtc_init(igt_display_t *display,
 
 	pipe->display = display;
 	pipe->plane_cursor = -1;
-	pipe->plane_primary = -1;
 	pipe->planes = NULL;
 	pipe->num_primary_planes = 0;
 
@@ -3157,12 +3150,6 @@ static void igt_crtc_init(igt_display_t *display,
 		igt_crtc_plane_init(display, pipe, resources, global_plane);
 	}
 
-	/*
-	 * At the bare minimum, we should expect to have a primary
-	 * plane, and it must be in slot 0.
-	 */
-	igt_assert_eq(pipe->plane_primary, 0);
-
 	for (j = 0; j < pipe->n_planes; j++)
 		igt_assert_lte(0, pipe->planes[j].index);
 }
@@ -3583,7 +3570,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 		plane_idx = pipe->plane_cursor;
 		break;
 	case DRM_PLANE_TYPE_PRIMARY:
-		plane_idx = pipe->plane_primary;
+		plane_idx = 0;
 		break;
 	case DRM_PLANE_TYPE_OVERLAY:
 		for(i = 0; i < pipe->n_planes; i++)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b00884640e16..810eb7497834 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -490,7 +490,6 @@ struct igt_crtc {
 	int n_planes;
 	int num_primary_planes;
 	int plane_cursor;
-	int plane_primary;
 	igt_plane_t *planes;
 
 	uint64_t changed;
-- 
2.51.2

