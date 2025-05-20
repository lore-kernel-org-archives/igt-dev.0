Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6800C3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AC10E453;
	Tue, 20 May 2025 06:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zh9Fh2BE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE9F10E42D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747723248; x=1779259248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fv5aY++RpBJKqt5y4MUnrTPrc8sUJVtKstjvAGyvOT0=;
 b=Zh9Fh2BEttheelbv5AMAV9UkrLyhm1n6sO7lT5gzA5Pagz5inpuhIqci
 qsK8fNbWltc6QnMsbjE2dTj4G+4oZ3xGYnPfwxHxzSc9onv3RvK8WNrWr
 Ku02IY5XNxmR67ePJz2O3+R6x/lw2vstJuwVlfheQEomoEiUD/g9sZREq
 IkBCW/Tqhlc1hBOBG38UfYI/HT28XlNbh0431frafgSxksJ1OPXmGwYcW
 OchxviHZ/G4empvJARp+607l+K/85kSc8iXhpNJpMOaGQGYpjlBXvDDWD
 mXeOv7TlJkIbHcbhhz3P9wcBHi9mGjg1xZ6dX1KLttQ1wpZc9u60RTW/Z A==;
X-CSE-ConnectionGUID: /jq7i9tvQ9Grf09hGjeDYg==
X-CSE-MsgGUID: CrNZzrjIRVyVRyMpA43GOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48755449"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48755449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:48 -0700
X-CSE-ConnectionGUID: xo8ljumAT5qf/wOznvSJ/w==
X-CSE-MsgGUID: S5cqnduLQbWn4+d9L+QNXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140105744"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:40:46 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v9 3/4] tests/kms_async_flips: Add test for all async format
 modifiers
Date: Tue, 20 May 2025 12:01:22 +0530
Message-Id: <20250520063123.3309554-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520063123.3309554-1-santhosh.reddy.guddati@intel.com>
References: <20250520063123.3309554-1-santhosh.reddy.guddati@intel.com>
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
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 119 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 3c6b7868c..44bc38c71 100644
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
@@ -96,6 +97,9 @@
  * SUBTEST: async-flip-with-page-flip-events-linear-atomic
  * Description: Verify the async flip functionality and the fps during async flips
  *		with linear modifier in Atomic API
+ *
+ * SUBTEST: async-flip-with-all-modifiers-formats
+ * Description: Verify the async flip functionality with all supported modifiers and formats
  */
 
 #define CURSOR_POS 128
@@ -137,8 +141,15 @@ typedef struct {
 	bool atomic_path;
 	bool overlay_path;
 	bool linear_modifier;
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
@@ -211,7 +222,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (NUM_FBS * 2);
 
-	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
 			    data->modifier, 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -408,6 +419,15 @@ static void test_async_flip(data_t *data)
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
@@ -432,10 +452,18 @@ static void test_async_flip(data_t *data)
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
@@ -803,6 +831,87 @@ static void run_test(data_t *data, void (*test)(data_t *))
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
 	if (data->atomic_path)
@@ -863,6 +972,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
@@ -1028,6 +1138,11 @@ igt_main
 		run_test(&data, test_async_flip);
 	}
 
+	igt_describe("Verify async flip with all supported modifier and format combinations");
+	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
+		run_test_with_async_format_modifiers(&data, test_async_flip);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++) {
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.34.1

