Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AABAC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 06:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB910E890;
	Fri, 31 May 2024 06:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWtF2R3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9433010E70B
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717135590; x=1748671590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fmIiC4+oeBQqAGJYkpcZ9Oqug4yWOpl6Koc7ZmzHJLc=;
 b=cWtF2R3P7FPm9j/whTlSB4Gn9gNulbAPx2z0DUgavlklaCLkacixPfZ3
 P3S3Dtv1x/J/uwkhgccoMDUGvkkIxwtVa2BQASqUB1pqf0PI+/w3SFxvy
 /Sb+UhYRKAs4YXqfY43a55kOyxhpHFnjKwijQ5X8IQs4K1iIFAgI0vRou
 uYK5TkYhalYG+NRBctpp8jCsGtYh4L1klz7btygrQs8o1kw+9YckAGeAH
 kbpKNlVKWlVL5k8+MiMGrfeLvrDYExyfdxnJhhSx1em+N7a993XicFizi
 qMXD34vQQEN5Jvd40LEPlbC+zMsc9LiSXIyGiw/751I0hUx58RT6iUqVS Q==;
X-CSE-ConnectionGUID: OXkHXgUTTFGZyc2x9Ik+PQ==
X-CSE-MsgGUID: CSIPmYXzSpWaVi6siyFeJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13534263"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13534263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:06:29 -0700
X-CSE-ConnectionGUID: U+JfD8VrRoGAJRR6T2t1gw==
X-CSE-MsgGUID: UcehH1ChQeydDZ4WKbh6Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="35993418"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa007.fm.intel.com with ESMTP; 30 May 2024 23:06:26 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/kms_plane: Reduce CI logging
Date: Fri, 31 May 2024 11:36:21 +0530
Message-Id: <20240531060622.489881-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531060622.489881-1-pranay.samala@intel.com>
References: <20240531060622.489881-1-pranay.samala@intel.com>
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

v3: Cleared the indentation issues with "--strict" parameter (Juha-pekka)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..7a17b700c 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -275,8 +275,8 @@ test_plane_position_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc, crc2;
 
-	igt_info("Testing connector %s using pipe %s plane %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
+	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_name(output),
+		  kmstest_pipe_name(pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -285,8 +285,8 @@ test_plane_position_with_output(data_t *data,
 	sprite = igt_output_get_plane(output, plane);
 
 	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
-		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
-				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
+		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
+			  primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
 		return;
 	}
 
@@ -415,8 +415,8 @@ test_plane_panning_with_output(data_t *data,
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
 
-	igt_info("Testing connector %s using pipe %s, mode %s\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
+	igt_debug("Testing connector %s using pipe %s, mode %s\n", igt_output_name(output),
+		  kmstest_pipe_name(pipe), mode->name);
 
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
+		  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+		  kmstest_pipe_name(pipe), plane->index);
 
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
+		  IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+		  kmstest_pipe_name(pipe), plane->index);
 
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

