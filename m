Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17716E52C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 14:45:58 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 27 Jan 2020 16:45:53 +0200
Message-Id: <20200127144554.11364-2-mika.kahola@intel.com>
In-Reply-To: <20200127144554.11364-1-mika.kahola@intel.com>
References: <20200127144554.11364-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_lowres: Skip Yf tiling
 tests from gen12 onwards
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Yf tiling is not supported by gen12. The patch proposes that we
intentionally skip this subtest.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_lowres.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 4c3f5636..f4a9ff8d 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
+	uint32_t devid;
 	struct igt_fb fb_primary;
 	struct igt_fb fb_plane[2];
 	struct {
@@ -236,6 +237,9 @@ test_planes_on_pipe(data_t *data, enum pipe pipe, uint64_t modifier)
 	igt_skip_on(!igt_display_has_format_mod(&data->display,
 						DRM_FORMAT_XRGB8888, modifier));
 
+	igt_skip_on(intel_gen(data->devid) >= 12 &&
+		    modifier == LOCAL_I915_FORMAT_MOD_Yf_TILED);
+
 	for_each_valid_output_on_pipe(&data->display, pipe, output)
 		tested += test_planes_on_pipe_with_output(data, pipe, output,
 							  modifier);
@@ -250,6 +254,8 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.devid = is_i915_device(data.drm_fd) ?
+			intel_get_drm_devid(data.drm_fd) : 0;
 
 		kmstest_set_vt_graphics_mode();
 
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
