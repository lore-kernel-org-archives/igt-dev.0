Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975EFD6ED12
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 11:59:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550D810E3F0;
	Thu, 21 Nov 2024 11:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KC1TyqsY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EADC10E3FB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190356; x=1763726356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YaSiV6UMxWtCBXABVkGZub8rcsM5A+jMO++kSipth4=;
 b=KC1TyqsY2FaY5l6Acjk8AMsLspeJYrP2uXqnCcD5wN/NBHKMvovsKH91
 UqWU+iJ4KwN0Yd2/BD+WOpiLjkFcINGXj0DYFY8xtr/b9f0t9z1bHcgaz
 0q0xCIDTzukJF2kxXF0KIPXtwuHP6cm71UmG2lcprmUFw9D50E2FOQv7e
 qQ1djm8gQZNDLWCw1CzaCrDGooR0kzx1XRQkEXTl0LCMEi4yryzmEiMnl
 gc/KrURSo+orNW+RNnM3STbRRKi1ty/za7lN/uN8aCrMw2bo4V3II6R4p
 FpJWmgY2nsN/prpwIsh5bAT8/Lk0vnSzPyPL2+z+pB1LOe0cQRqQgZA7p Q==;
X-CSE-ConnectionGUID: V1AhvJ+STjqoP0wcpOw4Rg==
X-CSE-MsgGUID: szjyF9MNRIKvoI9dCS//zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="19888106"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="19888106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 03:59:16 -0800
X-CSE-ConnectionGUID: WINifkMwQW2ZbNkqgCrLcQ==
X-CSE-MsgGUID: koaYF/4MQwOgo5FdE5frGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="113504167"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:59:15 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v4 1/1] tests/kms_async_flips: subtests to validate async
 flips on atomic path
Date: Thu, 21 Nov 2024 17:24:51 +0530
Message-Id: <20241121115451.2917187-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
References: <20241121115451.2917187-1-santhosh.reddy.guddati@intel.com>
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

subtest to validate async flips with atomic commit

v2: refactor repeated code to function (Karthik).
explicitly set atomic_path to false in legacy tests (Karthik).

v3: fix test_crc and test_invalid subtests.

v4: Add note for invalid_test for not using perform_flip (Karthik).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 173 ++++++++++++++++++++++++++++++++++------
 1 file changed, 147 insertions(+), 26 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..6e00be3de 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -67,6 +67,26 @@
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
  *
+ * SUBTEST: alternate-sync-async-flip-atomic
+ * Description: Verify the async flip functionality and the fps during async flips using atomic path
+ *
+ * SUBTEST: async-flip-with-page-flip-events-atomic
+ * Description: Wait for page flip events in between successive asynchronous flips using atomic path
+ *
+ * SUBTEST: test-time-stamp-atomic
+ * Description: Verify that the async flip timestamp does not coincide with either previous
+ *              or next vblank when async flip is done using atomic path
+ *
+ * SUBTEST: test-cursor-atomic
+ * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
+ *
+ * SUBTEST: invalid-async-flip-atomic
+ * Description: Negative case to verify if changes in fb are rejected from kernel
+ *              as expected when async flip is done using atomic path
+ *
+ * SUBTEST: crc-atomic
+ * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
+ *
  * SUBTEST: async-flip-suspend-resume
  * Description: Verify the async flip functionality with suspend and resume cycle
  */
@@ -105,6 +125,7 @@ typedef struct {
 	bool suspend_resume;
 	bool allow_fail;
 	struct buf_ops *bops;
+	bool atomic_path;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t *data)
 	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
 }
 
+static int perform_flip(data_t *data, int frame, int flags)
+{
+	int ret;
+
+	if (!data->atomic_path) {
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
+	} else {
+		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+	}
+
+	return ret;
+}
+
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
 		if (data->alternate_sync_async) {
 			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
 
-			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-					      data->bufs[frame % NUM_FBS].fb_id,
-					      flags, data);
+			ret = perform_flip(data, frame, flags);
 
 			igt_assert_eq(ret, 0);
 
@@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
 			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
 
 			if (async_flip_needs_extra_frame(data)) {
-				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-						      data->bufs[frame % NUM_FBS].fb_id,
-						      flags, data);
 
+				ret = perform_flip(data, frame, flags);
 				igt_assert_eq(ret, 0);
 
 				wait_flip_event(data);
 			}
 		}
 
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-				      data->bufs[frame % NUM_FBS].fb_id,
-				      flags, data);
+		ret = perform_flip(data, frame, flags);
+
 		if (frame == 1 && data->allow_fail)
 			igt_skip_on(ret == -EINVAL);
 		else
@@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
 
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
 
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-			      data->bufs[0].fb_id,
-			      flags, data);
+	ret = perform_flip(data, 0, flags);
 
 	igt_assert_eq(ret, 0);
 
@@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
 	int ret, width, height;
 	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
+	int flags;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
+	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
+
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_X_TILED, &fb[0]);
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -465,16 +497,30 @@ static void test_invalid(data_t *data)
 	igt_plane_set_fb(data->plane, &fb[0]);
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* first async flip is expected to allow modifier changes */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
-	igt_assert_eq(ret, 0);
-	wait_flip_event(data);
+	/* Note: Not using perform_flips here as this subtest passes
+	 * the fb_id parameter differently.
+	 */
+	if (!data->atomic_path) {
+		/* first async flip is expected to allow modifier changes */
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flags, data);
+		igt_assert_eq(ret, 0);
 
-	/* subsequent async flips should reject modifier changes */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
-	igt_assert(ret == -EINVAL);
+		wait_flip_event(data);
+
+		/* subsequent async flips should reject modifier changes */
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flags, data);
+		igt_assert(ret == -EINVAL);
+	} else {
+		igt_plane_set_fb(data->plane, &fb[1]);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+		igt_assert_eq(ret, 0);
+
+		wait_flip_event(data);
+
+		igt_plane_set_fb(data->plane, &fb[0]);
+		ret = igt_display_try_commit_atomic(&data->display, flags, data);
+		igt_assert(ret == -EINVAL);
+	}
 
 	/* TODO: Add verification for changes in stride, pixel format */
 
@@ -588,6 +634,8 @@ static void test_crc(data_t *data)
 	int ret, width, height;
 	drmModeModeInfoPtr mode;
 
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	/* make things faster by using a smallish mode */
 	mode = &data->output->config.connector->modes[0];
 	width = mode->hdisplay;
@@ -620,8 +668,9 @@ static void test_crc(data_t *data)
 		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
 
 		data->flip_pending = true;
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
-				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+
+		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
+				   DRM_MODE_PAGE_FLIP_EVENT);
 		igt_assert_eq(ret, 0);
 
 		wait_events_crc(data);
@@ -708,6 +757,18 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			data.alternate_sync_async = false;
+			data.atomic_path = false;
+			if (is_intel_device(data.drm_fd))
+				run_test_with_modifiers(&data, test_async_flip);
+			else
+				run_test(&data, test_async_flip);
+		}
+
+		igt_describe("Wait for page flip events in between successive "
+			     "asynchronous flips using atomic path");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
+			data.alternate_sync_async = false;
+			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -717,12 +778,30 @@ igt_main
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			data.alternate_sync_async = true;
+			data.atomic_path = false;
+			run_test(&data, test_async_flip);
+		}
+
+		igt_describe("Alternate between sync and async flips using atomic path");
+		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
+			data.alternate_sync_async = true;
+			data.atomic_path = true;
 			run_test(&data, test_async_flip);
 		}
 
-		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest_with_dynamic("test-time-stamp")
+		igt_describe("Verify that the async flip timestamp does not "
+			     "coincide with either previous or next vblank");
+		igt_subtest_with_dynamic("test-time-stamp") {
+			data.atomic_path = false;
 			run_test(&data, test_timestamp);
+		}
+
+		igt_describe("Verify that the async flip timestamp does not coincide "
+			     "with either previous or next vblank with atomic path");
+		igt_subtest_with_dynamic("test-time-stamp-atomic") {
+			data.atomic_path = true;
+			run_test(&data, test_timestamp);
+		}
 	}
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
@@ -733,9 +812,25 @@ igt_main
 		 * supported in cursor plane.
 		 */
 		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
-			      "PSR2 sel fetch causes cursor to be added to primary plane " \
+			      "PSR2 sel fetch causes cursor to be added to primary plane "
 			      "pages flips and async flip is not supported in cursor\n");
 
+		data.atomic_path = false;
+		run_test(&data, test_cursor);
+	}
+
+	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
+		     "async flip with atomic commit");
+	igt_subtest_with_dynamic("test-cursor-atomic") {
+		/*
+		 * Intel's PSR2 selective fetch adds other planes to state when
+		 * necessary, causing the async flip to fail because async flip is not
+		 * supported in cursor plane.
+		 */
+		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
+			      "PSR2 sel fetch causes cursor to be added to primary plane "
+			      "pages flips and async flip is not supported in cursor\n");
+		data.atomic_path = true;
 		run_test(&data, test_cursor);
 	}
 
@@ -748,6 +843,21 @@ igt_main
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
+		data.atomic_path = false;
+		run_test(&data, test_invalid);
+	}
+
+	igt_describe("Negative case to verify if changes in fb are rejected "
+		     "from kernel as expected when async flip is done using atomic path");
+	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
+		data.atomic_path = true;
+		/* TODO: support more vendors */
+		igt_require(is_intel_device(data.drm_fd));
+		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
+						       I915_FORMAT_MOD_X_TILED));
+		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
+						       I915_FORMAT_MOD_Y_TILED));
+
 		run_test(&data, test_invalid);
 	}
 
@@ -756,6 +866,17 @@ igt_main
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
+		data.atomic_path = false;
+		run_test(&data, test_crc);
+	}
+
+	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
+		     "with atomic commit");
+	igt_subtest_with_dynamic("crc-atomic") {
+		/* Devices without CRC can't run this test */
+		igt_require_pipe_crc(data.drm_fd);
+
+		data.atomic_path = true;
 		run_test(&data, test_crc);
 	}
 
-- 
2.34.1

