Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DDA10E31A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 12:01:55 +0000 (UTC)
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 17:31:50 +0530
Message-Id: <20220905120150.4074178-1-arun.r.murthy@intel.com>
In-Reply-To: <20220829093147.3836523-1-arun.r.murthy@intel.com>
References: <20220829093147.3836523-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCHv3 i-g-t] tests/kms_async_flips: Enable async flip
 on linear buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com, petri.latvala@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Intel Gen platforms >= GEN12, Async on linear buffer is supported,
hence enabling test for the same.

v2: Added new line character for igt_skip_on_f (Petri)
    Added new element modifier in data struct (JP)
v3: Use display ver instead of graphics ver(Jani N)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_async_flips.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 695aea74..7ff71d83 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -61,6 +61,7 @@ typedef struct {
 	bool extended;
 	enum pipe pipe;
 	bool alternate_sync_async;
+	uint64_t modifier;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -125,7 +126,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	if (is_i915_device(data->drm_fd)) {
 		igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      I915_FORMAT_MOD_X_TILED, fb);
+			      data->modifier, fb);
 		igt_draw_fill_fb(data->drm_fd, fb, 0x88);
 	} else {
 		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
@@ -594,21 +595,37 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		igt_fixture
 			require_monotonic_timestamp(data.drm_fd);
 
-		igt_describe("Wait for page flip events in between successive asynchronous flips");
+		igt_describe("Wait for page flip events in between successive asynchronous flips on X Tiled buffer");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			data.alternate_sync_async = false;
+			data.modifier = I915_FORMAT_MOD_X_TILED;
 			run_test(&data, test_async_flip);
 		}
 
+		igt_describe("Wait for page flip events in between successive asynchronous flips on Linear buffer");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			data.alternate_sync_async = false;
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			if(is_i915_device(data.drm_fd)) {
+				igt_skip_on_f(intel_display_ver(
+						intel_get_drm_devid(data.drm_fd)) < 12,
+						"Async on Linear buffer not supported\n");
+				run_test(&data, test_async_flip);
+			}
+		}
+
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
+			data.modifier = I915_FORMAT_MOD_X_TILED;
 			data.alternate_sync_async = true;
 			run_test(&data, test_async_flip);
 		}
 
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest_with_dynamic("test-time-stamp")
+		igt_subtest_with_dynamic("test-time-stamp") {
+			data.modifier = I915_FORMAT_MOD_X_TILED;
 			run_test(&data, test_timestamp);
+		}
 	}
 
 	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
@@ -622,6 +639,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 			      "PSR2 sel fetch causes cursor to be added to primary plane " \
 			      "pages flips and async flip is not supported in cursor\n");
 
+		data.modifier = I915_FORMAT_MOD_X_TILED;
 		run_test(&data, test_cursor);
 	}
 
@@ -632,6 +650,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
 						       I915_FORMAT_MOD_Y_TILED));
 
+		data.modifier = I915_FORMAT_MOD_X_TILED;
 		run_test(&data, test_invalid);
 	}
 
@@ -640,6 +659,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		/* Devices without CRC can't run this test */
 		igt_require_pipe_crc(data.drm_fd);
 
+		data.modifier = I915_FORMAT_MOD_X_TILED;
 		run_test(&data, test_crc);
 	}
 
-- 
2.25.1
