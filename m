Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DC3C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CDC10E101;
	Fri, 24 May 2024 08:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYDFW49r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA4A10E1EB
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540496; x=1748076496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5AELoNpSTwxMRTSJ1nXJuC2yt8ZIqWlPMqYGldF1JdQ=;
 b=NYDFW49ryItgc54hV0jRGDUhL5hKBW2Rzg2INok4qzFInOPjDU9XRad7
 gJpqso5dUrnBBs9cLK/B9UGzrdf8lOlhpw7BopBrIAbs9G/XTpGLAhzEb
 JeUvs8wa27P/QIaYVtY5TjQtwb/sLjxV+hJslhkk4H6gUAxOD/6hIt4MD
 VU/ZTaNHUOKwQfnSiyVO9GBjDRRBS6QFxuJZyI8cYaR/0oEJL1ZbNfxyC
 qb/bZ4V5jcURjPV/C9zLCrAs+o8+cSCnN09ga+8AiteVVlTcXXWB4QBvw
 CxlSMIUphaCzS2phugZFQAo0ew1Wy5LZF/0UP6gnYrDKpVWsu1OlAjiI6 g==;
X-CSE-ConnectionGUID: OO9KfM5gQiSuLzK5vHrMHA==
X-CSE-MsgGUID: ru+IEbNLQK23S3ppDS7XcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692277"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:48:16 -0700
X-CSE-ConnectionGUID: FetBx5ZTR7m9EeLvl58L2Q==
X-CSE-MsgGUID: nV+hLFYSRmy9p2EieK3mqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940850"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 24 May 2024 01:48:13 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_plane: Reduce CI logging
Date: Fri, 24 May 2024 14:18:06 +0530
Message-Id: <20240524084807.480971-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524084807.480971-1-pranay.samala@intel.com>
References: <20240524084807.480971-1-pranay.samala@intel.com>
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

Replacing igt_info with igt_debug to reduce CI logging.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..9062320e1 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -275,8 +275,8 @@ test_plane_position_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc, crc2;
 
-	igt_info("Testing connector %s using pipe %s plane %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
+	igt_debug("Testing connector %s using pipe %s plane %d\n",
+		igt_output_name(output), kmstest_pipe_name(pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -285,8 +285,8 @@ test_plane_position_with_output(data_t *data,
 	sprite = igt_output_get_plane(output, plane);
 
 	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
-		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
-				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
+		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
+			primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
 		return;
 	}
 
@@ -415,8 +415,8 @@ test_plane_panning_with_output(data_t *data,
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
 
-	igt_info("Testing connector %s using pipe %s, mode %s\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
+	igt_debug("Testing connector %s using pipe %s, mode %s\n",
+		igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
 
 	create_fb_for_mode_panning(data, mode, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
@@ -889,9 +889,9 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-		 kmstest_pipe_name(pipe), plane->index);
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		kmstest_pipe_name(pipe), plane->index);
 
 	return test_format_plane_colors(data, pipe, plane,
 					format, modifier,
@@ -927,11 +927,13 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
-				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-				 igt_color_encoding_to_str(e),
-				 igt_color_range_to_str(r),
-				 kmstest_pipe_name(pipe), plane->index);
+			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
+				" (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
+				IGT_MODIFIER_ARGS(modifier),
+				igt_color_encoding_to_str(e),
+				igt_color_range_to_str(r),
+				kmstest_pipe_name(pipe),
+				plane->index);
 
 			result &= test_format_plane_colors(data, pipe, plane,
 							   format, modifier,
@@ -1043,9 +1045,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
-		 kmstest_pipe_name(pipe), plane->index);
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+		IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+		kmstest_pipe_name(pipe), plane->index);
 
 	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
 
@@ -1089,9 +1091,12 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			};
 
 			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
-					 kmstest_pipe_name(pipe), plane->index);
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+					IGT_MODIFIER_FMT " on %s.%u\n",
+					IGT_FORMAT_ARGS(f.format),
+					IGT_MODIFIER_ARGS(f.modifier),
+					kmstest_pipe_name(pipe),
+					plane->index);
 				continue;
 			}
 
-- 
2.34.1

