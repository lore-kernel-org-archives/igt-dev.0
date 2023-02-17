Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E789910E4A6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 08:18:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Feb 2023 13:50:17 +0530
Message-Id: <20230217082017.27753-4-swati2.sharma@intel.com>
In-Reply-To: <20230217082017.27753-1-swati2.sharma@intel.com>
References: <20230217082017.27753-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/kms_plane_scaling: Add test to
 validate max source size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

i915 specific test is added to validate max source size. This
test is expected to return -EINVAL for platforms where we have
max source width 4096 whereas it will pass on platforms having
max source width 5120. We have created fb of size 5120x4320
(=size of source) and downscaled to 3840x2400(=size of dest).

On MTL(disp_ver=14), in dmesg we can see
"[drm:skl_update_scaler [i915]] scaler_user index 0.0: src
5120x4320 dst 3840x2400 size is out of scaler range."
since max source width supported is 4096.
whereas same test will pass on ADLP(display_ver=13) since max
source width  supported is 5120.

v2: -updated comment (JP)
    -not declare list of tests (JP)
    -fixed indentation (JP)
    -added i915_max_source_size_test() inside
     igt_subtest_group() (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 95 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 795e3daaf..bedd51400 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -964,6 +964,98 @@ static void invalid_parameter_tests(data_t *d)
 	}
 }
 
+/*
+ *	Max source/destination width/height for i915 driver.
+ *	These numbers are coming from
+ *	drivers/gpu/drm/i915/display/skl_scaler.c in kernel sources.
+ *
+ *	DISPLAY_VER < 11
+ *		max_src_w = 4096
+ *		max_src_h = 4096
+ *		max_dst_w = 4096
+ *		max_dst_h = 4096
+ *
+ *	DISPLAY_VER = 11
+ *		max_src_w = 5120
+ *		max_src_h = 4096
+ *		max_dst_w = 5120
+ *		max_dst_h = 4096
+ *
+ *	DISPLAY_VER = 12-13
+ *		max_src_w = 5120
+ *		max_src_h = 8192
+ *		max_dst_w = 8192
+ *		max_dst_h = 8192
+ *
+ *	DISPLAY_VER = 14
+ *		max_src_w = 4096
+ *		max_src_h = 8192
+ *		max_dst_w = 8192
+ *		max_dst_h = 8192
+ */
+
+static void i915_max_source_size_test(data_t *d)
+{
+	enum pipe pipe = PIPE_A;
+	igt_output_t *output;
+	igt_fb_t fb;
+	igt_plane_t *plane;
+	int rval;
+
+	static const struct invalid_paramtests paramtests[] = {
+		{
+			.testname = "max-src-size",
+			.planesize = {3840, 2400},
+			.params = {{~0}}
+		},
+	};
+
+	igt_fixture {
+		igt_require_intel(d->drm_fd);
+
+		output = igt_get_single_output_for_pipe(&d->display, pipe);
+		igt_require(output);
+
+		igt_output_set_pipe(output, pipe);
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_fb(d->drm_fd, 5120, 4320,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	}
+
+	igt_describe("test for validating max source size.");
+	igt_subtest_with_dynamic("i915-max-source-size") {
+		for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
+			igt_dynamic(paramtests[i].testname) {
+				igt_plane_set_position(plane, 0, 0);
+				igt_plane_set_fb(plane, &fb);
+				igt_plane_set_size(plane,
+						   paramtests[i].planesize[0],
+						   paramtests[i].planesize[1]);
+
+				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
+					igt_plane_set_prop_value(plane,
+								 paramtests[i].params[j].prop,
+								 paramtests[i].params[j].value);
+
+				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
+
+				if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
+					igt_assert(rval == -EINVAL || rval == -ERANGE);
+				else
+					igt_assert_eq(rval, 0);
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_remove_fb(d->drm_fd, &fb);
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1130,6 +1222,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group
 		invalid_parameter_tests(&data);
 
+	igt_subtest_group
+		i915_max_source_size_test(&data);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.25.1
