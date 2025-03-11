Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC76C28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 08:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA60310E537;
	Tue, 11 Mar 2025 08:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PO9fMF28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA16D10E537
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741683544; x=1773219544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sg3RqK0WmxX1MU+a3pW3PqM60kMeO1M6gcphurg9Jd4=;
 b=PO9fMF286SmTyeQQLFg8OL5rFI4/wGInyaMR3vuytw0YJPo4aZlYpzUk
 dxiHfpuucZe2Gyw9ekw7U2xOmmmr5LQQ/oHpocg5O5eDnbjdADRTS3xA6
 a7dGL6jqyAmvBFpNWBD6XWw23JD68+h/TZgySSEnT62J5bm6NQHRF0EDU
 GWJT7ryCoTTrGIIsxFVSYO+q6kt/4ztKPB5hgK/mwgDaMXxFr+30Ihax2
 z1VEAXfTG07mfK60oivnV74MS4XGAloeCeBXDC3nbRE9LGQiX6LWdGrGw
 npBF/YsEa5Rd8t4VU1uxQaFsn0C0bE/1UzmaMO6YinAXB4mIWRtSDZKZN A==;
X-CSE-ConnectionGUID: opmFXGmcTI+DrtthHvwudQ==
X-CSE-MsgGUID: r8iOw1jcTrWtInvKMJic+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42822036"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42822036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:59:04 -0700
X-CSE-ConnectionGUID: fl9I5+ojRHujcwlHRKdSOg==
X-CSE-MsgGUID: NQm9L1lOTViDj6B7/Cnvzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="120211277"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 01:59:02 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Tue, 11 Mar 2025 14:24:22 +0530
Message-Id: <20250311085422.2573860-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 76 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..0e2b0afec 100644
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
@@ -710,21 +717,75 @@ static void run_test(data_t *data, void (*test)(data_t *))
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
+	struct format_mod ref = {};
+	struct igt_vec tested_formats;
+
+	ref.format = DRM_FORMAT_ARGB8888;
+	ref.modifier = DRM_FORMAT_MOD_LINEAR;
+
+	igt_vec_init(&tested_formats, sizeof(struct format_mod));
+
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			struct format_mod f = {
+				.format = data->plane->async_formats[i],
+				.modifier = data->plane->async_modifiers[i],
+			};
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
-			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
+			if (ref.format == f.format && ref.modifier == f.modifier)
 				continue;
 
+			if (skip_async_format_mod(data, f.format, f.modifier, &tested_formats)) {
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+					   IGT_MODIFIER_FMT " on %s.%u\n",
+					   IGT_FORMAT_ARGS(f.format),
+					   IGT_MODIFIER_ARGS(f.modifier),
+					   kmstest_pipe_name(data->pipe),
+					   data->plane->index);
+				continue;
+			}
+
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
@@ -738,6 +799,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			}
 		}
 	}
+
+	igt_vec_fini(&tested_formats);
 }
 
 static data_t data;
@@ -757,6 +820,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.34.1

