Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97ECCF9C69
	for <igt-dev@archiver.kernel.org>; Sat, 21 Sep 2024 15:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A42A10E07B;
	Sat, 21 Sep 2024 15:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7Qf9URa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021C010E07B
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Sep 2024 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726932912; x=1758468912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iE96obttZJEW5N6SJZMQnbp8uTp7DOjGQBRqTZt++UE=;
 b=C7Qf9URa7yvsqvCtIwCcRLuDalUv+L94fPMGocE8+ameDtaMnPCbFbCi
 1jfMK8zg6zbDFQLLr9ljzjLHpJtrS0H38fAVcng22UsYk4j4M7W6Totnp
 1zqXHnVEkA8YWkBD32T3y8vlUl4bqzawcZTFmLylKE1wzsb4In/KXIQBe
 kg1BbKSYS9WBBRe8e2RgdNTMpdxpumq2GAWdnn5hF/nEdrjayh9xXOeJc
 ocQwV9+OKrOPsnvqqY+ZnNvqyyl5MiYVz0fautODbHVoDtRExiYon/9ET
 +E57VFNu7wBsU564ItV4qQJPMzOOUDnJeGIo89z6Ips5JzcHd5rKrCaYq A==;
X-CSE-ConnectionGUID: jH+RNMt7R+yoFziO3HuC9A==
X-CSE-MsgGUID: MeO1sLuBQhmIWDrMQ45jAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36512833"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="36512833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2024 08:35:12 -0700
X-CSE-ConnectionGUID: qFDc2GolR8W8KuyEBGDYVw==
X-CSE-MsgGUID: whgVoG5ZTz65DhkCIU4x0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; d="scan'208";a="71439423"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 08:35:10 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_async_flips: subtests to validate
 async flips on atomic path
Date: Sat, 21 Sep 2024 21:04:49 +0530
Message-Id: <20240921153450.668896-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240921153450.668896-1-santhosh.reddy.guddati@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
 <20240921153450.668896-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 134 ++++++++++++++++++++++++++++++++++------
 1 file changed, 116 insertions(+), 18 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5b70c4033..0d4759ff5 100644
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
@@ -705,15 +744,38 @@ igt_main
 				run_test(&data, test_async_flip);
 		}
 
+		igt_describe("Wait for page flip events in between successive asynchronous flips using atomic path");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
+			data.alternate_sync_async = false;
+			data.atomic_path = true;
+			if (is_intel_device(data.drm_fd))
+				run_test_with_modifiers(&data, test_async_flip);
+			else
+				run_test(&data, test_async_flip);
+		}
+
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
 			data.alternate_sync_async = true;
 			run_test(&data, test_async_flip);
 		}
 
+		igt_describe("Alternate between sync and async flips using atomic path");
+		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
+			data.alternate_sync_async = true;
+			data.atomic_path = true;
+			run_test(&data, test_async_flip);
+		}
+
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
 		igt_subtest_with_dynamic("test-time-stamp")
 			run_test(&data, test_timestamp);
+
+		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank with atomic path");
+		igt_subtest_with_dynamic("test-time-stamp-atomic") {
+			data.atomic_path = true;
+			run_test(&data, test_timestamp);
+		}
 	}
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
@@ -730,6 +792,20 @@ igt_main
 		run_test(&data, test_cursor);
 	}
 
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
+		run_test(&data, test_cursor);
+	}
+
 	igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
 	igt_subtest_with_dynamic("invalid-async-flip") {
 		/* TODO: support more vendors */
@@ -742,6 +818,19 @@ igt_main
 		run_test(&data, test_invalid);
 	}
 
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
+		run_test(&data, test_invalid);
+	}
+
 	igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
 	igt_subtest_with_dynamic("crc") {
 		/* Devices without CRC can't run this test */
@@ -750,6 +839,15 @@ igt_main
 		run_test(&data, test_crc);
 	}
 
+	igt_describe("Use CRC to verify async flip scans out the correct framebuffer with atomic commit");
+	igt_subtest_with_dynamic("crc-atomic") {
+		/* Devices without CRC can't run this test */
+		igt_require_pipe_crc(data.drm_fd);
+
+		data.atomic_path = true;
+		run_test(&data, test_crc);
+	}
+
 	igt_fixture {
 		for (i = 0; i < NUM_FBS; i++)
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
-- 
2.34.1

