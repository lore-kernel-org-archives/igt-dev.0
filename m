Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B391ECD5BDE
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 06:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471FB10E735;
	Wed, 27 May 2026 06:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gTUCetyp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9871F10E72D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 06:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779865089; x=1811401089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+6wOn1v85pnXF3gHtUa8JUkVwKnFdIwbY1xBYtsxa8=;
 b=gTUCetypp7hH3Epz+bIwXV/6RAKzS+M4Sk6WMxGdMNo3msasB2Z0nvLv
 O6CCl63Cxqy7zzILc/GPiENYAwd7mRff/tkcmjAoOMPAMuxWxSf79zwx0
 hUAdG8BTYOm3haMUFXQ/En8hBw68EJ7fbVmfyO7t+8OCtSv76U9rBsVKS
 lf4ym7BAiWyy74s327O/QkIecy/9hJLJ9UktFt1AHiSQyWZqBwieI+FIA
 M4M0+pktbNeYd7k/0Q5c654w4LuVuaYGIhcaiqS6VeBSkbWQYEEEJvfqj
 qswXpB4LLhgtkoCCai3MaYs9Pcu2EWxEs/tS8Q3qLrdNKbRU/PGFhWbeg Q==;
X-CSE-ConnectionGUID: 1KvFkiq/S/SXksH4fgD0ow==
X-CSE-MsgGUID: IW1J2To6STS0yN9ZK5IsHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80874760"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80874760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:08 -0700
X-CSE-ConnectionGUID: w8xuPC+OS4GDqVQ0YpzHDQ==
X-CSE-MsgGUID: 3HM77+nuSrG48vysGS5bzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="235787334"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 23:58:05 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/intel/kms_pipe_stress: fix plane source
 crop and separate cursor loop
Date: Wed, 27 May 2026 12:49:37 +0530
Message-ID: <20260527071940.3285269-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527071940.3285269-1-sowmiya.s@intel.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pass 3/4 destination size as initial source crop to
universal_plane_set_fb() to avoid an immediate
downscale. Keep source in sync with igt_fb_set_size()
in the reduction loop so the downscale ratio never
exceeds the hardware limit (~3x).

Move cursor handling out of the overlay loop into a
dedicated second for_each_plane_on_crtc loop with a
DRM_MODE_ATOMIC_TEST_ONLY commit.If the test commit
rejects the cursor (e.g. unsupported format or modifier),
disable it gracefully so the final commit with only overlay
planes can succeed.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 110 +++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 42 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 8724a674c..a84433b9d 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -425,57 +425,83 @@ static int crtc_stress(struct data *data, igt_output_t *output,
 	if (!data->num_planes[crtc->pipe] || !new_mode)
 		return 0;
 
-	for_each_plane_on_crtc(crtc,
-			       plane) {
+	/* Set up overlay/primary planes up to the configured limit. */
+	for_each_plane_on_crtc(crtc, plane) {
 		int plane_width, plane_height;
-		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-			cursor_plane_set_fb(plane,
-					    &data->cursor_fb[crtc->pipe],
-					    cursor_width, cursor_height);
-			plane_width = cursor_width;
-			plane_height = cursor_height;
-		} else {
-			universal_plane_set_fb(plane,
-					       &data->fb[crtc->pipe * MAX_PLANES + i],
-					       mode->hdisplay, mode->vdisplay);
 
-			plane_width = (mode->hdisplay * 3) / 4;
-			plane_height = (mode->vdisplay * 3) / 4;
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
 
-			ret = try_plane_scaling(data, plane, plane_width, plane_height);
+		plane_width = (mode->hdisplay * 3) / 4;
+		plane_height = (mode->vdisplay * 3) / 4;
 
-			while (ret) {
-				if (plane_width <= cursor_width || plane_height <= cursor_height)
-					break;
+		/*
+		 * Set the source crop to match the initial destination
+		 * size (no upscaling).  Keeping source == destination
+		 * prevents the downscale ratio from exceeding the
+		 * hardware limit (~3×) when the destination is halved
+		 * in the reduction loop below.
+		 */
+		universal_plane_set_fb(plane,
+				       &data->fb[crtc->pipe * MAX_PLANES + i],
+				       plane_width, plane_height);
 
-				plane_width /= 2;
-				plane_height /= 2;
+		ret = try_plane_scaling(data, plane, plane_width, plane_height);
 
-				ret = try_plane_scaling(data, plane, plane_width, plane_height);
+		while (ret) {
+			if (plane_width <= cursor_width || plane_height <= cursor_height)
+				break;
 
-				igt_info("Reduced plane %d size to %dx%d\n",
-					 plane->index, plane_width, plane_height);
-			}
-			if (ret) {
-				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
-					 crtc->pipe);
-				data->num_planes[crtc->pipe] = i;
-				igt_info("Max num planes for pipe %d set to %d\n",
-					 crtc->pipe, i);
-				/*
-				 * We have now determined max amount of full sized planes, we will just
-				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
-				 * Don't destroy cursor_fb as will take care about it at the end.
-				 */
+			plane_width /= 2;
+			plane_height /= 2;
+
+			/* Keep source crop in sync with the reduced destination. */
+			igt_fb_set_size(&data->fb[crtc->pipe * MAX_PLANES + i],
+					plane, plane_width, plane_height);
+
+			ret = try_plane_scaling(data, plane, plane_width, plane_height);
+
+			igt_info("Reduced plane %d size to %dx%d\n",
+				 plane->index, plane_width, plane_height);
+		}
+		if (ret) {
+			igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
+				 crtc->pipe);
+			data->num_planes[crtc->pipe] = i;
+			igt_info("Max num planes for pipe %d set to %d\n",
+				 crtc->pipe, i);
+			/*
+			 * We have now determined max amount of full sized planes, we will just
+			 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
+			 * Don't destroy cursor_fb as will take care about it at the end.
+			 */
+			igt_plane_set_fb(plane, NULL);
+			cleanup_plane_fbs(data, crtc, i, MAX_PLANES);
+		}
+
+		if (++i >= data->num_planes[crtc->pipe])
+			break;
+	}
+
+	/*
+	 * Always attempt to enable the cursor plane.  First validate it with
+	 * a TEST_ONLY commit: some format/modifier combinations (e.g.
+	 * XRGB8888, 4-tiled) are not accepted by the cursor hardware.
+	 * If the test commit rejects the cursor, gracefully disable it so
+	 * the final actual commit with only overlay planes can succeed.
+	 */
+	for_each_plane_on_crtc(crtc, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+			cursor_plane_set_fb(plane,
+					    &data->cursor_fb[crtc->pipe],
+					    cursor_width, cursor_height);
+			if (igt_display_try_commit_atomic(&data->display,
+							  DRM_MODE_ATOMIC_TEST_ONLY |
+							  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL)) {
 				igt_plane_set_fb(plane, NULL);
-				cleanup_plane_fbs(data,
-						  crtc,
-						  i,
-						  MAX_PLANES);
+				igt_info("Cursor fb not supported by hw (format/modifier), disabling\n");
 			}
-
-			if (++i >= data->num_planes[crtc->pipe])
-				break;
+			break;
 		}
 	}
 
-- 
2.48.1

