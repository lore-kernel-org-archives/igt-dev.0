Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAD710E3B1
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Jan 2023 21:04:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a11so123647lfg.0
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Jan 2023 13:04:01 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 15 Jan 2023 23:03:55 +0200
Message-Id: <20230115210355.28355-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: add invalid
 parameter tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Drew Davenport <ddavenport@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add skeleton for adding invalid parameter tests and add two tests which are
expected to return -EINVAL

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 71 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 887a55e63..96713128b 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -819,6 +819,75 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_assert_eq(ret1 && ret2, 0);
 }
 
+static void invalid_parameter_tests(data_t *d) {
+	enum pipe pipe = PIPE_A;
+	igt_output_t *output;
+	igt_fb_t fb;
+	igt_plane_t* plane;
+	int32_t rval;
+
+	const struct {
+		const char* testname;
+		uint32_t planesize[2];
+		struct {
+			enum igt_atomic_plane_properties prop;
+			uint32_t value;
+		} params[8];
+	} paramtests[] = {
+		{
+			.testname = "less-than-1-height-src",
+			.planesize = {256, 8},
+			.params = {{IGT_PLANE_SRC_H, IGT_FIXED(0, 30) }, {~0}}
+		},
+		{
+			.testname = "less-than-1-width-src",
+			.planesize = {8, 256},
+			.params = {{IGT_PLANE_SRC_W, IGT_FIXED(0, 30) }, {~0}}
+		},
+	};
+
+	igt_fixture {
+		output = igt_get_single_output_for_pipe(&d->display, pipe);
+		igt_require(output);
+
+		igt_output_set_pipe(output, pipe);
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_fb(d->drm_fd, 256, 256,
+			DRM_FORMAT_XRGB8888,
+			DRM_FORMAT_MOD_NONE,
+			&fb);
+	}
+
+	igt_subtest_group {
+		igt_describe("test parameters which should not be accepted");
+		igt_subtest_with_dynamic("invalid-parameters") {
+			for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
+				igt_dynamic(paramtests[i].testname) {
+					igt_plane_set_position(plane, 0, 0);
+					igt_plane_set_fb(plane, &fb);
+					igt_plane_set_size(plane,
+							   paramtests[i].planesize[0],
+							   paramtests[i].planesize[1]);
+
+
+					for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
+						igt_plane_set_prop_value(plane,
+									 paramtests[i].params[j].prop,
+									 paramtests[i].params[j].value);
+
+					rval = 	igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
+
+					igt_assert(rval == -EINVAL);
+				}
+			}
+		}
+	}
+
+	igt_fixture
+		igt_remove_fb(d->drm_fd, &fb);
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -982,6 +1051,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
+	invalid_parameter_tests(&data);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.39.0
