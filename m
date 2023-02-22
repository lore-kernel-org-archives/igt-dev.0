Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9F10E434
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Feb 2023 09:17:48 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Feb 2023 14:49:49 +0530
Message-Id: <20230222091950.31758-3-swati2.sharma@intel.com>
In-Reply-To: <20230222091950.31758-1-swati2.sharma@intel.com>
References: <20230222091950.31758-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] tests/kms_plane_scaling: Minor fixes
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

Minor fixes are done in the existing test.

v2: -indentation (JP)
    -added invalid_parameter_tests() inside igt_subtest_group
     macro (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ecb4087f..795e3daa 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -931,9 +931,9 @@ static void invalid_parameter_tests(data_t *d)
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_create_fb(d->drm_fd, 256, 256,
-			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_NONE,
-			&fb);
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
 	}
 
 	igt_describe("test parameters which should not be accepted");
@@ -943,14 +943,13 @@ static void invalid_parameter_tests(data_t *d)
 				igt_plane_set_position(plane, 0, 0);
 				igt_plane_set_fb(plane, &fb);
 				igt_plane_set_size(plane,
-							paramtests[i].planesize[0],
-							paramtests[i].planesize[1]);
-
+						   paramtests[i].planesize[0],
+						   paramtests[i].planesize[1]);
 
 				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
 					igt_plane_set_prop_value(plane,
-									paramtests[i].params[j].prop,
-									paramtests[i].params[j].value);
+								 paramtests[i].params[j].prop,
+								 paramtests[i].params[j].value);
 
 				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
 
@@ -1128,7 +1127,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
-	invalid_parameter_tests(&data);
+	igt_subtest_group
+		invalid_parameter_tests(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.25.1
