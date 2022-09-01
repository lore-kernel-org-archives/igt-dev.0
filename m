Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B710E270
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 02:20:44 +0000 (UTC)
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 07:50:38 +0530
Message-Id: <20220901022038.3920384-1-arun.r.murthy@intel.com>
In-Reply-To: <20220829093147.3836523-1-arun.r.murthy@intel.com>
References: <20220829093147.3836523-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCHv2 i-g-t] tests/kms_async_flips: Enable async flip
 on linear buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Intel Gen platforms >= GEN12, Async on linear buffer is supported,
hence enabling test for the same.

v2: Added new line character for igt_skip_on_f (Petri)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/kms_async_flips.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 695aea74..214f2195 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -61,6 +61,7 @@ typedef struct {
 	bool extended;
 	enum pipe pipe;
 	bool alternate_sync_async;
+	bool is_linear_buffer;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -125,6 +126,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	if (is_i915_device(data->drm_fd)) {
 		igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+			      data->is_linear_buffer ? DRM_FORMAT_MOD_LINEAR :
 			      I915_FORMAT_MOD_X_TILED, fb);
 		igt_draw_fill_fb(data->drm_fd, fb, 0x88);
 	} else {
@@ -594,14 +596,28 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 		igt_fixture
 			require_monotonic_timestamp(data.drm_fd);
 
-		igt_describe("Wait for page flip events in between successive asynchronous flips");
+		igt_describe("Wait for page flip events in between successive asynchronous flips on X Tiled buffer");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
 			data.alternate_sync_async = false;
+			data.is_linear_buffer = false;
 			run_test(&data, test_async_flip);
 		}
 
+		igt_describe("Wait for page flip events in between successive asynchronous flips on Linear buffer");
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			data.alternate_sync_async = false;
+			data.is_linear_buffer = true;
+			if(is_i915_device(data.drm_fd)) {
+				uint32_t devid = intel_get_drm_devid(data.drm_fd);
+				igt_skip_on_f(!AT_LEAST_GEN(devid, 12),
+						"Async on Linear buffer not supported\n");
+				run_test(&data, test_async_flip);
+			}
+		}
+
 		igt_describe("Alternate between sync and async flips");
 		igt_subtest_with_dynamic("alternate-sync-async-flip") {
+			data.is_linear_buffer = false;
 			data.alternate_sync_async = true;
 			run_test(&data, test_async_flip);
 		}
-- 
2.25.1
