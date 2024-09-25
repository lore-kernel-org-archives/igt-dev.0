Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BB6CCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 17:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FBC10E10A;
	Wed, 25 Sep 2024 17:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U08+uFC/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6D110E10A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727284292; x=1758820292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wjGvvywHPk8076J54S4dm8ED85NVyPU9gf7WeNUpyuU=;
 b=U08+uFC/2p906Y8b9d/eUYrfZaRCymLpcsffQUkFcCEw/mF4wOmlq2Jx
 jRSIsQHcTOti2eEuRjWKj68Iz3d/1o25mCqX69EQlpaHBbJy8tpWlTn2h
 BKjBRB4vVYp7j91/mFwu2Pe5hlF6Yy+bvU7aJCw4MiVK4y+Ww336ZEpv6
 r8UHGHJX7NXcQiSjs/iYMeR85TDtJ9AJ9HmGvKMTYHw8FM8gstAbq2Y8O
 ZtTW3Lk17JCZi4ZcVWBfi1nrprM7S3BSbTN6FR0pC8E9i2pvroKL91KFS
 9ugfe2qg1L9UTQFM1o5mIIBvETGyCUrOKPgPHSFtjjZRO5CN9PwoWJTWu A==;
X-CSE-ConnectionGUID: aFPRU73JSXKjJ4GZDSIDSQ==
X-CSE-MsgGUID: M0Zi+mXuTo2yN59WJ7QrRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26502178"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26502178"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 10:11:15 -0700
X-CSE-ConnectionGUID: 7rkD+WGXSgKKhXLXdb0TsA==
X-CSE-MsgGUID: CQc3Vef7RXW7CZJDMOHG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102672589"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 10:11:12 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/kms_async_flips: subtests to validate
 async flips on atomic path
Date: Wed, 25 Sep 2024 22:40:36 +0530
Message-Id: <20240925171037.785305-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925171037.785305-1-santhosh.reddy.guddati@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
 <20240925171037.785305-1-santhosh.reddy.guddati@intel.com>
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

v2: refactor repeated code to function (Karthik)
v3: explicitly set atomic_path to false in legacy tests (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 143 ++++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 19 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..b35e29da6 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -66,6 +66,26 @@
  *
  * SUBTEST: invalid-async-flip
  * Description: Negative case to verify if changes in fb are rejected from kernel as expected
+ *
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
  */
 
 #define CURSOR_POS 128
@@ -101,6 +121,7 @@ typedef struct {
 	bool alternate_sync_async;
 	bool allow_fail;
 	struct buf_ops *bops;
+	bool atomic_path;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -255,6 +276,22 @@ static bool async_flip_needs_extra_frame(data_t *data)
 	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
 }
 
+static int perform_flip(data_t *data, int frame, int flags)
+{
+	int ret;
+
+	if (!data->atomic_path) {
+		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+								data->bufs[frame % NUM_FBS].fb_id,
+								flags, data);
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
@@ -271,9 +308,7 @@ static void test_async_flip(data_t *data)
 		if (data->alternate_sync_async) {
 			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
 
-			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-					      data->bufs[frame % NUM_FBS].fb_id,
-					      flags, data);
+			ret = perform_flip(data, frame, flags);
 
 			igt_assert_eq(ret, 0);
 
@@ -282,19 +317,16 @@ static void test_async_flip(data_t *data)
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
@@ -419,9 +451,7 @@ static void test_cursor(data_t *data)
 
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
 
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-			      data->bufs[0].fb_id,
-			      flags, data);
+	ret = perform_flip(data, 0, flags);
 
 	igt_assert_eq(ret, 0);
 
@@ -457,14 +487,12 @@ static void test_invalid(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* first async flip is expected to allow modifier changes */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+	ret = perform_flip(data, 1, DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT);
 	igt_assert_eq(ret, 0);
 	wait_flip_event(data);
 
 	/* subsequent async flips should reject modifier changes */
-	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
-			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+	ret = perform_flip(data, 0, DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT);
 	igt_assert(ret == -EINVAL);
 
 	/* TODO: Add verification for changes in stride, pixel format */
@@ -604,6 +632,17 @@ static void test_crc(data_t *data)
 
 	queue_vblank(data);
 
+	/* 
+	 * TODO: 
+	 * Check if the first frame modeset is required.
+	 * Atomic commit is failing with invalid parameter when async flip with 
+	 * atomic is done for crc test. So, skipping the first frame modeset. 
+	 */
+	if (data->atomic_path) {
+		igt_plane_set_fb(data->plane, &data->bufs[frame]);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET , data);
+    }
+
 	start = clock_ms();
 
 	while (clock_ms() - start < 2000) {
@@ -611,8 +650,8 @@ static void test_crc(data_t *data)
 		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
 
 		data->flip_pending = true;
-		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
-				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
+
+		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT);
 		igt_assert_eq(ret, 0);
 
 		wait_events_crc(data);
@@ -699,6 +738,17 @@ igt_main
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
+		igt_describe("Wait for page flip events in between successive asynchronous flips using atomic path");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
+			data.alternate_sync_async = false;
+			data.atomic_path = true;
 			if (is_intel_device(data.drm_fd))
 				run_test_with_modifiers(&data, test_async_flip);
 			else
@@ -708,12 +758,28 @@ igt_main
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
 
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest_with_dynamic("test-time-stamp")
+		igt_subtest_with_dynamic("test-time-stamp") {
+			data.atomic_path = false;
+			run_test(&data, test_timestamp);
+		}
+
+		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank with atomic path");
+		igt_subtest_with_dynamic("test-time-stamp-atomic") {
+			data.atomic_path = true;
 			run_test(&data, test_timestamp);
+		}
 	}
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
@@ -727,6 +793,21 @@ igt_main
 			      "PSR2 sel fetch causes cursor to be added to primary plane " \
 			      "pages flips and async flip is not supported in cursor\n");
 
+		data.atomic_path = false;
+		run_test(&data, test_cursor);
+	}
+
+	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit");
+	igt_subtest_with_dynamic("test-cursor-atomic") {
+		/*
+		 * Intel's PSR2 selective fetch adds other planes to state when
+		 * necessary, causing the async flip to fail because async flip is not
+		 * supported in cursor plane.
+		 */
+		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
+			      "PSR2 sel fetch causes cursor to be added to primary plane " \
+			      "pages flips and async flip is not supported in cursor\n");
+		data.atomic_path = true;
 		run_test(&data, test_cursor);
 	}
 
@@ -739,6 +820,20 @@ igt_main
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
+		data.atomic_path = false;
+		run_test(&data, test_invalid);
+	}
+
+	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected when async flip is done using atomic path");
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
 
@@ -747,6 +842,16 @@ igt_main
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
+		data.atomic_path = false;
+		run_test(&data, test_crc);
+	}
+
+	igt_describe("Use CRC to verify async flip scans out the correct framebuffer with atomic commit");
+	igt_subtest_with_dynamic("crc-atomic") {
+		/* Devices without CRC can't run this test */
+		igt_require_pipe_crc(data.drm_fd);
+
+		data.atomic_path = true;
 		run_test(&data, test_crc);
 	}
 
-- 
2.34.1

