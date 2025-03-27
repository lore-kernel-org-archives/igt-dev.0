Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F6C3600E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 09:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA5610E267;
	Thu, 27 Mar 2025 09:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUvEP7ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFECE10E0F9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743066881; x=1774602881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HADe7PGpF5A0kk79d7oNUz0F+afRJFLqCk2fIari0so=;
 b=LUvEP7ijitJZ+7P4DvqOSEGt2juZpKO37tqAa2s/u7K4S7yWrxUngygn
 Dx3f8r0/vmru7oEbCHlIUzwoLu9be24sxxDhccwXlmRnygr7FJGMD/8ag
 xaOQ7cYwnbmj+MYIR1h0K5U2/UhvzR0p/Wfwzoe0eowIIJGFa1JMwyspe
 tK1Vl87ipzyEq4WyjhHhpZXGSUzQj6/fTNSuciLuV2mBgb30MaPliKgO3
 0s1cSBW7YlVcKQN72GBKxtL4Yg4Bp66KTMtbc/580Rv5snqZdpXWjSM8i
 WoyXtyOzQxyRrcruzrQM/OAF7acloCkJ1LxGzK2OlwPLiLCWL6cw7Nq76 Q==;
X-CSE-ConnectionGUID: FunL3y65TtOAAvhwUxhobg==
X-CSE-MsgGUID: kFkL1c6QTbyAr7RAJhgLgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69749318"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69749318"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:40 -0700
X-CSE-ConnectionGUID: gf/pIP/aTSiCtOlHbiD4dg==
X-CSE-MsgGUID: vONLt4DQRK63qa56KlB+CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="162311508"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 02:14:39 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 3/4] tests/kms_async_flips: Add test for all async
 format modifiers
Date: Thu, 27 Mar 2025 14:38:50 +0530
Message-Id: <20250327090851.2740672-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
References: <20250327090851.2740672-1-santhosh.reddy.guddati@intel.com>
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

Add a new subtest to iterate through all the supported async format
modifier pair and perform async flips.

V2: Add a check to avoid sync flip on all supported modifiers
    subtest(Chaitanya).
    Refactor and clean up code , split commit to include relevant
    changes.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 119 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f26c2c3fa..c3a875ced 100644
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
@@ -85,6 +86,9 @@
  *
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
+ *
+ * SUBTEST: async-flip-with-all-modifiers-formats
+ * Description: Verify the async flip functionality with all supported modifiers and formats
  */
 
 #define CURSOR_POS 128
@@ -122,8 +126,15 @@ typedef struct {
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
+	unsigned int plane_format;
+	bool async_mod_formats;
 } data_t;
 
+struct format_mod {
+	uint64_t modifier;
+	uint32_t format;
+};
+
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
 			 unsigned int tv_usec, void *_data)
 {
@@ -193,7 +204,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (NUM_FBS * 2);
 
-	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
 			    data->modifier, 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -325,6 +336,15 @@ static void test_async_flip(data_t *data)
 			}
 		}
 
+		if (data->async_mod_formats) {
+			if (async_flip_needs_extra_frame(data)) {
+				ret = perform_flip(data, frame, flags);
+				igt_assert_eq(ret, 0);
+
+				wait_flip_event(data);
+			}
+		}
+
 		ret = perform_flip(data, frame, flags);
 
 		if (frame == 1 && data->allow_fail)
@@ -349,10 +369,18 @@ static void test_async_flip(data_t *data)
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 
+		/* Reduce test execution for all formats and modifiers.*/
+		if (data->async_mod_formats) {
+			igt_assert_f(ret == 0, "Async flip failed with %s modifier and %s format",
+				     igt_fb_modifier_name(data->modifier),
+				     igt_format_str(data->plane_format));
+			break;
+		}
+
 		frame++;
 	} while (diff.tv_sec < RUN_TIME);
 
-	if (!data->alternate_sync_async) {
+	if (!data->alternate_sync_async && !data->async_mod_formats) {
 		fps = frame * 1000 / RUN_TIME;
 		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
 			     "FPS should be significantly higher than the refresh rate\n");
@@ -711,6 +739,87 @@ static void run_test(data_t *data, void (*test)(data_t *))
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
+	struct format_mod rf = {
+		.format = igt_reduce_format(format),
+		.modifier = modifier,
+	};
+
+	if (igt_vec_index(tested_formats, &rf) >= 0)
+		return true;
+
+	igt_vec_push(tested_formats, &rf);
+
+	return false;
+}
+
+static void run_test_with_async_format_modifiers(data_t *data, void (*test)(data_t *))
+{
+	struct igt_vec tested_formats;
+
+	igt_vec_init(&tested_formats, sizeof(struct format_mod));
+
+	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
+		test_init(data);
+
+		igt_assert_f(data->plane->async_format_mod_count > 0,
+			     "No async format/modifier supported\n");
+
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
+				continue;
+			}
+
+			data->modifier = f.modifier;
+			data->plane_format = f.format;
+			data->async_mod_formats = true;
+
+			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
+				      data->output->name,
+				      igt_fb_modifier_name(data->modifier),
+				      igt_format_str(data->plane_format)) {
+				      /*
+				       * FIXME: joiner+async flip is busted currently in KMD.
+				       * Remove this check once the issues are fixed in KMD.
+				       */
+				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
+								   data->output),
+						    "Skipping, async flip not supported "
+						    "on joiner mode\n");
+				      test_init_fbs(data);
+				      test(data);
+			}
+		}
+	}
+
+	igt_vec_fini(&tested_formats);
+}
+
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
@@ -760,6 +869,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
@@ -899,6 +1009,11 @@ igt_main
 		run_test(&data, test_async_flip);
 	}
 
+	igt_describe("Verify async flip with all supported modifier and format combinations");
+	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
+		run_test_with_async_format_modifiers(&data, test_async_flip);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.25.1

