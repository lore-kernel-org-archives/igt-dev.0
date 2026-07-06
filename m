Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8425CC43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 06:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAE810E758;
	Mon,  6 Jul 2026 06:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+wEqRZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882810E2F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783319248; x=1814855248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=py+vp9dguRWNuxSEdCegY+vscmkEuaNCw+aFiv47XVM=;
 b=R+wEqRZePXjqp3EdV+9fNCkYCyZuCCwaRcvHQTtyxLkQz7KgpE6Sd9dd
 mkiTF4RjnVpf4dc+eZYV3iXfPW9laU/F2SoxcBCHiGGIikL6M/7VXQ8WU
 XBNv4rjVdUjkxeV4dx3kRBRCCm3hV7IxO8e2t6uz8w4eAk3DVfFAbKMVo
 /2nQFJ8YhBA7l9kdB6xKNLzHrlW+yIg1l/MQiI8HaHRXo+vaianj+/KlU
 nVv3LZtwFYrVDCK5nUYnP5a754rgRPDP/jEiJPvn8ZyP6kCp581gcCUm9
 UDOU9bc0LMCjrlKaiVVDiJvCXuayHbBm2YcHAAl7LKP0JkW9UoLDzYcCD w==;
X-CSE-ConnectionGUID: R+3q1heRRcSFTgS3du09rA==
X-CSE-MsgGUID: v37v6B9FTrOs5VPRZh/8DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94303446"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94303446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:28 -0700
X-CSE-ConnectionGUID: u/k0RRN0QHWJA6/DxtljJA==
X-CSE-MsgGUID: kkP/qpV6QpGR7HIfK4u2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="250267067"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 23:27:26 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Sowmiya S <sowmiya.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 2/3] tests/intel/kms_pipe_stress: fix plane source
 crop and separate cursor loop
Date: Mon,  6 Jul 2026 12:20:08 +0530
Message-ID: <20260706065019.416906-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706065019.416906-1-sowmiya.s@intel.com>
References: <20260706065019.416906-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
DRM_MODE_ATOMIC_TEST_ONLY commit. If the test commit
rejects the cursor (e.g. unsupported format or modifier),
disable it gracefully so the final commit with only overlay
planes can succeed.

v3: Rebase to latest (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
2.51.0

