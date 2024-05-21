Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163F5C25B79
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 03:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E5A10E316;
	Tue, 21 May 2024 03:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwPRgYGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE5510E316
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 03:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716261762; x=1747797762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GbdP3aVneltrVUfTyvjix2uFxDj/yE9Yb4JfgiEirUc=;
 b=iwPRgYGfi6zuwZJR/hzWru/taM2aJTkIPGKGm//RmJUBQIXGmEvVi3cW
 5epTaGWsGyUWhOTYWv/fjRwoHM7nRDvAoAYVjsd5iFqLhta/r3m5hVGn4
 tJHrDShjnO2VW+moX6Jba4TWatyvB7Qw2/xS9m2QSzyayylb/yQutfbnd
 wdY0OvinX5Hliv6cq15SNqIRYX7eN/YN+Q7nC5xaqCFQOH1GpgNXtNFIS
 L2RQ3I85EwTLDtqfc40PAyreVdHIv9WlFoFDP5y35LxCtNh/7Jqwaij8p
 DC7h4blGGxL8GI0gJmuV7IeXpeoFKkvA8auHlb9zBXC4CKbt29hCvlhFX Q==;
X-CSE-ConnectionGUID: joI+xR2wQKG34MP1PR0AcQ==
X-CSE-MsgGUID: DKEnRbHPQHSDbHnrIpLfyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="11620481"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="11620481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 20:22:41 -0700
X-CSE-ConnectionGUID: O1f6sx35RfK5jqyqCUFuYw==
X-CSE-MsgGUID: oULjk1B9RvK62X2oCz2Fqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; d="scan'208";a="32626503"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 20 May 2024 20:22:38 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane: Implement dynamic level execution
 across multiple planes
Date: Tue, 21 May 2024 08:52:38 +0530
Message-Id: <20240521032238.456801-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

The test runs on all pipes on dynamic level to test all the supported
pixel-formats and modifiers on current plane of that pipe.

Updating the test to execute on multiple planes on dynamic level.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 107 +++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 53 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..f476ed52f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -275,7 +275,7 @@ test_plane_position_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc, crc2;
 
-	igt_info("Testing connector %s using pipe %s plane %d\n",
+	igt_debug("Testing connector %s using pipe %s plane %d\n",
 		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
@@ -285,7 +285,7 @@ test_plane_position_with_output(data_t *data,
 	sprite = igt_output_get_plane(output, plane);
 
 	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
-		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
+		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
 				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
 		return;
 	}
@@ -352,9 +352,9 @@ test_plane_position(data_t *data, enum pipe pipe)
 	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
-		test_plane_position_with_output(data, pipe, plane,
-						output, &reference_crc,
-						data->flags);
+		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
+			test_plane_position_with_output(data, pipe, plane,
+					output, &reference_crc,data->flags);
 
 	test_fini(data);
 }
@@ -415,7 +415,7 @@ test_plane_panning_with_output(data_t *data,
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
 
-	igt_info("Testing connector %s using pipe %s, mode %s\n",
+	igt_debug("Testing connector %s using pipe %s, mode %s\n",
 		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
 
 	create_fb_for_mode_panning(data, mode, &primary_fb);
@@ -449,59 +449,60 @@ test_plane_panning_with_output(data_t *data,
 static void
 test_plane_panning(data_t *data, enum pipe pipe)
 {
-	bool mode_found = false;
-	uint64_t mem_size = 0;
-	igt_output_t *output = data->output;
-	igt_crc_t ref_crc;
-
-	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+		bool mode_found = false;
+		uint64_t mem_size = 0;
+		igt_output_t *output = data->output;
+		igt_crc_t ref_crc;
 
-	test_init(data, pipe);
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
 
-	if (is_i915_device(data->drm_fd)) {
-		for_each_memory_region(r, data->drm_fd)
-			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
-				mem_size = r->cpu_size;
+		test_init(data, pipe);
 
-	}
+		if (is_i915_device(data->drm_fd)) {
+			for_each_memory_region(r, data->drm_fd)
+				if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
+					mem_size = r->cpu_size;
+		}
 
-	if (is_xe_device(data->drm_fd)) {
-		struct drm_xe_mem_region *memregion;
-		uint64_t memreg = all_memory_regions(data->drm_fd), region;
+		if (is_xe_device(data->drm_fd)) {
+			struct drm_xe_mem_region *memregion;
+			uint64_t memreg = all_memory_regions(data->drm_fd), region;
 
-		xe_for_each_mem_region(data->drm_fd, memreg, region) {
-			memregion = xe_mem_region(data->drm_fd, region);
+			xe_for_each_mem_region(data->drm_fd, memreg, region) {
+				memregion = xe_mem_region(data->drm_fd, region);
 
-			if (XE_IS_CLASS_VRAM(memregion))
-				mem_size = memregion->total_size;
+				if (XE_IS_CLASS_VRAM(memregion))
+					mem_size = memregion->total_size;
+			}
 		}
-	}
 
-	for_each_connector_mode(output) {
-		drmModeModeInfo *m = &output->config.connector->modes[j__];
-		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
+		for_each_connector_mode(output) {
+			drmModeModeInfo *m = &output->config.connector->modes[j__];
+			uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
 
-		/* test allocates 2 double-dim fbs, add one more, to be safe */
-		if (mem_size && 3 * 4 * fb_size > mem_size) {
-			igt_debug("Skipping mode %s due to low memory\n", m->name);
-			continue;
-		}
+			/* test allocates 2 double-dim fbs, add one more, to be safe */
+			if (mem_size && 3 * 4 * fb_size > mem_size) {
+				igt_debug("Skipping mode %s due to low memory\n", m->name);
+				continue;
+			}
 
-		igt_output_override_mode(output, m);
-		mode_found = true;
-		break;
-	}
-	igt_require(mode_found);
+			igt_output_override_mode(output, m);
+			mode_found = true;
+			break;
+		}
+		igt_require(mode_found);
 
-	if (data->flags & TEST_PANNING_TOP_LEFT)
-		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
-	else
-		test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
+		if (data->flags & TEST_PANNING_TOP_LEFT)
+			test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
+		else
+			test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
 
-	test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
+		test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
 
-	test_fini(data);
+		test_fini(data);
+	}
 }
 
 static const color_t colors_extended[] = {
@@ -889,7 +890,7 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
@@ -927,7 +928,7 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
+			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
 				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
 				 igt_color_encoding_to_str(e),
 				 igt_color_range_to_str(r),
@@ -1043,7 +1044,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
@@ -1089,7 +1090,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			};
 
 			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
 					 kmstest_pipe_name(pipe), plane->index);
 				continue;
@@ -1211,7 +1212,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
+			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
@@ -1317,8 +1319,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
-			test(data, pipe);
+		test(data, pipe);
 
 		if (is_pipe_limit_reached(++count))
 			break;
-- 
2.34.1

