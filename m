Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EA1D6ED19
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1CB10E401;
	Thu, 21 Nov 2024 12:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3guA1Bq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BCF10E401
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192415; x=1763728415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lFE4GO3HvRvYEFMWxxP1H7V7lfMTO02yx4lDzuMTLzE=;
 b=A3guA1BqRtLzwGV7q5U/YwLsWgX97FcmLGh7uFXrRNCejAowpLEeiAQ2
 iK8Jb7NfKGyBzZMLn2KY3VoGZA2qJyO+FoCe14wlFhemExUnyzFvMwYrp
 U5u12Yt9zPdxsJsR0czI9vR8xgkMYOIkG3gO3Ozlj/bcV+6OpHSfB/w0c
 G1HwQDZ2sOjRfROKhQ+JYnXxGj6IAtV7DffjpRtVcGBXyWeVEe5NWuNOW
 Ht+UeS6QiQpXfGJS8JgcHBC4q1+47v7pVHepL2ceLrWWi887kpMao2BoX
 eimMiNCOZ1W5snHWEKah/Pwlatg72hPXkcKQVnk/xVVrAys6m/PLuhylo Q==;
X-CSE-ConnectionGUID: tgpHMZY5SiShvZMvMyF6AA==
X-CSE-MsgGUID: d2uVOh7ARyuQ/Cd8Sb8V0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43697401"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43697401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:34 -0800
X-CSE-ConnectionGUID: xZrIqfV5SuaiVj6D+V3dEg==
X-CSE-MsgGUID: 1POmfhz3R+mY0/e0Ugdlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95298366"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:33 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v4 5/6] tests/gem_gpgpu_fill: Add width/height/x/y
 command line args
Date: Thu, 21 Nov 2024 13:33:07 +0100
Message-Id: <20241121123308.98158-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
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

I've noticed shaders/pipelines have limitation to work on 16B
boundaries (due to SIMD16). So to play with different surface sizes
and offsets add W/H/X/Y switches.

There's no problem at all not all sizes/offsets are supported as we
would like to have, we use gpgpu fill to verify compute workload so
if we won't notice gpu hang that's fine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 62 ++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index 36c60e75f0..ec34e95844 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -68,6 +68,10 @@
 #define COLOR_4C	0x4c
 
 static bool dump_surface;
+static uint32_t surfwidth = WIDTH;
+static uint32_t surfheight = HEIGHT;
+static uint32_t start_x;
+static uint32_t start_y;
 
 typedef struct {
 	int drm_fd;
@@ -103,17 +107,20 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
 	return buf;
 }
 
-static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
+static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
 {
 	uint8_t val;
 
-	val = ptr[y * WIDTH + x];
+	val = ptr[y * width + x];
 	igt_assert_f(val == color,
 		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
 		     color, val, x, y);
 }
 
-static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
+static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
+		       uint32_t surf_width, uint32_t surf_height,
+		       uint32_t x, uint32_t y,
+		       uint32_t width, uint32_t height)
 {
 	struct intel_buf *buf;
 	uint8_t *ptr;
@@ -123,17 +130,17 @@ static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
 	ptr = gem_mmap__device_coherent(data->drm_fd, buf->handle, 0,
 					buf->surface[0].size, PROT_READ);
 
-	for (i = 0; i < WIDTH; i++)
-		for (j = 0; j < HEIGHT; j++)
-			buf_check(ptr, i, j, COLOR_88);
+	for (i = 0; i < surf_width; i++)
+		for (j = 0; j < surf_height; j++)
+			buf_check(ptr, surf_width, i, j, COLOR_88);
 
 	fill(data->drm_fd, buf, 0, 0, WIDTH / 2, HEIGHT / 2, COLOR_4C);
 
 	if (dump_surface) {
-		for (j = 0; j < HEIGHT; j++) {
+		for (j = 0; j < surf_height; j++) {
 			igt_info("[%04x] ", j);
-			for (i = 0; i < WIDTH; i++) {
-				igt_info("%02x", ptr[j * HEIGHT + i]);
+			for (i = 0; i < surf_width; i++) {
+				igt_info("%02x", ptr[j * surf_height + i]);
 				if (i % 4 == 3)
 					igt_info(" ");
 			}
@@ -141,12 +148,13 @@ static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
 		}
 	}
 
-	for (i = 0; i < WIDTH; i++)
-		for (j = 0; j < HEIGHT; j++)
-			if (i < WIDTH / 2 && j < HEIGHT / 2)
-				buf_check(ptr, i, j, COLOR_4C);
+	for (i = 0; i < surf_width; i++)
+		for (j = 0; j < surf_height; j++)
+			if (i >= x && i < width + x &&
+			    j >= y && j < height + y)
+				buf_check(ptr, surf_width, i, j, COLOR_4C);
 			else
-				buf_check(ptr, i, j, COLOR_88);
+				buf_check(ptr, surf_height, i, j, COLOR_88);
 
 	munmap(ptr, buf->surface[0].size);
 }
@@ -157,6 +165,18 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'd':
 		dump_surface = true;
 		break;
+	case 'W':
+		surfwidth = atoi(optarg);
+		break;
+	case 'H':
+		surfheight = atoi(optarg);
+		break;
+	case 'X':
+		start_x = atoi(optarg);
+		break;
+	case 'Y':
+		start_y = atoi(optarg);
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -167,10 +187,14 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 const char *help_str =
 	"  -d\tDump surface\n"
+	"  -W\tWidth (default 64)\n"
+	"  -H\tHeight (default 64)\n"
+	"  -X\tX start (aligned to 4)\n"
+	"  -Y\tY start (aligned to 1)\n"
 	;
 
 
-igt_main_args("d", NULL, help_str, opt_handler, NULL)
+igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
@@ -193,6 +217,8 @@ igt_main_args("d", NULL, help_str, opt_handler, NULL)
 		region_set = get_memory_region_set(region_info,
 						   I915_SYSTEM_MEMORY,
 						   I915_DEVICE_MEMORY);
+
+		start_x = ALIGN(start_x, 16);
 	}
 
 	igt_subtest_with_dynamic("basic") {
@@ -203,7 +229,11 @@ igt_main_args("d", NULL, help_str, opt_handler, NULL)
 			uint32_t id = igt_collection_get_value(region, 0);
 
 			igt_dynamic(name)
-				gpgpu_fill(&data, fill_fn, id);
+				gpgpu_fill(&data, fill_fn, id,
+					   surfwidth, surfheight,
+					   start_x, start_y,
+					   surfwidth / 2,
+					   surfheight / 2);
 
 			free(name);
 		}
-- 
2.34.1

