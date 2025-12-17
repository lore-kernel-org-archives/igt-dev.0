Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE0D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D75510ED11;
	Wed, 17 Dec 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZsVVMWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C1910ED21
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985903; x=1797521903;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3+sxjBQWfl6iEPKcCbgyEl5rpdo64E8GfCk7wDElcxw=;
 b=kZsVVMWoXIhvxOi+HP3oMbF5sDUoRn+F/gnKw1eK6bL/cZKIMy4lrf+F
 E3u7SHQo/G0oH8qlkBfAKxfFf17LW5bL+00DuACX9mLfaBgqB1CWiqnB4
 10uMHUhndG0N/JpKhI9t9MB2nuOsumTueXQszliLwLhBu04Wjx8tVDMYH
 dNJJpjeEyZyc4sCrdt/I7ehOvhvP+9RaeFuvggz+DR6BEqjKXrzMz7+/c
 9CQGnM3r2dPaCxTY2rB9thtIy8m1X8DroO9T6NxaQQ9s7btm7k4I+9Te9
 MOMp/ZYHvTOdZ5SB0P6nNuBLiv7QazxewmpJKNGrgCThq7dYy3u02bR7X g==;
X-CSE-ConnectionGUID: N5FzauQIRYWuBSclCUAY5w==
X-CSE-MsgGUID: fWbHb5seRLGtL13/XurJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71557010"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71557010"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:22 -0800
X-CSE-ConnectionGUID: NSxepH91Rj+wEbJl9PbUJQ==
X-CSE-MsgGUID: eP8HhdDlS0uR9NBquw7M1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718718"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:21 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/11] lib/kms: Nuke pipe->plane_primary
Date: Wed, 17 Dec 2025 17:37:52 +0200
Message-ID: <20251217153758.9369-7-ville.syrjala@linux.intel.com>
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

Get rid of of the redundant pipe->plane_primary. It'll
always be 0 after we've found the plane. And before we've
found the plane we can just check for 'pipe->planes[0].index < 0'.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 31 +++++++++----------------------
 lib/igt_kms.h |  1 -
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 233f326d487f..5bb8da1ec2c5 100644
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
 
@@ -3156,12 +3149,6 @@ static void igt_crtc_init(igt_display_t *display,
 		igt_crtc_plane_init(display, pipe, resources, global_plane);
 	}
 
-	/*
-	 * At the bare minimum, we should expect to have a primary
-	 * plane, and it must be in slot 0.
-	 */
-	igt_assert_eq(pipe->plane_primary, 0);
-
 	for (j = 0; j < pipe->n_planes; j++)
 		igt_assert_lt(0, pipe->planes[j].index);
 }
@@ -3582,7 +3569,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
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

