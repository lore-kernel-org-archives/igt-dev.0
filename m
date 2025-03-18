Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49311C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 05:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83310E1B0;
	Tue, 18 Mar 2025 05:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQb+MdqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724D110E1B0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 05:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742276761; x=1773812761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R1F6daODhkQ2ljjO/nY0EbQqO+AFTBLr1d7gq2qjGjA=;
 b=kQb+MdqElPH0CWGOg6PTKArdgf1SHHYjXK3MkiJDx6zCvPHX2Stoekd6
 L/VmGw1TOh45Vr2e6rzPMejAXBFg6dqHDZfjSmeFc71AaZlZYRFCPX4x5
 gGIUOhbqcjc3jJIPLqUBD0XbpPW7XilSz28KzK0qGA093+4h7bsrQUF+U
 3KyegmkpcG9bNibKKB166sxPc1SNGtVH6r4SlLgWglk/suMT1slx/1kga
 k/MN0E0rtQO/0mdeDc0ZztTMGbxJHYA+HAxI+2vnhVK6Cs6wutTQMp3rK
 CqUaE+guXczNN1knd8zi9XlTmQy7TvT8x369XgqhqTsd0qBB963RKOIGS A==;
X-CSE-ConnectionGUID: 839zZ2E5Spap7e1tASCZwQ==
X-CSE-MsgGUID: /21VRbVeR1WyDqk5nCUnxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="30983416"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="30983416"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:46:01 -0700
X-CSE-ConnectionGUID: Qxn7e+4jR8KJab24tQTFtA==
X-CSE-MsgGUID: MXYFeir9RQKA3oCZ47zVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122905290"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:45:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Tue, 18 Mar 2025 11:10:45 +0530
Message-Id: <20250318054045.2611239-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318054045.2611239-1-santhosh.reddy.guddati@intel.com>
References: <20250318054045.2611239-1-santhosh.reddy.guddati@intel.com>
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

Utilise IN_FORMATS_ASYNC property exposed to get the list of
async supported modifier/format pair and improve the test coverage by
iterating through all the supported modifier format pairs.

V2: Improve run_test_with_modifiers to set data formats based on async
    formats.
    Update make_fb to use data formats instead of hard coded format

V3: Update commit message, remove complicated iterations (Chaitanya)

V4: Reduce the format+modifier combinations to reduce time needed to
    execute the tests. (Chaitanya)

V5: Remove unnecessary check for reduced formats. (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 71 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..4852e762e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -36,6 +36,7 @@
 #include "igt.h"
 #include "igt_aux.h"
 #include "igt_psr.h"
+#include "igt_vec.h"
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <poll.h>
@@ -122,8 +123,14 @@ typedef struct {
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
+	unsigned int plane_format;
 } data_t;
 
+struct format_mod {
+	uint64_t modifier;
+	uint32_t format;
+};
+
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -193,7 +200,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (NUM_FBS * 2);
 
-	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
 			    data->modifier, 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -710,21 +717,68 @@ static void run_test(data_t *data, void (*test)(data_t *))
 	}
 }
 
+static bool skip_async_format_mod(data_t *data,
+			    uint32_t format, uint64_t modifier,
+			    struct igt_vec *tested_formats)
+{
+	/* igt doesn't know how to sw generate UBWC: */
+	if (is_msm_device(data->drm_fd) &&
+	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+		return true;
+
+	/* VEBOX just hangs with an actual 10bpc format */
+	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
+	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
+		return true;
+
+	/* test each format "class" only once in non-extended tests */
+	if (modifier != DRM_FORMAT_MOD_LINEAR) {
+		struct format_mod rf = {
+			.format = igt_reduce_format(format),
+			.modifier = modifier,
+		};
+
+		if (igt_vec_index(tested_formats, &rf) >= 0)
+			return true;
+
+		igt_vec_push(tested_formats, &rf);
+	}
+
+	return false;
+}
+
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
+	struct igt_vec tested_formats;
+
+	igt_vec_init(&tested_formats, sizeof(struct format_mod));
+
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
-
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
-			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			struct format_mod f = {
+				.format = data->plane->async_formats[i],
+				.modifier = data->plane->async_modifiers[i],
+			};
+
+			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+					   IGT_MODIFIER_FMT " on %s.%u\n",
+					   IGT_FORMAT_ARGS(f.format),
+					   IGT_MODIFIER_ARGS(f.modifier),
+					   kmstest_pipe_name(data->pipe),
+					   data->plane->index);
 				continue;
+			}
 
 			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = data->plane->async_modifiers[i];
+			data->plane_format = data->plane->async_formats[i];
 
-			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
+			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
-				      igt_fb_modifier_name(data->modifier)) {
+				      igt_fb_modifier_name(data->modifier),
+				      igt_format_str(data->plane_format)) {
 				      /*
 				       * FIXME: joiner+async flip is busted currently in KMD.
 				       * Remove this check once the issues are fixed in KMD.
@@ -738,6 +792,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			}
 		}
 	}
+
+	igt_vec_fini(&tested_formats);
 }
 
 static data_t data;
@@ -757,6 +813,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.34.1

